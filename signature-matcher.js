const fs = require('fs');
const path = require('path');
const csv = require('csv-parser');

/**
 * ETL Signature Matcher
 * 
 * This script takes a CSV file with headers and matches it against
 * all signature files in the connector_etl directory to find the best matches.
 */

class SignatureMatcher {
    constructor(connectorEtlPath = 'connector_etl') {
        this.connectorEtlPath = connectorEtlPath;
        this.signatureCache = new Map();
        this.SIGNATURE_SUBPATH = 'src/main/resource/signatures';
    }

    /**
     * Main function to find matching signatures for a CSV file
     */
    async findMatchingSignatures(csvFilePath, options = {}) {
        console.log('🔍 Starting signature matching process...');
        console.log(`📁 CSV File: ${csvFilePath}`);
        
        try {
            // Step 1: Extract headers from CSV
            const csvHeaders = await this.extractCsvHeaders(csvFilePath);
            console.log(`📋 Found ${csvHeaders.length} headers in CSV:`);
            console.log(csvHeaders.join(', '));

            // Step 2: Load all signature files
            const signatures = await this.loadAllSignatures();
            console.log(`📄 Loaded ${signatures.length} signature files`);

            // Step 3: Compare headers with each signature
            const matches = await this.compareWithSignatures(csvHeaders, signatures, options);

            // Step 4: Sort and rank matches
            const rankedMatches = this.rankMatches(matches);

            // Step 5: Generate report
            const report = this.generateMatchReport(csvFilePath, csvHeaders, rankedMatches);

            return report;
        } catch (error) {
            console.error('❌ Error during signature matching:', error.message);
            throw error;
        }
    }

    /**
     * Extract headers from CSV file
     */
    async extractCsvHeaders(csvFilePath) {
        return new Promise((resolve, reject) => {
            if (!fs.existsSync(csvFilePath)) {
                reject(new Error(`CSV file not found: ${csvFilePath}`));
                return;
            }

            const headers = [];
            let firstRow = true;

            fs.createReadStream(csvFilePath)
                .pipe(csv())
                .on('headers', (headerList) => {
                    headers.push(...headerList);
                })
                .on('data', (data) => {
                    if (firstRow) {
                        // If csv-parser didn't capture headers properly, get from first data row
                        if (headers.length === 0) {
                            headers.push(...Object.keys(data));
                        }
                        firstRow = false;
                    }
                })
                .on('end', () => {
                    resolve(headers.filter(h => h && h.trim()));
                })
                .on('error', reject);
        });
    }

    /**
     * Load all signature files from connector_etl directory
     */
    async loadAllSignatures() {
        const signatures = [];
        
        if (!fs.existsSync(this.connectorEtlPath)) {
            throw new Error(`Connector ETL directory not found: ${this.connectorEtlPath}`);
        }

        const categories = fs.readdirSync(this.connectorEtlPath)
            .filter(item => fs.statSync(path.join(this.connectorEtlPath, item)).isDirectory())
            .filter(item => !item.startsWith('_')); // Skip _template and _logs

        for (const category of categories) {
            const categoryPath = path.join(this.connectorEtlPath, category);
            await this.scanCategoryForSignatures(categoryPath, category, signatures);
        }

        return signatures;
    }

    /**
     * Recursively scan category for signature files
     */
    async scanCategoryForSignatures(categoryPath, category, signatures) {
        const items = fs.readdirSync(categoryPath);

        for (const item of items) {
            const itemPath = path.join(categoryPath, item);
            
            if (fs.statSync(itemPath).isDirectory()) {
                const signaturePath = path.join(itemPath, this.SIGNATURE_SUBPATH);
                
                if (fs.existsSync(signaturePath)) {
                    // Found a connector with signatures
                    const connectorPath = path.relative(this.connectorEtlPath, itemPath);
                    const sigFiles = fs.readdirSync(signaturePath)
                        .filter(file => file.endsWith('.sig'));

                    for (const sigFile of sigFiles) {
                        const fullSigPath = path.join(signaturePath, sigFile);
                        try {
                            const signatureData = await this.loadSignatureFile(fullSigPath);
                            signatures.push({
                                category,
                                connectorPath,
                                connector: path.basename(itemPath),
                                fileName: sigFile,
                                filePath: fullSigPath,
                                relativePath: `${connectorPath}/${this.SIGNATURE_SUBPATH}/${sigFile}`,
                                data: signatureData
                            });
                        } catch (error) {
                            console.warn(`⚠️  Could not load signature: ${fullSigPath}`, error.message);
                        }
                    }
                } else {
                    // Continue scanning subdirectories
                    await this.scanCategoryForSignatures(itemPath, category, signatures);
                }
            }
        }
    }

