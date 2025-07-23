// ETL Assistant Tool - Main JavaScript File
class ETLAssistant {
    constructor() {
        this.signatures = [];
        this.currentFile = null;
        this.analysisData = {};
        this.signatureCatalog = typeof ETL_SIGNATURE_CATALOG !== 'undefined' ? ETL_SIGNATURE_CATALOG : null;
        this.currentView = 'grid';
        this.selectedSignature = null;
        this.init();
    }

    init() {
        this.setupTabNavigation();
        this.setupFileUpload();
        this.setupCodeAnalysis();
        this.setupSignatureBrowser();
        this.initializeCharts();
        this.loadStoredData();
        this.loadSignatureCatalog();
    }

    // Tab Navigation
    setupTabNavigation() {
        const tabBtns = document.querySelectorAll('.tab-btn');
        const tabContents = document.querySelectorAll('.tab-content');

        tabBtns.forEach(btn => {
            btn.addEventListener('click', () => {
                const targetTab = btn.getAttribute('data-tab');
                
                // Remove active class from all tabs and contents
                tabBtns.forEach(b => b.classList.remove('active'));
                tabContents.forEach(c => c.classList.remove('active'));
                
                // Add active class to clicked tab and corresponding content
                btn.classList.add('active');
                const targetContent = document.getElementById(targetTab);
                if (targetContent) {
                    targetContent.classList.add('active');
                }

                // If switching to signature browser, load signatures
                if (targetTab === 'signatures-browser') {
                    this.loadSignatureCatalog();
                }
            });
        });

        // Analysis sub-tabs
        const analysisTabBtns = document.querySelectorAll('.analysis-tab-btn');
        const analysisContents = document.querySelectorAll('.analysis-content');

        analysisTabBtns.forEach(btn => {
            btn.addEventListener('click', () => {
                const targetTab = btn.getAttribute('data-analysis-tab');
                
                analysisTabBtns.forEach(b => b.classList.remove('active'));
                analysisContents.forEach(c => c.classList.remove('active'));
                
                btn.classList.add('active');
                document.getElementById(targetTab + '-analysis').classList.add('active');
            });
        });
    }

    // File Upload Functionality
    setupFileUpload() {
        const uploadArea = document.getElementById('upload-area');
        const fileInput = document.getElementById('file-input');

        // Drag and drop events
        uploadArea.addEventListener('dragover', (e) => {
            e.preventDefault();
            uploadArea.classList.add('dragover');
        });

        uploadArea.addEventListener('dragleave', () => {
            uploadArea.classList.remove('dragover');
        });

        uploadArea.addEventListener('drop', (e) => {
            e.preventDefault();
            uploadArea.classList.remove('dragover');
            const files = e.dataTransfer.files;
            this.handleFileUpload(files);
        });

        // Click to upload
        uploadArea.addEventListener('click', () => {
            fileInput.click();
        });

        fileInput.addEventListener('change', (e) => {
            this.handleFileUpload(e.target.files);
        });
    }

    // Handle File Upload
    async handleFileUpload(files) {
        if (files.length === 0) return;

        const file = files[0];
        this.currentFile = file;

        // Show loading state
        this.showLoading('Analyzing file...');

        try {
            const fileData = await this.readFile(file);
            const analysis = await this.analyzeFile(file, fileData);
            this.displayFileResults(file, analysis);
            this.updateSignatures(analysis);
            this.updateMetrics();
        } catch (error) {
            console.error('Error processing file:', error);
            this.showError('Error processing file: ' + error.message);
        }
    }

    // Read File Content
    readFile(file) {
        return new Promise((resolve, reject) => {
            const reader = new FileReader();
            const fileExtension = file.name.split('.').pop().toLowerCase();

            reader.onload = (e) => {
                try {
                    let data;
                    if (fileExtension === 'csv') {
                        data = Papa.parse(e.target.result, {
                            header: true,
                            skipEmptyLines: true,
                            dynamicTyping: true
                        });
                        resolve(data);
                    } else if (fileExtension === 'xlsx' || fileExtension === 'xls') {
                        const workbook = XLSX.read(e.target.result, { type: 'binary' });
                        const sheetName = workbook.SheetNames[0];
                        const worksheet = workbook.Sheets[sheetName];
                        const jsonData = XLSX.utils.sheet_to_json(worksheet, { header: 1 });
                        
                        // Convert to Papa Parse format
                        const headers = jsonData[0];
                        const rows = jsonData.slice(1);
                        const parsedData = {
                            data: rows.map(row => {
                                const obj = {};
                                headers.forEach((header, index) => {
                                    obj[header] = row[index];
                                });
                                return obj;
                            }),
                            meta: { fields: headers }
                        };
                        resolve(parsedData);
                    } else {
                        reject(new Error('Unsupported file format'));
                    }
                } catch (error) {
                    reject(error);
                }
            };

            reader.onerror = () => reject(new Error('Error reading file'));

            if (fileExtension === 'csv') {
                reader.readAsText(file);
            } else {
                reader.readAsBinaryString(file);
            }
        });
    }

    // Analyze File Data
    async analyzeFile(file, fileData) {
        const analysis = {
            fileName: file.name,
            fileSize: file.size,
            fileType: file.type || 'unknown',
            uploadDate: new Date(),
            schema: this.analyzeSchema(fileData),
            quality: this.analyzeQuality(fileData),
            mapping: this.generateMapping(fileData),
            preview: this.generatePreview(fileData)
        };

        return analysis;
    }

    // Schema Analysis
    analyzeSchema(fileData) {
        const fields = fileData.meta.fields || [];
        const data = fileData.data || [];
        
        const schema = fields.map(field => {
            const values = data.map(row => row[field]).filter(v => v !== null && v !== undefined && v !== '');
            const dataType = this.inferDataType(values);
            const uniqueCount = new Set(values).size;
            const nullCount = data.length - values.length;
            
            return {
                name: field,
                dataType: dataType,
                uniqueValues: uniqueCount,
                nullCount: nullCount,
                nullPercentage: ((nullCount / data.length) * 100).toFixed(2),
                sampleValues: values.slice(0, 5)
            };
        });

        return {
            totalColumns: fields.length,
            totalRows: data.length,
            columns: schema
        };
    }

