# ETL Assistant Tool

A comprehensive web-based ETL (Extract, Transform, Load) analysis platform that provides intelligent data signature analysis, code overview generation, and file analysis capabilities.

## Features

### 🔍 Data Signatures Dashboard
- **Schema Signatures**: Track column names, data types, and structural patterns
- **Quality Signatures**: Monitor data completeness, uniqueness, and quality metrics
- **Processing Signatures**: Analyze transformation patterns and mapping rules
- **Visual Analytics**: Interactive charts showing data type and quality distributions

### 📊 Code Overview
- **Multi-language Support**: Analyze SQL, Python, and JavaScript ETL code
- **Natural Language Explanations**: Convert complex code into simple descriptions
- **Transformation Flow**: Visual representation of data processing steps
- **Step-by-step Breakdown**: Detailed analysis of each processing operation

### 📁 File Analysis
- **Multiple Format Support**: CSV, Excel (.xlsx, .xls), and schema files
- **Schema Detection**: Automatic data type inference and column analysis
- **Column Mapping**: Intelligent suggestions for source-to-target mappings
- **Data Quality Assessment**: Comprehensive quality scoring and recommendations
- **Data Preview**: Interactive preview of uploaded data

## Getting Started

### Prerequisites
- Modern web browser (Chrome, Firefox, Safari, Edge)
- No additional installations required - runs entirely in the browser

### Installation
1. Download or clone the project files
2. Open `index.html` in your web browser
3. Start analyzing your ETL data!

### Usage

#### 1. Signatures Analysis
- Navigate to the "Signatures" tab
- View real-time metrics of your analyzed files
- Explore data type and quality distributions through interactive charts
- Review signature history for pattern identification

#### 2. Code Analysis
- Go to the "Code Overview" tab
- Paste your ETL code (SQL, Python, JavaScript) into the text area
- Click "Analyze Code" to get:
  - Plain language explanation of the code
  - Step-by-step processing breakdown
  - Visual transformation flow diagram

#### 3. File Analysis
- Switch to the "File Analysis" tab
- Upload files by:
  - Dragging and dropping files onto the upload area
  - Clicking "Choose Files" to select from your computer
- Explore the analysis results across four tabs:
  - **Schema**: Column details, data types, and statistics
  - **Column Mapping**: Suggested mappings with confidence scores
  - **Data Quality**: Quality metrics and improvement recommendations
  - **Data Preview**: Sample data rows for verification

## Supported File Formats

- **CSV**: Comma-separated values
- **Excel**: .xlsx and .xls formats
- **JSON**: Schema definitions (planned)
- **SQL**: DDL statements (planned)

## Technology Stack

- **Frontend**: HTML5, CSS3, JavaScript (ES6+)
- **Libraries**:
  - Chart.js for data visualizations
  - Papa Parse for CSV processing
  - SheetJS for Excel file handling
- **Storage**: Browser localStorage for data persistence

## Sample Data

The project includes `sample-data.csv` for testing purposes. This file contains employee data with the following columns:
- ID (integer)
- Name (string)
- Email (string)
- Department (string)
- Salary (numeric)
- Hire Date (date)
- Status (string)

## Features in Detail

### Schema Analysis
- Automatic data type detection (string, integer, float, date, boolean)
- Column statistics (unique values, null counts, percentages)
- Sample value extraction for validation
- Structural pattern recognition

### Quality Assessment
- **Completeness**: Percentage of non-empty cells
- **Uniqueness**: Duplicate detection and scoring
- **Overall Score**: Composite quality metric
- **Recommendations**: Actionable improvement suggestions

### Column Mapping Intelligence
- Pattern-based mapping suggestions
- Confidence scoring for each mapping
- Common field type recognition (ID, email, date, etc.)
- Editable mapping configurations

### Code Understanding
- Multi-language code parsing
- Business logic extraction
- Data flow visualization
- Plain language summaries

## Browser Compatibility

- Chrome 80+
- Firefox 75+
- Safari 13+
- Edge 80+

## Data Privacy

- All processing happens locally in your browser
- No data is sent to external servers
- Data persistence uses browser localStorage only
- Clear data anytime through browser settings

## Contributing

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## Future Enhancements

- [ ] Export analysis reports to PDF/Excel
- [ ] Advanced mapping rule editor
- [ ] Data lineage tracking
- [ ] API integration capabilities
- [ ] Real-time collaboration features
- [ ] Advanced code analysis (more languages)
- [ ] Machine learning for pattern recognition
- [ ] Data quality alerting system

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For questions, issues, or feature requests, please create an issue in the project repository.

---

**Built with ❤️ for the ETL community**