    /**
     * Load and parse a signature file
     */
    async loadSignatureFile(filePath) {
        if (this.signatureCache.has(filePath)) {
            return this.signatureCache.get(filePath);
        }

        try {
            const content = fs.readFileSync(filePath, 'utf8');
            const signature = JSON.parse(content);
            
            // Extract field information
            const fields = this.extractFieldsFromSignature(signature);
            
            const signatureData = {
                raw: signature,
                fields,
                fieldNames: this.extractAllFieldNames(fields),
                logicalNames: fields.map(f => f.logicalName).filter(Boolean),
                physicalNames: fields.map(f => f.physicalName).filter(Boolean),
                otherNames: this.extractOtherPossibleNames(fields)
            };

            this.signatureCache.set(filePath, signatureData);
            return signatureData;
        } catch (error) {
            throw new Error(`Failed to parse signature file ${filePath}: ${error.message}`);
        }
    }

    /**
     * Extract field information from signature JSON
     */
    extractFieldsFromSignature(signature) {
        const fields = [];

        // Handle the specific ETL signature format: format.fields
        if (signature.format && signature.format.fields) {
            fields.push(...signature.format.fields);
        }
        // Handle other possible formats
        else if (signature.fields) {
            fields.push(...signature.fields);
        }
        else if (signature.columns) {
            fields.push(...signature.columns);
        }
        else if (signature.schema && signature.schema.fields) {
            fields.push(...signature.schema.fields);
        }
        else if (signature.dataElements) {
            fields.push(...signature.dataElements);
        }

        // If no structured fields, try to extract from other properties
        if (fields.length === 0) {
            Object.keys(signature).forEach(key => {
                if (Array.isArray(signature[key]) && signature[key].length > 0) {
                    const firstItem = signature[key][0];
                    if (typeof firstItem === 'object' && (firstItem.name || firstItem.logicalName || firstItem.physicalName)) {
                        fields.push(...signature[key]);
                    }
                }
            });
        }

        return fields;
    }

    /**
     * Extract all possible field names from fields array
     */
    extractAllFieldNames(fields) {
        const allNames = [];
        
        fields.forEach(field => {
            // Add physicalName
            if (field.physicalName) {
                allNames.push(field.physicalName);
            }
            
            // Add logicalName
            if (field.logicalName) {
                allNames.push(field.logicalName);
            }
            
            // Add other possible names
            if (field.otherPossibleNames && Array.isArray(field.otherPossibleNames)) {
                allNames.push(...field.otherPossibleNames);
            }
            
            // Add name (fallback)
            if (field.name) {
                allNames.push(field.name);
            }
        });
        
        return allNames.filter(Boolean);
    }

    /**
     * Extract other possible names from fields array
     */
    extractOtherPossibleNames(fields) {
        const otherNames = [];
        
        fields.forEach(field => {
            if (field.otherPossibleNames && Array.isArray(field.otherPossibleNames)) {
                otherNames.push(...field.otherPossibleNames);
            }
        });
        
        return otherNames.filter(Boolean);
    }

    /**
     * Compare CSV headers with all signatures
     */
    async compareWithSignatures(csvHeaders, signatures, options = {}) {
        const matches = [];
        const threshold = options.threshold || 0.1; // Minimum match score

        console.log('\n🔄 Comparing headers with signatures...');

        for (const signature of signatures) {
            const matchResult = this.calculateMatch(csvHeaders, signature);
            
            if (matchResult.score >= threshold) {
                matches.push({
                    ...signature,
                    matchResult
                });
            }
        }

        return matches;
    }