    // Infer Data Type
    inferDataType(values) {
        if (values.length === 0) return 'unknown';
        
        const sample = values.slice(0, 100); // Use first 100 values for type inference
        
        let isInteger = true;
        let isFloat = true;
        let isDate = true;
        let isBoolean = true;
        
        for (const value of sample) {
            const str = String(value).trim();
            
            if (isInteger && !(/^\d+$/.test(str))) {
                isInteger = false;
            }
            
            if (isFloat && !(/^\d*\.?\d+$/.test(str))) {
                isFloat = false;
            }
            
            if (isDate && isNaN(Date.parse(str))) {
                isDate = false;
            }
            
            if (isBoolean && !(/^(true|false|yes|no|1|0)$/i.test(str))) {
                isBoolean = false;
            }
        }
        
        if (isInteger) return 'integer';
        if (isFloat) return 'float';
        if (isBoolean) return 'boolean';
        if (isDate) return 'date';
        return 'string';
    }

    // Quality Analysis
    analyzeQuality(fileData) {
        const data = fileData.data || [];
        const fields = fileData.meta.fields || [];
        
        let totalCells = data.length * fields.length;
        let emptyCells = 0;
        let duplicateRows = 0;
        
        // Count empty cells
        data.forEach(row => {
            fields.forEach(field => {
                if (!row[field] || row[field] === '' || row[field] === null) {
                    emptyCells++;
                }
            });
        });
        
        // Check for duplicate rows
        const rowHashes = new Set();
        data.forEach(row => {
            const hash = JSON.stringify(row);
            if (rowHashes.has(hash)) {
                duplicateRows++;
            } else {
                rowHashes.add(hash);
            }
        });
        
        const completeness = ((totalCells - emptyCells) / totalCells * 100).toFixed(2);
        const uniqueness = ((data.length - duplicateRows) / data.length * 100).toFixed(2);
        
        let qualityScore = (parseFloat(completeness) + parseFloat(uniqueness)) / 2;
        let qualityLevel = 'poor';
        
        if (qualityScore >= 90) qualityLevel = 'excellent';
        else if (qualityScore >= 75) qualityLevel = 'good';
        else if (qualityScore >= 50) qualityLevel = 'warning';
        
        return {
            completeness: completeness,
            uniqueness: uniqueness,
            qualityScore: qualityScore.toFixed(2),
            qualityLevel: qualityLevel,
            totalRows: data.length,
            duplicateRows: duplicateRows,
            emptyCells: emptyCells,
            totalCells: totalCells
        };
    }

    // Generate Column Mapping
    generateMapping(fileData) {
        const fields = fileData.meta.fields || [];
        
        // Simple mapping suggestions based on common field patterns
        const mappings = fields.map(field => {
            const lowerField = field.toLowerCase();
            let suggestion = 'custom_field';
            
            if (lowerField.includes('id')) suggestion = 'identifier';
            else if (lowerField.includes('name')) suggestion = 'name_field';
            else if (lowerField.includes('email')) suggestion = 'email_address';
            else if (lowerField.includes('date') || lowerField.includes('time')) suggestion = 'datetime_field';
            else if (lowerField.includes('amount') || lowerField.includes('price') || lowerField.includes('cost')) suggestion = 'numeric_value';
            else if (lowerField.includes('address')) suggestion = 'address_field';
            else if (lowerField.includes('phone')) suggestion = 'phone_number';
            
            return {
                source: field,
                target: suggestion,
                confidence: this.calculateMappingConfidence(field, suggestion)
            };
        });
        
        return mappings;
    }

    // Calculate Mapping Confidence
    calculateMappingConfidence(field, suggestion) {
        const lowerField = field.toLowerCase();
        
        if (suggestion === 'custom_field') return 30;
        
        const keywords = {
            'identifier': ['id', 'key', 'index'],
            'name_field': ['name', 'title', 'label'],
            'email_address': ['email', 'mail'],
            'datetime_field': ['date', 'time', 'created', 'updated'],
            'numeric_value': ['amount', 'price', 'cost', 'value', 'number'],
            'address_field': ['address', 'location', 'street'],
            'phone_number': ['phone', 'mobile', 'contact']
        };
        
        const suggestionKeywords = keywords[suggestion] || [];
        const matches = suggestionKeywords.filter(keyword => lowerField.includes(keyword));
        
        return Math.min(90, 50 + (matches.length * 20));
    }

    // Generate Data Preview
    generatePreview(fileData) {
        const data = fileData.data || [];
        return data.slice(0, 10); // First 10 rows
    }

    // Display File Results
    displayFileResults(file, analysis) {
        // Show results section
        document.getElementById('file-results').style.display = 'block';
        
        // Update file info
        document.getElementById('file-name').textContent = file.name;
        
        // Update file stats
        const statsGrid = document.getElementById('file-stats');
        statsGrid.innerHTML = `
            <div class="stat-item">
                <span class="stat-value">${analysis.schema.totalRows}</span>
                <span class="stat-label">Rows</span>
            </div>
            <div class="stat-item">
                <span class="stat-value">${analysis.schema.totalColumns}</span>
                <span class="stat-label">Columns</span>
            </div>
            <div class="stat-item">
                <span class="stat-value">${(file.size / 1024).toFixed(1)} KB</span>
                <span class="stat-label">File Size</span>
            </div>
            <div class="stat-item">
                <span class="stat-value quality-${analysis.quality.qualityLevel}">${analysis.quality.qualityScore}%</span>
                <span class="stat-label">Quality Score</span>
            </div>
        `;
        
        // Update schema analysis
        this.displaySchemaAnalysis(analysis.schema);
        
        // Update mapping analysis
        this.displayMappingAnalysis(analysis.mapping);
        
        // Update quality analysis
        this.displayQualityAnalysis(analysis.quality);
        
        // Update data preview
        this.displayDataPreview(analysis.preview, analysis.schema.columns);
        
        this.analysisData = analysis;
    }

