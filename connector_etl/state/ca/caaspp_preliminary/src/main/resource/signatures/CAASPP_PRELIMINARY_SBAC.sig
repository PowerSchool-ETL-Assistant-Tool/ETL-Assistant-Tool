{
	"encoding": "UTF-8",
	"format": {
	  "@type": "Delimited",
	  "formatName": "CAASPP_PRELIMINARY_SBAC",
	  "quoteDelim": "\"",
	  "fieldDelim": ",",
	  "hasHeader": true,
	  "naturalKey": ["ENROLLED_SCHOOL_ID","STUDENT_LOCAL_ID", "ELA/LITERACY_OPPNUMBER","MATHEMATICS_OPPNUMBER"],
	  "fields": [{
		"physicalName": "Student First Name",
		"otherPossibleNames": [],
		"logicalName": "STUDENT_FIRST_NAME",
		"formatMask": null,
		"isFieldRequired": "Y",
		"canBeNull": "Y",
		"fieldOffset": {
		  "offsetStart": 0,
		  "offsetEnd": 0,
		  "columnNum": 1
		},
		"fieldLength": 30,
		"expectedValues": [],
		"dataTypes": "STRING",
		"scale": null
	  },
		{
		  "physicalName": "Student Last Name",
		  "otherPossibleNames": [],
		  "logicalName": "STUDENT_LAST_NAME",
		  "formatMask": null,
		  "isFieldRequired": "Y",
		  "canBeNull": "Y",
		  "fieldOffset": {
			"offsetStart": 0,
			"offsetEnd": 0,
			"columnNum": 2
		  },
		  "fieldLength": 45,
		  "expectedValues": [],
		  "dataTypes": "STRING",
		  "scale": null
		},
		{
		  "physicalName": "Student ID",
		  "otherPossibleNames": [],
		  "logicalName": "STUDENT_LOCAL_ID",
		  "formatMask": null,
		  "isFieldRequired": "Y",
		  "canBeNull": "Y",
		  "fieldOffset": {
			"offsetStart": 0,
			"offsetEnd": 0,
			"columnNum": 3
		  },
		  "fieldLength": 11,
		  "expectedValues": [],
		  "dataTypes": "INTEGER",
		  "scale": null
		},
		{
		  "physicalName": "Race/Ethnicity",
		  "otherPossibleNames": [],
		  "logicalName": "RACE/ETHNICITY",
		  "formatMask": null,
		  "isFieldRequired": "Y",
		  "canBeNull": "Y",
		  "fieldOffset": {
			"offsetStart": 0,
			"offsetEnd": 0,
			"columnNum": 4
		  },
		  "fieldLength": 40,
		  "expectedValues": [],
		  "dataTypes": "STRING",
		  "scale": null
		},
		{
		  "physicalName": "IDEA Indicator",
		  "otherPossibleNames": [],
		  "logicalName": "IDEA_INDICATOR",
		  "formatMask": null,
		  "isFieldRequired": "Y",
		  "canBeNull": "Y",
		  "fieldOffset": {
			"offsetStart": 0,
			"offsetEnd": 0,
			"columnNum": 5
		  },
		  "fieldLength": 1,
		  "expectedValues": ["", "Y"],
		  "dataTypes": "STRING",
		  "scale": null
		},
		{
		  "physicalName": "LEP Status",
		  "otherPossibleNames": [],
		  "logicalName": "LEP_STATUS",
		  "formatMask": null,
		  "isFieldRequired": "Y",
		  "canBeNull": "Y",
		  "fieldOffset": {
			"offsetStart": 0,
			"offsetEnd": 0,
			"columnNum": 6
		  },
		  "fieldLength": 1,
		  "expectedValues": ["", "Y"],
		  "dataTypes": "STRING",
		  "scale": null
		},
		{
		  "physicalName": "Section 504 Status",
		  "otherPossibleNames": [],
		  "logicalName": "SECTION_504_STATUS",
		  "formatMask": null,
		  "isFieldRequired": "Y",
		  "canBeNull": "Y",
		  "fieldOffset": {
			"offsetStart": 0,
			"offsetEnd": 0,
			"columnNum": 7
		  },
		  "fieldLength": 1,
		  "expectedValues": ["", "Y", "N"],
		  "dataTypes": "STRING",
		  "scale": null
		},
		{
		  "physicalName": "Economically Disadvantaged Status",
		  "otherPossibleNames": [],
		  "logicalName": "ECONOMICALLY_DISADVANTAGED_STATUS",
		  "formatMask": null,
		  "isFieldRequired": "Y",
		  "canBeNull": "Y",
		  "fieldOffset": {
			"offsetStart": 0,
			"offsetEnd": 0,
			"columnNum": 8
		  },
		  "fieldLength": 1,
		  "expectedValues": ["", "Y"],
		  "dataTypes": "STRING",
		  "scale": null
		},
		{
		  "physicalName": "Language Code",
		  "otherPossibleNames": [],
		  "logicalName": "LANGUAGE_CODE",
		  "formatMask": null,
		  "isFieldRequired": "Y",
		  "canBeNull": "Y",
		  "fieldOffset": {
			"offsetStart": 0,
			"offsetEnd": 0,
			"columnNum": 9
		  },
		  "fieldLength": 5,
		  "expectedValues": [],
		  "dataTypes": "STRING",
		  "scale": null
		},
		{
		  "physicalName": "English Language Proficiency Level",
		  "otherPossibleNames": [],
		  "logicalName": "ENGLISH_LANGUAGE_PROFICIENCY_LEVEL",
		  "formatMask": null,
		  "isFieldRequired": "Y",
		  "canBeNull": "Y",
		  "fieldOffset": {
			"offsetStart": 0,
			"offsetEnd": 0,
			"columnNum": 10
		  },
		  "fieldLength": 25,
		  "expectedValues": ["Advanced", "Beginning", "Early Advanced", "Early Intermediate", "Intermediate", ""],
		  "dataTypes": "STRING",
		  "scale": null
		},
		{
		  "physicalName": "Migrant Status",
		  "otherPossibleNames": [],
		  "logicalName": "MIGRANT_STATUS",
		  "formatMask": null,
		  "isFieldRequired": "Y",
		  "canBeNull": "Y",
		  "fieldOffset": {
			"offsetStart": 0,
			"offsetEnd": 0,
			"columnNum": 11
		  },
		  "fieldLength": 1,
		  "expectedValues": ["", "Y", "N"],
		  "dataTypes": "STRING",
		  "scale": null
		},
		{
		  "physicalName": "First Entry Date Into US School",
		  "otherPossibleNames": [],
		  "logicalName": "FIRST_ENTRY_DATE_INTO_US_SCHOOL",
		  "formatMask": "Mddyyyy",
		  "isFieldRequired": "Y",
		  "canBeNull": "Y",
		  "fieldOffset": {
			"offsetStart": 0,
			"offsetEnd": 0,
			"columnNum": 12
		  },
		  "fieldLength": 10,
		  "expectedValues": [],
		  "dataTypes": "DATE",
		  "scale": null
		},
		{
		  "physicalName": "LEP Entry Date",
		  "otherPossibleNames": [],
		  "logicalName": "LEP_ENTRY_DATE",
		  "formatMask": "Mddyyyy",
		  "isFieldRequired": "Y",
		  "canBeNull": "Y",
		  "fieldOffset": {
			"offsetStart": 0,
			"offsetEnd": 0,
			"columnNum": 13
		  },
		  "fieldLength": 10,
		  "expectedValues": [],
		  "dataTypes": "DATE",
		  "scale": null
		},
		{
		  "physicalName": "LEP Exit Date",
		  "otherPossibleNames": [],
		  "logicalName": "LEP_EXIT_DATE",
		  "formatMask": "Mddyyyy",
		  "isFieldRequired": "Y",
		  "canBeNull": "Y",
		  "fieldOffset": {
			"offsetStart": 0,
			"offsetEnd": 0,
			"columnNum": 14
		  },
		  "fieldLength": 10,
		  "expectedValues": [],
		  "dataTypes": "DATE",
		  "scale": null
		},
		{
		  "physicalName": "Primary Disability Type",
		  "otherPossibleNames": [],
		  "logicalName": "PRIMARY_DISABILITY_TYPE",
		  "formatMask": null,
		  "isFieldRequired": "Y",
		  "canBeNull": "Y",
		  "fieldOffset": {
			"offsetStart": 0,
			"offsetEnd": 0,
			"columnNum": 15
		  },
		  "fieldLength": 5,
		  "expectedValues": [],
		  "dataTypes": "STRING",
		  "scale": null
		},
		{
		  "physicalName": "Enrolled School",
		  "otherPossibleNames": [],
		  "logicalName": "ENROLLED_SCHOOL",
		  "formatMask": null,
		  "isFieldRequired": "Y",
		  "canBeNull": "Y",
		  "fieldOffset": {
			"offsetStart": 0,
			"offsetEnd": 0,
			"columnNum": 16
		  },
		  "fieldLength": 100,
		  "expectedValues": [],
		  "dataTypes": "STRING",
		  "scale": null
		},
		{
		  "physicalName": "Enrolled School ID",
		  "otherPossibleNames": [],
		  "logicalName": "ENROLLED_SCHOOL_ID",
		  "formatMask": null,
		  "isFieldRequired": "Y",
		  "canBeNull": "Y",
		  "fieldOffset": {
			"offsetStart": 0,
			"offsetEnd": 0,
			"columnNum": 17
		  },
		  "fieldLength": 15,
		  "expectedValues": [],
		  "dataTypes": "INTEGER",
		  "scale": null
		},
		{
		  "physicalName": "Enrolled District",
		  "otherPossibleNames": [],
		  "logicalName": "ENROLLED_DISTRICT",
		  "formatMask": null,
		  "isFieldRequired": "Y",
		  "canBeNull": "Y",
		  "fieldOffset": {
			"offsetStart": 0,
			"offsetEnd": 0,
			"columnNum": 18
		  },
		  "fieldLength": 100,
		  "expectedValues": [],
		  "dataTypes": "STRING",
		  "scale": null
		},
		{
		  "physicalName": "Enrolled District ID",
		  "otherPossibleNames": [],
		  "logicalName": "ENROLLED_DISTRICT_ID",
		  "formatMask": null,
		  "isFieldRequired": "Y",
		  "canBeNull": "Y",
		  "fieldOffset": {
			"offsetStart": 0,
			"offsetEnd": 0,
			"columnNum": 19
		  },
		  "fieldLength": 15,
		  "expectedValues": [],
		  "dataTypes": "INTEGER",
		  "scale": null
		},
		{
		  "physicalName": "ELA/Literacy OppNumber",
		  "otherPossibleNames": [],
		  "logicalName": "ELA/LITERACY_OPPNUMBER",
		  "formatMask": null,
		  "isFieldRequired": "Y",
		  "canBeNull": "Y",
		  "fieldOffset": {
			"offsetStart": 0,
			"offsetEnd": 0,
			"columnNum": 20
		  },
		  "fieldLength": 1,
		  "expectedValues": [],
		  "dataTypes": "INTEGER",
		  "scale": null
		},
		{
		  "physicalName": "ELA/Literacy Scale Score",
		  "otherPossibleNames": [],
		  "logicalName": "ELA/LITERACY_SCALE_SCORE",
		  "formatMask": null,
		  "isFieldRequired": "Y",
		  "canBeNull": "Y",
		  "fieldOffset": {
			"offsetStart": 0,
			"offsetEnd": 0,
			"columnNum": 21
		  },
		  "fieldLength": 4,
		  "expectedValues": [],
		  "dataTypes": "STRING",
		  "scale": null
		},
		{
		  "physicalName": "Standard Error for ELA/Literacy Scale Score",
		  "otherPossibleNames": [],
		  "logicalName": "STANDARD_ERROR_FOR_ELA/LITERACY_SCALE_SCORE",
		  "formatMask": null,
		  "isFieldRequired": "Y",
		  "canBeNull": "Y",
		  "fieldOffset": {
			"offsetStart": 0,
			"offsetEnd": 0,
			"columnNum": 22
		  },
		  "fieldLength": 2,
		  "expectedValues": [],
		  "dataTypes": "STRING",
		  "scale": null
		},
		{
		  "physicalName": "ELA/Literacy Achievement Level",
		  "otherPossibleNames": [],
		  "logicalName": "ELA/LITERACY_ACHIEVEMENT_LEVEL",
		  "formatMask": null,
		  "isFieldRequired": "Y",
		  "canBeNull": "Y",
		  "fieldOffset": {
			"offsetStart": 0,
			"offsetEnd": 0,
			"columnNum": 23
		  },
		  "fieldLength": 25,
		  "expectedValues": ["NS", "Standard Exceeded", "Standard Met", "Standard Nearly Met", "Standard Not Met", ""],
		  "dataTypes": "STRING",
		  "scale": null
		},
		{
		  "physicalName": "Reading Claim Achievement Category",
		  "otherPossibleNames": [],
		  "logicalName": "READING_CLAIM_ACHIEVEMENT_CATEGORY",
		  "formatMask": null,
		  "isFieldRequired": "Y",
		  "canBeNull": "Y",
		  "fieldOffset": {
			"offsetStart": 0,
			"offsetEnd": 0,
			"columnNum": 24
		  },
		  "fieldLength": 20,
		  "expectedValues": ["NS", "Above Standard", "Near Standard", "Below Standard", ""],
		  "dataTypes": "STRING",
		  "scale": null
		},
		{
		  "physicalName": "Writing Claim Achievement Category",
		  "otherPossibleNames": [],
		  "logicalName": "WRITING_CLAIM_ACHIEVEMENT_CATEGORY",
		  "formatMask": null,
		  "isFieldRequired": "Y",
		  "canBeNull": "Y",
		  "fieldOffset": {
			"offsetStart": 0,
			"offsetEnd": 0,
			"columnNum": 25
		  },
		  "fieldLength": 20,
		  "expectedValues": ["NS", "Above Standard", "Near Standard", "Below Standard", ""],
		  "dataTypes": "STRING",
		  "scale": null
		},
		{
		  "physicalName": "Listening Claim Achievement Category",
		  "otherPossibleNames": [],
		  "logicalName": "LISTENING_CLAIM_ACHIEVEMENT_CATEGORY",
		  "formatMask": null,
		  "isFieldRequired": "Y",
		  "canBeNull": "Y",
		  "fieldOffset": {
			"offsetStart": 0,
			"offsetEnd": 0,
			"columnNum": 26
		  },
		  "fieldLength": 20,
		  "expectedValues": ["NS", "Above Standard", "Near Standard", "Below Standard", ""],
		  "dataTypes": "STRING",
		  "scale": null
		},
		{
		  "physicalName": "Research/Inquiry Claim Achievement Category",
		  "otherPossibleNames": [],
		  "logicalName": "RESEARCH/INQUIRY_CLAIM_ACHIEVEMENT_CATEGORY",
		  "formatMask": null,
		  "isFieldRequired": "Y",
		  "canBeNull": "Y",
		  "fieldOffset": {
			"offsetStart": 0,
			"offsetEnd": 0,
			"columnNum": 27
		  },
		  "fieldLength": 20,
		  "expectedValues": ["NS", "Above Standard", "Near Standard", "Below Standard", ""],
		  "dataTypes": "STRING",
		  "scale": null
		},
		{
		  "physicalName": "Informational Organization/Purpose",
		  "otherPossibleNames": [],
		  "logicalName": "INFORMATIONAL_ORGANIZATION/PURPOSE",
		  "formatMask": null,
		  "isFieldRequired": "N",
		  "canBeNull": "Y",
		  "fieldOffset": {
			"offsetStart": 0,
			"offsetEnd": 0,
			"columnNum": 28
		  },
		  "fieldLength": 1,
		  "expectedValues": ["0", "1", "2", "3", "4", ""],
		  "dataTypes": "INTEGER",
		  "scale": null
		},
		{
		  "physicalName": "Informational Evidence/Elaboration",
		  "otherPossibleNames": [],
		  "logicalName": "INFORMATIONAL_EVIDENCE/ELABORATION",
		  "formatMask": null,
		  "isFieldRequired": "N",
		  "canBeNull": "Y",
		  "fieldOffset": {
			"offsetStart": 0,
			"offsetEnd": 0,
			"columnNum": 29
		  },
		  "fieldLength": 1,
		  "expectedValues": ["0", "1", "2", "3", "4", ""],
		  "dataTypes": "INTEGER",
		  "scale": null
		},
		{
		  "physicalName": "Informational Conventions",
		  "otherPossibleNames": [],
		  "logicalName": "INFORMATIONAL_CONVENTIONS",
		  "formatMask": null,
		  "isFieldRequired": "N",
		  "canBeNull": "Y",
		  "fieldOffset": {
			"offsetStart": 0,
			"offsetEnd": 0,
			"columnNum": 30
		  },
		  "fieldLength": 1,
		  "expectedValues": ["0", "1", "2", "3", "4", ""],
		  "dataTypes": "INTEGER",
		  "scale": null
		},
		{
		  "physicalName": "Opinion Organization/Purpose",
		  "otherPossibleNames": [],
		  "logicalName": "OPINION_ORGANIZATION/PURPOSE",
		  "formatMask": null,
		  "isFieldRequired": "N",
		  "canBeNull": "Y",
		  "fieldOffset": {
			"offsetStart": 0,
			"offsetEnd": 0,
			"columnNum": 31
		  },
		  "fieldLength": 1,
		  "expectedValues": ["0", "1", "2", "3", "4", ""],
		  "dataTypes": "INTEGER",
		  "scale": null
		},
		{
		  "physicalName": "Opinion Evidence/Elaboration",
		  "otherPossibleNames": [],
		  "logicalName": "OPINION_EVIDENCE/ELABORATION",
		  "formatMask": null,
		  "isFieldRequired": "N",
		  "canBeNull": "Y",
		  "fieldOffset": {
			"offsetStart": 0,
			"offsetEnd": 0,
			"columnNum": 32
		  },
		  "fieldLength": 1,
		  "expectedValues": ["0", "1", "2", "3", "4", ""],
		  "dataTypes": "INTEGER",
		  "scale": null
		},
		{
		  "physicalName": "Opinion Conventions",
		  "otherPossibleNames": [],
		  "logicalName": "OPINION_CONVENTIONS",
		  "formatMask": null,
		  "isFieldRequired": "N",
		  "canBeNull": "Y",
		  "fieldOffset": {
			"offsetStart": 0,
			"offsetEnd": 0,
			"columnNum": 33
		  },
		  "fieldLength": 1,
		  "expectedValues": ["0", "1", "2", "3", "4", ""],
		  "dataTypes": "INTEGER",
		  "scale": null
		},
				{
        		  "physicalName": "Argumentative Organization/Purpose",
        		  "otherPossibleNames": [],
        		  "logicalName": "ARGUMENTATIVE_ORGANIZATION/PURPOSE",
        		  "formatMask": null,
        		  "isFieldRequired": "N",
        		  "canBeNull": "Y",
        		  "fieldOffset": {
        			"offsetStart": 0,
        			"offsetEnd": 0,
        			"columnNum": 34
        		  },
        		  "fieldLength": 1,
        		  "expectedValues": ["0", "1", "2", "3", "4", ""],
        		  "dataTypes": "INTEGER",
        		  "scale": null
        		},
        		{
        		  "physicalName": "Argumentative Evidence/Elaboration",
        		  "otherPossibleNames": [],
        		  "logicalName": "ARGUMENTATIVE_EVIDENCE/ELABORATION",
        		  "formatMask": null,
        		  "isFieldRequired": "N",
        		  "canBeNull": "Y",
        		  "fieldOffset": {
        			"offsetStart": 0,
        			"offsetEnd": 0,
        			"columnNum": 35
        		  },
        		  "fieldLength": 1,
        		  "expectedValues": ["0", "1", "2", "3", "4", ""],
        		  "dataTypes": "INTEGER",
        		  "scale": null
        		},
        		{
        		  "physicalName": "Argumentative Conventions",
        		  "otherPossibleNames": [],
        		  "logicalName": "ARGUMENTATIVE_CONVENTIONS",
        		  "formatMask": null,
        		  "isFieldRequired": "N",
        		  "canBeNull": "Y",
        		  "fieldOffset": {
        			"offsetStart": 0,
        			"offsetEnd": 0,
        			"columnNum": 36
        		  },
        		  "fieldLength": 1,
        		  "expectedValues": ["0", "1", "2", "3", "4", ""],
        		  "dataTypes": "INTEGER",
        		  "scale": null
        		},
        		{
        		  "physicalName": "Explanatory Organization/Purpose",
        		  "otherPossibleNames": [],
        		  "logicalName": "EXPLANATORY_ORGANIZATION/PURPOSE",
        		  "formatMask": null,
        		  "isFieldRequired": "N",
        		  "canBeNull": "Y",
        		  "fieldOffset": {
        			"offsetStart": 0,
        			"offsetEnd": 0,
        			"columnNum": 37
        		  },
        		  "fieldLength": 1,
        		  "expectedValues": ["0", "1", "2", "3", "4", ""],
        		  "dataTypes": "INTEGER",
        		  "scale": null
        		},
        		{
        		  "physicalName": "Explanatory Evidence/Elaboration",
        		  "otherPossibleNames": [],
        		  "logicalName": "EXPLANATORY_EVIDENCE/ELABORATION",
        		  "formatMask": null,
        		  "isFieldRequired": "N",
        		  "canBeNull": "Y",
        		  "fieldOffset": {
        			"offsetStart": 0,
        			"offsetEnd": 0,
        			"columnNum": 38
        		  },
        		  "fieldLength": 1,
        		  "expectedValues": ["0", "1", "2", "3", "4", ""],
        		  "dataTypes": "INTEGER",
        		  "scale": null
        		},
        		{
        		  "physicalName": "Explanatory Conventions",
        		  "otherPossibleNames": [],
        		  "logicalName": "EXPLANATORY_CONVENTIONS",
        		  "formatMask": null,
        		  "isFieldRequired": "N",
        		  "canBeNull": "Y",
        		  "fieldOffset": {
        			"offsetStart": 0,
        			"offsetEnd": 0,
        			"columnNum": 40
        		  },
        		  "fieldLength": 1,
        		  "expectedValues": ["0", "1", "2", "3", "4", ""],
        		  "dataTypes": "INTEGER",
        		  "scale": null
        		},
		  {
			"physicalName": "Narrative Organization/Purpose",
			"otherPossibleNames": [],
			"logicalName": "NARRATIVE_ORGANIZATION/PURPOSE",
			"formatMask": null,
			"isFieldRequired": "N",
			"canBeNull": "Y",
			"fieldOffset": {
			  "offsetStart": 0,
			  "offsetEnd": 0,
			  "columnNum": 41
			},
			"fieldLength": 1,
			"expectedValues": ["0", "1", "2", "3", "4", ""],
			"dataTypes": "INTEGER",
			"scale": null
		  },
		  {
			"physicalName": "Narrative Evidence/Elaboration",
			"otherPossibleNames": [],
			"logicalName": "Narrative Evidence/Elaboration",
			"formatMask": null,
			"isFieldRequired": "N",
			"canBeNull": "Y",
			"fieldOffset": {
			  "offsetStart": 0,
			  "offsetEnd": 0,
			  "columnNum": 42
			},
			"fieldLength": 1,
			"expectedValues": ["0", "1", "2", "3", "4", ""],
			"dataTypes": "INTEGER",
			"scale": null
		  },
		  {
			"physicalName": "Narrative Conventions",
			"otherPossibleNames": [],
			"logicalName": "Narrative Conventions",
			"formatMask": null,
			"isFieldRequired": "N",
			"canBeNull": "Y",
			"fieldOffset": {
			  "offsetStart": 0,
			  "offsetEnd": 0,
			  "columnNum": 43
			},
			"fieldLength": 1,
			"expectedValues": ["0", "1", "2", "3", "4", ""],
			"dataTypes": "INTEGER",
			"scale": null
		  },
		{
		  "physicalName": "Mathematics OppNumber",
		  "otherPossibleNames": [],
		  "logicalName": "MATHEMATICS_OPPNUMBER",
		  "formatMask": null,
		  "isFieldRequired": "Y",
		  "canBeNull": "Y",
		  "fieldOffset": {
			"offsetStart": 0,
			"offsetEnd": 0,
			"columnNum": 44
		  },
		  "fieldLength": 1,
		  "expectedValues": ["", "1"],
		  "dataTypes": "INTEGER",
		  "scale": null
		},
		{
		  "physicalName": "Mathematics Scale Score",
		  "otherPossibleNames": [],
		  "logicalName": "MATHEMATICS_SCALE_SCORE",
		  "formatMask": null,
		  "isFieldRequired": "Y",
		  "canBeNull": "Y",
		  "fieldOffset": {
			"offsetStart": 0,
			"offsetEnd": 0,
			"columnNum": 45
		  },
		  "fieldLength": 4,
		  "expectedValues": [],
		  "dataTypes": "STRING",
		  "scale": null
		},
		{
		  "physicalName": "Standard Error for Mathematics Scale Score",
		  "otherPossibleNames": [],
		  "logicalName": "STANDARD_ERROR_FOR_MATHEMATICS_SCALE_SCORE",
		  "formatMask": null,
		  "isFieldRequired": "Y",
		  "canBeNull": "Y",
		  "fieldOffset": {
			"offsetStart": 0,
			"offsetEnd": 0,
			"columnNum": 46
		  },
		  "fieldLength": 2,
		  "expectedValues": [],
		  "dataTypes": "STRING",
		  "scale": null
		},
		{
		  "physicalName": "Mathematics Achievement Level",
		  "otherPossibleNames": [],
		  "logicalName": "MATHEMATICS_ACHIEVEMENT_LEVEL",
		  "formatMask": null,
		  "isFieldRequired": "Y",
		  "canBeNull": "Y",
		  "fieldOffset": {
			"offsetStart": 0,
			"offsetEnd": 0,
			"columnNum": 47
		  },
		  "fieldLength": 25,
		  "expectedValues": ["NS", "Standard Exceeded", "Standard Met", "Standard Nearly Met", "Standard Not Met", ""],
		  "dataTypes": "STRING",
		  "scale": null
		},
		{
		  "physicalName": "Concepts and Procedures Claim Achievement Category",
		  "otherPossibleNames": [],
		  "logicalName": "CONCEPTS_AND_PROCEDURES_CLAIM_ACHIEVEMENT_CATEGORY",
		  "formatMask": null,
		  "isFieldRequired": "Y",
		  "canBeNull": "Y",
		  "fieldOffset": {
			"offsetStart": 0,
			"offsetEnd": 0,
			"columnNum": 48
		  },
		  "fieldLength": 20,
		  "expectedValues": ["NS", "Above Standard", "Near Standard", "Below Standard", ""],
		  "dataTypes": "STRING",
		  "scale": null
		},
		{
		  "physicalName": "Problem Solving and Modeling & Data Analysis Claim Achievement Category",
		  "otherPossibleNames": [],
		  "logicalName": "PROBLEM_SOLVING_AND_MODELING_&_DATA_ANALYSIS_CLAIM_ACHIEVEMENT_CATEGORY",
		  "formatMask": null,
		  "isFieldRequired": "Y",
		  "canBeNull": "Y",
		  "fieldOffset": {
			"offsetStart": 0,
			"offsetEnd": 0,
			"columnNum": 49
		  },
		  "fieldLength": 20,
		  "expectedValues": ["NS", "Above Standard", "Near Standard", "Below Standard", ""],
		  "dataTypes": "STRING",
		  "scale": null
		},
		{
		  "physicalName": "Communicating Reasoning Claim Achievement Category",
		  "otherPossibleNames": [],
		  "logicalName": "COMMUNICATING_REASONING_CLAIM_ACHIEVEMENT_CATEGORY",
		  "formatMask": null,
		  "isFieldRequired": "Y",
		  "canBeNull": "Y",
		  "fieldOffset": {
			"offsetStart": 0,
			"offsetEnd": 0,
			"columnNum": 50
		  },
		  "fieldLength": 20,
		  "expectedValues": ["NS", "Above Standard", "Near Standard", "Below Standard", ""],
		  "dataTypes": "STRING",
		  "scale": null
		}
	  ]
	},
	"fileExtensions": [".csv"]
  }