const fs = require('fs');
const path = require('path');

// Update this path to match your actual directory structure
const ROOT_DIR = 'connector_etl';  // Relative path from current directory
const SIGNATURE_SUBPATH = 'src/main/resource/signatures';  // Note: "resource" not "resources"

const catalog = {
  totalSignatures: 0,
  lastScanned: new Date().toISOString(),
  categories: {}
};

console.log('🔍 Scanning directory structure...');

// Check if ROOT_DIR exists
if (!fs.existsSync(ROOT_DIR)) {
  console.error('❌ Directory not found:', ROOT_DIR);
  console.log('Please update ROOT_DIR in the script to match your connector_etl path');
  process.exit(1);
}

const topLevelFolders = fs.readdirSync(ROOT_DIR);
console.log('📁 Found top-level categories:', topLevelFolders);

for (const category of topLevelFolders) {
  const categoryPath = path.join(ROOT_DIR, category);
  
  // Skip files and _template directory
  if (!fs.statSync(categoryPath).isDirectory() || category === '_template') {
    continue;
  }

  console.log(`\n📂 Processing category: ${category}`);
  catalog.categories[category] = {};

  try {
    const subfolders = fs.readdirSync(categoryPath);
    
    for (const sub of subfolders) {
      const subPath = path.join(categoryPath, sub);
      if (!fs.statSync(subPath).isDirectory()) continue;

      // Find all connector folders (including nested ones)
      const connectorFolders = findAllConnectorFolders(subPath);
      
      for (const connectorFolder of connectorFolders) {
        const sigDir = path.join(connectorFolder, SIGNATURE_SUBPATH);
        
        if (fs.existsSync(sigDir)) {
          try {
            const sigFiles = fs.readdirSync(sigDir).filter(f => f.endsWith('.sig'));
            
            if (sigFiles.length > 0) {
              // Create relative path key
              const relPath = path.relative(ROOT_DIR, connectorFolder).replace(/\\/g, '/');
              catalog.categories[category][relPath] = sigFiles;
              catalog.totalSignatures += sigFiles.length;
              
              console.log(`  ✅ ${relPath}: ${sigFiles.length} signature(s)`);
            }
          } catch (err) {
            console.warn(`  ⚠️  Error reading signatures in ${sigDir}:`, err.message);
          }
        }
      }
    }
  } catch (err) {
    console.warn(`⚠️  Error processing category ${category}:`, err.message);
  }
}

// 🔁 Utility: Recursively find all connector folders
function findAllConnectorFolders(dir, result = []) {
  try {
    const entries = fs.readdirSync(dir, { withFileTypes: true });
    
    for (const entry of entries) {
      const fullPath = path.join(dir, entry.name);
      
      if (entry.isDirectory()) {
        // Check if this directory has the signature structure
        const sigPath = path.join(fullPath, SIGNATURE_SUBPATH);
        if (fs.existsSync(sigPath)) {
          result.push(fullPath);
        }
        
        // Continue searching recursively
        findAllConnectorFolders(fullPath, result);
      }
    }
  } catch (err) {
    console.warn(`⚠️  Error scanning directory ${dir}:`, err.message);
  }
  
  return result;
}

// ✅ Generate statistics
console.log('\n📊 Scan Results:');
console.log('================');
for (const [category, connectors] of Object.entries(catalog.categories)) {
  const connectorCount = Object.keys(connectors).length;
  const sigCount = Object.values(connectors).reduce((sum, sigs) => sum + sigs.length, 0);
  console.log(`${category.toUpperCase()}: ${connectorCount} connectors, ${sigCount} signatures`);
}
console.log(`\nTOTAL: ${catalog.totalSignatures} signatures across ${Object.keys(catalog.categories).length} categories`);

// ✅ Save to JS file for browser use
const outputPath = 'signature-catalog-generated.js';
const jsContent = `// Auto-generated ETL Signature Catalog
// Generated on: ${catalog.lastScanned}
// Total signatures: ${catalog.totalSignatures}

const ETL_SIGNATURE_CATALOG = ${JSON.stringify(catalog, null, 2)};

// Utility functions for signature catalog
ETL_SIGNATURE_CATALOG.getSignatureByName = function(name) {
    for (const category in this.categories) {
        for (const subcategory in this.categories[category]) {
            if (this.categories[category][subcategory].includes(name)) {
                return {
                    category: category,
                    subcategory: subcategory,
                    path: \`connector_etl/\${category}/\${subcategory}/src/main/resource/signatures/\${name}\`
                };
            }
        }
    }
    return null;
};

ETL_SIGNATURE_CATALOG.getSignaturesByCategory = function(category) {
    return this.categories[category] || {};
};

ETL_SIGNATURE_CATALOG.searchSignatures = function(searchTerm) {
    const results = [];
    const term = searchTerm.toLowerCase();
    
    for (const category in this.categories) {
        for (const subcategory in this.categories[category]) {
            this.categories[category][subcategory].forEach(sig => {
                if (sig.toLowerCase().includes(term) || 
                    subcategory.toLowerCase().includes(term) ||
                    category.toLowerCase().includes(term)) {
                    results.push({
                        signature: sig,
                        category: category,
                        subcategory: subcategory,
                        path: \`connector_etl/\${category}/\${subcategory}/src/main/resource/signatures/\${sig}\`
                    });
                }
            });
        }
    }
    
    return results;
};

ETL_SIGNATURE_CATALOG.getAllSignaturePaths = function() {
    const paths = [];
    for (const category in this.categories) {
        for (const subcategory in this.categories[category]) {
            this.categories[category][subcategory].forEach(sig => {
                paths.push(\`connector_etl/\${category}/\${subcategory}/src/main/resource/signatures/\${sig}\`);
            });
        }
    }
    return paths;
};

// Export for use in main application
if (typeof module !== 'undefined' && module.exports) {
    module.exports = ETL_SIGNATURE_CATALOG;
}
`;

fs.writeFileSync(outputPath, jsContent);

console.log(`\n✅ Catalog saved to: ${outputPath}`);
console.log('🎯 Next steps:');
console.log('1. Update your HTML to use signature-catalog-generated.js');
console.log('2. Refresh your browser to see the complete catalog');
console.log('3. You should now see all 319 connectors!');