    // Display Schema Analysis
    displaySchemaAnalysis(schema) {
        const container = document.getElementById('schema-table');
        
        let html = `
            <table class="table">
                <thead>
                    <tr>
                        <th>Column Name</th>
                        <th>Data Type</th>
                        <th>Unique Values</th>
                        <th>Null Count</th>
                        <th>Null %</th>
                        <th>Sample Values</th>
                    </tr>
                </thead>
                <tbody>
        `;
        
        schema.columns.forEach(col => {
            html += `
                <tr>
                    <td><strong>${col.name}</strong></td>
                    <td><span class="badge">${col.dataType}</span></td>
                    <td>${col.uniqueValues}</td>
                    <td>${col.nullCount}</td>
                    <td>${col.nullPercentage}%</td>
                    <td>${col.sampleValues.slice(0, 3).join(', ')}</td>
                </tr>
            `;
        });
        
        html += '</tbody></table>';
        container.innerHTML = html;
    }

    // Display Mapping Analysis
    displayMappingAnalysis(mappings) {
        const container = document.getElementById('mapping-diagram');
        
        let html = `
            <div class="mapping-container">
                <h5>Suggested Column Mappings</h5>
                <table class="table">
                    <thead>
                        <tr>
                            <th>Source Column</th>
                            <th>Suggested Target</th>
                            <th>Confidence</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
        `;
        
        mappings.forEach((mapping, index) => {
            const confidenceClass = mapping.confidence >= 70 ? 'quality-excellent' : 
                                  mapping.confidence >= 50 ? 'quality-good' : 'quality-warning';
            
            html += `
                <tr>
                    <td><strong>${mapping.source}</strong></td>
                    <td>${mapping.target.replace('_', ' ').toUpperCase()}</td>
                    <td><span class="quality-indicator ${confidenceClass}">${mapping.confidence}%</span></td>
                    <td><button class="btn btn-secondary btn-sm" onclick="etlApp.editMapping(${index})">Edit</button></td>
                </tr>
            `;
        });
        
        html += '</tbody></table></div>';
        container.innerHTML = html;
    }

    // Display Quality Analysis
    displayQualityAnalysis(quality) {
        const container = document.getElementById('quality-metrics');
        
        const html = `
            <div class="quality-overview">
                <div class="quality-score">
                    <h4>Overall Quality Score</h4>
                    <div class="score-circle quality-${quality.qualityLevel}">
                        ${quality.qualityScore}%
                    </div>
                </div>
                
                <div class="quality-metrics-grid">
                    <div class="quality-metric">
                        <h5>Data Completeness</h5>
                        <div class="metric-bar">
                            <div class="metric-fill" style="width: ${quality.completeness}%"></div>
                        </div>
                        <span>${quality.completeness}%</span>
                        <p>${quality.emptyCells} empty cells out of ${quality.totalCells}</p>
                    </div>
                    
                    <div class="quality-metric">
                        <h5>Data Uniqueness</h5>
                        <div class="metric-bar">
                            <div class="metric-fill" style="width: ${quality.uniqueness}%"></div>
                        </div>
                        <span>${quality.uniqueness}%</span>
                        <p>${quality.duplicateRows} duplicate rows found</p>
                    </div>
                </div>
                
                <div class="quality-recommendations">
                    <h5>Recommendations</h5>
                    <ul>
                        ${quality.completeness < 90 ? '<li>Consider data cleansing to handle missing values</li>' : ''}
                        ${quality.duplicateRows > 0 ? '<li>Remove duplicate rows to improve data quality</li>' : ''}
                        ${quality.qualityScore < 70 ? '<li>Review data sources and collection processes</li>' : ''}
                        <li>Implement data validation rules for future uploads</li>
                    </ul>
                </div>
            </div>
        `;
        
        container.innerHTML = html;
    }

    // Display Data Preview
    displayDataPreview(preview, columns) {
        const container = document.getElementById('data-preview');
        
        if (preview.length === 0) {
            container.innerHTML = '<p class="no-data">No preview data available</p>';
            return;
        }
        
        let html = `
            <table class="table">
                <thead>
                    <tr>
                        ${columns.map(col => `<th>${col.name}</th>`).join('')}
                    </tr>
                </thead>
                <tbody>
        `;
        
        preview.forEach(row => {
            html += '<tr>';
            columns.forEach(col => {
                const value = row[col.name] || '';
                html += `<td>${value}</td>`;
            });
            html += '</tr>';
        });
        
        html += '</tbody></table>';
        container.innerHTML = html;
    }

    // Code Analysis Setup
    setupCodeAnalysis() {
        const analyzeBtn = document.getElementById('analyze-code-btn');
        const codeInput = document.getElementById('code-input');
        
        analyzeBtn.addEventListener('click', () => {
            const code = codeInput.value.trim();
            if (code) {
                this.analyzeCode(code);
            }
        });
    }

    // Analyze Code
    analyzeCode(code) {
        const explanation = this.parseCode(code);
        this.displayCodeExplanation(explanation);
        this.displayTransformationFlow(explanation.flow);
    }