    /**
     * Calculate match score between CSV headers and signature fields
     */
    calculateMatch(csvHeaders, signature) {
        const sigFields = signature.data.fieldNames;
        const sigLogical = signature.data.logicalNames;
        const sigPhysical = signature.data.physicalNames;
        const sigOtherNames = signature.data.otherNames || [];

        let exactMatches = 0;
        let partialMatches = 0;
        let matchedHeaders = [];
        let unmatchedHeaders = [];
        let matchDetails = [];

        // Normalize headers for comparison
        const normalizedCsvHeaders = csvHeaders.map(h => this.normalizeFieldName(h));
        const normalizedSigFields = sigFields.map(f => this.normalizeFieldName(f));
        const normalizedLogical = sigLogical.map(f => this.normalizeFieldName(f));
        const normalizedPhysical = sigPhysical.map(f => this.normalizeFieldName(f));
        const normalizedOtherNames = sigOtherNames.map(f => this.normalizeFieldName(f));

        for (let i = 0; i < csvHeaders.length; i++) {
            const csvHeader = csvHeaders[i];
            const normalizedHeader = normalizedCsvHeaders[i];
            let matched = false;
            let matchType = '';
            let matchedField = '';

            // Check exact matches with field names
            if (normalizedSigFields.includes(normalizedHeader)) {
                exactMatches++;
                matched = true;
                matchType = 'exact_field';
                matchedField = sigFields[normalizedSigFields.indexOf(normalizedHeader)];
            }
            // Check exact matches with logical names
            else if (normalizedLogical.includes(normalizedHeader)) {
                exactMatches++;
                matched = true;
                matchType = 'exact_logical';
                matchedField = sigLogical[normalizedLogical.indexOf(normalizedHeader)];
            }
            // Check exact matches with physical names
            else if (normalizedPhysical.includes(normalizedHeader)) {
                exactMatches++;
                matched = true;
                matchType = 'exact_physical';
                matchedField = sigPhysical[normalizedPhysical.indexOf(normalizedHeader)];
            }
            // Check exact matches with other possible names
            else if (normalizedOtherNames.includes(normalizedHeader)) {
                exactMatches++;
                matched = true;
                matchType = 'exact_other';
                matchedField = sigOtherNames[normalizedOtherNames.indexOf(normalizedHeader)];
            }
            // Check partial matches
            else {
                const partialMatch = this.findPartialMatch(normalizedHeader,
                    [...normalizedSigFields, ...normalizedLogical, ...normalizedPhysical, ...normalizedOtherNames]);
                
                if (partialMatch.score > 0.7) {
                    partialMatches++;
                    matched = true;
                    matchType = 'partial';
                    matchedField = partialMatch.field;
                }
            }

            if (matched) {
                matchedHeaders.push(csvHeader);
                matchDetails.push({
                    csvHeader,
                    matchedField,
                    matchType
                });
            } else {
                unmatchedHeaders.push(csvHeader);
            }
        }

        // Calculate score
        const totalHeaders = csvHeaders.length;
        const exactScore = exactMatches / totalHeaders;
        const partialScore = (partialMatches * 0.5) / totalHeaders;
        const overallScore = exactScore + partialScore;

        return {
            score: overallScore,
            exactMatches,
            partialMatches,
            totalHeaders,
            matchedHeaders,
            unmatchedHeaders,
            matchDetails,
            coverage: (exactMatches + partialMatches) / totalHeaders
        };
    }

    /**
     * Normalize field names for comparison
     */
    normalizeFieldName(name) {
        if (!name) return '';
        return name.toString()
            .toLowerCase()
            .replace(/[^a-z0-9]/g, '')
            .trim();
    }

    /**
     * Find partial matches using string similarity
     */
    findPartialMatch(target, candidates) {
        let bestMatch = { field: '', score: 0 };

        for (const candidate of candidates) {
            if (!candidate) continue;
            
            const similarity = this.calculateStringSimilarity(target, candidate);
            if (similarity > bestMatch.score) {
                bestMatch = { field: candidate, score: similarity };
            }
        }

        return bestMatch;
    }

    /**
     * Calculate string similarity using Levenshtein distance
     */
    calculateStringSimilarity(str1, str2) {
        const len1 = str1.length;
        const len2 = str2.length;
        
        if (len1 === 0) return len2 === 0 ? 1 : 0;
        if (len2 === 0) return 0;

        const matrix = Array(len2 + 1).fill().map(() => Array(len1 + 1).fill(0));

        for (let i = 0; i <= len1; i++) matrix[0][i] = i;
        for (let j = 0; j <= len2; j++) matrix[j][0] = j;

        for (let j = 1; j <= len2; j++) {
            for (let i = 1; i <= len1; i++) {
                const substitutionCost = str1[i - 1] === str2[j - 1] ? 0 : 1;
                matrix[j][i] = Math.min(
                    matrix[j][i - 1] + 1,
                    matrix[j - 1][i] + 1,
                    matrix[j - 1][i - 1] + substitutionCost
                );
            }
        }

        const maxLen = Math.max(len1, len2);
        return (maxLen - matrix[len2][len1]) / maxLen;
    }

    /**
     * Rank matches by score and other criteria
     */
    rankMatches(matches) {
        return matches.sort((a, b) => {
            // Primary sort: match score
            if (b.matchResult.score !== a.matchResult.score) {
                return b.matchResult.score - a.matchResult.score;
            }
            
            // Secondary sort: exact matches
            if (b.matchResult.exactMatches !== a.matchResult.exactMatches) {
                return b.matchResult.exactMatches - a.matchResult.exactMatches;
            }
            
            // Tertiary sort: coverage
            return b.matchResult.coverage - a.matchResult.coverage;
        });
    }

