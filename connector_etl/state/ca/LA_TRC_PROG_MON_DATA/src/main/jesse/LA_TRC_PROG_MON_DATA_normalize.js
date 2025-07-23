var AppNormalize = (function() {
    var module = {};
    var _thisModuleName = "AppNormalize";
    var _assessmentIdentifier = "LA_TRC_PROG_MON_DATA";
    var _thisLineageSource = "Edvantage ${_assessmentIdentifier} Loader v1.0";
    var multipleRowsPerGroupingExpected = false;

    /**
     * Converts an assessment source file into the normalized assessment format.
     *
     * @param file The raw source file being reviewed.
     * @param signature The signature file details in JSON format.
     * @returns {String} The location of the normalized file.
     */
    module.createNormalizedFile = function(file, signature) {
		try {

			var signatureFormatName = signature.getFormat().getFormatName();
			print("Loading using signature file ${signatureFormatName}");


			//Initialize path and lineage variables.
			var normalizedFile = AppUtil.createResultsFile(file);

			print("Normalized file: ${normalizedFile}");

			var hierarchy = AppUtil.getAssessmentHierarchyDetails(file);
			var lineNumber = 0;
			const fileFullName = file.getFullName();

			//Process data file records.
			_dataflow.create("RECORD BUILD")
				.input("INPUT", AppUtil.getInputDataflow(file, signature))
				.transform("ADD LINEAGE FIELD", ["RECORDS"], function (output, json) {

					json.LINEAGE_FILE = fileFullName;
					json.LINEAGE_LINE = (++lineNumber).toString();
					output.RECORDS.put(json);
				})
				.group_by("ADMINISTRATION GROUPING" , function(one, two){

					try {
						var rowOne = AppSignatureFieldDetails.getFieldDetailsParser(signature, one);
						var rowTwo = AppSignatureFieldDetails.getFieldDetailsParser(signature, two);

						return groupAssessmentByNaturalKey(signature, hierarchy, rowOne, rowTwo);
					} catch(exception) {
						AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",one.LINEAGE_LINE, "ADMINISTRATION GROUPING dataflow error: ${exception}", JSON.stringify(one) + "|" + JSON.stringify(two)));
					}

				})
				.transform("DUPLICATE ADMINISTRATION CHECK", ["RECORDS"], function (output, rows) {
					try{
						if(!multipleRowsPerGroupingExpected && rows.length > 1){

							//Report error for each row
							rows.forEach(function(row){
								AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "WARNING",json.LINEAGE_LINE, "Duplicate record natural key in source assessment file.", JSON.stringify(row)));
							});

						} else {
							output.RECORDS.put(rows);
						}
					} catch(exception) {
						AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "WARNING", rows[0].LINEAGE_LINE, "DUPLICATE ADMINISTRATION CHECK dataflow error: ${exception}", JSON.stringify(rows)));
					}
				})
				.transform("NORMALIZE RECORDS", ["RECORDS"],
					function(output, rows) {
						try{

							var normalizedRecords = mapNormalizedRecords(signature, hierarchy, rows);

							normalizedRecords.forEach(function(record){
								output.RECORDS.put(record);
							});

						} catch(exception) {
							AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH",rows[0].LINEAGE_LINE, "TRANSFORMATION dataflow error: ${exception}", JSON.stringify(rows)));
						}


					})
				.transform("SCORE COUNT CHECK", ["RECORDS"], function (output, row) {
					try {
						var mappingObject = JSON.parse(row.ASSESSMENT_JSON_MAPPINGS);

						// Report when no scores are found.
						if(mappingObject.SCORE_MAPPINGS.length === 0){
							AssessmentLoader.audits.push(AppAudit.writeRejectRecord(file.getFilePath(), "WARNING",row.LINEAGE_LINE, "No scores found.", JSON.stringify(row)));
						} else {
							output.RECORDS.put(row);
						}
					} catch(exception) {
						AssessmentLoader.audits.push(AppAudit.writeRejectRecord(hierarchy.SOURCE_FILE.getFilePath(), "HIGH", _util.coalesce(row.LINEAGE_LINE, -1), "SCORE COUNT CHECK dataflow error: ${exception}", JSON.stringify(row)));
					}
				})
				.output("OUTPUT", _io.delim_output(normalizedFile, "\t", "\"", "\\",false))
				.execute_markII(AssessmentLoader.config.ENABLE_DEBUG, 200, 1, 100);

			return normalizedFile;

		} catch(exception) {
			throw "${_thisModuleName}.createNormalizedFile Exception: ${exception}";
		}
    };


    /**
     * Merges a normalized file into the master normalized file.
     *
     * @param file The normalized assessment file to be merged.
     * @returns {file} The merged normalized file.
     */
    module.mergeAssessment = function(file) {
        return AppDataflow.mergeAssessment(file);
    };

    /***************************************************************************
     Assessment-specific Objects
     ***************************************************************************/

    var strandsAndFields =
        [
            {TEST: "LA_TRC_PROG_MON_DATA", STRAND: "PROGMONDATA", FIELD: "PROGMONDATA"}
        ];

    var lookUpTestNumber = {
        "Guided Reading (GR)" : "GR"
        ,"Go to the Zoo" : "GTZ"
        , "fun with clay" : "FWC"
        , "Fun with Clay" : "FWC"
        , "Lots Of Jobs" : "LOJ"
        , "Growing Up" : "GRUP"
        , "Birthday Cakes" : "BC"
        , "The Lost Mother" : "TLM"
        , "Working with Dad" : "WWD"
        , "Reptiles" : "RPTS"
        , "Sonoran Desert Animals" : "SDA"
        , "Little Bat" : "LTB"
        , "Unlucky Stanley" : "US"
        , "Oil Spills" : "OS"
        , "Lots Of Fish" : "LOF"
        , "Who is mom?" : "WIM"
        , "Can pat ride?" : "CPR"
        , "Bugs1" : "BUG1"
        , "At the pond 1" : "ATP1"
        , "Hands Can Do a Lot!" : "HCDL"
        , "hands Can Do a lot!" : "HCDL"
        , "Little Red Mix Up" : "LRMU"
        , "Bugs" : "BUG"
        , "bugs" : "BUG"
        , "Car Wash" : "CW"
        , "Silent Sam" : "SS"
        , "Surprise Moon" : "SM"
        , "Pickle Puss" : "PP"
        , "Week of Adventure" : "WOA"
        , "Sugar Cakes Cyril" : "SCC"
        , "I'm Heading to the Rodeo" : "IHTR"
        , "The Puzzle of Pretty" : "TPP"
        , "A Special Day" : "ASD"
        , "Fancy Dance" : "FD"
        , "A Pond" : "AP"
        , "Best Friends" : "BF"
        , "Why Anansi has eight thin legs" : "WAHETL"
        , "best friends" : "BF"
        , "The Sleep over" : "TSO"
        , "The Talking Dogfish" : "TTD"
        , "Monkey to the Top" : "MTTT"
        , "From Nest to Bird" : "FNB"
        , "The Sandwich" : "TS"
        , "In the Sea" : "ITS"
        , "Bedtime for Nick" : "BFN"
        , "I can help" : "ICA"
        , "I Can Help" : "ICA"
        , "The Nice Little House" : "TNLH"
        , "Shopping" : "SPG"
        , "Who runs faster?" : "WHF"
        , "Mom is a Painter" : "MIP"
        , "The Zoo" : "TZ"
        , "Sister, Sister" : "SIS"
        , "I Play Soccer" : "IPS"
        , "Ruby's Whistle" : "RW"
        , "Can I Have a Pet?" : "CIHP"
        , "Moving Day Surprise" : "MDS"
        , "In the Mountains" : "ITM"
        , "Buzz Said the Bee" : "BSB"
        , "Laundry Day" : "LD"
        , "Freddy Ready! Don't Sit On My Lunch" : "FRDSOML"
        , "Assessment" : "ASSMNT"
        , "We go to the zoo" : "WGZ"
        , "We Go To The Zoo" : "WGZ"
        , "I Go" : "IG"
        , "Pran's Week of Adventure" : "PWA"
        , "How Long Does It Take?" : "HLDIT"
        , "On Vacation" : "OV"
        , "I See" : "ISEE"
        , "Animal Coverings" : "ACGS"
        , "In Fall" : "IF"
        , "A Pumkin Grows" : "APG"
        , "The Fall Festival" : "TFF"
        , "Why Hummingbirds Drink Nectar" : "WHDN"
        , "Shoe Boxes" : "SBX"
        , "Green Freddie" : "GFD"
        , "Robert's New Friend" : "RNF"
        , "The Wonderful Day" : "TWD"
        , "What Do  You See at the Pond" : "WDYSATP"
        , "Fall" : "FALL"
        , "In the Ocean" : "ITO"
        , "The Loose Tooth" : "TLT"
        , "Carla's Special Paintbrush" : "CSP"
        , "Edwin's Haircut" : "EH"
        , "Anna's New Glasses" : "ANG"
        , "The Sleepover Party" : "TSOP"
        , "Socks" : "SOCKS"
        , "Can Pat Ride" : "CPR"
        , "Trouble at Beaver Pond" : "TABP"
        , "Old Bailey Meets His Match" : "OBMHM"
        , "Be Nice to Josephine" : "BNTJ"
        , "Touchdown" : "TOUCHDOWN"
        , "The Pot of Gold" : "TPOG"
        , "You Don't Look Beautiful to Me" : "YDLBTM"
        , "Danger in the Deep" : "DITD"
        , "Pig Has a Plan" : "PHAP"
        , "The Storm" : "TS"
        , "What Do You See" : "WDYS"
        , "Molly's Dogs" : "MD"
        , "What Do You See?" : "WDYS"
        , "Fall is Here!" : "FIH"
        , "will Tim Jump In" : "WTJI"
        , "will sam make a friend?" : "WSMAF"
        , "the picnic basket" : "TPB"
        , "the right teeth" : "TRT"
        , "the green tomato mystery" : "TGTM"
        , "the day the pages spoke" : "TDTPS"
        , "lets save energy" : "LSE"
        , "On the Wings of an eagle" : "OTWOAE"
        , "Mountain Bike Mania by Angie Belcher" : "MBMBAB"
        , "Justin and the Best Biscuits in the World" : "JATBBITW"
        , "Third-Grade Detectives#2, The Puzzle of the Pretty Pink Handerchief" : "TGDTPOTPPH"
        , "Playing" : "PLAYING"
        , "At the Park" : "ATP"
        , "Big and small cats" : "BASC"
        , "Big and Small Cats" : "BASC"
        , "Jake Sees a Tunnel" : "JSAT"
        , "I need shoes to play soccer" : "INSTPS"
        , "who is mom" : "WIM"
        , "The Gray Wolf" : "TGW"
        , "This Turtle" : "TT"
        , "The Mailman's Hat" : "TMH"
        , "Life Cycles" : "LC"
        , "Polar Regions of the Earth" : "PROTE"
        , "Why Can't I Fly" : "WCIF"
        , "Mom's Secret" : "MS"
        , "Punched Paper" : "PP"
        , "Frog's Lunch" : "FL"
        , "Fall is here" : "FIH"
        , "A Pumpkin Can Grow" : "APCG"
        , "I'm on the Phone" : "IOTP"
        , "Remember George Washington" : "RGW"
        , "What families Do" : "WFD"
        , "Rain Forest Birds" : "RFB"
        , "Houses Around the World" : "HATW"
        , "Animal Messengers" : "AM"
        , "The Statue of Liberty" : "TSOL"
        , "Bright Ideas Inventions That Changed History" : "BIITCH"
        , "Sounds in the Woods" : "SITW"
        , "Floating and Sinking" : "FAS"
        , "I'm Brave" : "IB"
        , "Incredible Cells" : "IC"
        , "Looking at Clouds" : "LAC"
        , "Communities" : "COMMUNITIES"
        , "The Moon" : "TM"
        , "A City Grows" : "ACG"
        , "Look at Me" : "LAM"
        , "Alex Swings the Vote" : "ASTV"
        , "Last Chance Cabin [Ch. 1-2]" : "LCC"
        , "The Dog and the Wolf" : "TDTW"
        , "Paul Bunyan" : "PB"
        , "Arie's Journey" : "AJ"
        , "Energy on Earth" : "EOE"
        , "A Matter of Mix-ups" : "AMOMU"
        , "Invaders" : "INVADERS"
        , "Sam and Puff" : "SAP"
        , "Take care of your teeth" : "TCOYT"
        , "Name day" : "ND"
        , "Lots of Fish PM" : "LOFPM"
        , "Pug the Pup PM" : "PTPPM"
        , "Who is Mom? PM" : "WIMPM"
        , "Lots of Jobs PM" : "LOJPM"
        , "Laugh Baby Sister" : "LBS"
        , "Catch a snowflake" : "CAS"
        , "The Not so Deserted Island" : "TNSDI"
        , "Carla's Special Paint brush" : "CSPB"
        , "Carla's Special Paintbrush PM" : "CSPPM"
        , "Unexpected visitors" : "UV"
        , "Felipe's Journey" : "FJ"
        , "On the Wings of an Eagle 1" : "OTWOAE1"
        , "TheCase of the MissingBasketball" : "TCOTMB"
        , "A Pet from Grandpa" : "APFGP"
        , "A pet From grandma" : "APFGM"
        , "The Right Teeth PM" : "TRTPM"
        , "Will Tim Jump in." : "WTJI"
        , "Clouds" : "CLOUDS"
        , "I Eat Leaves" : "IEL"
        , "stop that sneeze" : "STS"
        , "The Wall" : "TW"
        , "A Kitchen" : "AK"
        , "The" : "THE"
        , "The Best Cat" : "TBC"
        , "Carlas Special Paintbrush" : "CSP"
        , "Bird Goes Home" : "BGH"
        , "cats" : "CATS"
        , "Lizard seeks the sun" : "LSTS"
        , "Cows" : "COWS"
        , "Green Tomato Mystery" : "GTM"
        , "Robots" : "ROBOTS"
        , "The Nor'easter" : "TNE"
        , "How We Get to School" : "HWGTS"
        , "Dinosaurs [rev. 2004]" : "DINOSAURS"
        , "My Family - Hjemboe" : "MFH"
        , "The best field trip" : "TBFT"
        , "The not so desert island" : "TNSDI"
        , "Unexpected Visitors." : "UV"
        , "Laugh, Baby Sister h" : "LBSH"
        , "stop that sneeze" : "STS"
        , "Animals Hiding" : "AH"
        , "I Paint" : "IP"
        , "Deserts Dry" : "DD"
        , "Speedier than a Meteor" : "STAM"
        , "The Wheel" : "TW"
        , "Living Together" : "LT"
        , "Le't Save Energy!" : "LSE"
		, "Where Do Animals Live?" : "WDAL"
		, "Little Bears" : "LB"
		, "What Comes From Eggs?" : "WCFE"
		, "Jon Runs" : "JR"
		, "At The Pond" : "ATP"
		, "lots of fish" : "LOF"
		, "Gorillas" : "G"
		, "Grow, Seed, Grow" : "GSG"
		, "Water Changes" : "WC"
		, "My Steps" : "MS"
		, "A Tree Can Be..." : "ATCB"
		, "The Cat in the Hate" : "TCIH"
		, "The Incredible Bee" : "TIB"
		, "Inside a Rainbow" : "IAR"
		, "Who is Mom? PM" : "WIMPM"
		, "Why Anansi has Eight Thin Legs" : "WNETL"
		, "The Right teeth" : "TRT"
		, "monarch butterflies" : "MB"
		, "My Family" : "MF"
		, "Harold the Hungry Plant" : "HTHP"
		, "Lots Of Job" : "LOJ"
		, "Take Care of Your Teeth" : "TCOYT"
		, "What Families Do" : "WFD"
		, "I can Help" : "ICH"
		, "Who is Mom" : "WIM"
		, "The green tomato mystery" : "TGTM"
		, "The" : "THE"
        , "lots of fish" : "LOF"
        , "Lots of jobs" : "LOJ"
        , "Lots Of fish" : "LOF"
        , "Who is Mom?" : "WIM"
        , "The Right Teeth" : "TRT"
        , "A Pet from grandpa" : "APFG"
        , "The picnic Basket" : "TPB"
        , "BUGs" : "BUG"
        , "who is mom?" : "WIM"
        , "The right teeth" : "TRT"
        , "Felipe¿¿¿¿¿¿s Journey" : "FJ"
        , "Carla¿¿¿¿¿¿s Special Paint brush" : "CSPB"
        , "Pran¿¿¿¿¿¿s Week of Adventure" : "PWA"
        , "I¿¿¿¿¿¿m Heading to the Rodeo" : "IDR"
        , "Why Can¿¿t I Fly" : "WCIF"
        , "" : "NOTITLE",
          null : "NOTITLE"
    };

    /***************************************************************************
        Assessment-specific decodes
    ***************************************************************************/

    var gradeLevels =
        {
            "K": "KG",
            "1": "01",
            "2": "02",
            "3": "03",
            "4": "04",
            "5": "05",
            "6": "06",
            "7": "07",
            "8": "08",
            "9": "09",
            "10": "10",
            "11": "11",
            "12": "12",
            "Kindergarten": "KG",
             "" : null,
            null : null
        };

    /***********************************************************************************
        Assessment-specific mapping functions
    ***********************************************************************************/

    /**
     * Maps normalized records for given group of rows.
     *
     * @param object Signature file object.
     * @param JSON JSON object representing data path hierarchy.
     * @param array Array containing JSON objects representing raw data by physical name.
     * @returns {array} Mapped normalized records.
     */
    function mapNormalizedRecords(signature, hierarchy, rows) {
        var normalizedRecords = [];
        var year = (hierarchy.SCHOOL_YEAR).substring(0,4);
        //Base administration off of first row in grouping and convert to lookup object.
        var row = AppSignatureFieldDetails.getFieldDetailsParser(signature, rows[0]);


            var record = mapSingleNormalizedRecord(signature, hierarchy, row, year);
            AppUtil.nullSafePush(normalizedRecords, record);


        return normalizedRecords;
    }


    /**
     * Map a normalized record for given row and set of administration metadata.
     *
     * @param object Signature file object.
     * @param JSON JSON object representing data path hierarchy.
     * @param module Module representing raw data by logical name.
     * @param JSON JSON object representing administration metadata.
     * @returns {object} Mapped normalized record.
     */
    function mapSingleNormalizedRecord(signature, hierarchy, row, year) {
        var record = {};
        var mappingObject = {};

        mappingObject.SCORE_MAPPINGS = [];
        mappingObject.ADMIN_MAPPINGS = {};
        mappingObject.ASSESSMENT_METADATA = {};
        mappingObject.ASSESSMENT_METADATA.TESTS = [];
        mappingObject.ASSESSMENT_METADATA.BENCHMARKS = [];

        record = mapNormalizedAdminFields(signature, hierarchy, row, year);

         strandsAndFields.forEach(function(strandsAndField) {
            var testNumber = '';
            var bookLvl = row.getField("BOOK_LEVEL");
            var booktitle = row.getField("BOOK_TITLE");
            var currLvlSys = row.getField("CURRENT_LEVEL_SYSTEM");
            if (currLvlSys === null || currLvlSys === undefined  || _util.trim(currLvlSys) === "--" ||  _util.trim(currLvlSys) === ""){
                 testNumber = "LA_TRC_PMD" + "_" + getShortAdminPeriod(row.getField("PM_PERIOD")) + "_" + lookUpTestNumber[booktitle] + "_" + bookLvl;
            }else{
                 testNumber =  "LA_TRC_PMD" + "_" + getShortAdminPeriod(row.getField("PM_PERIOD")) + "_" + lookUpTestNumber[booktitle] + "_" + bookLvl + "_" + lookUpTestNumber[currLvlSys];
            }

            var score = row.getField("ORAL_COMPREHENSION_SCORE");
            var percentage = row.getField("ACCURACY");
            var errRatio = row.getField("ERROR_RATIO");
            var selfCorrectRatio = row.getField("SELF_CORRECT_RATIO");
            var totalProbes = row.getField("TOTAL_NUMBER_OF_PROBES");
            var perfLvl = row.getField("ASSESSMENT_MEASURE_TRC_PROFICIENCY_LEVEL");
            //var syncDate = AppUtil.getDateObjByPattern(row.getField("SYNC_DATE")).STANDARD_DATE;
            var syncDate1 = row.getField("SYNC_DATE");
            var syncDate = dateConverter(syncDate1).finalDates;


            mappingObject.SCORE_MAPPINGS.push(
                {
                    "TEST_NUMBER" : testNumber,
                    "TEST_SCALED_SCORE" : score,
                    "TEST_SCORE_VALUE" : score,
                    "TEST_SCORE_TEXT" : score,
                    "TEST_PRIMARY_RESULT" : perfLvl,
                    "TEST_SECONDARY_RESULT" : bookLvl,
                    "TEST_SCORE_ATTRIBUTES" : booktitle,
                    "TEST_PERCENTAGE_SCORE" : percentage,
                    "TEST_GROWTH_TARGET_1" : errRatio,
                    "TEST_GROWTH_TARGET_2" : selfCorrectRatio,
                    "TEST_QUATERNARY_RESULT" : syncDate
                }
            );

        });


        //Map non-normalized admin fields
        mappingObject.ADMIN_MAPPINGS = mapAdditionalAdminFields(row);

        // System Fields
        record.ASSESSMENT_JSON_MAPPINGS = JSON.stringify(mappingObject);
        record.LINEAGE_SOURCE = _thisLineageSource;
        record.LINEAGE_SIGNATURE = signature.getFormat().getFormatName();
        record.LINEAGE_FILE = row.getRawField("LINEAGE_FILE");
        record.LINEAGE_LINE = row.getRawField("LINEAGE_LINE");

        return record;
    }



    /***********************************************************************************
        Assessment-specific administration functions
    ***********************************************************************************/


    /**
     * Maps normalized administration fields based on a given set of administration metadata.
     *
     * @param JSON JSON object representing data path hierarchy.
     * @param object JavaScript object representing a normalized row mapping.
     * @param module Module representing raw data by logical name.
     * @param JSON JSON object representing administration metadata.
     * @returns {object} JavaScript object representing a normalized row mapping.
     */


     function dateConverter(dateString) {
              var dateParts, dateObj, year, month, day;
              // Check for the presence of time and strip it out for initial processing
              var timeIndex = dateString.indexOf(" ");
              if (timeIndex !== -1) {
                dateString = dateString.split(" ")[0];
              }
              // Replace dashes with slashes for consistent processing
              dateString = dateString.replace(/-/g, '/');
              // Handle YYYY/MM/DD or YYYY/DD/MM
              if (dateString.match(/^\d{4}\/\d{2}\/\d{2}$/)) {
                dateParts = dateString.split('/');
                if (dateParts[1] > 12) { // It's in YYYY/DD/MM format
                    dateString = dateParts[0] + '/' + dateParts[2] + '/' + dateParts[1];
                }
              }
              // Handle DD/MM/YYYY
              else if (dateString.match(/^\d{2}\/\d{2}\/\d{4}$/)) {
                dateParts = dateString.split('/');
                if (parseInt(dateParts[0], 10) > 12) {
                    dateString = dateParts[1] + '/' + dateParts[0] + '/' + dateParts[2];
                }
              }
              dateObj = new Date(dateString);
              month = ('0' + (dateObj.getMonth() + 1)).slice(-2);
              day = ('0' + dateObj.getDate()).slice(-2);
              year = dateObj.getFullYear();
              var finalDate =  month + '/' + day + '/' + year;
              return { finalDates: finalDate, months: month, days: day, years: year };
           }


    function mapNormalizedAdminFields(signature, hierarchy, row, year) {

       var record = {};
               var normalizedFileFields = AppUtil.getStandardNormalizedFileFields();
               var birthDateField = row.getField("DATE_OF_BIRTH");
//               var birthDateObject = {
//                           RAW_DATE : null
//                           , MONTH : null
//                           , DAY : null
//                           , YEAR : null
//                           , STANDARD_DATE : null
//                       }
//                       var birthDate = row.getField("DATE_OF_BIRTH");
//                       if(birthDate !== null && birthDate !== undefined && birthDate !== "") {
//                           birthDateObject = AppUtil.getMonthFollowedByDay(birthDate);
//                       }
               var birthDateObject = {
                                         RAW_DATE : null
                                         , MONTH : null
                                         , DAY : null
                                         , YEAR : null
                                         , STANDARD_DATE : null
                                     };
//
                if (birthDateField !== null && birthDateField !== "" && birthDateField !== undefined){
                   if (birthDateField.indexOf("-") >= 4){
                       birthDateObject = AppUtil.getDateObjByPattern(birthDateField, "yyyy-MM-dd");
                   } else {
                       birthDateObject = AppUtil.getDateObjByPattern(birthDateField, "MM/dd/yyyy");
                   }
                } else {
                   birthDateObject;
                }

                 var testDateField = row.getField("CLIENT_DATE");
                 var testDateObject = {
                                                   RAW_DATE : null
                                                   , MONTH : null
                                                   , DAY : null
                                                   , YEAR : null
                                                   , STANDARD_DATE : null
                                              };
                        testDateObject.STANDARD_DATE = dateConverter(testDateField).finalDates;

        //Loop through normalized fields and map if possible.
        normalizedFileFields.forEach(function (field) {
            switch(field) {
                case "ASSESSMENT_ADMIN_KEY":
                    record.ASSESSMENT_ADMIN_KEY = generateAssessmentAdminKey(signature, hierarchy, row);
                    break;
                case "SYS_PARTITION_VALUE":
                    record.SYS_PARTITION_VALUE = _util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE);
                    break;
                case "TENANT_CODE":
                    record.TENANT_CODE = AssessmentLoader.config.TENANT_CODE;
                    break;
                case "DISTRICT_CODE":
                    record.DISTRICT_CODE = AssessmentLoader.config.DISTRICT_CODE;
                    break;
                case "SCHOOL_YEAR":
                    record.SCHOOL_YEAR = hierarchy.SCHOOL_YEAR;
                    break;
                case "REPORTING_PERIOD":
                    record.REPORTING_PERIOD = getTEST_ADMIN_PERIOD(row.getField("PM_PERIOD"));
                    break;
                case "ASSESSMENT_VENDOR":
                    record.ASSESSMENT_VENDOR = hierarchy.ASSESSMENT_VENDOR;
                    break;
                case "ASSESSMENT_PRODUCT":
                    record.ASSESSMENT_PRODUCT = hierarchy.ASSESSMENT_PRODUCT;
                    break;
                case "TEST_ADMIN_DATE":
                    record.TEST_ADMIN_DATE = _util.coalesce(testDateObject.STANDARD_DATE, null);
                    break;
                case "STUDENT_DOB_MONTH":
                    record.STUDENT_DOB_MONTH = birthDateObject.MONTH;
                    break;
                case "STUDENT_DOB_DAY":
                    record.STUDENT_DOB_DAY = birthDateObject.DAY;
                    break;
                case "STUDENT_DOB_YEAR":
                    record.STUDENT_DOB_YEAR = birthDateObject.YEAR;
                    break;
                case "STUDENT_LOCAL_ID":
                    record.STUDENT_LOCAL_ID = _util.coalesce(row.getField("STUDENT_PRIMARY_ID"));
                    break;
                case "STUDENT_STATE_ID":
                    record.STUDENT_STATE_ID = _util.coalesce(
                        row.getField("STUDENT_PRIMARY_ID")
                    );
                    break;
                case "STUDENT_VENDOR_ID":
                    record.STUDENT_VENDOR_ID = _util.coalesce(
                        row.getField("STUDENT_PRIMARY_ID")
                    );
                    break;
                case "STUDENT_FIRST_NAME":
                    record.STUDENT_FIRST_NAME = _util.coalesce(row.getField("STUDENT_FIRST_NAME"));
                    break;
                case "STUDENT_MIDDLE_NAME":
                    record.STUDENT_MIDDLE_NAME= _util.coalesce(row.getField("STUDENT_MIDDLE_NAME"));
                    break;
                case "STUDENT_LAST_NAME":
                    record.STUDENT_LAST_NAME = _util.coalesce(row.getField("STUDENT_LAST_NAME"));
                    break;
                case "STUDENT_STREET_ADDRESS":
                    record.STUDENT_STREET_ADDRESS = null;
                    break;
                case "STUDENT_STATE_CODE":
                    record.STUDENT_STATE_CODE = null;
                    break;
                case "STUDENT_POSTAL_CODE":
                    record.STUDENT_POSTAL_CODE = null;
                    break;
                case "STUDENT_GENDER_CODE":
                    record.STUDENT_GENDER_CODE = _util.coalesce(row.getField("GENDER"));
                    break;
                case "STUDENT_GRADE_CODE":
                    record.STUDENT_GRADE_CODE = gradeLevels[_util.coalesce(row.getField("GRADE"))];
                    break;
                case "TEST_LOCATION":
                    record.TEST_LOCATION = null;
                    break;
                case "SCHOOL_NAME":
                    record.SCHOOL_NAME = _util.coalesce(row.getField("SCHOOL_NAME"));
                    break;
                case "SCHOOL_LOCAL_ID":
                    record.SCHOOL_LOCAL_ID = _util.coalesce(row.getField("PRIMARY_SCHOOL_ID"));
                    break;
                case "SCHOOL_VENDOR_ID":
                    record.SCHOOL_VENDOR_ID = _util.coalesce(row.getField("SCHOOL_NAME"));
                    break;
                default:
                    record[field] = row.getField(field);
                    break;
            }
        });

        return record;
    }

    /**
     * Maps additional administration fields based on a given set of administration metadata.
     *
     * @param object JavaScript object representing a normalized row mapping.
     * @param module Module representing raw data by logical name.
     * @param JSON JSON object representing administration metadata.
     * @returns {object} JavaScript object containing administration row mappings.
     */
    function mapAdditionalAdminFields(row) {
        var admin = {};

        return admin;
    }

    function getTEST_ADMIN_PERIOD(assessPeriod) {

        var period = null;
        switch (assessPeriod) {
            case "BOY->MOY":
                period = "FALL";
                break;
            case "MOY->EOY":
                period = "WINTER";
                break;
            case "After EOY":
                period = "SPRING";
                break;
        }

        return period;
    }

    function getShortAdminPeriod(assessPeriod) {

        var period = null;
        switch (assessPeriod) {
            case "BOY->MOY":
                period = "BEG";
                break;
            case "MOY->EOY":
                period = "MID";
                break;
            case "After EOY":
                period = "END";
                break;
        }

        return period;
    }

   function getTEST_ADMIN_DATE_STR(assessPeriod, year) {
        var date = null;

        switch (assessPeriod) {

            case "BOY->MOY":
                date = "10/15/${year}";
                break;
            case "MOY->EOY":
                year = parseInt(year) + 1;
                date = "01/15/${year}";
                break;
            case  "After EOY":
                year = parseInt(year) + 1;
                date = "04/15/${year}";
            break;
     }
        return date;
    }

    /***********************************************************************************
        Assessment-specific score functions
    ***********************************************************************************/



    /***************************************************************************
        Utility Functions
    ***************************************************************************/

    function groupAssessmentByNaturalKey(signature, hierarchy, one, two) {

        try {

           var assessmentAdminKey_one = generateAssessmentAdminKey(signature, hierarchy, one);
           var assessmentAdminKey_two = generateAssessmentAdminKey(signature, hierarchy, two);

           if(assessmentAdminKey_one === assessmentAdminKey_two) {
               return 1;
           } else {
               return -1;
           }

       } catch (exception) {
           throw "${_thisModuleName}.groupAssessmentByNaturalKey Exception: ${exception}";
       }

    }


    function generateAssessmentAdminKey(signature, hierarchy, srcRecord) {

        var assessmentAdminKey = null;
        var booktitle = lookUpTestNumber[srcRecord.getField("BOOK_TITLE")];
         var clientDate =  srcRecord.getField("CLIENT_DATE");

                clientDate = dateConverter(clientDate).finalDates;
        //var clientDate = AppUtil.getDateObjByPattern(srcRecord.getField("CLIENT_DATE")).STANDARD_DATE;

        // Set base assessment admin key information
        assessmentAdminKey = "${_assessmentIdentifier}_${_util.coalesce(AssessmentLoader.config.SYS_PARTITION_VALUE, AssessmentLoader.config.TENANT_CODE)}_${AssessmentLoader.config.DISTRICT_CODE}_" + getTEST_ADMIN_PERIOD(srcRecord.getField("PM_PERIOD"));
        assessmentAdminKey = assessmentAdminKey + "_" + booktitle + "_" + clientDate;


        //Add natural key fields
        signature.getFormat().getNaturalKey().forEach(function(key) {
            assessmentAdminKey = assessmentAdminKey + "_" + _util.coalesce(srcRecord.getField(key),"");
        });


        return assessmentAdminKey;

    }

    /*******************************************
        End of module.  Return module object.
    *******************************************/
    return module;
}());