    // Parse Code (Basic implementation)
    parseCode(code) {
        const lines = code.split('\n');
        const explanation = {
            type: this.detectCodeType(code),
            summary: '',
            steps: [],
            flow: []
        };
        
        // Basic SQL parsing
        if (explanation.type === 'SQL') {
            explanation.summary = 'SQL query for data transformation and selection';
            
            lines.forEach(line => {
                const trimmed = line.trim().toLowerCase();
                if (trimmed.startsWith('select')) {
                    explanation.steps.push({
                        type: 'Selection',
                        description: 'Selecting specific columns from the dataset',
                        code: line.trim()
                    });
                    explanation.flow.push('Data Selection');
                } else if (trimmed.startsWith('from')) {
                    explanation.steps.push({
                        type: 'Source',
                        description: 'Reading data from specified table or source',
                        code: line.trim()
                    });
                    explanation.flow.push('Data Source');
                } else if (trimmed.startsWith('where')) {
                    explanation.steps.push({
                        type: 'Filtering',
                        description: 'Applying filters to exclude unwanted records',
                        code: line.trim()
                    });
                    explanation.flow.push('Data Filtering');
                } else if (trimmed.startsWith('join')) {
                    explanation.steps.push({
                        type: 'Join',
                        description: 'Combining data from multiple tables',
                        code: line.trim()
                    });
                    explanation.flow.push('Data Joining');
                } else if (trimmed.startsWith('group by')) {
                    explanation.steps.push({
                        type: 'Grouping',
                        description: 'Grouping records by specified columns',
                        code: line.trim()
                    });
                    explanation.flow.push('Data Grouping');
                }
            });
        }
        
        // Basic Python parsing
        else if (explanation.type === 'Python') {
            explanation.summary = 'Python script for data processing and transformation';
            
            lines.forEach(line => {
                const trimmed = line.trim();
                if (trimmed.includes('pd.read_csv') || trimmed.includes('pd.read_excel')) {
                    explanation.steps.push({
                        type: 'Data Loading',
                        description: 'Loading data from file into DataFrame',
                        code: trimmed
                    });
                    explanation.flow.push('Data Loading');
                } else if (trimmed.includes('dropna') || trimmed.includes('fillna')) {
                    explanation.steps.push({
                        type: 'Data Cleaning',
                        description: 'Handling missing values in the dataset',
                        code: trimmed
                    });
                    explanation.flow.push('Data Cleaning');
                } else if (trimmed.includes('merge') || trimmed.includes('join')) {
                    explanation.steps.push({
                        type: 'Data Joining',
                        description: 'Combining multiple datasets',
                        code: trimmed
                    });
                    explanation.flow.push('Data Joining');
                } else if (trimmed.includes('to_csv') || trimmed.includes('to_excel')) {
                    explanation.steps.push({
                        type: 'Data Export',
                        description: 'Saving processed data to file',
                        code: trimmed
                    });
                    explanation.flow.push('Data Export');
                }
            });
        }
        
        return explanation;
    }

    // Detect Code Type
    detectCodeType(code) {
        const lowerCode = code.toLowerCase();
        
        if (lowerCode.includes('select') && lowerCode.includes('from')) {
            return 'SQL';
        } else if (lowerCode.includes('import pandas') || lowerCode.includes('pd.')) {
            return 'Python';
        } else if (lowerCode.includes('function') || lowerCode.includes('const') || lowerCode.includes('let')) {
            return 'JavaScript';
        } else {
            return 'Unknown';
        }
    }

    // Display Code Explanation
    displayCodeExplanation(explanation) {
        const container = document.getElementById('explanation-content');
        
        let html = `
            <div class="code-summary">
                <h4>Code Type: ${explanation.type}</h4>
                <p>${explanation.summary}</p>
            </div>
            
            <div class="code-steps">
                <h4>Processing Steps</h4>
        `;
        
        if (explanation.steps.length > 0) {
            explanation.steps.forEach(step => {
                html += `
                    <div class="explanation-item">
                        <div class="explanation-title">${step.type}</div>
                        <div class="explanation-text">${step.description}</div>
                        <code>${step.code}</code>
                    </div>
                `;
            });
        } else {
            html += '<p class="no-data">No recognizable processing steps found. Try a different code format.</p>';
        }
        
        html += '</div>';
        container.innerHTML = html;
    }

    // Display Transformation Flow
    displayTransformationFlow(flow) {
        const container = document.getElementById('flow-diagram');
        
        if (flow.length === 0) {
            container.innerHTML = '<p class="no-data">No transformation flow detected.</p>';
            return;
        }
        
        let html = '<div class="flow-diagram">';
        
        flow.forEach((step, index) => {
            html += `
                <div class="flow-step">
                    <div class="flow-number">${index + 1}</div>
                    <div class="flow-label">${step}</div>
                </div>
            `;
            
            if (index < flow.length - 1) {
                html += '<div class="flow-arrow">→</div>';
            }
        });
        
        html += '</div>';
        container.innerHTML = html;
    }

    // Update Signatures
    updateSignatures(analysis) {
        const signature = {
            id: Date.now(),
            fileName: analysis.fileName,
            date: analysis.uploadDate,
            schemaSignature: this.generateSchemaSignature(analysis.schema),
            qualitySignature: this.generateQualitySignature(analysis.quality),
            processingSignature: this.generateProcessingSignature(analysis.mapping)
        };
        
        this.signatures.push(signature);
        this.saveData();
        this.displaySignatures();
    }

    // Generate Schema Signature
    generateSchemaSignature(schema) {
        return {
            columnCount: schema.totalColumns,
            rowCount: schema.totalRows,
            dataTypes: schema.columns.reduce((acc, col) => {
                acc[col.dataType] = (acc[col.dataType] || 0) + 1;
                return acc;
            }, {}),
            nullPercentage: schema.columns.reduce((sum, col) => sum + parseFloat(col.nullPercentage), 0) / schema.columns.length
        };
    }

    // Generate Quality Signature
    generateQualitySignature(quality) {
        return {
            qualityScore: parseFloat(quality.qualityScore),
            completeness: parseFloat(quality.completeness),
            uniqueness: parseFloat(quality.uniqueness),
            qualityLevel: quality.qualityLevel
        };
    }