    /**
     * Generate comprehensive match report
     */
    generateMatchReport(csvFilePath, csvHeaders, rankedMatches) {
        const report = {
            csvFile: csvFilePath,
            csvHeaders,
            totalHeaders: csvHeaders.length,
            totalSignatures: rankedMatches.length,
            timestamp: new Date().toISOString(),
            topMatches: rankedMatches.slice(0, 10),
            summary: {
                perfectMatches: rankedMatches.filter(m => m.matchResult.score >= 0.9).length,
                goodMatches: rankedMatches.filter(m => m.matchResult.score >= 0.7 && m.matchResult.score < 0.9).length,
                partialMatches: rankedMatches.filter(m => m.matchResult.score >= 0.3 && m.matchResult.score < 0.7).length,
                poorMatches: rankedMatches.filter(m => m.matchResult.score < 0.3).length
            }
        };

        return report;
    }

    /**
     * Save report to file
     */
    async saveReport(report, outputPath = 'signature-match-report.json') {
        try {
            fs.writeFileSync(outputPath, JSON.stringify(report, null, 2));
            console.log(`📄 Report saved to: ${outputPath}`);
            return outputPath;
        } catch (error) {
            console.error('❌ Error saving report:', error.message);
            throw error;
        }
    }

    /**
     * Generate human-readable summary
     */
    generateSummary(report) {
        console.log('\n📊 SIGNATURE MATCHING SUMMARY');
        console.log('================================');
        console.log(`📁 CSV File: ${report.csvFile}`);
        console.log(`📋 Headers: ${report.totalHeaders}`);
        console.log(`🔍 Signatures Analyzed: ${report.totalSignatures}`);
        console.log('\n🎯 Match Quality:');
        console.log(`  Perfect (90%+): ${report.summary.perfectMatches}`);
        console.log(`  Good (70-89%): ${report.summary.goodMatches}`);
        console.log(`  Partial (30-69%): ${report.summary.partialMatches}`);
        console.log(`  Poor (<30%): ${report.summary.poorMatches}`);

        if (report.topMatches.length > 0) {
            console.log('\n🏆 TOP MATCHES:');
            console.log('================');
            
            report.topMatches.slice(0, 5).forEach((match, index) => {
                console.log(`\n${index + 1}. ${match.connector} (${match.category})`);
                console.log(`   📄 File: ${match.fileName}`);
                console.log(`   📊 Score: ${(match.matchResult.score * 100).toFixed(1)}%`);
                console.log(`   ✅ Exact: ${match.matchResult.exactMatches}/${match.matchResult.totalHeaders}`);
                console.log(`   📂 Path: ${match.relativePath}`);
                
                if (match.matchResult.matchDetails.length > 0) {
                    console.log(`   🔗 Matches: ${match.matchResult.matchDetails.slice(0, 3).map(m => m.csvHeader).join(', ')}${match.matchResult.matchDetails.length > 3 ? '...' : ''}`);
                }
            });
        }
    }
}

// CLI Usage
async function main() {
    const args = process.argv.slice(2);
    
    if (args.length === 0) {
        console.log('📋 ETL Signature Matcher');
        console.log('========================');
        console.log('Usage: node signature-matcher.js <csv-file-path> [options]');
        console.log('\nOptions:');
        console.log('  --connector-path <path>  Path to connector_etl directory (default: ./connector_etl)');
        console.log('  --threshold <number>     Minimum match score (default: 0.1)');
        console.log('  --output <path>          Output report file (default: signature-match-report.json)');
        console.log('\nExample:');
        console.log('  node signature-matcher.js sample-data.csv');
        console.log('  node signature-matcher.js data.csv --threshold 0.5 --output my-report.json');
        return;
    }

    const csvFile = args[0];
    const options = {};
    let outputPath = 'signature-match-report.json';
    let connectorPath = 'connector_etl';

    // Parse command line options
    for (let i = 1; i < args.length; i += 2) {
        switch (args[i]) {
            case '--threshold':
                options.threshold = parseFloat(args[i + 1]);
                break;
            case '--output':
                outputPath = args[i + 1];
                break;
            case '--connector-path':
                connectorPath = args[i + 1];
                break;
        }
    }

    try {
        const matcher = new SignatureMatcher(connectorPath);
        const report = await matcher.findMatchingSignatures(csvFile, options);
        
        await matcher.saveReport(report, outputPath);
        matcher.generateSummary(report);
        
        console.log('\n✅ Signature matching completed successfully!');
    } catch (error) {
        console.error('❌ Error:', error.message);
        process.exit(1);
    }
}

// Export for use as module
module.exports = SignatureMatcher;

// Run CLI if this file is executed directly
if (require.main === module) {
    main();
}