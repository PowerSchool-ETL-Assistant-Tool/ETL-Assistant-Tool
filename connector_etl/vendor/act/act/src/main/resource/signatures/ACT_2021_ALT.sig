{
	"encoding": "UTF-8",
	"format": {
		"@type": "Delimited",
		"quoteDelim": "\"",
		"fieldDelim": ",",
		"hasHeader": true,
		"formatName": "ACT_2021_ALT",
		"naturalKey": ["TEST_LOCATION", "STUDENT_FIRST_NAME", "STUDENT_MIDDLE_INITIAL", "STUDENT_LAST_NAME"],
		"fields": [{
				"physicalName": "ID_ACT",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_VENDOR_ID",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 1
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ID_StateAssign",
				"otherPossibleNames": [],
				"logicalName": "STATE_STUDENT_ID_VERSION_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 2
				},
				"fieldLength": 13,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ID_Local",
				"otherPossibleNames": [],
				"logicalName": "LOCAL_ID_NUMBER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 3
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "F_Name",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_FIRST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 4
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "M_Initial",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_MIDDLE_INITIAL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 5
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "L_Name",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_LAST_NAME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 6
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Address1",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_ADDRESS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 7
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Address2",
				"otherPossibleNames": [],
				"logicalName": "STUDENTADDRESS_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 8
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "City",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_CITY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 9
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "State",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_STATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 10
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Zip",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_ZIP_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 11
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Country_Cde",
				"otherPossibleNames": [],
				"logicalName": "COUNTRY_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 12
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Prov",
				"otherPossibleNames": [],
				"logicalName": "CANADIAN_PROVINCE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 13
				},
				"fieldLength": 2,
				"expectedValues": ["  ", "AB", "BC", "MB", "NB", "NL", "NT", "NS", "NU", "ON", "PE", "QC", "SK", "YT"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Postal",
				"otherPossibleNames": [],
				"logicalName": "CANADIAN_POSTAL_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 14
				},
				"fieldLength": 7,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Gender",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_GENDER_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 15
				},
				"fieldLength": 1,
				"expectedValues": ["M", "F", "-"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "DOB",
				"otherPossibleNames": [],
				"logicalName": "STUDENT_BIRTHDATE_STR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 16
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": null
			},
			{
				"physicalName": "Ethn_HispLat",
				"otherPossibleNames": [],
				"logicalName": "ETHNICITY_HISPANIC_LATINO",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 17
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Ethn_AlaskaNat",
				"otherPossibleNames": [],
				"logicalName": "ETHNICITY_ALASKA_NATIVE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 18
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Ethn_Asian",
				"otherPossibleNames": [],
				"logicalName": "ETHNICITY_ASIAN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 19
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Ethn_AfricAmer",
				"otherPossibleNames": [],
				"logicalName": "ETHNICITY_AFRICAN_AMERICAN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 20
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Ethn_PacIsland",
				"otherPossibleNames": [],
				"logicalName": "ETHNICITY_PACIFIC_ISLAND",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 21
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Ethn_White",
				"otherPossibleNames": [],
				"logicalName": "ETHNICITY_WHITE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 22
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Ethn_PrefNoRsp",
				"otherPossibleNames": [],
				"logicalName": "ETHNICITY_NO_RESPONSE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 23
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Ethn_FedValues",
				"otherPossibleNames": [],
				"logicalName": "ETHNICITY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 24
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Ph_Type",
				"otherPossibleNames": [],
				"logicalName": "PHONE_TYPE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "N",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 25
				},
				"fieldLength": 1,
				"expectedValues": ["1", "2", "3"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Phone",
				"otherPossibleNames": [],
				"logicalName": "PHONE_NUMBER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 26
				},
				"fieldLength": 10,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "HS_GradeLev",
				"otherPossibleNames": [],
				"logicalName": "GRADE_LEVEL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "N",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 27
				},
				"fieldLength": 2,
				"expectedValues": ["07", "08", "09", "10", "11", "12", "13", "14", "15", "07th Grade", "08th Grade", "09th Grade", "10th Grade", "11th Grade", "12th Grade", "13th Grade", "14th Grade", "15th Grade"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "HS_Code",
				"otherPossibleNames": [],
				"logicalName": "ACT_SCHOOL_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 28
				},
				"fieldLength": 6,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "G_AllEng",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_GPA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 29
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "G_AllMth",
				"otherPossibleNames": [],
				"logicalName": "MATH_GPA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 30
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "G_AllSocSc",
				"otherPossibleNames": [],
				"logicalName": "SS_GPA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 31
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "G_AllNatSc",
				"otherPossibleNames": [],
				"logicalName": "NAT_SCI_GPA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 32
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "G_HS_Avg",
				"otherPossibleNames": [],
				"logicalName": "AVG_GPA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 33
				},
				"fieldLength": 3,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "HS_GradYr",
				"otherPossibleNames": [],
				"logicalName": "YEAR_OF_HS_GRADUATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 34
				},
				"fieldLength": 4,
				"expectedValues": [],
				"dataTypes": "DATE",
				"scale": null
			},
			{
				"physicalName": "Col_Choice_1",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_NAME_1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 35
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Col_Choice_2",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_NAME_2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 36
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Col_Choice_3",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_NAME_3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 37
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Col_Choice_4",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_NAME_4",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 38
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Col_Choice_5",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_NAME_5",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 39
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Col_Choice_6",
				"otherPossibleNames": [],
				"logicalName": "COLLEGE_NAME_6",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 40
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test_Dte",
				"otherPossibleNames": [],
				"logicalName": "TEST_DATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "N",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 41
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "StRnk_Eng",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_STATE_RANKS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 42
				},
				"fieldLength": 3,
				"expectedValues": ["001", "002", "003", "004", "005", "006", "007", "008", "009", "010", "011", "012", "013", "014", "015", "016", "017", "018", "019", "020", "021", "022", "023", "024", "025", "026", "027", "028", "029", "030", "031", "032", "033", "034", "035", "036", "037", "038", "039", "040", "041", "042", "043", "044", "045", "046", "047", "048", "049", "050", "051", "052", "053", "054", "055", "056", "057", "058", "059", "060", "061", "062", "063", "064", "065", "066", "067", "068", "069", "070", "071", "072", "073", "074", "075", "076", "077", "078", "079", "080", "081", "082", "083", "084", "085", "086", "087", "088", "089", "090", "091", "092", "093", "094", "095", "096", "097", "098", "099", "100", "---"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "StRnk_Math",
				"otherPossibleNames": [],
				"logicalName": "MATH_STATE_RANKS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 43
				},
				"fieldLength": 3,
				"expectedValues": ["001", "002", "003", "004", "005", "006", "007", "008", "009", "010", "011", "012", "013", "014", "015", "016", "017", "018", "019", "020", "021", "022", "023", "024", "025", "026", "027", "028", "029", "030", "031", "032", "033", "034", "035", "036", "037", "038", "039", "040", "041", "042", "043", "044", "045", "046", "047", "048", "049", "050", "051", "052", "053", "054", "055", "056", "057", "058", "059", "060", "061", "062", "063", "064", "065", "066", "067", "068", "069", "070", "071", "072", "073", "074", "075", "076", "077", "078", "079", "080", "081", "082", "083", "084", "085", "086", "087", "088", "089", "090", "091", "092", "093", "094", "095", "096", "097", "098", "099", "100", "---"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "StRnk_Read",
				"otherPossibleNames": [],
				"logicalName": "READING_STATE_RANKS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 44
				},
				"fieldLength": 3,
				"expectedValues": ["001", "002", "003", "004", "005", "006", "007", "008", "009", "010", "011", "012", "013", "014", "015", "016", "017", "018", "019", "020", "021", "022", "023", "024", "025", "026", "027", "028", "029", "030", "031", "032", "033", "034", "035", "036", "037", "038", "039", "040", "041", "042", "043", "044", "045", "046", "047", "048", "049", "050", "051", "052", "053", "054", "055", "056", "057", "058", "059", "060", "061", "062", "063", "064", "065", "066", "067", "068", "069", "070", "071", "072", "073", "074", "075", "076", "077", "078", "079", "080", "081", "082", "083", "084", "085", "086", "087", "088", "089", "090", "091", "092", "093", "094", "095", "096", "097", "098", "099", "100", "---"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "StRnk_Sci",
				"otherPossibleNames": [],
				"logicalName": "SCIENCE_STATE_RANKS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 45
				},
				"fieldLength": 3,
				"expectedValues": ["001", "002", "003", "004", "005", "006", "007", "008", "009", "010", "011", "012", "013", "014", "015", "016", "017", "018", "019", "020", "021", "022", "023", "024", "025", "026", "027", "028", "029", "030", "031", "032", "033", "034", "035", "036", "037", "038", "039", "040", "041", "042", "043", "044", "045", "046", "047", "048", "049", "050", "051", "052", "053", "054", "055", "056", "057", "058", "059", "060", "061", "062", "063", "064", "065", "066", "067", "068", "069", "070", "071", "072", "073", "074", "075", "076", "077", "078", "079", "080", "081", "082", "083", "084", "085", "086", "087", "088", "089", "090", "091", "092", "093", "094", "095", "096", "097", "098", "099", "100", "---"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test_Loc",
				"otherPossibleNames": [],
				"logicalName": "TEST_LOCATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 46
				},
				"fieldLength": 1,
				"expectedValues": ["S", "D", " "],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Eng",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_SCALED_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 47
				},
				"fieldLength": 500,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "--", " "],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Mth",
				"otherPossibleNames": [],
				"logicalName": "MATH_SCALED_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 48
				},
				"fieldLength": 500,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "--", " "],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Rdg",
				"otherPossibleNames": [],
				"logicalName": "READING_SCALED_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 49
				},
				"fieldLength": 500,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "--", " "],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Sci",
				"otherPossibleNames": [],
				"logicalName": "SCIENCE_SCALED_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 50
				},
				"fieldLength": 500,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "--", " "],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Composite",
				"otherPossibleNames": [],
				"logicalName": "COMPOSITE_SCALED_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 51
				},
				"fieldLength": 500,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "--", " "],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "USRnk_Eng",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_NATIONAL_NORM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 52
				},
				"fieldLength": 3,
				"expectedValues": ["001", "002", "003", "004", "005", "006", "007", "008", "009", "010", "011", "012", "013", "014", "015", "016", "017", "018", "019", "020", "021", "022", "023", "024", "025", "026", "027", "028", "029", "030", "031", "032", "033", "034", "035", "036", "037", "038", "039", "040", "041", "042", "043", "044", "045", "046", "047", "048", "049", "050", "051", "052", "053", "054", "055", "056", "057", "058", "059", "060", "061", "062", "063", "064", "065", "066", "067", "068", "069", "070", "071", "072", "073", "074", "075", "076", "077", "078", "079", "080", "081", "082", "083", "084", "085", "086", "087", "088", "089", "090", "091", "092", "093", "094", "095", "096", "097", "098", "099", "100", "---"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "USRnk_Math",
				"otherPossibleNames": [],
				"logicalName": "MATH_NATIONAL_NORM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 53
				},
				"fieldLength": 3,
				"expectedValues": ["001", "002", "003", "004", "005", "006", "007", "008", "009", "010", "011", "012", "013", "014", "015", "016", "017", "018", "019", "020", "021", "022", "023", "024", "025", "026", "027", "028", "029", "030", "031", "032", "033", "034", "035", "036", "037", "038", "039", "040", "041", "042", "043", "044", "045", "046", "047", "048", "049", "050", "051", "052", "053", "054", "055", "056", "057", "058", "059", "060", "061", "062", "063", "064", "065", "066", "067", "068", "069", "070", "071", "072", "073", "074", "075", "076", "077", "078", "079", "080", "081", "082", "083", "084", "085", "086", "087", "088", "089", "090", "091", "092", "093", "094", "095", "096", "097", "098", "099", "100", "---"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "USRnk_Read",
				"otherPossibleNames": [],
				"logicalName": "READING_NATIONAL_NORM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 54
				},
				"fieldLength": 3,
				"expectedValues": ["001", "002", "003", "004", "005", "006", "007", "008", "009", "010", "011", "012", "013", "014", "015", "016", "017", "018", "019", "020", "021", "022", "023", "024", "025", "026", "027", "028", "029", "030", "031", "032", "033", "034", "035", "036", "037", "038", "039", "040", "041", "042", "043", "044", "045", "046", "047", "048", "049", "050", "051", "052", "053", "054", "055", "056", "057", "058", "059", "060", "061", "062", "063", "064", "065", "066", "067", "068", "069", "070", "071", "072", "073", "074", "075", "076", "077", "078", "079", "080", "081", "082", "083", "084", "085", "086", "087", "088", "089", "090", "091", "092", "093", "094", "095", "096", "097", "098", "099", "100", "---"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "USRnk_Sci",
				"otherPossibleNames": [],
				"logicalName": "SCIENCE_NATIONAL_NORM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 55
				},
				"fieldLength": 3,
				"expectedValues": ["001", "002", "003", "004", "005", "006", "007", "008", "009", "010", "011", "012", "013", "014", "015", "016", "017", "018", "019", "020", "021", "022", "023", "024", "025", "026", "027", "028", "029", "030", "031", "032", "033", "034", "035", "036", "037", "038", "039", "040", "041", "042", "043", "044", "045", "046", "047", "048", "049", "050", "051", "052", "053", "054", "055", "056", "057", "058", "059", "060", "061", "062", "063", "064", "065", "066", "067", "068", "069", "070", "071", "072", "073", "074", "075", "076", "077", "078", "079", "080", "081", "082", "083", "084", "085", "086", "087", "088", "089", "090", "091", "092", "093", "094", "095", "096", "097", "098", "099", "100", "---"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "USRnk_Comp",
				"otherPossibleNames": [],
				"logicalName": "COMPOSITE_NATIONAL_NORM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 56
				},
				"fieldLength": 3,
				"expectedValues": ["001", "002", "003", "004", "005", "006", "007", "008", "009", "010", "011", "012", "013", "014", "015", "016", "017", "018", "019", "020", "021", "022", "023", "024", "025", "026", "027", "028", "029", "030", "031", "032", "033", "034", "035", "036", "037", "038", "039", "040", "041", "042", "043", "044", "045", "046", "047", "048", "049", "050", "051", "052", "053", "054", "055", "056", "057", "058", "059", "060", "061", "062", "063", "064", "065", "066", "067", "068", "069", "070", "071", "072", "073", "074", "075", "076", "077", "078", "079", "080", "081", "082", "083", "084", "085", "086", "087", "088", "089", "090", "091", "092", "093", "094", "095", "096", "097", "098", "099", "100", "---"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Sum_Scale",
				"otherPossibleNames": [],
				"logicalName": "SUM_OF_SCALE_SCORES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 57
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "StRnk_Comp",
				"otherPossibleNames": [],
				"logicalName": "COMPOSITE_STATE_RANKS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 58
				},
				"fieldLength": 3,
				"expectedValues": ["001", "002", "003", "004", "005", "006", "007", "008", "009", "010", "011", "012", "013", "014", "015", "016", "017", "018", "019", "020", "021", "022", "023", "024", "025", "026", "027", "028", "029", "030", "031", "032", "033", "034", "035", "036", "037", "038", "039", "040", "041", "042", "043", "044", "045", "046", "047", "048", "049", "050", "051", "052", "053", "054", "055", "056", "057", "058", "059", "060", "061", "062", "063", "064", "065", "066", "067", "068", "069", "070", "071", "072", "073", "074", "075", "076", "077", "078", "079", "080", "081", "082", "083", "084", "085", "086", "087", "088", "089", "090", "091", "092", "093", "094", "095", "096", "097", "098", "099", "100", "---"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "STEM",
				"otherPossibleNames": [],
				"logicalName": "STEM_SCALED_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 59
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "USRnk_STEM",
				"otherPossibleNames": [],
				"logicalName": "STEM_NATIONAL_NORM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 60
				},
				"fieldLength": 3,
				"expectedValues": ["001", "002", "003", "004", "005", "006", "007", "008", "009", "010", "011", "012", "013", "014", "015", "016", "017", "018", "019", "020", "021", "022", "023", "024", "025", "026", "027", "028", "029", "030", "031", "032", "033", "034", "035", "036", "037", "038", "039", "040", "041", "042", "043", "044", "045", "046", "047", "048", "049", "050", "051", "052", "053", "054", "055", "056", "057", "058", "059", "060", "061", "062", "063", "064", "065", "066", "067", "068", "069", "070", "071", "072", "073", "074", "075", "076", "077", "078", "079", "080", "081", "082", "083", "084", "085", "086", "087", "088", "089", "090", "091", "092", "093", "094", "095", "096", "097", "098", "099", "100", "---"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Writing",
				"otherPossibleNames": [],
				"logicalName": "WRITING_SCALED_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 61
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "--", " "],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "W_USRnk",
				"otherPossibleNames": [],
				"logicalName": "WRITING_NATIONAL_NORM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 62
				},
				"fieldLength": 3,
				"expectedValues": ["001", "002", "003", "004", "005", "006", "007", "008", "009", "010", "011", "012", "013", "014", "015", "016", "017", "018", "019", "020", "021", "022", "023", "024", "025", "026", "027", "028", "029", "030", "031", "032", "033", "034", "035", "036", "037", "038", "039", "040", "041", "042", "043", "044", "045", "046", "047", "048", "049", "050", "051", "052", "053", "054", "055", "056", "057", "058", "059", "060", "061", "062", "063", "064", "065", "066", "067", "068", "069", "070", "071", "072", "073", "074", "075", "076", "077", "078", "079", "080", "081", "082", "083", "084", "085", "086", "087", "088", "089", "090", "091", "092", "093", "094", "095", "096", "097", "098", "099", "100", "---"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "W_Dom_Ideas",
				"otherPossibleNames": [],
				"logicalName": "WRITING_DOMAIN_IDEAS_ANALYSIS_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 63
				},
				"fieldLength": 2,
				"expectedValues": ["02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "--", " "],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "W_Dom_Supt",
				"otherPossibleNames": [],
				"logicalName": "WRITING_DOMAIN_DEVELOPMENT_SUPPORT_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 64
				},
				"fieldLength": 2,
				"expectedValues": ["02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "--", " "],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "W_Dom_Org",
				"otherPossibleNames": [],
				"logicalName": "WRITING_DOMAIN_ORGANIZATION_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 65
				},
				"fieldLength": 2,
				"expectedValues": ["02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "--", " "],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "W_Dom_LangUse",
				"otherPossibleNames": [],
				"logicalName": "WRITING_DOMAIN_USE_CONVENTIONS_RAW_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 66
				},
				"fieldLength": 2,
				"expectedValues": ["02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "--", " "],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ELA",
				"otherPossibleNames": [],
				"logicalName": "ELA_SCALED_SCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 67
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "--", " "],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "USRnk_ELA",
				"otherPossibleNames": [],
				"logicalName": "ELA_NATIONAL_NORM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 68
				},
				"fieldLength": 3,
				"expectedValues": ["001", "002", "003", "004", "005", "006", "007", "008", "009", "010", "011", "012", "013", "014", "015", "016", "017", "018", "019", "020", "021", "022", "023", "024", "025", "026", "027", "028", "029", "030", "031", "032", "033", "034", "035", "036", "037", "038", "039", "040", "041", "042", "043", "044", "045", "046", "047", "048", "049", "050", "051", "052", "053", "054", "055", "056", "057", "058", "059", "060", "061", "062", "063", "064", "065", "066", "067", "068", "069", "070", "071", "072", "073", "074", "075", "076", "077", "078", "079", "080", "081", "082", "083", "084", "085", "086", "087", "088", "089", "090", "091", "092", "093", "094", "095", "096", "097", "098", "099", "100", "---"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "R_CmplxTxt",
				"otherPossibleNames": [],
				"logicalName": "UNDERSTANDING_COMPLEX_TEXT_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 69
				},
				"fieldLength": 1,
				"expectedValues": ["0", "1", "2", "-"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Sup_Eng_Dt",
				"otherPossibleNames": [],
				"logicalName": "SUP_ENG_DT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 70
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Sup_Eng_Loc",
				"otherPossibleNames": [],
				"logicalName": "SUP_ENG_LOC",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 71
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Sup_Eng_Sc",
				"otherPossibleNames": [],
				"logicalName": "ENGLISH_SUPERSCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 72
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Sup_OthEng",
				"otherPossibleNames": [],
				"logicalName": "SUP_OTHENG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 73
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Sup_Eng_Type",
				"otherPossibleNames": [],
				"logicalName": "SUP_ENG_TYPE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 74
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Sup_Mth_Dt",
				"otherPossibleNames": [],
				"logicalName": "SUP_MTH_DT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 75
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Sup_Mth_Loc",
				"otherPossibleNames": [],
				"logicalName": "SUP_MTH_LOC",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 76
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Sup_Mth_Sc",
				"otherPossibleNames": [],
				"logicalName": "MATH_SUPERSCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 77
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Sup_OthMth",
				"otherPossibleNames": [],
				"logicalName": "SUP_OTHMTH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 78
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Sup_Mth_Type",
				"otherPossibleNames": [],
				"logicalName": "SUP_MTH_TYPE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 79
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Sup_Rdg_Dt",
				"otherPossibleNames": [],
				"logicalName": "SUP_RDG_DT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 80
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Sup_Rdg_Loc",
				"otherPossibleNames": [],
				"logicalName": "SUP_RDG_LOC",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 81
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Sup_Rdg_Sc",
				"otherPossibleNames": [],
				"logicalName": "READING_SUPERSCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 82
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Sup_OthRdg",
				"otherPossibleNames": [],
				"logicalName": "SUP_OTHRDG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 83
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Sup_Rdg_Type",
				"otherPossibleNames": [],
				"logicalName": "SUP_RDG_TYPE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 84
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Sup_Sci_Dt",
				"otherPossibleNames": [],
				"logicalName": "SUP_SCI_DT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 85
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Sup_Sci_Loc",
				"otherPossibleNames": [],
				"logicalName": "SUP_SCI_LOC",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 86
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Sup_Sci_Sc",
				"otherPossibleNames": [],
				"logicalName": "SCIENCE_SUPERSCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 87
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Sup_OthSci",
				"otherPossibleNames": [],
				"logicalName": "SUP_OTHSCI",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 88
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Sup_Sci_Type",
				"otherPossibleNames": [],
				"logicalName": "SUP_SCI_TYPE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 89
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Sup_Composite",
				"otherPossibleNames": [],
				"logicalName": "SUP_COMPOSITE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 90
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Sup_STEM",
				"otherPossibleNames": [],
				"logicalName": "STEM_SUPERSCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 91
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Sup_Writ_Dt",
				"otherPossibleNames": [],
				"logicalName": "SUP_WRIT_DT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 92
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Sup_Writ_Loc",
				"otherPossibleNames": [],
				"logicalName": "SUP_WRIT_LOC",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 93
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Sup_Writ_Sc",
				"otherPossibleNames": [],
				"logicalName": "WRITING_SUPERSCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 94
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Sup_Writ_Type",
				"otherPossibleNames": [],
				"logicalName": "SUP_WRIT_TYPE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 95
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Strnk_STEM",
				"otherPossibleNames": ["StRnk_STEM"],
				"logicalName": "STEM_STATE_RANKS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 96
				},
				"fieldLength": 3,
				"expectedValues": ["001", "002", "003", "004", "005", "006", "007", "008", "009", "010", "011", "012", "013", "014", "015", "016", "017", "018", "019", "020", "021", "022", "023", "024", "025", "026", "027", "028", "029", "030", "031", "032", "033", "034", "035", "036", "037", "038", "039", "040", "041", "042", "043", "044", "045", "046", "047", "048", "049", "050", "051", "052", "053", "054", "055", "056", "057", "058", "059", "060", "061", "062", "063", "064", "065", "066", "067", "068", "069", "070", "071", "072", "073", "074", "075", "076", "077", "078", "079", "080", "081", "082", "083", "084", "085", "086", "087", "088", "089", "090", "091", "092", "093", "094", "095", "096", "097", "098", "099", "100", "---"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Strnk_ELA",
				"otherPossibleNames": ["StRnk_ELA"],
				"logicalName": "ELA_STATE_RANKS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 97
				},
				"fieldLength": 3,
				"expectedValues": ["001", "002", "003", "004", "005", "006", "007", "008", "009", "010", "011", "012", "013", "014", "015", "016", "017", "018", "019", "020", "021", "022", "023", "024", "025", "026", "027", "028", "029", "030", "031", "032", "033", "034", "035", "036", "037", "038", "039", "040", "041", "042", "043", "044", "045", "046", "047", "048", "049", "050", "051", "052", "053", "054", "055", "056", "057", "058", "059", "060", "061", "062", "063", "064", "065", "066", "067", "068", "069", "070", "071", "072", "073", "074", "075", "076", "077", "078", "079", "080", "081", "082", "083", "084", "085", "086", "087", "088", "089", "090", "091", "092", "093", "094", "095", "096", "097", "098", "099", "100", "---"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Sup_Sum_Scale",
				"otherPossibleNames": [],
				"logicalName": "COMPOSITE_SUPERSCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 98
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Sup_ELA",
				"otherPossibleNames": [],
				"logicalName": "ELA_SUPERSCORE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 99
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "StRnk_W",
				"otherPossibleNames": [],
				"logicalName": "WRITING_STATE_RANKS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 100
				},
				"fieldLength": 3,
				"expectedValues": ["001", "002", "003", "004", "005", "006", "007", "008", "009", "010", "011", "012", "013", "014", "015", "016", "017", "018", "019", "020", "021", "022", "023", "024", "025", "026", "027", "028", "029", "030", "031", "032", "033", "034", "035", "036", "037", "038", "039", "040", "041", "042", "043", "044", "045", "046", "047", "048", "049", "050", "051", "052", "053", "054", "055", "056", "057", "058", "059", "060", "061", "062", "063", "064", "065", "066", "067", "068", "069", "070", "071", "072", "073", "074", "075", "076", "077", "078", "079", "080", "081", "082", "083", "084", "085", "086", "087", "088", "089", "090", "091", "092", "093", "094", "095", "096", "097", "098", "099", "100", "---"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Best_Lan",
				"otherPossibleNames": [],
				"logicalName": "BEST_LAN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 101
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "First_Lan",
				"otherPossibleNames": [],
				"logicalName": "FIRST_LAN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 102
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ELA_Services",
				"otherPossibleNames": [],
				"logicalName": "ELA_SERVICES",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 103
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ELA_Serv_Grade",
				"otherPossibleNames": [],
				"logicalName": "ELA_SERV_GRADE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 104
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "IntInv_SciStd",
				"otherPossibleNames": [],
				"logicalName": "INTINV_SCISTD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 105
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "IntInv_SciRnk",
				"otherPossibleNames": [],
				"logicalName": "INTINV_SCIRNK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 106
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "IntInv_ArtStd",
				"otherPossibleNames": [],
				"logicalName": "INTINV_ARTSTD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 107
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "IntInv_ArtRnk",
				"otherPossibleNames": [],
				"logicalName": "INTINV_ARTRNK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 108
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "IntInv_SocStd",
				"otherPossibleNames": [],
				"logicalName": "INTINV_SOCSTD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 109
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "IntInv_SocRnk",
				"otherPossibleNames": [],
				"logicalName": "INTINV_SOCRNK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 110
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "IntInv_BusCStd",
				"otherPossibleNames": [],
				"logicalName": "INTINV_BUSCSTD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 111
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "IntInv_BusCRank",
				"otherPossibleNames": [],
				"logicalName": "INTINV_BUSCRANK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 112
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "IntInv_BusOpStd",
				"otherPossibleNames": [],
				"logicalName": "INTINV_BUSOPSTD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 113
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "IntInv_BusOpRnk",
				"otherPossibleNames": [],
				"logicalName": "INTINV_BUSOPRNK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 114
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "IntInv_TechStd",
				"otherPossibleNames": [],
				"logicalName": "INTINV_TECHSTD",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 115
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "IntInv_TechRnk",
				"otherPossibleNames": [],
				"logicalName": "INTINV_TECHRNK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 116
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "IntInv_MapReg1",
				"otherPossibleNames": [],
				"logicalName": "INTINV_MAPREG1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 117
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "IntInv_MapReg2",
				"otherPossibleNames": [],
				"logicalName": "INTINV_MAPREG2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 118
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "IntInv_MapReg3",
				"otherPossibleNames": [],
				"logicalName": "INTINV_MAPREG3",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 119
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EOS_OptIn",
				"otherPossibleNames": [],
				"logicalName": "EOS_OPTIN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 120
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Rel_Int",
				"otherPossibleNames": [],
				"logicalName": "REL_INT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 121
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "C_Eng_9",
				"otherPossibleNames": [],
				"logicalName": "C_ENG_9",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 122
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "C_Eng_10",
				"otherPossibleNames": [],
				"logicalName": "C_ENG_10",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 123
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "C_Eng_11",
				"otherPossibleNames": [],
				"logicalName": "C_ENG_11",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 124
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "C_Eng_12",
				"otherPossibleNames": [],
				"logicalName": "C_ENG_12",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 125
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "C_Eng_Oth",
				"otherPossibleNames": [],
				"logicalName": "C_ENG_OTH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 126
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "C_Alg1",
				"otherPossibleNames": [],
				"logicalName": "C_ALG1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 127
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "C_Alg2",
				"otherPossibleNames": [],
				"logicalName": "C_ALG2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 128
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "C_Geom",
				"otherPossibleNames": [],
				"logicalName": "C_GEOM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 129
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "C_Trig",
				"otherPossibleNames": [],
				"logicalName": "C_TRIG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 130
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "C_BegCalc",
				"otherPossibleNames": [],
				"logicalName": "C_BEGCALC",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 131
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "C_AdvMth",
				"otherPossibleNames": [],
				"logicalName": "C_ADVMTH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 132
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "C_Cmpt",
				"otherPossibleNames": [],
				"logicalName": "C_CMPT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 133
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "C_GenSc",
				"otherPossibleNames": [],
				"logicalName": "C_GENSC",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 134
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "C_Bio",
				"otherPossibleNames": [],
				"logicalName": "C_BIO",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 135
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "C_Chem",
				"otherPossibleNames": [],
				"logicalName": "C_CHEM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 136
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "C_Phys",
				"otherPossibleNames": [],
				"logicalName": "C_PHYS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 137
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "C_USHist",
				"otherPossibleNames": [],
				"logicalName": "C_USHIST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 138
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "C_WrldHist",
				"otherPossibleNames": [],
				"logicalName": "C_WRLDHIST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 139
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "C_OthHist",
				"otherPossibleNames": [],
				"logicalName": "C_OTHHIST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 140
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "C_AmGov",
				"otherPossibleNames": [],
				"logicalName": "C_AMGOV",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 141
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "C_Econ",
				"otherPossibleNames": [],
				"logicalName": "C_ECON",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 142
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "C_Geog",
				"otherPossibleNames": [],
				"logicalName": "C_GEOG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 143
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "C_Psych",
				"otherPossibleNames": [],
				"logicalName": "C_PSYCH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 144
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "C_Span",
				"otherPossibleNames": [],
				"logicalName": "C_SPAN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 145
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "C_Frch",
				"otherPossibleNames": [],
				"logicalName": "C_FRCH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 146
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "C_Germ",
				"otherPossibleNames": [],
				"logicalName": "C_GERM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 147
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "C_Lang",
				"otherPossibleNames": [],
				"logicalName": "C_LANG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 148
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "C_Art",
				"otherPossibleNames": [],
				"logicalName": "C_ART",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 149
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "C_Mus",
				"otherPossibleNames": [],
				"logicalName": "C_MUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 150
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "C_Dram",
				"otherPossibleNames": [],
				"logicalName": "C_DRAM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 151
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "G_Eng_9",
				"otherPossibleNames": [],
				"logicalName": "G_ENG_9",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 152
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "G_Eng_10",
				"otherPossibleNames": [],
				"logicalName": "G_ENG_10",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 153
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "G_Eng_11",
				"otherPossibleNames": [],
				"logicalName": "G_ENG_11",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 154
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "G_Eng_12",
				"otherPossibleNames": [],
				"logicalName": "G_ENG_12",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 155
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "G_Eng_Oth",
				"otherPossibleNames": [],
				"logicalName": "G_ENG_OTH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 156
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "G_Alg1",
				"otherPossibleNames": [],
				"logicalName": "G_ALG1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 157
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "G_Alg2",
				"otherPossibleNames": [],
				"logicalName": "G_ALG2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 158
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "G_Geom",
				"otherPossibleNames": [],
				"logicalName": "G_GEOM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 159
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "G_Trig",
				"otherPossibleNames": [],
				"logicalName": "G_TRIG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 160
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "G_BegCalc",
				"otherPossibleNames": [],
				"logicalName": "G_BEGCALC",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 161
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "G_AdvMth",
				"otherPossibleNames": [],
				"logicalName": "G_ADVMTH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 162
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "G_Cmpt",
				"otherPossibleNames": [],
				"logicalName": "G_CMPT",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 163
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "G_GenSc",
				"otherPossibleNames": [],
				"logicalName": "G_GENSC",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 164
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "G_Bio",
				"otherPossibleNames": [],
				"logicalName": "G_BIO",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 165
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "G_Chem",
				"otherPossibleNames": [],
				"logicalName": "G_CHEM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 166
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "G_Phys",
				"otherPossibleNames": [],
				"logicalName": "G_PHYS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 167
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "G_USHist",
				"otherPossibleNames": [],
				"logicalName": "G_USHIST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 168
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "G_WrldHist",
				"otherPossibleNames": [],
				"logicalName": "G_WRLDHIST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 169
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "G_OthHist",
				"otherPossibleNames": [],
				"logicalName": "G_OTHHIST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 170
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "G_AmGov",
				"otherPossibleNames": [],
				"logicalName": "G_AMGOV",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 171
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "G_Econ",
				"otherPossibleNames": [],
				"logicalName": "G_ECON",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 172
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "G_Geog",
				"otherPossibleNames": [],
				"logicalName": "G_GEOG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 173
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "G_Psych",
				"otherPossibleNames": [],
				"logicalName": "G_PSYCH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 174
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "G_Span",
				"otherPossibleNames": [],
				"logicalName": "G_SPAN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 175
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "G_Frch",
				"otherPossibleNames": [],
				"logicalName": "G_FRCH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 176
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "G_Germ",
				"otherPossibleNames": [],
				"logicalName": "G_GERM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 177
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "G_Lang",
				"otherPossibleNames": [],
				"logicalName": "G_LANG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 178
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "G_Art",
				"otherPossibleNames": [],
				"logicalName": "G_ART",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 179
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "G_Mus",
				"otherPossibleNames": [],
				"logicalName": "G_MUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 180
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "G_Dram",
				"otherPossibleNames": [],
				"logicalName": "G_DRAM",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 181
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "G_Overall",
				"otherPossibleNames": [],
				"logicalName": "G_OVERALL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 182
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Full_Part",
				"otherPossibleNames": [],
				"logicalName": "FULL_PART",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 183
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Live_Pln",
				"otherPossibleNames": [],
				"logicalName": "LIVE_PLN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 184
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Major_Code",
				"otherPossibleNames": [],
				"logicalName": "MAJOR_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 185
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Major_Certainty",
				"otherPossibleNames": [],
				"logicalName": "MAJOR_CERTAINTY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 186
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Voc_Code",
				"otherPossibleNames": [],
				"logicalName": "VOC_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 187
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Voc_Certainty",
				"otherPossibleNames": [],
				"logicalName": "VOC_CERTAINTY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 188
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Highest_ed_exp",
				"otherPossibleNames": [],
				"logicalName": "HIGHEST_ED_EXP",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 189
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "ROTC",
				"otherPossibleNames": [],
				"logicalName": "ROTC",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 190
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Help_EdPlan",
				"otherPossibleNames": [],
				"logicalName": "HELP_EDPLAN",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 191
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Help_Writing",
				"otherPossibleNames": [],
				"logicalName": "HELP_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 192
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Help_Reading",
				"otherPossibleNames": [],
				"logicalName": "HELP_READING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 193
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Help_StudySk",
				"otherPossibleNames": [],
				"logicalName": "HELP_STUDYSK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 194
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Help_MathSk",
				"otherPossibleNames": [],
				"logicalName": "HELP_MATHSK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 195
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Want_IndepSt",
				"otherPossibleNames": [],
				"logicalName": "WANT_INDEPST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 196
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Want_Honors",
				"otherPossibleNames": [],
				"logicalName": "WANT_HONORS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 197
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Want_StudyAb",
				"otherPossibleNames": [],
				"logicalName": "WANT_STUDYAB",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 198
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Plan_InstMus",
				"otherPossibleNames": [],
				"logicalName": "PLAN_INSTMUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 199
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Plan_VocMus",
				"otherPossibleNames": [],
				"logicalName": "PLAN_VOCMUS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 200
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Plan_StuGov",
				"otherPossibleNames": [],
				"logicalName": "PLAN_STUGOV",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 201
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Plan_Pubs",
				"otherPossibleNames": [],
				"logicalName": "PLAN_PUBS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 202
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Plan_Debate",
				"otherPossibleNames": [],
				"logicalName": "PLAN_DEBATE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 203
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Plan_Theater",
				"otherPossibleNames": [],
				"logicalName": "PLAN_THEATER",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 204
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Plan_RelOrg",
				"otherPossibleNames": [],
				"logicalName": "PLAN_RELORG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 205
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Plan_RacEthOrg",
				"otherPossibleNames": [],
				"logicalName": "PLAN_RACETHORG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 206
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Plan_VAthl",
				"otherPossibleNames": [],
				"logicalName": "PLAN_VATHL",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 207
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Plan_PolOrg",
				"otherPossibleNames": [],
				"logicalName": "PLAN_POLORG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 208
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Plan_RadioTV",
				"otherPossibleNames": [],
				"logicalName": "PLAN_RADIOTV",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 209
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Plan_FratSor",
				"otherPossibleNames": [],
				"logicalName": "PLAN_FRATSOR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 210
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Plan_ServOrg",
				"otherPossibleNames": [],
				"logicalName": "PLAN_SERVORG",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 211
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Exp_FinAidApp",
				"otherPossibleNames": [],
				"logicalName": "EXP_FINAIDAPP",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 212
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Exp_Work",
				"otherPossibleNames": [],
				"logicalName": "EXP_WORK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 213
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Exp_WorkHrs",
				"otherPossibleNames": [],
				"logicalName": "EXP_WORKHRS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 214
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Fam_Income",
				"otherPossibleNames": [],
				"logicalName": "FAM_INCOME",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 215
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EdLevel_Mthr",
				"otherPossibleNames": [],
				"logicalName": "EDLEVEL_MTHR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 216
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "EdLevel_Fthr",
				"otherPossibleNames": [],
				"logicalName": "EDLEVEL_FTHR",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 217
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Pref_Dist",
				"otherPossibleNames": [],
				"logicalName": "PREF_DIST",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 218
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "InstTypePref",
				"otherPossibleNames": [],
				"logicalName": "INSTTYPEPREF",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 219
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "InstTypePref_Rnk",
				"otherPossibleNames": [],
				"logicalName": "INSTTYPEPREF_RNK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 220
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MaleFemPref",
				"otherPossibleNames": [],
				"logicalName": "MALEFEMPREF",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 221
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "MaleFemPref_Rnk",
				"otherPossibleNames": [],
				"logicalName": "MALEFEMPREF_RNK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 222
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "StatePref1",
				"otherPossibleNames": [],
				"logicalName": "STATEPREF1",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 223
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "StatePref2",
				"otherPossibleNames": [],
				"logicalName": "STATEPREF2",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 224
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "StatePref_Rnk",
				"otherPossibleNames": [],
				"logicalName": "STATEPREF_RNK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 225
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "CostPref",
				"otherPossibleNames": [],
				"logicalName": "COSTPREF",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 226
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "CostPref_Rnk",
				"otherPossibleNames": [],
				"logicalName": "COSTPREF_RNK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 227
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SizePref",
				"otherPossibleNames": [],
				"logicalName": "SIZEPREF",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 228
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "SizePref_Rnk",
				"otherPossibleNames": [],
				"logicalName": "SIZEPREF_RNK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 229
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "AcadMajPref_Rnk",
				"otherPossibleNames": [],
				"logicalName": "ACADMAJPREF_RNK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 230
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "OtherFac_Rnk",
				"otherPossibleNames": [],
				"logicalName": "OTHERFAC_RNK",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 231
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Rnks_Type",
				"otherPossibleNames": [],
				"logicalName": "RNKS_TYPE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 232
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "C_Readiness",
				"otherPossibleNames": [],
				"logicalName": "PROGRESS_TOWARD_CAREER_READINESS_CODE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 233
				},
				"fieldLength": 1,
				"expectedValues": ["0", "1", "2", "3", "-"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "E_Earn_Prod",
				"otherPossibleNames": [],
				"logicalName": "POINTS_EARNED_ENGLISH_PRODUCTION_OF_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 234
				},
				"fieldLength": 2,
				"expectedValues": ["00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "--"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "E_Poss_Prod",
				"otherPossibleNames": [],
				"logicalName": "POINTS_POSSIBLE_ENGLISH_PRODUCTION_OF_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 235
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "--"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "E_PctC_Prod",
				"otherPossibleNames": [],
				"logicalName": "PERCENT_CORRECT_ENGLISH_PRODUCTION_OF_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 236
				},
				"fieldLength": 3,
				"expectedValues": ["000", "001", "002", "003", "004", "005", "006", "007", "008", "009", "010", "011", "012", "013", "014", "015", "016", "017", "018", "019", "020", "021", "022", "023", "024", "025", "026", "027", "028", "029", "030", "031", "032", "033", "034", "035", "036", "037", "038", "039", "040", "041", "042", "043", "044", "045", "046", "047", "048", "049", "050", "051", "052", "053", "054", "055", "056", "057", "058", "059", "060", "061", "062", "063", "064", "065", "066", "067", "068", "069", "070", "071", "072", "073", "074", "075", "076", "077", "078", "079", "080", "081", "082", "083", "084", "085", "086", "087", "088", "089", "090", "091", "092", "093", "094", "095", "096", "097", "098", "099", "100","00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "---"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "E_RdyRng_Prod",
				"otherPossibleNames": [],
				"logicalName": "READINESS_LOWER_BOUND_ENGLISH_PRODUCTION_OF_WRITING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 237
				},
				"fieldLength": 3,
				"expectedValues": ["000", "001", "002", "003", "004", "005", "006", "007", "008", "009", "010", "011", "012", "013", "014", "015", "016", "017", "018", "019", "020", "021", "022", "023", "024", "025", "026", "027", "028", "029", "030", "031", "032", "033", "034", "035", "036", "037", "038", "039", "040", "041", "042", "043", "044", "045", "046", "047", "048", "049", "050", "051", "052", "053", "054", "055", "056", "057", "058", "059", "060", "061", "062", "063", "064", "065", "066", "067", "068", "069", "070", "071", "072", "073", "074", "075", "076", "077", "078", "079", "080", "081", "082", "083", "084", "085", "086", "087", "088", "089", "090", "091", "092", "093", "094", "095", "096", "097", "098", "099", "100","00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "---"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "E_Earn_Knlg",
				"otherPossibleNames": [],
				"logicalName": "POINTS_EARNED_ENGLISH_KNOWLEDGE_OF_LANGUAGE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 238
				},
				"fieldLength": 2,
				"expectedValues": ["00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "--"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "E_Poss_Knlg",
				"otherPossibleNames": [],
				"logicalName": "POINTS_POSSIBLE_ENGLISH_KNOWLEDGE_OF_LANGUAGE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 239
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "--"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "E_PctC_Knlg",
				"otherPossibleNames": [],
				"logicalName": "PERCENT_CORRECT_ENGLISH_KNOWLEDGE_OF_LANGUAGE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 240
				},
				"fieldLength": 3,
				"expectedValues": ["000", "001", "002", "003", "004", "005", "006", "007", "008", "009", "010", "011", "012", "013", "014", "015", "016", "017", "018", "019", "020", "021", "022", "023", "024", "025", "026", "027", "028", "029", "030", "031", "032", "033", "034", "035", "036", "037", "038", "039", "040", "041", "042", "043", "044", "045", "046", "047", "048", "049", "050", "051", "052", "053", "054", "055", "056", "057", "058", "059", "060", "061", "062", "063", "064", "065", "066", "067", "068", "069", "070", "071", "072", "073", "074", "075", "076", "077", "078", "079", "080", "081", "082", "083", "084", "085", "086", "087", "088", "089", "090", "091", "092", "093", "094", "095", "096", "097", "098", "099", "100","00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "---"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "E_RdyRng_Knlg",
				"otherPossibleNames": [],
				"logicalName": "READINESS_LOWER_BOUND_ENGLISH_KNOWLEDGE_OF_LANGUAGE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 241
				},
				"fieldLength": 3,
				"expectedValues": ["000", "001", "002", "003", "004", "005", "006", "007", "008", "009", "010", "011", "012", "013", "014", "015", "016", "017", "018", "019", "020", "021", "022", "023", "024", "025", "026", "027", "028", "029", "030", "031", "032", "033", "034", "035", "036", "037", "038", "039", "040", "041", "042", "043", "044", "045", "046", "047", "048", "049", "050", "051", "052", "053", "054", "055", "056", "057", "058", "059", "060", "061", "062", "063", "064", "065", "066", "067", "068", "069", "070", "071", "072", "073", "074", "075", "076", "077", "078", "079", "080", "081", "082", "083", "084", "085", "086", "087", "088", "089", "090", "091", "092", "093", "094", "095", "096", "097", "098", "099", "100","00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "---"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "E_Earn_Conv",
				"otherPossibleNames": [],
				"logicalName": "POINTS_EARNED_ENGLISH_CONVENTIONS_OF_STANDARD_ENGLISH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 242
				},
				"fieldLength": 2,
				"expectedValues": ["00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "--"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "E_Poss_Conv",
				"otherPossibleNames": [],
				"logicalName": "POINTS_POSSIBLE_ENGLISH_CONVENTIONS_OF_STANDARD_ENGLISH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 243
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "--"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "E_PctC_Conv",
				"otherPossibleNames": [],
				"logicalName": "PERCENT_CORRECT_ENGLISH_CONVENTIONS_OF_STANDARD_ENGLISH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 244
				},
				"fieldLength": 3,
				"expectedValues": ["000", "001", "002", "003", "004", "005", "006", "007", "008", "009", "010", "011", "012", "013", "014", "015", "016", "017", "018", "019", "020", "021", "022", "023", "024", "025", "026", "027", "028", "029", "030", "031", "032", "033", "034", "035", "036", "037", "038", "039", "040", "041", "042", "043", "044", "045", "046", "047", "048", "049", "050", "051", "052", "053", "054", "055", "056", "057", "058", "059", "060", "061", "062", "063", "064", "065", "066", "067", "068", "069", "070", "071", "072", "073", "074", "075", "076", "077", "078", "079", "080", "081", "082", "083", "084", "085", "086", "087", "088", "089", "090", "091", "092", "093", "094", "095", "096", "097", "098", "099", "100","00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "---"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "E_RdyRng_Conv",
				"otherPossibleNames": [],
				"logicalName": "READINESS_LOWER_BOUND_ENGLISH_CONVENTIONS_OF_STANDARD_ENGLISH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 245
				},
				"fieldLength": 3,
				"expectedValues": ["000", "001", "002", "003", "004", "005", "006", "007", "008", "009", "010", "011", "012", "013", "014", "015", "016", "017", "018", "019", "020", "021", "022", "023", "024", "025", "026", "027", "028", "029", "030", "031", "032", "033", "034", "035", "036", "037", "038", "039", "040", "041", "042", "043", "044", "045", "046", "047", "048", "049", "050", "051", "052", "053", "054", "055", "056", "057", "058", "059", "060", "061", "062", "063", "064", "065", "066", "067", "068", "069", "070", "071", "072", "073", "074", "075", "076", "077", "078", "079", "080", "081", "082", "083", "084", "085", "086", "087", "088", "089", "090", "091", "092", "093", "094", "095", "096", "097", "098", "099", "100","00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "---"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "M_Earn_Higher",
				"otherPossibleNames": [],
				"logicalName": "POINTS_EARNED_MATH_PREP_HIGHER_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 246
				},
				"fieldLength": 2,
				"expectedValues": ["00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "--"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "M_Poss_Higher",
				"otherPossibleNames": [],
				"logicalName": "POINTS_POSSIBLE_MATH_PREP_HIGHER_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 247
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "--"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "M_PctC_Higher",
				"otherPossibleNames": [],
				"logicalName": "PERCENT_CORRECT_MATH_PREP_HIGHER_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 248
				},
				"fieldLength": 3,
				"expectedValues": ["000", "001", "002", "003", "004", "005", "006", "007", "008", "009", "010", "011", "012", "013", "014", "015", "016", "017", "018", "019", "020", "021", "022", "023", "024", "025", "026", "027", "028", "029", "030", "031", "032", "033", "034", "035", "036", "037", "038", "039", "040", "041", "042", "043", "044", "045", "046", "047", "048", "049", "050", "051", "052", "053", "054", "055", "056", "057", "058", "059", "060", "061", "062", "063", "064", "065", "066", "067", "068", "069", "070", "071", "072", "073", "074", "075", "076", "077", "078", "079", "080", "081", "082", "083", "084", "085", "086", "087", "088", "089", "090", "091", "092", "093", "094", "095", "096", "097", "098", "099", "100","00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "---"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "M_RdyRng_Higher",
				"otherPossibleNames": [],
				"logicalName": "READINESS_LOWER_BOUND_MATH_PREP_HIGHER_MATH",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 249
				},
				"fieldLength": 3,
				"expectedValues": ["000", "001", "002", "003", "004", "005", "006", "007", "008", "009", "010", "011", "012", "013", "014", "015", "016", "017", "018", "019", "020", "021", "022", "023", "024", "025", "026", "027", "028", "029", "030", "031", "032", "033", "034", "035", "036", "037", "038", "039", "040", "041", "042", "043", "044", "045", "046", "047", "048", "049", "050", "051", "052", "053", "054", "055", "056", "057", "058", "059", "060", "061", "062", "063", "064", "065", "066", "067", "068", "069", "070", "071", "072", "073", "074", "075", "076", "077", "078", "079", "080", "081", "082", "083", "084", "085", "086", "087", "088", "089", "090", "091", "092", "093", "094", "095", "096", "097", "098", "099", "100","00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "---"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "M_Earn_NumQ",
				"otherPossibleNames": [],
				"logicalName": "POINTS_EARNED_MATH_NUMBER_AND_QUANTITY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 250
				},
				"fieldLength": 2,
				"expectedValues": ["00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "--"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "M_Poss_NumQ",
				"otherPossibleNames": [],
				"logicalName": "POINTS_POSSIBLE_MATH_NUMBER_AND_QUANTITY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 251
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "--"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "M_PctC_NumQ",
				"otherPossibleNames": [],
				"logicalName": "PERCENT_CORRECT_MATH_NUMBER_AND_QUANTITY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 252
				},
				"fieldLength": 3,
				"expectedValues": ["000", "001", "002", "003", "004", "005", "006", "007", "008", "009", "010", "011", "012", "013", "014", "015", "016", "017", "018", "019", "020", "021", "022", "023", "024", "025", "026", "027", "028", "029", "030", "031", "032", "033", "034", "035", "036", "037", "038", "039", "040", "041", "042", "043", "044", "045", "046", "047", "048", "049", "050", "051", "052", "053", "054", "055", "056", "057", "058", "059", "060", "061", "062", "063", "064", "065", "066", "067", "068", "069", "070", "071", "072", "073", "074", "075", "076", "077", "078", "079", "080", "081", "082", "083", "084", "085", "086", "087", "088", "089", "090", "091", "092", "093", "094", "095", "096", "097", "098", "099", "100","00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "---"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "M_RdyRng_NumQ",
				"otherPossibleNames": [],
				"logicalName": "READINESS_LOWER_BOUND_MATH_NUMBER_AND_QUANTITY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 253
				},
				"fieldLength": 3,
				"expectedValues": ["000", "001", "002", "003", "004", "005", "006", "007", "008", "009", "010", "011", "012", "013", "014", "015", "016", "017", "018", "019", "020", "021", "022", "023", "024", "025", "026", "027", "028", "029", "030", "031", "032", "033", "034", "035", "036", "037", "038", "039", "040", "041", "042", "043", "044", "045", "046", "047", "048", "049", "050", "051", "052", "053", "054", "055", "056", "057", "058", "059", "060", "061", "062", "063", "064", "065", "066", "067", "068", "069", "070", "071", "072", "073", "074", "075", "076", "077", "078", "079", "080", "081", "082", "083", "084", "085", "086", "087", "088", "089", "090", "091", "092", "093", "094", "095", "096", "097", "098", "099", "100","00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "---"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "M_Earn_Alg",
				"otherPossibleNames": [],
				"logicalName": "POINTS_EARNED_MATH_ALGEBRA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 254
				},
				"fieldLength": 2,
				"expectedValues": ["00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "--"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "M_Poss_Alg",
				"otherPossibleNames": [],
				"logicalName": "POINTS_POSSIBLE_MATH_ALGEBRA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 255
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "--"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "M_PctC_Alg",
				"otherPossibleNames": [],
				"logicalName": "PERCENT_CORRECT_MATH_ALGEBRA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 256
				},
				"fieldLength": 3,
				"expectedValues": ["000", "001", "002", "003", "004", "005", "006", "007", "008", "009", "010", "011", "012", "013", "014", "015", "016", "017", "018", "019", "020", "021", "022", "023", "024", "025", "026", "027", "028", "029", "030", "031", "032", "033", "034", "035", "036", "037", "038", "039", "040", "041", "042", "043", "044", "045", "046", "047", "048", "049", "050", "051", "052", "053", "054", "055", "056", "057", "058", "059", "060", "061", "062", "063", "064", "065", "066", "067", "068", "069", "070", "071", "072", "073", "074", "075", "076", "077", "078", "079", "080", "081", "082", "083", "084", "085", "086", "087", "088", "089", "090", "091", "092", "093", "094", "095", "096", "097", "098", "099", "100","00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "---"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "M_RdyRng_Alg",
				"otherPossibleNames": [],
				"logicalName": "READINESS_LOWER_BOUND_MATH_ALGEBRA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 257
				},
				"fieldLength": 3,
				"expectedValues": ["000", "001", "002", "003", "004", "005", "006", "007", "008", "009", "010", "011", "012", "013", "014", "015", "016", "017", "018", "019", "020", "021", "022", "023", "024", "025", "026", "027", "028", "029", "030", "031", "032", "033", "034", "035", "036", "037", "038", "039", "040", "041", "042", "043", "044", "045", "046", "047", "048", "049", "050", "051", "052", "053", "054", "055", "056", "057", "058", "059", "060", "061", "062", "063", "064", "065", "066", "067", "068", "069", "070", "071", "072", "073", "074", "075", "076", "077", "078", "079", "080", "081", "082", "083", "084", "085", "086", "087", "088", "089", "090", "091", "092", "093", "094", "095", "096", "097", "098", "099", "100","00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "---"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "M_Earn_Func",
				"otherPossibleNames": [],
				"logicalName": "POINTS_EARNED_MATH_FUNCTIONS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 258
				},
				"fieldLength": 2,
				"expectedValues": ["00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "--"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "M_Poss_Func",
				"otherPossibleNames": [],
				"logicalName": "POINTS_POSSIBLE_MATH_FUNCTIONS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 259
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "--"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "M_PctC_Func",
				"otherPossibleNames": [],
				"logicalName": "PERCENT_CORRECT_MATH_FUNCTIONS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 260
				},
				"fieldLength": 3,
				"expectedValues": ["000", "001", "002", "003", "004", "005", "006", "007", "008", "009", "010", "011", "012", "013", "014", "015", "016", "017", "018", "019", "020", "021", "022", "023", "024", "025", "026", "027", "028", "029", "030", "031", "032", "033", "034", "035", "036", "037", "038", "039", "040", "041", "042", "043", "044", "045", "046", "047", "048", "049", "050", "051", "052", "053", "054", "055", "056", "057", "058", "059", "060", "061", "062", "063", "064", "065", "066", "067", "068", "069", "070", "071", "072", "073", "074", "075", "076", "077", "078", "079", "080", "081", "082", "083", "084", "085", "086", "087", "088", "089", "090", "091", "092", "093", "094", "095", "096", "097", "098", "099", "100","00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "---"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "M_RdyRng_Func",
				"otherPossibleNames": [],
				"logicalName": "READINESS_LOWER_BOUND_MATH_FUNCTIONS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 261
				},
				"fieldLength": 3,
				"expectedValues": ["000", "001", "002", "003", "004", "005", "006", "007", "008", "009", "010", "011", "012", "013", "014", "015", "016", "017", "018", "019", "020", "021", "022", "023", "024", "025", "026", "027", "028", "029", "030", "031", "032", "033", "034", "035", "036", "037", "038", "039", "040", "041", "042", "043", "044", "045", "046", "047", "048", "049", "050", "051", "052", "053", "054", "055", "056", "057", "058", "059", "060", "061", "062", "063", "064", "065", "066", "067", "068", "069", "070", "071", "072", "073", "074", "075", "076", "077", "078", "079", "080", "081", "082", "083", "084", "085", "086", "087", "088", "089", "090", "091", "092", "093", "094", "095", "096", "097", "098", "099", "100","00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "---"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "M_Earn_Geom",
				"otherPossibleNames": [],
				"logicalName": "POINTS_EARNED_MATH_GEOMETRY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 262
				},
				"fieldLength": 2,
				"expectedValues": ["00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "--"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "M_Poss_Geom",
				"otherPossibleNames": [],
				"logicalName": "POINTS_POSSIBLE_MATH_GEOMETRY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 263
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "--"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "M_PctC_Geom",
				"otherPossibleNames": [],
				"logicalName": "PERCENT_CORRECT_MATH_GEOMETRY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 264
				},
				"fieldLength": 3,
				"expectedValues": ["000", "001", "002", "003", "004", "005", "006", "007", "008", "009", "010", "011", "012", "013", "014", "015", "016", "017", "018", "019", "020", "021", "022", "023", "024", "025", "026", "027", "028", "029", "030", "031", "032", "033", "034", "035", "036", "037", "038", "039", "040", "041", "042", "043", "044", "045", "046", "047", "048", "049", "050", "051", "052", "053", "054", "055", "056", "057", "058", "059", "060", "061", "062", "063", "064", "065", "066", "067", "068", "069", "070", "071", "072", "073", "074", "075", "076", "077", "078", "079", "080", "081", "082", "083", "084", "085", "086", "087", "088", "089", "090", "091", "092", "093", "094", "095", "096", "097", "098", "099", "100","00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "---"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "M_RdyRng_Geom",
				"otherPossibleNames": [],
				"logicalName": "READINESS_LOWER_BOUND_MATH_GEOMETRY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 265
				},
				"fieldLength": 3,
				"expectedValues": ["000", "001", "002", "003", "004", "005", "006", "007", "008", "009", "010", "011", "012", "013", "014", "015", "016", "017", "018", "019", "020", "021", "022", "023", "024", "025", "026", "027", "028", "029", "030", "031", "032", "033", "034", "035", "036", "037", "038", "039", "040", "041", "042", "043", "044", "045", "046", "047", "048", "049", "050", "051", "052", "053", "054", "055", "056", "057", "058", "059", "060", "061", "062", "063", "064", "065", "066", "067", "068", "069", "070", "071", "072", "073", "074", "075", "076", "077", "078", "079", "080", "081", "082", "083", "084", "085", "086", "087", "088", "089", "090", "091", "092", "093", "094", "095", "096", "097", "098", "099", "100","00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "---"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "M_Earn_Stat",
				"otherPossibleNames": [],
				"logicalName": "POINTS_EARNED_MATH_STATISTICS_AND_PROBABILITY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 266
				},
				"fieldLength": 2,
				"expectedValues": ["00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "--"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "M_Poss_Stat",
				"otherPossibleNames": [],
				"logicalName": "POINTS_POSSIBLE_MATH_STATISTICS_AND_PROBABILITY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 267
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "--"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "M_PctC_Stat",
				"otherPossibleNames": [],
				"logicalName": "PERCENT_CORRECT_MATH_STATISTICS_AND_PROBABILITY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 268
				},
				"fieldLength": 3,
				"expectedValues": ["000", "001", "002", "003", "004", "005", "006", "007", "008", "009", "010", "011", "012", "013", "014", "015", "016", "017", "018", "019", "020", "021", "022", "023", "024", "025", "026", "027", "028", "029", "030", "031", "032", "033", "034", "035", "036", "037", "038", "039", "040", "041", "042", "043", "044", "045", "046", "047", "048", "049", "050", "051", "052", "053", "054", "055", "056", "057", "058", "059", "060", "061", "062", "063", "064", "065", "066", "067", "068", "069", "070", "071", "072", "073", "074", "075", "076", "077", "078", "079", "080", "081", "082", "083", "084", "085", "086", "087", "088", "089", "090", "091", "092", "093", "094", "095", "096", "097", "098", "099", "100","00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "---"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "M_RdyRng_Stat",
				"otherPossibleNames": [],
				"logicalName": "READINESS_LOWER_BOUND_MATH_STATISTICS_AND_PROBABILITY",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 269
				},
				"fieldLength": 3,
				"expectedValues": ["000", "001", "002", "003", "004", "005", "006", "007", "008", "009", "010", "011", "012", "013", "014", "015", "016", "017", "018", "019", "020", "021", "022", "023", "024", "025", "026", "027", "028", "029", "030", "031", "032", "033", "034", "035", "036", "037", "038", "039", "040", "041", "042", "043", "044", "045", "046", "047", "048", "049", "050", "051", "052", "053", "054", "055", "056", "057", "058", "059", "060", "061", "062", "063", "064", "065", "066", "067", "068", "069", "070", "071", "072", "073", "074", "075", "076", "077", "078", "079", "080", "081", "082", "083", "084", "085", "086", "087", "088", "089", "090", "091", "092", "093", "094", "095", "096", "097", "098", "099", "100","00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "---"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "M_Earn_Essen",
				"otherPossibleNames": [],
				"logicalName": "POINTS_EARNED_MATH_INTEGRATING_ESSENTIAL_SKILLS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 270
				},
				"fieldLength": 2,
				"expectedValues": ["00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "--"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "M_Poss_Essen",
				"otherPossibleNames": [],
				"logicalName": "POINTS_POSSIBLE_MATH_INTEGRATING_ESSENTIAL_SKILLS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 271
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "--"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "M_PctC_Essen",
				"otherPossibleNames": [],
				"logicalName": "PERCENT_CORRECT_MATH_INTEGRATING_ESSENTIAL_SKILLS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 272
				},
				"fieldLength": 3,
				"expectedValues": ["000", "001", "002", "003", "004", "005", "006", "007", "008", "009", "010", "011", "012", "013", "014", "015", "016", "017", "018", "019", "020", "021", "022", "023", "024", "025", "026", "027", "028", "029", "030", "031", "032", "033", "034", "035", "036", "037", "038", "039", "040", "041", "042", "043", "044", "045", "046", "047", "048", "049", "050", "051", "052", "053", "054", "055", "056", "057", "058", "059", "060", "061", "062", "063", "064", "065", "066", "067", "068", "069", "070", "071", "072", "073", "074", "075", "076", "077", "078", "079", "080", "081", "082", "083", "084", "085", "086", "087", "088", "089", "090", "091", "092", "093", "094", "095", "096", "097", "098", "099", "100","00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "---"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "M_RdyRng_Essen",
				"otherPossibleNames": [],
				"logicalName": "READINESS_LOWER_BOUND_MATH_INTEGRATING_ESSENTIAL_SKILLS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 273
				},
				"fieldLength": 3,
				"expectedValues": ["000", "001", "002", "003", "004", "005", "006", "007", "008", "009", "010", "011", "012", "013", "014", "015", "016", "017", "018", "019", "020", "021", "022", "023", "024", "025", "026", "027", "028", "029", "030", "031", "032", "033", "034", "035", "036", "037", "038", "039", "040", "041", "042", "043", "044", "045", "046", "047", "048", "049", "050", "051", "052", "053", "054", "055", "056", "057", "058", "059", "060", "061", "062", "063", "064", "065", "066", "067", "068", "069", "070", "071", "072", "073", "074", "075", "076", "077", "078", "079", "080", "081", "082", "083", "084", "085", "086", "087", "088", "089", "090", "091", "092", "093", "094", "095", "096", "097", "098", "099", "100","00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "---"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "M_Earn_Mod",
				"otherPossibleNames": [],
				"logicalName": "POINTS_EARNED_MATH_MODELING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 274
				},
				"fieldLength": 2,
				"expectedValues": ["00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "--"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "M_Poss_Mod",
				"otherPossibleNames": [],
				"logicalName": "POINTS_POSSIBLE_MATH_MODELING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 275
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "--"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "M_PctC_Mod",
				"otherPossibleNames": [],
				"logicalName": "PERCENT_CORRECT_MATH_MODELING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 276
				},
				"fieldLength": 3,
				"expectedValues": ["000", "001", "002", "003", "004", "005", "006", "007", "008", "009", "010", "011", "012", "013", "014", "015", "016", "017", "018", "019", "020", "021", "022", "023", "024", "025", "026", "027", "028", "029", "030", "031", "032", "033", "034", "035", "036", "037", "038", "039", "040", "041", "042", "043", "044", "045", "046", "047", "048", "049", "050", "051", "052", "053", "054", "055", "056", "057", "058", "059", "060", "061", "062", "063", "064", "065", "066", "067", "068", "069", "070", "071", "072", "073", "074", "075", "076", "077", "078", "079", "080", "081", "082", "083", "084", "085", "086", "087", "088", "089", "090", "091", "092", "093", "094", "095", "096", "097", "098", "099", "100","00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "---"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "M_RdyRng_Mod",
				"otherPossibleNames": [],
				"logicalName": "READINESS_LOWER_BOUND_MATH_MODELING",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 277
				},
				"fieldLength": 3,
				"expectedValues": ["000", "001", "002", "003", "004", "005", "006", "007", "008", "009", "010", "011", "012", "013", "014", "015", "016", "017", "018", "019", "020", "021", "022", "023", "024", "025", "026", "027", "028", "029", "030", "031", "032", "033", "034", "035", "036", "037", "038", "039", "040", "041", "042", "043", "044", "045", "046", "047", "048", "049", "050", "051", "052", "053", "054", "055", "056", "057", "058", "059", "060", "061", "062", "063", "064", "065", "066", "067", "068", "069", "070", "071", "072", "073", "074", "075", "076", "077", "078", "079", "080", "081", "082", "083", "084", "085", "086", "087", "088", "089", "090", "091", "092", "093", "094", "095", "096", "097", "098", "099", "100","00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "---"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "R_Earn_Ideas",
				"otherPossibleNames": [],
				"logicalName": "POINTS_EARNED_READING_KEY_IDEAS_DETAILS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 278
				},
				"fieldLength": 2,
				"expectedValues": ["00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "--"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "R_Poss_Ideas",
				"otherPossibleNames": [],
				"logicalName": "POINTS_POSSIBLE_READING_KEY_IDEAS_DETAILS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 279
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "--"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "R_PctC_Ideas",
				"otherPossibleNames": [],
				"logicalName": "PERCENT_CORRECT_READING_KEY_IDEAS_DETAILS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 280
				},
				"fieldLength": 3,
				"expectedValues": ["000", "001", "002", "003", "004", "005", "006", "007", "008", "009", "010", "011", "012", "013", "014", "015", "016", "017", "018", "019", "020", "021", "022", "023", "024", "025", "026", "027", "028", "029", "030", "031", "032", "033", "034", "035", "036", "037", "038", "039", "040", "041", "042", "043", "044", "045", "046", "047", "048", "049", "050", "051", "052", "053", "054", "055", "056", "057", "058", "059", "060", "061", "062", "063", "064", "065", "066", "067", "068", "069", "070", "071", "072", "073", "074", "075", "076", "077", "078", "079", "080", "081", "082", "083", "084", "085", "086", "087", "088", "089", "090", "091", "092", "093", "094", "095", "096", "097", "098", "099", "100","00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "---"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "R_RdyRng_Ideas",
				"otherPossibleNames": [],
				"logicalName": "READINESS_LOWER_BOUND_READING_KEY_IDEAS_DETAILS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 281
				},
				"fieldLength": 3,
				"expectedValues": ["000", "001", "002", "003", "004", "005", "006", "007", "008", "009", "010", "011", "012", "013", "014", "015", "016", "017", "018", "019", "020", "021", "022", "023", "024", "025", "026", "027", "028", "029", "030", "031", "032", "033", "034", "035", "036", "037", "038", "039", "040", "041", "042", "043", "044", "045", "046", "047", "048", "049", "050", "051", "052", "053", "054", "055", "056", "057", "058", "059", "060", "061", "062", "063", "064", "065", "066", "067", "068", "069", "070", "071", "072", "073", "074", "075", "076", "077", "078", "079", "080", "081", "082", "083", "084", "085", "086", "087", "088", "089", "090", "091", "092", "093", "094", "095", "096", "097", "098", "099", "100","00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "---"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "R_Earn_Struc",
				"otherPossibleNames": [],
				"logicalName": "POINTS_EARNED_READING_CRAFT_AND_STRUCTURE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 282
				},
				"fieldLength": 2,
				"expectedValues": ["00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "--"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "R_Poss_Struc",
				"otherPossibleNames": [],
				"logicalName": "POINTS_POSSIBLE_READING_CRAFT_AND_STRUCTURE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 283
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "--"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "R_PctC_Struc",
				"otherPossibleNames": [],
				"logicalName": "PERCENT_CORRECT_READING_CRAFT_AND_STRUCTURE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 284
				},
				"fieldLength": 3,
				"expectedValues": ["000", "001", "002", "003", "004", "005", "006", "007", "008", "009", "010", "011", "012", "013", "014", "015", "016", "017", "018", "019", "020", "021", "022", "023", "024", "025", "026", "027", "028", "029", "030", "031", "032", "033", "034", "035", "036", "037", "038", "039", "040", "041", "042", "043", "044", "045", "046", "047", "048", "049", "050", "051", "052", "053", "054", "055", "056", "057", "058", "059", "060", "061", "062", "063", "064", "065", "066", "067", "068", "069", "070", "071", "072", "073", "074", "075", "076", "077", "078", "079", "080", "081", "082", "083", "084", "085", "086", "087", "088", "089", "090", "091", "092", "093", "094", "095", "096", "097", "098", "099", "100","00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "---"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "R_RdyRng_Struc",
				"otherPossibleNames": [],
				"logicalName": "READINESS_LOWER_BOUND_READING_CRAFT_AND_STRUCTURE",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 285
				},
				"fieldLength": 3,
				"expectedValues": ["000", "001", "002", "003", "004", "005", "006", "007", "008", "009", "010", "011", "012", "013", "014", "015", "016", "017", "018", "019", "020", "021", "022", "023", "024", "025", "026", "027", "028", "029", "030", "031", "032", "033", "034", "035", "036", "037", "038", "039", "040", "041", "042", "043", "044", "045", "046", "047", "048", "049", "050", "051", "052", "053", "054", "055", "056", "057", "058", "059", "060", "061", "062", "063", "064", "065", "066", "067", "068", "069", "070", "071", "072", "073", "074", "075", "076", "077", "078", "079", "080", "081", "082", "083", "084", "085", "086", "087", "088", "089", "090", "091", "092", "093", "094", "095", "096", "097", "098", "099", "100","00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "---"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "R_Earn_Knlg",
				"otherPossibleNames": [],
				"logicalName": "POINTS_EARNED_READING_INTEGRATION_OF_KNOWLEDGE_AND_IDEAS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 286
				},
				"fieldLength": 2,
				"expectedValues": ["00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "--"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "R_Poss_Knlg",
				"otherPossibleNames": [],
				"logicalName": "POINTS_POSSIBLE_READING_INTEGRATION_OF_KNOWLEDGE_AND_IDEAS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 287
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "--"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "R_PctC_Knlg",
				"otherPossibleNames": [],
				"logicalName": "PERCENT_CORRECT_READING_INTEGRATION_OF_KNOWLEDGE_AND_IDEAS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 288
				},
				"fieldLength": 3,
				"expectedValues": ["000", "001", "002", "003", "004", "005", "006", "007", "008", "009", "010", "011", "012", "013", "014", "015", "016", "017", "018", "019", "020", "021", "022", "023", "024", "025", "026", "027", "028", "029", "030", "031", "032", "033", "034", "035", "036", "037", "038", "039", "040", "041", "042", "043", "044", "045", "046", "047", "048", "049", "050", "051", "052", "053", "054", "055", "056", "057", "058", "059", "060", "061", "062", "063", "064", "065", "066", "067", "068", "069", "070", "071", "072", "073", "074", "075", "076", "077", "078", "079", "080", "081", "082", "083", "084", "085", "086", "087", "088", "089", "090", "091", "092", "093", "094", "095", "096", "097", "098", "099", "100","00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "---"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "R_RdyRng_Knlg",
				"otherPossibleNames": [],
				"logicalName": "READINESS_LOWER_BOUND_READING_INTEGRATION_OF_KNOWLEDGE_AND_IDEAS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 289
				},
				"fieldLength": 3,
				"expectedValues": ["000", "001", "002", "003", "004", "005", "006", "007", "008", "009", "010", "011", "012", "013", "014", "015", "016", "017", "018", "019", "020", "021", "022", "023", "024", "025", "026", "027", "028", "029", "030", "031", "032", "033", "034", "035", "036", "037", "038", "039", "040", "041", "042", "043", "044", "045", "046", "047", "048", "049", "050", "051", "052", "053", "054", "055", "056", "057", "058", "059", "060", "061", "062", "063", "064", "065", "066", "067", "068", "069", "070", "071", "072", "073", "074", "075", "076", "077", "078", "079", "080", "081", "082", "083", "084", "085", "086", "087", "088", "089", "090", "091", "092", "093", "094", "095", "096", "097", "098", "099", "100","00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "---"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "S_Earn_Data",
				"otherPossibleNames": [],
				"logicalName": "POINTS_EARNED_SCIENCE_INTERPRETATION_OF_DATA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 290
				},
				"fieldLength": 2,
				"expectedValues": ["00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "--"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "S_Poss_Data",
				"otherPossibleNames": [],
				"logicalName": "POINTS_POSSIBLE_SCIENCE_INTERPRETATION_OF_DATA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 291
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "--"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "S_PctC_Data",
				"otherPossibleNames": [],
				"logicalName": "PERCENT_CORRECT_SCIENCE_INTERPRETATION_OF_DATA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 292
				},
				"fieldLength": 3,
				"expectedValues": ["000", "001", "002", "003", "004", "005", "006", "007", "008", "009", "010", "011", "012", "013", "014", "015", "016", "017", "018", "019", "020", "021", "022", "023", "024", "025", "026", "027", "028", "029", "030", "031", "032", "033", "034", "035", "036", "037", "038", "039", "040", "041", "042", "043", "044", "045", "046", "047", "048", "049", "050", "051", "052", "053", "054", "055", "056", "057", "058", "059", "060", "061", "062", "063", "064", "065", "066", "067", "068", "069", "070", "071", "072", "073", "074", "075", "076", "077", "078", "079", "080", "081", "082", "083", "084", "085", "086", "087", "088", "089", "090", "091", "092", "093", "094", "095", "096", "097", "098", "099", "100","00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "---"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "S_RdyRng_Data",
				"otherPossibleNames": [],
				"logicalName": "READINESS_LOWER_BOUND_SCIENCE_INTERPRETATION_OF_DATA",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 293
				},
				"fieldLength": 3,
				"expectedValues": ["000", "001", "002", "003", "004", "005", "006", "007", "008", "009", "010", "011", "012", "013", "014", "015", "016", "017", "018", "019", "020", "021", "022", "023", "024", "025", "026", "027", "028", "029", "030", "031", "032", "033", "034", "035", "036", "037", "038", "039", "040", "041", "042", "043", "044", "045", "046", "047", "048", "049", "050", "051", "052", "053", "054", "055", "056", "057", "058", "059", "060", "061", "062", "063", "064", "065", "066", "067", "068", "069", "070", "071", "072", "073", "074", "075", "076", "077", "078", "079", "080", "081", "082", "083", "084", "085", "086", "087", "088", "089", "090", "091", "092", "093", "094", "095", "096", "097", "098", "099", "100","00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "---"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "S_Earn_Inv",
				"otherPossibleNames": [],
				"logicalName": "POINTS_EARNED_SCIENCE_SCIENTIFIC_INVESTIGATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 294
				},
				"fieldLength": 2,
				"expectedValues": ["00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "--"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "S_Poss_Inv",
				"otherPossibleNames": [],
				"logicalName": "POINTS_POSSIBLE_SCIENCE_SCIENTIFIC_INVESTIGATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 295
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "--"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "S_PctC_Inv",
				"otherPossibleNames": [],
				"logicalName": "PERCENT_CORRECT_SCIENCE_SCIENTIFIC_INVESTIGATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 296
				},
				"fieldLength": 3,
				"expectedValues": ["000", "001", "002", "003", "004", "005", "006", "007", "008", "009", "010", "011", "012", "013", "014", "015", "016", "017", "018", "019", "020", "021", "022", "023", "024", "025", "026", "027", "028", "029", "030", "031", "032", "033", "034", "035", "036", "037", "038", "039", "040", "041", "042", "043", "044", "045", "046", "047", "048", "049", "050", "051", "052", "053", "054", "055", "056", "057", "058", "059", "060", "061", "062", "063", "064", "065", "066", "067", "068", "069", "070", "071", "072", "073", "074", "075", "076", "077", "078", "079", "080", "081", "082", "083", "084", "085", "086", "087", "088", "089", "090", "091", "092", "093", "094", "095", "096", "097", "098", "099", "100","00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "---"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "S_RdyRng_Inv",
				"otherPossibleNames": [],
				"logicalName": "READINESS_LOWER_BOUND_SCIENCE_SCIENTIFIC_INVESTIGATION",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 297
				},
				"fieldLength": 3,
				"expectedValues": ["000", "001", "002", "003", "004", "005", "006", "007", "008", "009", "010", "011", "012", "013", "014", "015", "016", "017", "018", "019", "020", "021", "022", "023", "024", "025", "026", "027", "028", "029", "030", "031", "032", "033", "034", "035", "036", "037", "038", "039", "040", "041", "042", "043", "044", "045", "046", "047", "048", "049", "050", "051", "052", "053", "054", "055", "056", "057", "058", "059", "060", "061", "062", "063", "064", "065", "066", "067", "068", "069", "070", "071", "072", "073", "074", "075", "076", "077", "078", "079", "080", "081", "082", "083", "084", "085", "086", "087", "088", "089", "090", "091", "092", "093", "094", "095", "096", "097", "098", "099", "100","00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "---"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "S_Earn_Eval",
				"otherPossibleNames": [],
				"logicalName": "POINTS_EARNED_SCIENCE_EVAL_OF_MODELS_INFERENCES_EXP_RESULTS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 298
				},
				"fieldLength": 2,
				"expectedValues": ["00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "--"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "S_Poss_Eval",
				"otherPossibleNames": [],
				"logicalName": "POINTS_POSSIBLE_SCIENCE_EVAL_OF_MODELS_INFERENCES_EXP_RESULTS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 299
				},
				"fieldLength": 2,
				"expectedValues": ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "--"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "S_PctC_Eval",
				"otherPossibleNames": [],
				"logicalName": "PERCENT_CORRECT_SCIENCE_EVAL_OF_MODELS_INFERENCES_EXP_RESULTS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 300
				},
				"fieldLength": 3,
				"expectedValues": ["000", "001", "002", "003", "004", "005", "006", "007", "008", "009", "010", "011", "012", "013", "014", "015", "016", "017", "018", "019", "020", "021", "022", "023", "024", "025", "026", "027", "028", "029", "030", "031", "032", "033", "034", "035", "036", "037", "038", "039", "040", "041", "042", "043", "044", "045", "046", "047", "048", "049", "050", "051", "052", "053", "054", "055", "056", "057", "058", "059", "060", "061", "062", "063", "064", "065", "066", "067", "068", "069", "070", "071", "072", "073", "074", "075", "076", "077", "078", "079", "080", "081", "082", "083", "084", "085", "086", "087", "088", "089", "090", "091", "092", "093", "094", "095", "096", "097", "098", "099", "100","00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "---"],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "S_RdyRng_Eval",
				"otherPossibleNames": [],
				"logicalName": "READINESS_LOWER_BOUND_SCIENCE_EVAL_OF_MODELS_INFERENCES_EXP_RESULTS",
				"formatMask": null,
				"isFieldRequired": "Y",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 301
				},
				"fieldLength": 3,
				"expectedValues": ["000", "001", "002", "003", "004", "005", "006", "007", "008", "009", "010", "011", "012", "013", "014", "015", "016", "017", "018", "019", "020", "021", "022", "023", "024", "025", "026", "027", "028", "029", "030", "031", "032", "033", "034", "035", "036", "037", "038", "039", "040", "041", "042", "043", "044", "045", "046", "047", "048", "049", "050", "051", "052", "053", "054", "055", "056", "057", "058", "059", "060", "061", "062", "063", "064", "065", "066", "067", "068", "069", "070", "071", "072", "073", "074", "075", "076", "077", "078", "079", "080", "081", "082", "083", "084", "085", "086", "087", "088", "089", "090", "091", "092", "093", "094", "095", "096", "097", "098", "099", "100","00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "---"],
				"dataTypes": "INTEGER",
				"scale": null
			},
			{
				"physicalName": "Report_Year",
				"otherPossibleNames": [],
				"logicalName": "REPORT_YEAR",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 302
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Admin",
				"otherPossibleNames": [],
				"logicalName": "ADMIN",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 303
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test_Dte_Expanded",
				"otherPossibleNames": [],
				"logicalName": "TEST_DATE_EXPANDED",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 304
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Test_Type",
				"otherPossibleNames": [],
				"logicalName": "TEST_TYPE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 305
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Barcode_Ind",
				"otherPossibleNames": [],
				"logicalName": "BARCODE_IND",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 306
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "State_Test_Day_Ind",
				"otherPossibleNames": [],
				"logicalName": "STATE_TEST_DAY_IND",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 307
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "HS_Type",
				"otherPossibleNames": [],
				"logicalName": "HS_TYPE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 308
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "HS_Size",
				"otherPossibleNames": [],
				"logicalName": "HS_SIZE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 309
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "HS_Rank",
				"otherPossibleNames": [],
				"logicalName": "HS_RANK",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 310
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "HS_GPA",
				"otherPossibleNames": [],
				"logicalName": "HS_GPA",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 311
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "HS_Curriculum",
				"otherPossibleNames": [],
				"logicalName": "HS_CURRICULUM",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 312
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "YRS_Eng",
				"otherPossibleNames": [],
				"logicalName": "YSR_ENG",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 313
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "YRS_Mth",
				"otherPossibleNames": [],
				"logicalName": "YRS_MTH",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 314
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "YRS_SocSc",
				"otherPossibleNames": [],
				"logicalName": "YRS_SOCSC",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 315
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "YRS_NatSc",
				"otherPossibleNames": [],
				"logicalName": "YRS_NATSC",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 316
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "YRS_Span",
				"otherPossibleNames": [],
				"logicalName": "YRS_SPAN",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 317
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "YRS_Germ",
				"otherPossibleNames": [],
				"logicalName": "YRS_GERM",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 318
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "YRS_Frch",
				"otherPossibleNames": [],
				"logicalName": "YRS_FRCH",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 319
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "YRS_Lang",
				"otherPossibleNames": [],
				"logicalName": "YRS_LANG",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 320
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Honors_Eng",
				"otherPossibleNames": [],
				"logicalName": "HONORS_ENG",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 321
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Honors_Mth",
				"otherPossibleNames": [],
				"logicalName": "HONORS_MTH",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 322
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Honors_SocSc",
				"otherPossibleNames": [],
				"logicalName": "HONORS_SOCSC",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 323
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Honors_NatSc",
				"otherPossibleNames": [],
				"logicalName": "HONORS_NATSC",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 324
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Honors_Lang",
				"otherPossibleNames": [],
				"logicalName": "HONORS_LANG",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 325
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "HS_InstMus",
				"otherPossibleNames": [],
				"logicalName": "HS_INSTMUS",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 326
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "HS_VocMus",
				"otherPossibleNames": [],
				"logicalName": "HS_VOCMUS",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 327
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "HS_StuGov",
				"otherPossibleNames": [],
				"logicalName": "HS_STUGOV",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 328
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "HS_Pubs",
				"otherPossibleNames": [],
				"logicalName": "HS_PUBS",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 329
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "HS_Debate",
				"otherPossibleNames": [],
				"logicalName": "HS_DEBATE",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 330
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "HS_Theater",
				"otherPossibleNames": [],
				"logicalName": "HS_THEATER",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 331
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "HS_RelOrg",
				"otherPossibleNames": [],
				"logicalName": "HS_RELORG",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 332
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "HS_RacEthOrg",
				"otherPossibleNames": [],
				"logicalName": "HS_RACETHORG",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 333
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "HS_VAthl",
				"otherPossibleNames": [],
				"logicalName": "HS_VATHL",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 334
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "HS_PolOrg",
				"otherPossibleNames": [],
				"logicalName": "HS_POLORG",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 335
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "HS_RadioTV",
				"otherPossibleNames": [],
				"logicalName": "HS_RADIOTV",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 336
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "HS_FratSor",
				"otherPossibleNames": [],
				"logicalName": "HS_FRATSOR",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 337
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "HS_ServOrg",
				"otherPossibleNames": [],
				"logicalName": "HS_SERVORG",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 338
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "State_Q1",
				"otherPossibleNames": [],
				"logicalName": "STATE_Q1",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 339
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "State_Q2",
				"otherPossibleNames": [],
				"logicalName": "STATE_Q2",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 340
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "State_Q3",
				"otherPossibleNames": [],
				"logicalName": "STATE_Q3",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 341
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "State_Q4",
				"otherPossibleNames": [],
				"logicalName": "STATE_Q4",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 342
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "State_Q5",
				"otherPossibleNames": [],
				"logicalName": "STATE_Q5",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 343
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "State_Q6",
				"otherPossibleNames": [],
				"logicalName": "STATE_Q6",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 344
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "State_Q7",
				"otherPossibleNames": [],
				"logicalName": "STATE_Q7",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 345
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "State_Q8",
				"otherPossibleNames": [],
				"logicalName": "STATE_Q8",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 346
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "State_Q9",
				"otherPossibleNames": [],
				"logicalName": "STATE_Q9",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 347
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "State_Q10",
				"otherPossibleNames": [],
				"logicalName": "STATE_Q10",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 348
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "State_Q11",
				"otherPossibleNames": [],
				"logicalName": "STATE_Q11",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 349
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "State_Q12",
				"otherPossibleNames": [],
				"logicalName": "STATE_Q12",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 350
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "State_Q13",
				"otherPossibleNames": [],
				"logicalName": "STATE_Q13",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 351
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "State_Q14",
				"otherPossibleNames": [],
				"logicalName": "STATE_Q14",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 352
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "State_Q15",
				"otherPossibleNames": [],
				"logicalName": "STATE_Q15",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 353
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Sup_L_Name",
				"otherPossibleNames": [],
				"logicalName": "SUP_L_NAME",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 354
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Sup_F_Name",
				"otherPossibleNames": [],
				"logicalName": "SUP_F_NAME",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 355
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
			},
			{
				"physicalName": "Sup_M_Initial",
				"otherPossibleNames": [],
				"logicalName": "SUP_M_INITIAL",
				"formatMask": null,
				"isFieldRequired": "N",
				"canBeNull": "Y",
				"fieldOffset": {
					"offsetStart": 0,
					"offsetEnd": 0,
					"columnNum": 356
				},
				"fieldLength": 500,
				"expectedValues": [],
				"dataTypes": "STRING",
				"scale": null
				},
    			{
    				"physicalName": "Sup_Gender",
    				"otherPossibleNames": [],
    				"logicalName": "SUP_GENDER",
    				"formatMask": null,
    				"isFieldRequired": "N",
    				"canBeNull": "Y",
    				"fieldOffset": {
    					"offsetStart": 0,
    					"offsetEnd": 0,
    					"columnNum": 357
    				},
    				"fieldLength": 500,
    				"expectedValues": [],
    				"dataTypes": "STRING",
    				"scale": null
 				},
     			{
     				"physicalName": "Sup_DOB",
     				"otherPossibleNames": [],
     				"logicalName": "SUP_DOB",
     				"formatMask": null,
     				"isFieldRequired": "N",
     				"canBeNull": "Y",
     				"fieldOffset": {
     					"offsetStart": 0,
     					"offsetEnd": 0,
     					"columnNum": 358
     				},
     				"fieldLength": 500,
     				"expectedValues": [],
     				"dataTypes": "STRING",
     				"scale": null
 				},
     			{
     				"physicalName": "MC_Score_Ind",
     				"otherPossibleNames": [],
     				"logicalName": "MC_SCORE_IND",
     				"formatMask": null,
     				"isFieldRequired": "N",
     				"canBeNull": "Y",
     				"fieldOffset": {
     					"offsetStart": 0,
     					"offsetEnd": 0,
     					"columnNum": 359
     				},
     				"fieldLength": 500,
     				"expectedValues": [],
     				"dataTypes": "STRING",
     				"scale": null
 				},
     			{
     				"physicalName": "Wrt_Score_Ind",
     				"otherPossibleNames": [],
     				"logicalName": "WRT_SCORE_IND",
     				"formatMask": null,
     				"isFieldRequired": "N",
     				"canBeNull": "Y",
     				"fieldOffset": {
     					"offsetStart": 0,
     					"offsetEnd": 0,
     					"columnNum": 360
     				},
     				"fieldLength": 500,
     				"expectedValues": [],
     				"dataTypes": "STRING",
     				"scale": null
         		}
		]
	},
	"fileExtensions": [".csv"]
}