    // Generate Processing Signature
    generateProcessingSignature(mappings) {
        const targetTypes = mappings.reduce((acc, mapping) => {
            acc[mapping.target] = (acc[mapping.target] || 0) + 1;
            return acc;
        }, {});
        
        const avgConfidence = mappings.reduce((sum, mapping) => sum + mapping.confidence, 0) / mappings.length;
        
        return {
            targetTypes: targetTypes,
            averageConfidence: avgConfidence,
            mappingCount: mappings.length
        };
    }

    // Display Signatures
    displaySignatures() {
        const container = document.getElementById('signatures-container');
        
        if (this.signatures.length === 0) {
            container.innerHTML = '<p class="no-data">No signatures detected yet. Upload files to start analysis.</p>';
            return;
        }
        
        let html = '';
        
        this.signatures.slice(-5).reverse().forEach(signature => {
            html += `
                <div class="signature-item">
                    <div class="signature-header">
                        <span class="signature-name">${signature.fileName}</span>
                        <span class="signature-date">${signature.date.toLocaleDateString()}</span>
                    </div>
                    <div class="signature-details">
                        <span>Columns: ${signature.schemaSignature.columnCount}</span>
                        <span>Rows: ${signature.schemaSignature.rowCount}</span>
                        <span>Quality: ${signature.qualitySignature.qualityScore}%</span>
                        <span>Confidence: ${signature.processingSignature.averageConfidence.toFixed(1)}%</span>
                    </div>
                </div>
            `;
        });
        
        container.innerHTML = html;
    }

    // Update Metrics
    updateMetrics() {
        const schemaCount = new Set(this.signatures.map(s => JSON.stringify(s.schemaSignature.dataTypes))).size;
        const qualityCount = this.signatures.filter(s => s.qualitySignature.qualityScore >= 70).length;
        const processingCount = new Set(this.signatures.map(s => JSON.stringify(s.processingSignature.targetTypes))).size;
        const filesCount = this.signatures.length;
        
        document.getElementById('schema-count').textContent = schemaCount;
        document.getElementById('quality-count').textContent = qualityCount;
        document.getElementById('processing-count').textContent = processingCount;
        document.getElementById('files-count').textContent = filesCount;
        
        this.updateCharts();
    }

    // Initialize Charts
    initializeCharts() {
        // Data Type Distribution Chart
        const dataTypeCtx = document.getElementById('dataTypeChart').getContext('2d');
        this.dataTypeChart = new Chart(dataTypeCtx, {
            type: 'doughnut',
            data: {
                labels: ['String', 'Integer', 'Float', 'Date', 'Boolean'],
                datasets: [{
                    data: [0, 0, 0, 0, 0],
                    backgroundColor: ['#667eea', '#764ba2', '#f093fb', '#f5576c', '#4facfe']
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false
            }
        });
        
        // Quality Score Distribution Chart
        const qualityCtx = document.getElementById('qualityChart').getContext('2d');
        this.qualityChart = new Chart(qualityCtx, {
            type: 'bar',
            data: {
                labels: ['Excellent', 'Good', 'Warning', 'Poor'],
                datasets: [{
                    label: 'Quality Distribution',
                    data: [0, 0, 0, 0],
                    backgroundColor: ['#28a745', '#17a2b8', '#ffc107', '#dc3545']
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    }

    // Update Charts
    updateCharts() {
        // Update data type chart
        const dataTypeCounts = { string: 0, integer: 0, float: 0, date: 0, boolean: 0 };
        
        this.signatures.forEach(signature => {
            Object.entries(signature.schemaSignature.dataTypes).forEach(([type, count]) => {
                if (dataTypeCounts.hasOwnProperty(type)) {
                    dataTypeCounts[type] += count;
                }
            });
        });
        
        this.dataTypeChart.data.datasets[0].data = [
            dataTypeCounts.string,
            dataTypeCounts.integer,
            dataTypeCounts.float,
            dataTypeCounts.date,
            dataTypeCounts.boolean
        ];
        this.dataTypeChart.update();
        
        // Update quality chart
        const qualityCounts = { excellent: 0, good: 0, warning: 0, poor: 0 };
        
        this.signatures.forEach(signature => {
            qualityCounts[signature.qualitySignature.qualityLevel]++;
        });
        
        this.qualityChart.data.datasets[0].data = [
            qualityCounts.excellent,
            qualityCounts.good,
            qualityCounts.warning,
            qualityCounts.poor
        ];
        this.qualityChart.update();
    }

    // Utility Methods
    showLoading(message) {
        console.log('Loading:', message);
    }

    showError(message) {
        alert('Error: ' + message);
    }

    editMapping(index) {
        alert('Edit mapping functionality - to be implemented');
    }

    // Export Functionality
    exportAnalysisReport() {
        if (!this.analysisData) {
            alert('No analysis data available for export');
            return;
        }

        const report = this.generateReport();
        this.downloadJSON(report, `etl-analysis-${this.analysisData.fileName}-${new Date().toISOString().split('T')[0]}.json`);
    }

    exportSignatures() {
        if (this.signatures.length === 0) {
            alert('No signatures available for export');
            return;
        }

        this.downloadJSON(this.signatures, `etl-signatures-${new Date().toISOString().split('T')[0]}.json`);
    }

    exportSchemaMapping() {
        if (!this.analysisData || !this.analysisData.mapping) {
            alert('No mapping data available for export');
            return;
        }

        const mappingData = {
            fileName: this.analysisData.fileName,
            mappings: this.analysisData.mapping,
            schema: this.analysisData.schema,
            exportDate: new Date().toISOString()
        };

        this.downloadJSON(mappingData, `schema-mapping-${this.analysisData.fileName}-${new Date().toISOString().split('T')[0]}.json`);
    }

    generateReport() {
        return {
            reportInfo: {
                fileName: this.analysisData.fileName,
                generatedDate: new Date().toISOString(),
                version: '1.0.0'
            },
            fileInfo: {
                name: this.analysisData.fileName,
                size: this.analysisData.fileSize,
                type: this.analysisData.fileType,
                uploadDate: this.analysisData.uploadDate
            },
            schemaAnalysis: this.analysisData.schema,
            qualityAnalysis: this.analysisData.quality,
            mappingAnalysis: this.analysisData.mapping,
            recommendations: this.generateRecommendations()
        };
    }

    generateRecommendations() {
        const recommendations = [];
        
        if (this.analysisData.quality.qualityScore < 70) {
            recommendations.push({
                type: 'Quality Improvement',
                priority: 'High',
                description: 'Overall data quality is below acceptable threshold',
                actions: ['Review data collection processes', 'Implement data validation rules', 'Consider data cleansing procedures']
            });
        }

        if (this.analysisData.quality.completeness < 90) {
            recommendations.push({
                type: 'Data Completeness',
                priority: 'Medium',
                description: 'Missing data detected in multiple columns',
                actions: ['Identify sources of missing data', 'Implement default value strategies', 'Add data validation at source']
            });
        }

        if (this.analysisData.quality.duplicateRows > 0) {
            recommendations.push({
                type: 'Data Uniqueness',
                priority: 'Medium',
                description: `${this.analysisData.quality.duplicateRows} duplicate rows found`,
                actions: ['Remove duplicate records', 'Implement unique constraints', 'Review data ingestion process']
            });
        }

        const lowConfidenceMappings = this.analysisData.mapping.filter(m => m.confidence < 70);
        if (lowConfidenceMappings.length > 0) {
            recommendations.push({
                type: 'Column Mapping',
                priority: 'Low',
                description: `${lowConfidenceMappings.length} columns have low mapping confidence`,
                actions: ['Review automated mapping suggestions', 'Create custom mapping rules', 'Standardize column naming conventions']
            });
        }

        return recommendations;
    }

    downloadJSON(data, filename) {
        const jsonString = JSON.stringify(data, null, 2);
        const blob = new Blob([jsonString], { type: 'application/json' });
        const url = URL.createObjectURL(blob);
        
        const link = document.createElement('a');
        link.href = url;
        link.download = filename;
        document.body.appendChild(link);

    // Signature Browser Setup
    setupSignatureBrowser() {
        const searchInput = document.getElementById('signature-search');
        const searchBtn = document.getElementById('search-btn');
        const categoryFilter = document.getElementById('category-filter');
        const viewBtns = document.querySelectorAll('.view-btn');
        const loadSigBtn = document.getElementById('load-signature-btn');
        const sigFileInput = document.getElementById('sig-file-input');
        const closeDetailsBtn = document.getElementById('close-details');

        // Search functionality
        if (searchBtn) {
            searchBtn.addEventListener('click', () => {
                this.searchSignatures();
            });
        }

        if (searchInput) {
            searchInput.addEventListener('keypress', (e) => {
                if (e.key === 'Enter') {
                    this.searchSignatures();
                }
            });
        }

        // Category filter
        if (categoryFilter) {
            categoryFilter.addEventListener('change', () => {
                this.filterSignatures();
            });
        }

        // View toggle
        viewBtns.forEach(btn => {
            btn.addEventListener('click', () => {
                viewBtns.forEach(b => b.classList.remove('active'));
                btn.classList.add('active');
                this.currentView = btn.getAttribute('data-view');
                this.updateSignatureView();
            });
        });

        // Load local signature file
        if (loadSigBtn) {
            loadSigBtn.addEventListener('click', () => {
                sigFileInput.click();
            });
        }

        if (sigFileInput) {
            sigFileInput.addEventListener('change', (e) => {
                this.handleLocalSignatureFile(e.target.files[0]);
            });
        }

        // Close details panel
        if (closeDetailsBtn) {
            closeDetailsBtn.addEventListener('click', () => {
                document.getElementById('signature-details').style.display = 'none';
            });
        }
    }

    // Load and display signature catalog
    loadSignatureCatalog() {
        if (this.signatureCatalog) {
            this.displaySignatureCatalog();
            this.updateSignatureStats();
        }
    }

    // Display signature catalog
    displaySignatureCatalog() {
        const resultsContainer = document.getElementById('signature-results');
        if (!resultsContainer || !this.signatureCatalog) return;

        const signatures = this.getAllSignatures();
        this.renderSignatures(signatures);
    }

    // Get all signatures from catalog
    getAllSignatures() {
        const signatures = [];
        if (!this.signatureCatalog) return signatures;

        for (const category in this.signatureCatalog.categories) {
            for (const subcategory in this.signatureCatalog.categories[category]) {
                this.signatureCatalog.categories[category][subcategory].forEach(sig => {
                    signatures.push({
                        name: sig,
                        category: category,
                        subcategory: subcategory,
                        path: `connector_etl/${category}/${subcategory}/src/main/resource/signatures/${sig}`,
                        size: this.estimateSignatureSize(sig),
                        vendor: this.extractVendor(subcategory),
                        type: this.extractType(sig)
                    });
                });
            }
        }

        return signatures;
    }

    // Render signatures in current view
    renderSignatures(signatures) {
        const resultsContainer = document.getElementById('signature-results');
        if (!resultsContainer) return;

        resultsContainer.className = this.currentView === 'grid' ? 'signature-grid' : 'signature-list';
        resultsContainer.innerHTML = '';

        signatures.forEach(sig => {
            const card = this.createSignatureCard(sig);
            resultsContainer.appendChild(card);
        });
    }

    // Create signature card element
    createSignatureCard(signature) {
        const card = document.createElement('div');
        card.className = 'signature-card';
        card.onclick = () => this.selectSignature(signature);

        card.innerHTML = `
            <div class="signature-card-header">
                <div class="signature-name">${signature.name}</div>
                <div class="signature-category">${signature.category}</div>
            </div>
            <div class="signature-path">${signature.path}</div>
            <div class="signature-meta">
                <span>📁 ${signature.subcategory}</span>
                <span>🏢 ${signature.vendor}</span>
                <span>📄 ${signature.type}</span>
                <span>📊 ${signature.size}</span>
            </div>
        `;

        return card;
    }

    // Select and analyze signature
    selectSignature(signature) {
        this.selectedSignature = signature;
        this.showSignatureDetails(signature);
    }

    // Show signature details panel
    showSignatureDetails(signature) {
        const detailsPanel = document.getElementById('signature-details');
        const signatureName = document.getElementById('selected-signature-name');
        const signatureContent = document.getElementById('signature-content');

        if (signatureName) {
            signatureName.textContent = signature.name;
        }

        if (signatureContent) {
            signatureContent.innerHTML = `
                <div class="loading">Loading signature details...</div>
            `;
        }

        detailsPanel.style.display = 'block';

        // Try to load actual signature file (this would require server-side support)
        this.loadSignatureFile(signature.path).then(data => {
            this.displaySignatureData(data);
        }).catch(error => {
            this.displaySignatureError(signature);
        });
    }

    // Load signature file (mock implementation)
    async loadSignatureFile(path) {
        // In a real implementation, this would fetch the actual .sig file
        // For now, we'll return a mock structure
        return new Promise((resolve, reject) => {
            // Try to load from known signatures
            if (path.includes('ENGLISH_COL_32.sig') || path.includes('MATH_COL_32.sig')) {
                resolve(this.getMockSignatureData(path));
            } else {
                reject(new Error('File not accessible in browser environment'));
            }
        });
    }

    // Get mock signature data for demonstration
    getMockSignatureData(path) {
        const isEnglish = path.includes('ENGLISH_COL_32.sig');
        return {
            encoding: "UTF-8",
            fileExtensions: [".csv"],
            format: {
                "@type": "Delimited",
                formatName: isEnglish ? "ENGLISH_COL_32" : "MATH_COL_32",
                quoteDelim: "\"",
                fieldDelim: ",",
                hasHeader: true,
                naturalKey: ["STUDENT_ID", "STUDENT_FIRST_NAME", "STUDENT_LAST_NAME"],
                fields: isEnglish ? this.getEnglishFields() : this.getMathFields()
            }
        };
    }

    // Display signature data
    displaySignatureData(data) {
        const signatureContent = document.getElementById('signature-content');
        if (!signatureContent) return;

        const fields = data.format.fields || [];
        
        let html = `
            <div class="signature-overview">
                <h4>Signature Overview</h4>
                <div class="overview-stats">
                    <span><strong>Format:</strong> ${data.format['@type']}</span>
                    <span><strong>Delimiter:</strong> ${data.format.fieldDelim}</span>
                    <span><strong>Has Header:</strong> ${data.format.hasHeader ? 'Yes' : 'No'}</span>
                    <span><strong>Total Fields:</strong> ${fields.length}</span>
                    <span><strong>Encoding:</strong> ${data.encoding}</span>
                </div>
            </div>

            <div class="fields-section">
                <h4>Field Definitions (${fields.length} fields)</h4>
        `;

        fields.slice(0, 10).forEach((field, index) => {
            html += `
                <div class="field-details">
                    <div class="field-name">${field.physicalName}</div>
                    <div class="field-info">
                        <span><strong>Logical:</strong> ${field.logicalName}</span>
                        <span><strong>Type:</strong> ${field.dataTypes}</span>
                        <span><strong>Required:</strong> ${field.isFieldRequired}</span>
                        <span><strong>Nullable:</strong> ${field.canBeNull}</span>
                        <span><strong>Column:</strong> ${field.fieldOffset.columnNum}</span>
                        <span><strong>Length:</strong> ${field.fieldLength}</span>
                    </div>
                </div>
            `;
        });

        if (fields.length > 10) {
            html += `<p><em>... and ${fields.length - 10} more fields</em></p>`;
        }

        html += '</div>';

        signatureContent.innerHTML = html;
    }

    // Display error when signature can't be loaded
    displaySignatureError(signature) {
        const signatureContent = document.getElementById('signature-content');
        if (!signatureContent) return;

        signatureContent.innerHTML = `
            <div class="signature-error">
                <h4>⚠️ Signature File Not Accessible</h4>
                <p>The signature file <code>${signature.path}</code> cannot be loaded directly in the browser.</p>
                <p><strong>File Details:</strong></p>
                <ul>
                    <li><strong>Category:</strong> ${signature.category}</li>
                    <li><strong>Subcategory:</strong> ${signature.subcategory}</li>
                    <li><strong>Vendor:</strong> ${signature.vendor}</li>
                    <li><strong>Type:</strong> ${signature.type}</li>
                    <li><strong>Estimated Size:</strong> ${signature.size}</li>
                </ul>
                <p><em>To view full signature details, please load the file using the "Load Local .sig File" button.</em></p>
            </div>
        `;
    }

    // Handle local signature file upload
    async handleLocalSignatureFile(file) {
        if (!file || !file.name.endsWith('.sig')) {
            alert('Please select a valid .sig file');
            return;
        }

        try {
            const text = await this.readFileAsText(file);
            const signatureData = JSON.parse(text);
            
            this.selectedSignature = {
                name: file.name,
                category: 'local',
                subcategory: 'uploaded',
                path: file.name,
                size: this.formatFileSize(file.size),
                vendor: 'Local File',
                type: 'Uploaded'
            };

            this.showSignatureDetails(this.selectedSignature);
            this.displaySignatureData(signatureData);
            
        } catch (error) {
            alert('Error reading signature file: ' + error.message);
        }
    }

    // Read file as text
    readFileAsText(file) {
        return new Promise((resolve, reject) => {
            const reader = new FileReader();
            reader.onload = e => resolve(e.target.result);
            reader.onerror = reject;
            reader.readAsText(file);
        });
    }

    // Search signatures
    searchSignatures() {
        const searchTerm = document.getElementById('signature-search').value;
        const categoryFilter = document.getElementById('category-filter').value;
        
        let signatures = this.getAllSignatures();
        
        if (searchTerm) {
            signatures = signatures.filter(sig => 
                sig.name.toLowerCase().includes(searchTerm.toLowerCase()) ||
                sig.subcategory.toLowerCase().includes(searchTerm.toLowerCase()) ||
                sig.vendor.toLowerCase().includes(searchTerm.toLowerCase())
            );
        }
        
        if (categoryFilter) {
            signatures = signatures.filter(sig => sig.category === categoryFilter);
        }
        
        this.renderSignatures(signatures);
    }

    // Filter signatures by category
    filterSignatures() {
        this.searchSignatures();
    }

    // Update signature view
    updateSignatureView() {
        const signatures = this.getAllSignatures();
        this.renderSignatures(signatures);
    }

    // Update signature statistics
    updateSignatureStats() {
        if (!this.signatureCatalog) return;

        const totalSigs = document.getElementById('total-signatures');
        const categoriesCount = document.getElementById('categories-count');
        const vendorsCount = document.getElementById('vendors-count');
        const statesCount = document.getElementById('states-count');

        if (totalSigs) totalSigs.textContent = this.signatureCatalog.totalSignatures;
        if (categoriesCount) categoriesCount.textContent = Object.keys(this.signatureCatalog.categories).length;
        
        // Count unique vendors and states
        const vendors = new Set();
        const states = new Set();
        
        for (const category in this.signatureCatalog.categories) {
            for (const subcategory in this.signatureCatalog.categories[category]) {
                if (category === 'vendor') vendors.add(subcategory);
                if (category === 'state') states.add(subcategory);
            }
        }
        
        if (vendorsCount) vendorsCount.textContent = vendors.size;
        if (statesCount) statesCount.textContent = states.size;
    }

    // Utility functions for signature processing
    estimateSignatureSize(filename) {
        // Estimate based on common patterns
        if (filename.includes('FULL') || filename.includes('1314_COLS')) return 'Large';
        if (filename.includes('COLS') && filename.match(/\d{3,}/)) return 'Large';
        if (filename.includes('COLS') && filename.match(/\d{2,}/)) return 'Medium';
        return 'Small';
    }

    extractVendor(subcategory) {
        // Extract vendor name from subcategory path
        const parts = subcategory.split('/');
        return parts[parts.length - 1].replace(/_/g, ' ').toUpperCase();
    }

    extractType(filename) {
        // Extract assessment type from filename
        if (filename.includes('MATH')) return 'Mathematics';
        if (filename.includes('ENGLISH') || filename.includes('READING')) return 'English/Reading';
        if (filename.includes('SCIENCE')) return 'Science';
        if (filename.includes('SOCIAL')) return 'Social Studies';
        if (filename.includes('ACCESS') || filename.includes('WIDA')) return 'Language Assessment';
        if (filename.includes('DIBELS')) return 'Reading Assessment';
        if (filename.includes('STAR')) return 'Adaptive Assessment';
        return 'General';
    }

    formatFileSize(bytes) {
        if (bytes < 1024) return bytes + ' B';
        if (bytes < 1048576) return Math.round(bytes / 1024) + ' KB';
        return Math.round(bytes / 1048576) + ' MB';
    }

    // Mock field data for demonstration
    getEnglishFields() {
        return [
            {
                physicalName: "Year",
                logicalName: "YEAR",
                dataTypes: "STRING",
                isFieldRequired: "Y",
                canBeNull: "Y",
                fieldOffset: { columnNum: 1 },
                fieldLength: 500
            },
            {
                physicalName: "Student #",
                logicalName: "STUDENT_ID", 
                dataTypes: "STRING",
                isFieldRequired: "Y",
                canBeNull: "Y",
                fieldOffset: { columnNum: 9 },
                fieldLength: 500
            },
            {
                physicalName: "Reading Performance Level",
                logicalName: "READING_PERFORMANCE_LEVEL",
                dataTypes: "STRING", 
                isFieldRequired: "Y",
                canBeNull: "Y",
                fieldOffset: { columnNum: 17 },
                fieldLength: 500
            }
        ];
    }

    getMathFields() {
        return [
            {
                physicalName: "Year",
                logicalName: "YEAR",
                dataTypes: "STRING",
                isFieldRequired: "Y", 
                canBeNull: "Y",
                fieldOffset: { columnNum: 1 },
                fieldLength: 500
            },
            {
                physicalName: "Student #",
                logicalName: "STUDENT_ID",
                dataTypes: "STRING",
                isFieldRequired: "Y",
                canBeNull: "Y", 
                fieldOffset: { columnNum: 9 },
                fieldLength: 500
            },
            {
                physicalName: "Performance Level",
                logicalName: "MATHEMATICS_PERFORMANCE_LEVEL",
                dataTypes: "STRING",
                isFieldRequired: "Y",
                canBeNull: "Y",
                fieldOffset: { columnNum: 17 },
                fieldLength: 500
            }
        ];
    }
        link.click();
        document.body.removeChild(link);
        
        URL.revokeObjectURL(url);
    }

    downloadCSV(data, filename) {
        const csv = Papa.unparse(data);
        const blob = new Blob([csv], { type: 'text/csv' });
        const url = URL.createObjectURL(blob);
        
        const link = document.createElement('a');
        link.href = url;
        link.download = filename;
        document.body.appendChild(link);
        link.click();
        document.body.removeChild(link);
        
        URL.revokeObjectURL(url);
    }

    // Data Persistence
    saveData() {
        localStorage.setItem('etl-signatures', JSON.stringify(this.signatures));
    }

    loadStoredData() {
        const stored = localStorage.getItem('etl-signatures');
        if (stored) {
            this.signatures = JSON.parse(stored).map(sig => ({
                ...sig,
                date: new Date(sig.date)
            }));
            this.updateMetrics();
            this.displaySignatures();
        }
    }
}

// Initialize the application when DOM is loaded
document.addEventListener('DOMContentLoaded', () => {
    window.etlApp = new ETLAssistant();
});