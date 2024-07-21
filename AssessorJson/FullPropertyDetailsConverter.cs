using Newtonsoft.Json;
using NLog;
using NLog.Config;
using NLog.Targets;
using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Configuration;
using System.Data.Common;
using System.Data.Entity.Core.EntityClient;
using System.Data.Entity.Core.Metadata.Edm;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Dynamic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Security;
using System.Security.AccessControl;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading;
using System.Threading.Tasks;

namespace AssessorJson
{
    public class FullPropertyDetailsConverter
    {
        /// <summary>
        /// TODO: Move all configs into app.config
        /// TODO: Update logger and NLog config, add some flair!
        /// TODO: Distill functionality - simple is faster
        /// TODO: Add notifications for errors and successes - RSS?
        /// TODO: Separate concerns - don't depend on all paths to sum a success
        /// TODO: 
        /// </summary>
        #region properties
        private Logger log = null;
        private const string DIR_DETAIL = @"\detail";
        private const string DIR_NOV = @"\nov";
        private const string DIR_NOD = @"\nod";
        private const string FILE_META = @"\meta.json";

        private const Formatting JSON_FORMAT_DEFAULT = Formatting.None; // Used for nearly all generated json files
        private const Formatting JSON_FORMAT_META = Formatting.Indented;  // Used specifically for meta.json (indent for human readability)

        // Data Output Directories        
        private string liveDir;
        private string metaPath;
        private string newDir;
        private string prevDir;
        private string oldDir;
        private string baseDir;
        private string novYears;
        private string nodYears;
        private string detailYear;

        private long elapsedTotal = 0;
        private long elapsedAccount = 0;
        private long elapsedNov = 0;

        private int totalAccountsProcessed = 0;
        private int totalNovProcessed = 0;
        private int totalPersonalProperty = 0;
        private int totalNodProcessed = 0;

        private bool RunDetailJson = true;

        private Entities entities;
        //JsonConverterConfig _CONFIG;
        #endregion

        private static JsonSerializerSettings jsonSerializerSettings = new JsonSerializerSettings
        {
            ReferenceLoopHandling = ReferenceLoopHandling.Ignore
        };

        public FullPropertyDetailsConverter(string dtsConnectionString, string baseDir, string detailYear, string novYears, string nodYears, string RunDetailsJSON)
        {
            bool outBool;
            this.RunDetailJson = bool.TryParse(RunDetailsJSON, out outBool) ?
                    bool.Parse(RunDetailsJSON) :
                    true;

            //JsonConverterConfig _CONFIG = new JsonConverterConfig(
            //		 runJSON, baseDir, novYears, true, null, true, null, true
            //		);
            //Debug.WriteLine(JsonConvert.SerializeObject(_CONFIG));


            initLogging(baseDir);

            this.novYears = novYears;
            this.detailYear = detailYear;

            log.Info("FullPropertyDetailsConverter(" + dtsConnectionString + ", " + baseDir + "): Constructor Entry.");

            entities = DbHelper.initEntities(dtsConnectionString);
            prepDirectories(baseDir);
        }

        public static void Main(string[] args)
        {
            // Example Usage
            string DEFAULT_CONNECTION_STRING = ConfigurationManager.ConnectionStrings["defaultConnection"].ConnectionString;
            string TEST_OUTPUT_DIR = ConfigurationManager.AppSettings["outputDirectory"];
            string novYears = ConfigurationManager.AppSettings["novYears"];
            string detailYear = ConfigurationManager.AppSettings["detailYear"];
            string nodYears = ConfigurationManager.AppSettings["nodYears"];
            string RunDetailsJSON = ConfigurationManager.AppSettings["RunDetailsJSON"];


            FullPropertyDetailsConverter converter = new FullPropertyDetailsConverter(DEFAULT_CONNECTION_STRING, TEST_OUTPUT_DIR, detailYear, novYears, nodYears, RunDetailsJSON);

            converter.convertAll();
            ////NEW HOTNESS
            //converter.Invade(5000, 0, DEFAULT_CONNECTION_STRING).Wait();


        }

        private void initLogging(string baseDir)
        {
            createDir(baseDir, baseDir); // If not already there

            string version = MetaHelper.getVersion();

            // Remove any previous log file(s)
            foreach (var logFile in Directory.EnumerateFiles(baseDir, "log-*.txt"))
            {
                if (File.Exists(logFile))
                {
                    File.Delete(logFile);
                }
            }

            var config = new LoggingConfiguration();
            var consoleTarget = new ColoredConsoleTarget();
            config.AddTarget("console", consoleTarget);

            var fileTarget = new FileTarget();
            config.AddTarget("file", fileTarget);

            string outputLayout = @"${date:format=HH\:mm\:ss} ${logger} ${level} - ${message}";
            consoleTarget.Layout = outputLayout;
            fileTarget.Layout = outputLayout;
            fileTarget.FileName = baseDir + @"\log-" + version + ".txt";

            var rule1 = new LoggingRule("*", LogLevel.Info, consoleTarget);
            config.LoggingRules.Add(rule1);

            var rule2 = new LoggingRule("*", LogLevel.Debug, fileTarget);
            config.LoggingRules.Add(rule2);

            LogManager.Configuration = config;

            log = LogManager.GetLogger("FullPropertyDetailsConverter");
            log.Info("Logging Initialized for version '" + version + "'");
        }


        private Boolean createDir(string dir, string baseDir)
        {
            Boolean dirExists = Directory.Exists(dir);

            if (!dirExists)
            {
                /*Create dir and make sure parent rules are applied*/
                //var parentDir = new DirectoryInfo(baseDir);
                //var parentAc = parentDir.GetAccessControl();
                //var explicitRules = parentAc.GetAccessRules(includeExplicit: true, includeInherited: true,
                //		targetType: typeof(System.Security.Principal.NTAccount));
                //var implicitRules = parentAc.GetAccessRules(includeExplicit: true, includeInherited: true,
                //		targetType: typeof(System.Security.Principal.NTAccount));

                //DirectoryInfo di = new DirectoryInfo(baseDir);
                //var ac = di.GetAccessControl();
                //var newRule = new FileSystemAccessRule(
                //		new System.Security.Principal.NTAccount("Everyone"),
                //		FileSystemRights.FullControl,
                //		AccessControlType.Allow
                //);
                //ac.AddAccessRule(newRule);

                //foreach (FileSystemAccessRule rule in implicitRules)
                //{
                //		ac.AddAccessRule(rule);
                //}
                //foreach (FileSystemAccessRule rule in explicitRules)
                //{
                //		ac.AddAccessRule(rule);
                //}


                //Directory.CreateDirectory(dir, ac);

                Directory.CreateDirectory(dir);
            }

            File.SetAttributes(dir, FileAttributes.Normal);

            return !dirExists;
        }

        public void prepDirectories(string baseDir)
        {
            log.Debug("prepDirectories(" + baseDir + ")");

            createDir(baseDir, baseDir);

            log.Info("Created base directory - setting up subdirectories");

            // Setup yearly account directories 
            foreach (var taxYear in getTaxYears())
            {
                var yearDir = baseDir + @"\" + taxYear;

                createDir(yearDir, baseDir);
                createDir(yearDir + DIR_DETAIL, baseDir);
                createDir(yearDir + DIR_NOV, baseDir);
                createDir(yearDir + DIR_NOD, baseDir);

            }

            // Setup live / current year directory
            string year = this.detailYear ?? DateTime.Now.Year.ToString();

            this.baseDir = baseDir;
            liveDir = baseDir + @"\" + year;

            metaPath = baseDir + FILE_META;

            newDir = liveDir + "_new";
            prevDir = liveDir + "_prev";
            oldDir = liveDir + "_old";

            // Delete these in case they were left behind in the last run
            deleteDir(oldDir);
            deleteDir(newDir);

            createDir(newDir, baseDir);
            createDir(newDir + DIR_DETAIL, baseDir);
            createDir(newDir + DIR_NOV, baseDir);
            createDir(newDir + DIR_NOD, baseDir);

            createDir(liveDir, baseDir);

            //// Remove previous meta.json
            //if (File.Exists(metaPath))
            //{
            //		File.Delete(metaPath);
            //}
        }

        public object getMetaPath()
        {
            return metaPath;
        }

        public string getLiveDir()
        {
            return liveDir;
        }

        public string getPrevDir()
        {
            return prevDir;
        }

        public string getNewDir()
        {
            return newDir;
        }

        public string getOldDir()
        {
            return oldDir;
        }

        public string convertAll()
        {
            return convertAll(-1);
        }

        public string convertAll(int maxResults)
        {
            log.Debug("convertAll(" + maxResults + "): Entry");

            elapsedTotal = MetaHelper.getTimeInMillis();
            try
            {

                // Accounts
                if (RunDetailJson && detailYear != "")
                {
                    log.Info("Converting accounts");
                    if (maxResults < 1)
                    {
                        convertAccounts();
                    }
                    else
                    {
                        convertAccounts(maxResults / 2, 2);
                    }
                }
                else
                {
                    if (detailYear == "") { log.Info("Details skipped because detailYear was {0}.", detailYear); }
                    if (RunDetailJson == false) { log.Info("Details skipped because RunDetailJson was set to {0}.", RunDetailJson); }
                }
            }
            catch (Exception ex)
            {
                log.Error("ERROR PRODUCING DETAILS JSON: {0}", ex.Message);
            }

            try
            {

                // Accounts
                if (this.novYears.Split(new char[] { '-' })[0] != "")
                {
                    log.Info("Converting NOV");
                    if (maxResults < 1)
                    {
                        convertNov();
                    }
                    else
                    {
                        convertNov(maxResults);
                    }
                }
                else
                {
                    log.Info("NOV skipped because novYears was set to {0}.", novYears);
                }
            }
            catch (Exception ex)
            {
                log.Error("ERROR PRODUCING NOV JSON: {0}:{1}", ex.Message, ex.StackTrace);
            }

            elapsedTotal = MetaHelper.getTimeInMillis() - elapsedTotal;
            var metaJson = "";
            // Meta JSON
            log.Info("Converting Meta / ETL Parameters");
            try
            {
                metaJson = getMetaAsJson();
                File.WriteAllText(metaPath, metaJson);


                // Finalizing directories after run
                log.Info("Finalizing directories after run");

                finalizeDirectories();

                log.Info("Process Complete.");

                // TODO: Determine purpose for return value - using for debugging for now

            }
            catch (Exception error) {
                log.Info(error);
            }

            return metaJson;
        }
        public void finalizeDirectories()
        {
            log.Info("liveDir: " + liveDir);
            log.Info("newDir: " + newDir);
            log.Info("prevDir: " + prevDir);
            log.Info("oldDir: " + oldDir);

            try
            {
                log.Info("Examining prevDir (" + prevDir + ")");
                if (Directory.Exists(prevDir))
                {
                    log.Info("prevDir (" + prevDir + ") exists.");

                    log.Info("Moving " + prevDir + "to " + oldDir + "...");
                    Directory.Move(prevDir, oldDir);
                    while (Directory.Exists(prevDir))
                    {
                        log.Info("prevDir still there...");
                        Thread.Sleep(1000);
                    }
                    log.Info(prevDir + " moved successfully.");

                    log.Info("Deleting " + oldDir + ".");
                    deleteDir(oldDir);
                    while (Directory.Exists(oldDir))
                    {
                        log.Info("oldDir still there...");
                        Thread.Sleep(1000);
                    }
                    log.Info(oldDir + " deleted successfully.");
                }
                else
                {
                    log.Info("prevDir (" + prevDir + ") doesn't exist.");
                }

                /*Surgically move foldders...*/

                if (totalAccountsProcessed > 0)
                {
                    /*
                     * -liveDir: E:\ASSESSOR_ODS2\TestOutput\2017
                     * -newDir: E:\ASSESSOR_ODS2\TestOutput\2017_new
                     * -prevDir: E:\ASSESSOR_ODS2\TestOutput\2017_prev
                     * -oldDir: E:\ASSESSOR_ODS2\TestOutput\2017_old
                    */
                    string _tmpLiveDir = liveDir + @"\detail";
                    string _tmpPrevDir = prevDir + @"\detail";
                    string _tmpNewDir = newDir + @"\detail";
                    string _tmpOldDir = oldDir + @"\detail";
                    if (Directory.Exists(_tmpPrevDir))
                    {
                        log.Info("Moving " + _tmpPrevDir + " to " + _tmpOldDir + "...");
                        Directory.Move(_tmpPrevDir, _tmpOldDir);
                        while (Directory.Exists(_tmpLiveDir))
                        {
                            log.Info("prevDir still there...");
                            Thread.Sleep(1000);
                        }
                        log.Info("Moved " + _tmpPrevDir + " to " + _tmpOldDir + " successfully.");

                    }
                    else
                    {
                        createDir(prevDir, "");
                    }

                    if (Directory.Exists(_tmpPrevDir))
                    {
                        log.Info("Cleaning " + _tmpPrevDir + " to receive " + _tmpLiveDir + "...");
                        Directory.Delete(_tmpPrevDir, true);
                    }

                    log.Info("Moving " + _tmpLiveDir + " to " + _tmpPrevDir + "...");
                    Directory.Move(_tmpLiveDir, _tmpPrevDir);
                    while (Directory.Exists(_tmpLiveDir))
                    {
                        log.Info("liveDir still there...");
                        Thread.Sleep(1000);
                    }
                    log.Info("Moved " + _tmpLiveDir + " to " + _tmpPrevDir + " successfully.");

                    log.Info("Moving " + _tmpNewDir + " to " + _tmpLiveDir + "...");
                    Directory.Move(_tmpNewDir, _tmpLiveDir);
                    while (Directory.Exists(_tmpNewDir))
                    {
                        log.Info("newDir still there...");
                        Thread.Sleep(1000);
                    }
                    log.Info("Moved " + _tmpNewDir + " to " + _tmpLiveDir + " successfully.");
                }

                if (totalNovProcessed > 0)
                {
                    /*
                     * -liveDir: E:\ASSESSOR_ODS2\TestOutput\2017
                     * -newDir: E:\ASSESSOR_ODS2\TestOutput\2017_new
                     * -prevDir: E:\ASSESSOR_ODS2\TestOutput\2017_prev
                     * -oldDir: E:\ASSESSOR_ODS2\TestOutput\2017_old
                    */
                    string _tmpLiveDir = liveDir + @"\nov";
                    string _tmpPrevDir = prevDir + @"\nov";
                    string _tmpNewDir = newDir + @"\nov";
                    string _tmpOldDir = oldDir + @"\nov";
                    if (Directory.Exists(_tmpPrevDir))
                    {
                        log.Info("Moving " + _tmpPrevDir + " to " + _tmpOldDir + "...");
                        Directory.Move(_tmpPrevDir, _tmpOldDir);
                        while (Directory.Exists(_tmpLiveDir))
                        {
                            log.Info("prevDir still there...");
                            Thread.Sleep(1000);
                        }
                        log.Info("Moved " + _tmpPrevDir + " to " + _tmpOldDir + " successfully.");
                    }
                    else
                    {
                        createDir(_tmpPrevDir, "");
                    }

                    if (Directory.Exists(_tmpPrevDir))
                    {
                        log.Info("Cleaning " + _tmpPrevDir + " to receive " + _tmpLiveDir + "...");
                        Directory.Delete(_tmpPrevDir, true);
                    }

                    log.Info("Moving " + _tmpLiveDir + " to " + _tmpPrevDir + "...");
                    Directory.Move(_tmpLiveDir, _tmpPrevDir);
                    while (Directory.Exists(_tmpLiveDir))
                    {
                        log.Info("liveDir still there...");
                        Thread.Sleep(1000);
                    }
                    log.Info("Moved " + _tmpLiveDir + " to " + _tmpPrevDir + " successfully.");

                    log.Info("Moving " + _tmpNewDir + " to " + _tmpLiveDir + "...");
                    Directory.Move(_tmpNewDir, _tmpLiveDir);
                    while (Directory.Exists(_tmpNewDir))
                    {
                        log.Info("newDir still there...");
                        Thread.Sleep(1000);
                    }
                    log.Info("Moved " + _tmpNewDir + " to " + _tmpLiveDir + " successfully.");
                }

                if (totalNodProcessed > 0)
                {
                    /*
                     * 12:06:14 FullPropertyDetailsConverter Info -liveDir: E:\ASSESSOR_ODS2\TestOutput\2017
                     * 12:06:14 FullPropertyDetailsConverter Info -newDir: E:\ASSESSOR_ODS2\TestOutput\2017_new
                     * 12:06:14 FullPropertyDetailsConverter Info -prevDir: E:\ASSESSOR_ODS2\TestOutput\2017_prev
                     * 12:06:14 FullPropertyDetailsConverter Info -oldDir: E:\ASSESSOR_ODS2\TestOutput\2017_old
                    */

                    string _tmpLiveDir = liveDir + @"\nod";
                    string _tmpPrevDir = prevDir + @"\nod";
                    string _tmpNewDir = newDir + @"\nod";
                    string _tmpOldDir = oldDir + @"\nod";
                    if (Directory.Exists(_tmpPrevDir))
                    {
                        log.Info("Moving " + _tmpPrevDir + " to " + _tmpOldDir + "...");
                        Directory.Move(_tmpPrevDir, _tmpOldDir);
                        while (Directory.Exists(_tmpLiveDir))
                        {
                            log.Info("prevDir still there...");
                            Thread.Sleep(1000);
                        }
                        log.Info("Moved " + _tmpPrevDir + " to " + _tmpOldDir + " successfully.");
                    }
                    else
                    {
                        createDir(_tmpPrevDir, "");
                    }

                    log.Info("Moving " + _tmpLiveDir + " to " + _tmpPrevDir + "...");
                    Directory.Move(_tmpLiveDir, _tmpPrevDir);
                    while (Directory.Exists(_tmpLiveDir))
                    {
                        log.Info("liveDir still there...");
                        Thread.Sleep(1000);
                    }
                    log.Info("Moved " + _tmpLiveDir + " to " + _tmpPrevDir + " successfully.");

                    log.Info("Moving " + _tmpNewDir + " to " + _tmpLiveDir + "...");
                    Directory.Move(_tmpNewDir, _tmpLiveDir);
                    while (Directory.Exists(_tmpNewDir))
                    {
                        log.Info("newDir still there...");
                        Thread.Sleep(1000);
                    }
                    log.Info("Moved " + _tmpNewDir + " to " + _tmpLiveDir + " successfully.");
                }
                log.Info("newDir still there...");
                Directory.Delete(newDir, true);
            }
            catch (DirectoryNotFoundException dnf)
            {
                log.Error(dnf.Message + " _ " + dnf.StackTrace);
            }
            catch (ArgumentNullException argNull)
            {
                log.Error(argNull.Message + " _ " + argNull.StackTrace);
            }
            catch (ArgumentException arg)
            {
                log.Error(arg.Message + " _ " + arg.StackTrace);
            }
            catch (IOException io)
            {
                log.Error(io.Message + " _ " + io.StackTrace);
            }
            catch (SecurityException sec)
            {
                log.Error(sec.Message + " _ " + sec.StackTrace);
            }
            catch (Exception ex)
            {
                log.Error("!!! finalizeDirectories error: " + ex.Message);
            }
        }

        public string convertAccounts()
        {
            return convertAccounts(5000, -1);
        }

        public async Task Invade(int resultPageSize, int maxResultPages, string connStr)
        {
            Stopwatch _sw = new Stopwatch();
            _sw.Start();
            log.Info("Invading......{0}:{1}:{2}:{3}", _sw.Elapsed.Hours, _sw.Elapsed.Minutes, _sw.Elapsed.Seconds, _sw.Elapsed.Milliseconds);

            int recordCount = entities.accounts.Select(a => a).Count();
            int skip = 0;
            List<Task> _Tak = new List<Task>();
            while (skip < 30000)
            {
                var t = QueryAccountsAsync(skip, resultPageSize, connStr);
                _Tak.Add(t);
                skip += resultPageSize;
            }
            await Task.WhenAll(_Tak);
            _sw.Stop();
            log.Info("Invasion complete...{0}:{1}:{2}:{3}", _sw.Elapsed.Hours, _sw.Elapsed.Minutes, _sw.Elapsed.Seconds, _sw.Elapsed.Milliseconds);


        }

        public async Task QueryAccountsAsync(int skip, int take, string connStr)
        {
            var t = Task.Run(() =>
            {
                convertAccount(skip, take, connStr);
            });
            await t;
        }

        public List<dynamic> convertAccount(int skip, int take, string connStr)
        {
            Stopwatch _sw = new Stopwatch();
            _sw.Start();
            Entities entities = DbHelper.initEntities(connStr);

            #region LINQ Query
            List<dynamic> accounts = entities.accounts
                .OrderBy(a => a.rowhash)
                .Skip(skip)
                .Take(take)
                .Select(a => new
                {
                    appeals = a.appeal_account.Where(apps => apps.ACCOUNT_NO == a.account_no)
                    .Where(t => t.TAX_YEAR >= 2016)
                    .Select(app =>
                        new Appeal()
                        {
                            accountNo = app.ACCOUNT_NO,
                            appealNo = (int)app.APPEAL_NO,
                            decision = app.APPEAL_DECISION,
                            reason = app.APPEAL_ACCT_REASON_DESC,
                            taxYear = (int)app.TAX_YEAR
                        }),
                    accountNumber = a.account_no,
                    accountType = a.account_type,
                    appraisalType = a.appraisal_type,
                    stateParcelNumber = a.state_parcel_no,
                    legalDescription = a.legal_description,
                    taxDistrictNumber = a.tax_district.tax_district_no,
                    zoningCode = a.real_account.zoning_code,
                    zoningCodeDescription = a.real_account.zoning_code_description,
                    defaultLea = a.real_account.default_lea,
                    defaultLeaDescription = a.real_account.default_lea_description,
                    totalImprovementInterestPercent = a.real_account.total_improvement_interest_percent,
                    totalLandInterestPercent = a.real_account.total_land_interest_percent,
                    isVacant = (Boolean?)a.real_account.vacant_flag,
                    isImprovementOnly = (Boolean?)a.real_account.improvement_only_flag,
                    isTif = (Boolean?)a.real_account.tif_flag,
                    isPlatted = (Boolean?)a.real_account.platted_flag,
                    numberOfBuildings = a.real_account.no_of_buildings,
                    neighborhoods = a.account_neighborhood.Select(an => new
                    {
                        code = an.neighborhood_code,
                        extension = an.neighborhood_extension
                    }),
                    notifications = a.account_notification.Select(n => new
                    {
                        id = n.noteid,
                        note = n.note
                    }),
                    latitude = a.latitude_y,
                    longitude = a.longitude_x,
                    elevation = a.elevation_z,
                    quartersection = a.qtr,
                    section = a.section,
                    township = a.township,
                    range = a.range,
                    subdivision = new
                    {
                        name = a.sub_filing.subdivision_name,
                        filingNumber = a.sub_filing.filing_no,
                        recordingNumber = a.sub_filing.sub_filing_recording_no
                    },
                    isPrivate = a.account_owner_address.FirstOrDefault().private_flag,
                    owners = a.account_owner_address.Select(aoa => new
                    {
                        isPrimary = aoa.primary_owner_flag,
                        name = aoa.owner_name,
                        mailingAddress = new
                        {
                            street = aoa.address_line_1,
                            street2 = aoa.address_line_2,
                            city = aoa.city_name,
                            state = aoa.state,
                            zipCode = aoa.zip_code
                        }
                    }),
                    addresses = a.account_property_address.Select(apa => new
                    {
                        isPrimary = apa.primary_address_flag,
                        street = apa.concatenated_property_address,
                        city = apa.city_name,
                        zipCode = apa.location_zip_code
                    }),
                    taxAuthorities = a.tax_district.tax_district_authority.Select(tda => new
                    {
                        id = tda.tax_authority.tax_authority_no,
                        name = tda.tax_authority.tax_authority_name,
                        pointOfContact = tda.tax_authority.contact_person,
                        contactPhone = tda.tax_authority.contact_phone,
                        street = tda.tax_authority.contact_address_line_1,
                        street2 = tda.tax_authority.contact_address_line_2,
                        city = tda.tax_authority.contact_city_name,
                        zipCode = tda.tax_authority.contact_zip_code,
                        funds = tda.tax_authority.tax_authority_fund.Select(taf => new
                        {
                            description = taf.tax_fund_description,
                            millLevy = taf.assessed_mill_levy
                        })
                    }),
                    valuesByAbstractCode = a.value_from_tsgvacctabstvalue.Select(av => new
                    {
                        taxYear = av.tax_year,
                        abstractCode = av.valuation_class_code,
                        abstractCodeDescription = av.valuation_class_code_description,
                        netAcres = av.net_acres,
                        actualValue = av.actual_value,
                        assessedValue = av.raw_assessed_value,
                        millLevy = av.mill_levy,
                        taxDollars = av.raw_tax_dollars,
                        assessmentRate = av.assessment_rate
                    }),
                    sales = a.sale_account.Select(sa => new
                    {
                        recordingNumber = sa.sale.recording_no,
                        grantor = sa.sale.grantor,
                        grantee = sa.sale.grantee,
                        date = sa.sale.sale_date,
                        price = sa.sale.sale_price,
                        deedType = sa.sale.deed_code_description,
                        book = sa.sale.book,
                        page = sa.sale.page,
                        isValid1 = sa.sale.valid1_flag,
                        isImproved = sa.sale.improved_flag
                    }),
                    buildings = a.improvements.Select(i => new
                    {
                        buildingNumber = i.improvement_no,
                        propertyType = i.property_type,
                        completedPercent = i.completed_percent,
                        quality = i.improvement_quality,
                        perimeter = i.improvement_perimeter,
                        squareFeet = i.improvement_sf,
                        netSquareFeet = i.improvement_net_sf,
                        isPrimary = i.primary_flag,
                        unitType = i.improvement_unit_type,
                        approachType = i.approach_type,
                        conditionType = i.condition_type,
                        details = i.improvement_detail.Select(id => new
                        {
                            type = id.improvement_detail_type,
                            subtype = id.improvement_detail_type_description,
                            unitCount = id.detail_unit_count,
                            builtYear = id.detail_built_year,
                            addonCode = id.addon_code,
                            addonCodeDescription = id.addon_code_description
                        }),
                        uses = i.improvement_occupancy.Select(io => new
                        {
                            useCode = io.occupancy_code,
                            useCodeDescription = io.occupancy_code_description,
                            usePercentage = io.occupancy_percent,
                            abstractCode = io.abstract_code,
                            abstractCodeDescription = io.abstract_code_description,
                            abstractValue = io.abstract_value,
                            isPrimary = io.primary_flag
                        }),
                        styles = i.improvement_built_as.Select(iba => new
                        {
                            styleCode = iba.built_as_code,
                            styleCodeDescription = iba.built_as_code_description,
                            builtYear = iba.built_year,
                            squareFeet = iba.built_as_sf,
                            abstractCode = iba.class_code,
                            abstractCodeDescription = iba.class_code_description,
                            bedroomCount = iba.bedroom_count,
                            bathroomCount = iba.bathroom_count,
                            effectiveAge = iba.effective_age,
                            exteriorConstructionType = iba.exterior_construction_type,
                            floorMaterialType = iba.floor_material_type,
                            heatType = iba.heat_type,
                            hvacPercent = iba.hvac_percent,
                            interiorFinishType = iba.interior_finish_type,
                            numberOfStories = iba.no_of_story,
                            remodeledPercent = iba.remodeled_percent,
                            remodeledYear = iba.remodeled_year,
                            roofConstructionType = iba.roof_construction_type,
                            roofMaterialType = iba.roof_material_type,
                            numberOfRooms = iba.room_count,
                            sprinklerCoverageSquareFeet = iba.sprinkler_coverage_sf,
                            totalUnitCount = iba.total_unit_count,
                            typicalStoryHeight = iba.typical_story_height,
                            isPrimary = iba.primary_flag,
                            length = iba.built_as_length,
                            width = iba.built_as_width,
                            height = iba.built_as_height,
                            mobileHomeMake = iba.mobile_home_make,
                            mobileHomeModelType = iba.mobile_home_model_type,
                            mobileHomeSkirt = iba.mobile_home_skirt,
                            mobileHomeSkirtLinearFeet = iba.mobile_home_skirt_linear_feet,
                            mobileHomeWallType = iba.mobile_home_wall_type
                        })
                    }),
                    landAttributes = a.land_attribute.Select(lat => new
                    {
                        attributeType = lat.attribute_type,
                        attributeTypeDescription = lat.attribute_subtype,
                        attributeAdjustment = lat.attribute_adjustment
                    }),
                    landSegments = a.land_abstract.Select(la => new
                    {
                        abstractCode = la.abstract_code,
                        abstractCodeDescription = la.abstract_code_description,
                        type = la.land_type,
                        acres = la.land_acres,
                        actualValue = la.land_actual_value
                    }),
                    buildingPermitAuthority = new
                    {
                        name = a.azure_building_permit_authority.authority_name,
                        phone = a.azure_building_permit_authority.phone,
                        email = a.azure_building_permit_authority.email,
                        url = a.azure_building_permit_authority.URL,
                        street = a.azure_building_permit_authority.street,
                        city = a.azure_building_permit_authority.city,
                        zipCode = a.azure_building_permit_authority.zip
                    },
                    novTaxYears = a.realnov.Select(rn => rn.TAXYEAR)
                }).ToList<dynamic>();
            #endregion

            _sw.Stop();
            log.Info("Batch {4}...{0}:{1}:{2}:{3}", _sw.Elapsed.Hours, _sw.Elapsed.Minutes, _sw.Elapsed.Seconds, _sw.Elapsed.Milliseconds, skip);
            return accounts;
        }

        public string convertAccounts(int resultPageSize, int maxResultPages)
        {
            Stopwatch watch = System.Diagnostics.Stopwatch.StartNew();
            log.Debug("convertAccounts(" + resultPageSize + ", " + maxResultPages + "): Entry.");

            elapsedAccount = MetaHelper.getTimeInMillis();

            int rowsProcessed = 0;
            int rowsReturned = 0;
            int currentPage = 0;

            do
            {
                #region LINQ Query
                List<dynamic> accounts = entities.accounts
                    .OrderBy(a => a.rowhash)
                    .Skip(rowsProcessed)
                    .Take(resultPageSize)
                    .Select(a => new
                    {
                        appeals = a.appeal_account.Where(apps => apps.ACCOUNT_NO == a.account_no)
                        .Where(t => t.TAX_YEAR >= 2016)
                        .Select(app =>
                            new Appeal()
                            {
                                accountNo = app.ACCOUNT_NO,
                                appealNo = (int)app.APPEAL_NO,
                                decision = app.APPEAL_DECISION,
                                reason = app.APPEAL_ACCT_REASON_DESC,
                                taxYear = (int)app.TAX_YEAR
                            }),
                        accountNumber = a.account_no,
                        accountType = a.account_type,
                        appraisalType = a.appraisal_type,
                        stateParcelNumber = a.state_parcel_no,
                        legalDescription = a.legal_description,
                        taxDistrictNumber = a.tax_district.tax_district_no,
                        zoningCode = a.real_account.zoning_code,
                        zoningCodeDescription = a.real_account.zoning_code_description,
                        defaultLea = a.real_account.default_lea,
                        defaultLeaDescription = a.real_account.default_lea_description,
                        totalImprovementInterestPercent = a.real_account.total_improvement_interest_percent,
                        totalLandInterestPercent = a.real_account.total_land_interest_percent,
                        isVacant = (Boolean?)a.real_account.vacant_flag,
                        isImprovementOnly = (Boolean?)a.real_account.improvement_only_flag,
                        isTif = (Boolean?)a.real_account.tif_flag,
                        isPlatted = (Boolean?)a.real_account.platted_flag,
                        numberOfBuildings = a.real_account.no_of_buildings,
                        neighborhoods = a.account_neighborhood.Select(an => new
                        {
                            code = an.neighborhood_code,
                            extension = an.neighborhood_extension
                        }),
                        notifications = a.account_notification.Select(n => new
                        {
                            id = n.noteid,
                            note = n.note
                        }),
                        latitude = a.latitude_y,
                        longitude = a.longitude_x,
                        elevation = a.elevation_z,
                        quartersection = a.qtr,
                        section = a.section,
                        township = a.township,
                        range = a.range,
                        subdivision = new
                        {
                            name = a.sub_filing.subdivision_name,
                            filingNumber = a.sub_filing.filing_no,
                            recordingNumber = a.sub_filing.sub_filing_recording_no
                        },
                        isPrivate = a.account_owner_address.FirstOrDefault().private_flag,
                        owners = a.account_owner_address.Select(aoa => new
                        {
                            isPrimary = aoa.primary_owner_flag,
                            name = aoa.owner_name,
                            mailingAddress = new
                            {
                                street = aoa.address_line_1,
                                street2 = aoa.address_line_2,
                                city = aoa.city_name,
                                state = aoa.state,
                                zipCode = aoa.zip_code
                            }
                        }),
                        addresses = a.account_property_address.Select(apa => new
                        {
                            isPrimary = apa.primary_address_flag,
                            street = apa.concatenated_property_address,
                            city = apa.city_name,
                            zipCode = apa.location_zip_code
                        }),
                        taxAuthorities = a.tax_district.tax_district_authority.Select(tda => new
                        {
                            id = tda.tax_authority.tax_authority_no,
                            name = tda.tax_authority.tax_authority_name,
                            pointOfContact = tda.tax_authority.contact_person,
                            contactPhone = tda.tax_authority.contact_phone,
                            street = tda.tax_authority.contact_address_line_1,
                            street2 = tda.tax_authority.contact_address_line_2,
                            city = tda.tax_authority.contact_city_name,
                            zipCode = tda.tax_authority.contact_zip_code,
                            funds = tda.tax_authority.tax_authority_fund.Select(taf => new
                            {
                                description = taf.tax_fund_description,
                                millLevy = taf.assessed_mill_levy
                            })
                        }),
                        valuesByAbstractCode = a.value_from_tsgvacctabstvalue.Select(av => new
                        {
                            taxYear = av.tax_year,
                            abstractCode = av.valuation_class_code,
                            abstractCodeDescription = av.valuation_class_code_description,
                            netAcres = av.net_acres,
                            actualValue = av.actual_value,
                            assessedValue = av.raw_assessed_value,
                            millLevy = av.mill_levy,
                            taxDollars = av.raw_tax_dollars,
                            assessmentRate = av.assessment_rate
                        }),
                        sales = a.sale_account.Select(sa => new
                        {
                            recordingNumber = sa.sale.recording_no,
                            grantor = sa.sale.grantor,
                            grantee = sa.sale.grantee,
                            date = sa.sale.sale_date,
                            price = sa.sale.sale_price,
                            deedType = sa.sale.deed_code_description,
                            book = sa.sale.book,
                            page = sa.sale.page,
                            isValid1 = sa.sale.valid1_flag,
                            isImproved = sa.sale.improved_flag
                        }),
                        buildings = a.improvements.Select(i => new
                        {
                            buildingNumber = i.improvement_no,
                            propertyType = i.property_type,
                            completedPercent = i.completed_percent,
                            quality = i.improvement_quality,
                            perimeter = i.improvement_perimeter,
                            squareFeet = i.improvement_sf,
                            netSquareFeet = i.improvement_net_sf,
                            isPrimary = i.primary_flag,
                            unitType = i.improvement_unit_type,
                            approachType = i.approach_type,
                            conditionType = i.condition_type,
                            details = i.improvement_detail.Select(id => new
                            {
                                type = id.improvement_detail_type,
                                subtype = id.improvement_detail_type_description,
                                unitCount = id.detail_unit_count,
                                builtYear = id.detail_built_year,
                                addonCode = id.addon_code,
                                addonCodeDescription = id.addon_code_description
                            }),
                            uses = i.improvement_occupancy.Select(io => new
                            {
                                useCode = io.occupancy_code,
                                useCodeDescription = io.occupancy_code_description,
                                usePercentage = io.occupancy_percent,
                                abstractCode = io.abstract_code,
                                abstractCodeDescription = io.abstract_code_description,
                                abstractValue = io.abstract_value,
                                isPrimary = io.primary_flag
                            }),
                            styles = i.improvement_built_as.Select(iba => new
                            {
                                styleCode = iba.built_as_code,
                                styleCodeDescription = iba.built_as_code_description,
                                builtYear = iba.built_year,
                                squareFeet = iba.built_as_sf,
                                abstractCode = iba.class_code,
                                abstractCodeDescription = iba.class_code_description,
                                bedroomCount = iba.bedroom_count,
                                bathroomCount = iba.bathroom_count,
                                effectiveAge = iba.effective_age,
                                exteriorConstructionType = iba.exterior_construction_type,
                                floorMaterialType = iba.floor_material_type,
                                heatType = iba.heat_type,
                                hvacPercent = iba.hvac_percent,
                                interiorFinishType = iba.interior_finish_type,
                                numberOfStories = iba.no_of_story,
                                remodeledPercent = iba.remodeled_percent,
                                remodeledYear = iba.remodeled_year,
                                roofConstructionType = iba.roof_construction_type,
                                roofMaterialType = iba.roof_material_type,
                                numberOfRooms = iba.room_count,
                                sprinklerCoverageSquareFeet = iba.sprinkler_coverage_sf,
                                totalUnitCount = iba.total_unit_count,
                                typicalStoryHeight = iba.typical_story_height,
                                isPrimary = iba.primary_flag,
                                length = iba.built_as_length,
                                width = iba.built_as_width,
                                height = iba.built_as_height,
                                mobileHomeMake = iba.mobile_home_make,
                                mobileHomeModelType = iba.mobile_home_model_type,
                                mobileHomeSkirt = iba.mobile_home_skirt,
                                mobileHomeSkirtLinearFeet = iba.mobile_home_skirt_linear_feet,
                                mobileHomeWallType = iba.mobile_home_wall_type
                            })
                        }),
                        landAttributes = a.land_attribute.Select(lat => new
                        {
                            attributeType = lat.attribute_type,
                            attributeTypeDescription = lat.attribute_subtype,
                            attributeAdjustment = lat.attribute_adjustment
                        }),
                        landSegments = a.land_abstract.Select(la => new
                        {
                            abstractCode = la.abstract_code,
                            abstractCodeDescription = la.abstract_code_description,
                            type = la.land_type,
                            acres = la.land_acres,
                            actualValue = la.land_actual_value
                        }),
                        buildingPermitAuthority = new
                        {
                            name = a.azure_building_permit_authority.authority_name,
                            phone = a.azure_building_permit_authority.phone,
                            email = a.azure_building_permit_authority.email,
                            url = a.azure_building_permit_authority.URL,
                            street = a.azure_building_permit_authority.street,
                            city = a.azure_building_permit_authority.city,
                            zipCode = a.azure_building_permit_authority.zip
                        },
                        novTaxYears = a.realnov.Select(rn => rn.TAXYEAR),
                        ppAccount = a.account_no.StartsWith("P") ? new
                        {
                            propertyAccount = entities.pers_prop_acct
                                            .Where(p => p.ACCOUNT_NO == a.account_no)
                                            .Select(pp => new
                                            {
                                                businessName = pp.BUSINESS_NAME,
                                                businessTypeDescription = pp.BUSINESS_TYPE_DESCRIPTION,
                                                businessTypeCode = pp.BUSINESS_TYPE,
                                                associatedAcct = pp.ASSOCIATED_ACCOUNT
                                            }),
                            propertyAddress = entities.account_property_address
                                    .Where(ppd => ppd.account_no == a.account_no)
                                    .Select(ppd => new
                                    {
                                        address = ppd.concatenated_property_address,
                                        city = ppd.city_name,
                                        zip = ppd.location_zip_code
                                    })
                        } : null
                    })
                    .ToList<dynamic>();
                #endregion

                //if (isPersonalProperty(account))
                //{
                //		totalPersonalProperty++;
                //		acctExpObj.ppAccount = getPersonalPropertyAccount(account.accountNumber, false);
                //}

                int accountCnt = 0;
                log.Info("Writing JSON files...{0}:{1}:{2}:{3}", watch.Elapsed.Hours, watch.Elapsed.Minutes, watch.Elapsed.Seconds, watch.Elapsed.Milliseconds);

                //##########################################
                var fileNames = new ConcurrentBag<string>();
                var opts = new ParallelOptions();
                opts.MaxDegreeOfParallelism = 50;  // 1 thread turns out to be fastest.


                ParallelLoopResult Schpongle = Parallel.For(0, accounts.Count(), opts,
                () => new { Files = new List<string>() },
                (i, parState, state) =>
                {

                    string _payload = JsonConvert.SerializeObject(accounts[i]);
                    var filename = newDir + DIR_DETAIL + @"\" + accounts[i].accountNumber + ".json";

                    using (FileStream file = new FileStream(filename, FileMode.OpenOrCreate, FileAccess.Write, FileShare.None, 8192, FileOptions.None))
                    {
                        byte[] info = new UTF8Encoding(true).GetBytes(_payload);
                        file.Write(info, 0, info.Length);
                    }
                    fileNames.Add(filename);

                    return state;
                },
                state =>
                {
                    foreach (var f in state.Files)
                    {
                        fileNames.Add(f);
                    }
                });

                /*The writes are complete*/
                if (Schpongle.IsCompleted)
                {
                    //foreach (dynamic account in accounts)
                    //{
                    //		accountCnt++;

                    //		if (log.IsDebugEnabled)
                    //		{
                    //				if (accountCnt % 10000 == 0)
                    //				{
                    //						log.Info("Processing accounts, index = " + (rowsProcessed + accountCnt));
                    //				}
                    //		}

                    //		writeAccountJson(account);
                    //}

                    rowsReturned = (int)accounts.LongCount();
                    rowsProcessed += rowsReturned;
                    currentPage++;
                    log.Info(rowsProcessed + " Account JSON files ...{0}:{1}:{2}:{3}", watch.Elapsed.Hours, watch.Elapsed.Minutes, watch.Elapsed.Seconds, watch.Elapsed.Milliseconds);
                }
            }
            while (rowsReturned > 0 && (maxResultPages < 1 || (maxResultPages > 0 && currentPage < maxResultPages)));



            var result = rowsProcessed + " accounts processed";

            log.Info(result);

            totalAccountsProcessed = rowsProcessed;
            elapsedAccount = MetaHelper.getTimeInMillis() - elapsedAccount;

            return result;
        }

        public dynamic getPersonalPropertyAccount(string acctNo, Boolean formatAsJson)
        {
            if (acctNo == null)
            {
                log.Error("Unexpected condition: getPersonalPropertyAccount invoked with null account number, exiting");
                return "";
            }

            // Create json for personal property account  
            IQueryable<dynamic> ppAcct = entities.pers_prop_acct
                .Where(acct => acct.ACCOUNT_NO.Equals(acctNo))
                .Select(acct => new
                {
                    businessName = acct.BUSINESS_NAME,
                    businessTypeDescription = acct.BUSINESS_TYPE_DESCRIPTION,
                    businessTypeCode = acct.BUSINESS_TYPE,
                    associatedAcct = acct.ASSOCIATED_ACCOUNT
                });

            IQueryable<dynamic> propAddress = entities.account_property_address
                .Where(acct => acct.account_no.Equals(acctNo))
                .Select(acct => new
                {
                    address = acct.concatenated_property_address,
                    city = acct.city_name,
                    zip = acct.location_zip_code
                });

            if (ppAcct != null && propAddress != null)
            {
                dynamic personalProperty = new
                {
                    propertyAccount = ppAcct,
                    propertyAddress = propAddress
                };

                if (formatAsJson)
                {
                    return getAsJson(personalProperty);
                }
                else
                {
                    return personalProperty;
                }
            }

            // TODO: Determine what should be returned here... if anything
            return "";
        }

        public dynamic getTaxYears()
        {
            // Create json for distinct years table  
            IQueryable<dynamic> taxYearList = entities.v_nov_tax_years
                .Select(p => p.TaxYear).Distinct();

            return taxYearList;
        }

        public string getMetaAsJson()
        {
            var meta = new
            {
                version = MetaHelper.getVersion(),
                processRunDate = String.Format("{0:G}", DateTime.Now),
                metrics = new
                {
                    totalDuration = MetaHelper.getFormattedDuration(elapsedTotal),
                    accountProcessDuration = MetaHelper.getFormattedDuration(elapsedAccount),
                    accountNovProcessDuration = MetaHelper.getFormattedDuration(elapsedNov),
                    totalAccountsProcessed = totalAccountsProcessed,
                    totalPersonalProperty = totalPersonalProperty,
                    totalNovProcessed = totalNovProcessed,
                },
                taxYears = getTaxYears(),
                etlParameters = getEtlParameters(),
                importantLinks = getImportantLinks(),
                importantDates = getImportantDates()
            };

            return getAsJson(meta, JSON_FORMAT_META);
        }

        public dynamic getImportantLinks()
        {
            IQueryable<dynamic> importantLinks = entities.azure_important_PPLinks
                .Select(p => new
                {
                    name = p.LinkName,
                    url = p.LinkURL,
                    order = (int)p.LinkOrder,
                });

            return importantLinks;
        }

        public dynamic getImportantDates()
        {
            IQueryable<dynamic> importantDates = entities.azure_important_dates
                .Select(dates => new
                {
                    id = dates.ID,
                    description = dates.Description,
                    reappraisalDate = dates.Reappraisal,
                    eventName = dates.Event_Name,
                    eventTitle = dates.Title,
                    interveningDate = dates.Intervening,
                    category = dates.Category
                });

            return importantDates;
        }

        public dynamic getEtlParameters()
        {
            // Create json for etl_parameter table        
            IQueryable<dynamic> parms = entities.etl_parameter
                .Select(p => new
                {
                    name = p.parameter_name,
                    value = p.parameter_value,
                    descr = p.parameter_description
                });

            // TODO The following only works if parameter_name values are unique; we should add a unique constraint to that field if it isn't there.
            dynamic normalizedParams = new ExpandoObject();
            foreach (dynamic parm in parms)
            {
                dynamic value = dynamicFormatting(parm.value);
                (normalizedParams as IDictionary<string, object>)[parm.name] = new { value, parm.descr };
            }

            return normalizedParams;
        }

        private string getDefaultOutputDateFormat(string value, string outputFormat)
        {
            return DateTime.ParseExact(value, outputFormat, null).ToString("yyyy-MM-ddTHH:mm:ss");
        }

        /// <summary>
        /// Receives a value and determines if it needs to be formatted if it matches a specific pattern
        /// </summary>
        /// <param name="valToFormat"></param>
        /// <returns>Formatted value based on the determined type</returns>
        public dynamic dynamicFormatting(dynamic valToFormat)
        {
            dynamic result = null;
            valToFormat = valToFormat.ToString();
            List<KeyValuePair<string, bool>> status = new List<KeyValuePair<string, bool>>();
            status.Add(new KeyValuePair<string, bool>(key: "formatDateTime", value: new Regex(@"(^(\d){5,}$)|(^[\d]{4}\-[\d]{2}\-[\d]{2}$)|(^[A-z]{3,4} [\d]{2} [\d]{4}$)|(^[\d]{2}\/[\d]{2}\/[\d]{4}$)", RegexOptions.IgnoreCase).IsMatch(valToFormat)));
            status.Add(new KeyValuePair<string, bool>(key: "formatBool", value: new Regex(@"^(Y|N)$", RegexOptions.IgnoreCase).IsMatch(valToFormat)));

            var x = status.Where(s => s.Value == true).Select(d => d.Key).FirstOrDefault();
            if (x != null)
            {
                MethodInfo info = this.GetType().GetMethod(x);
                result = info.Invoke(this, new string[] { valToFormat });
            }
            else
            {
                result = valToFormat;
            }
            return result;
        }

        /// <summary>
        /// Formats the SQL date of 11 numbers into a correct JSON date object
        /// </summary>
        /// <param name="valToFormat">the date object to be formatted. </param>
        /// <returns>DateTime if successful, the original valuie if not</returns>
        public dynamic formatDateTime(string valToFormat)
        {
            DateTime outDate;
            Regex d1 = new Regex(@"^(\d){5,}$");
            Regex d2 = new Regex(@"^[\d]{4}\-[\d]{2}\-[\d]{2}$");
            Regex d3 = new Regex(@"^[A-z]{3,4} [\d]{2} [\d]{4}$");
            Regex d4 = new Regex(@"^[\d]{2}\/[\d]{2}\/[\d]{4}$");
            Regex y1 = new Regex(@"^(19|20)", RegexOptions.None);

            if (d1.IsMatch(valToFormat))
            {
                try
                {
                    //20101231999
                    GroupCollection m = new Regex(@"^([\d]{4})([\d]{2})([\d]{2})", RegexOptions.None).Match(valToFormat).Groups;
                    if (!y1.IsMatch(m[1].Value)) { return valToFormat; }
                    if (m.Count >= 3 && y1.IsMatch(m[1].Value))
                    {
                        return new DateTime(
                                int.Parse(m[1].Value),
                                int.Parse(m[2].Value),
                                int.Parse(m[3].Value)).ToUniversalTime();
                    }
                    throw new AmbiguousMatchException(valToFormat + " not transformabe into DateTime.");

                }
                catch (Exception ex)
                {
                    log.Error(ex.Message);
                    return valToFormat;
                }

            }
            if (d2.IsMatch(valToFormat))
            {
                //2017-07-01
                try
                {
                    GroupCollection m = new Regex(@"^([\d]{4})\-([\d]{2})\-([\d]{2})", RegexOptions.None).Match(valToFormat).Groups;
                    if (!y1.IsMatch(m[1].Value)) { return valToFormat; }
                    if (m.Count >= 3 && y1.IsMatch(m[1].Value))
                    {
                        return new DateTime(
                        int.Parse(m[1].Value),
                        int.Parse(m[2].Value),
                        int.Parse(m[3].Value)).ToUniversalTime();
                    }
                    throw new AmbiguousMatchException(valToFormat + " not transformabe into DateTime.");
                }
                catch (Exception ex)
                {
                    log.Error(ex.Message);
                    return valToFormat;
                }


            }
            if (d3.IsMatch(valToFormat))
            {
                //Jun 16 2016
                try
                {
                    GroupCollection m = new Regex(@"^([A-z]{3,4}) ([\d]{2}) ([\d]{4})$", RegexOptions.None).Match(valToFormat).Groups;
                    if (!y1.IsMatch(m[3].Value)) { return valToFormat; }

                    if (m.Count >= 3 && y1.IsMatch(m[3].Value))
                    {
                        return new DateTime(
                        int.Parse(m[3].Value),
                        DateTime.ParseExact(m[1].Value, "MMM", CultureInfo.InvariantCulture).Month,
                        int.Parse(m[2].Value)).ToUniversalTime();
                    }
                    throw new AmbiguousMatchException(valToFormat + " not transformabe into DateTime.");

                }
                catch (Exception ex)
                {
                    log.Error(ex.Message);
                    return valToFormat;
                }


            }
            if (d4.IsMatch(valToFormat))
            {
                //04/02/2015 && 05/12/2015
                try
                {
                    GroupCollection m = new Regex(@"^([\d]{2})\/([\d]{2})\/([\d]{4})", RegexOptions.None).Match(valToFormat).Groups;
                    if (!y1.IsMatch(m[3].Value)) { return valToFormat; }
                    if (m.Count >= 3 && y1.IsMatch(m[3].Value))
                    {
                        return new DateTime(
                                int.Parse(m[3].Value),
                                int.Parse(m[1].Value),
                                int.Parse(m[2].Value)).ToUniversalTime();
                    }
                }
                catch (Exception ex)
                {
                    log.Error(ex.Message);
                    return valToFormat;
                }

            }
            return valToFormat;
        }

        /// <summary>
        /// Converts a string to a boolean value
        /// </summary>
        /// <param name="valToFormat"></param>
        /// <returns>Boolean</returns>
        public dynamic formatBool(string valToFormat)
        {
            return valToFormat == "Y" ? true : false;
        }

        private string getFormattedParamValue(string paramName, string paramValue)
        {
            if (paramName.ToUpper().EndsWith("DATE"))
            {
                //log.Debug("Converting date param: " + paramName + " = " + paramValue);

                if (paramValue.Length == 10)
                {
                    paramValue = getDefaultOutputDateFormat(paramValue, "MM/dd/yyyy");
                }
                else if (paramValue.Length == 11)
                {
                    if (!Char.IsLetter(paramValue.FirstOrDefault()))
                    {
                        paramValue = paramValue.Remove(paramValue.Length - 3);
                        paramValue = getDefaultOutputDateFormat(paramValue, "yyyyMMdd");
                    }
                    else
                    {
                        paramValue = getDefaultOutputDateFormat(paramValue, "MMM dd yyyy");
                    }
                }
            }

            return paramValue;
        }

        public string getEtlParametersAsJson()
        {
            return getAsJson(getEtlParameters());
        }

        public void convertNov()
        {
            convertNov(-1); // < 1 is unlimited results
        }

        public void convertNov(int maxResults)
        {
            elapsedNov = MetaHelper.getTimeInMillis();

            string[] novYears = this.novYears.Split(new char[] { '-' });

            int _novCount = 0;

            foreach (var yr in novYears)
            {
                Regex r = new Regex(@"^[\d]{4}$", RegexOptions.None);
                if (!r.IsMatch(yr))
                {
                    log.Error("AppSettings[\"novYears\"] must be a 4 digit year separated by dashes ex:\"####-####\" or empty.");
                    log.Error("Value passed was: {0}", yr);
                    elapsedNov = MetaHelper.getTimeInMillis() - elapsedNov;
                    continue;
                }

                int filetaxYear = int.Parse(yr);
                Stopwatch watch = new Stopwatch();
                watch.Start();
                #region NOV Query
                List<dynamic> realNovEntities = entities.realnov
                    .AsNoTracking()
                    .Where(n => n.TAXYEAR == filetaxYear)
                    .OrderBy(a => a.account_no)
                    .Select(an => new
                    {
                        taxyear = an.TAXYEAR,
                        accountNumber = an.account_no,
                        parcelnumber = an.PARCELNO,
                        propertyaddress = an.PROPADDRESS,
                        legalDescription1 = an.LEGALDESCRIPTION1,
                        legalDescription2 = an.LEGALDESCRIPTION2,
                        legalDescription3 = an.LEGALDESCRIPTION3,
                        name1 = an.NAME1,
                        name2 = an.NAME2,
                        pname1 = an.PNAME1,
                        pname2 = an.PNAME2,
                        owneraddress1 = an.OWNERADDRESS1,
                        owneraddress2 = an.OWNERADDRESS2,
                        ownercity = an.OWNERCITY,
                        ownerstate = an.OWNERSTATE,
                        ownerzip = an.OWNERZIP,
                        propertyclass1 = an.PROPCLASS1,
                        priorvalue1 = an.PRIORVALUE1,
                        currentvalue1 = an.CURRENTVALUE1,
                        increasedecrease1 = an.INCREASEDECREASE1,
                        propertyclass2 = an.PROPCLASS2,
                        priorvalue2 = an.PRIORVALUE2,
                        currentvalue2 = an.CURRENTVALUE2,
                        increasedecrease2 = an.INCREASEDECREASE2,
                        propertyclass3 = an.PROPCLASS3,
                        priorvalue3 = an.PRIORVALUE3,
                        currentvalue3 = an.CURRENTVALUE3,
                        increasedecrease3 = an.INCREASEDECREASE3,
                        propertyclass4 = an.PROPCLASS4,
                        priorvalue4 = an.PRIORVALUE4,
                        currentvalue4 = an.CURRENTVALUE4,
                        increasedecrease4 = an.INCREASEDECREASE4,
                        propertyclass5 = an.PROPCLASS5,
                        priorvalue5 = an.PRIORVALUE5,
                        currentvalue5 = an.CURRENTVALUE5,
                        increasedecrease5 = an.INCREASEDECREASE5,
                        propertyclass6 = an.PROPCLASS6,
                        priorvalue6 = an.PRIORVALUE6,
                        currentvalue6 = an.CURRENTVALUE6,
                        increasedecrease6 = an.INCREASEDECREASE6,
                        totalpriorvalue = an.TOTALPRIOR,
                        totalcurrentvalue = an.TOTALCURRENT,
                        totalincreasedecreasevalue = an.TOTALINCREASEDECREASE,
                        valueyear = an.VALUEYEAR,
                        propertytype = an.PROPERTYTYPE,
                        primarybuilding = an.PRIMARYBUILDING,
                        buildingcount = an.BUILDINGCOUNT,
                        subdivision = an.SUBDIVISION,
                        neighborhood = an.NEIGHBORHOOD,
                        residentialsquarefeet = an.RESIDENTIALSF,
                        style = an.STYLE,
                        quality = an.QUALITY,
                        yearbuilt = an.YEARBUILT,
                        heattype = an.HEATTYPE,
                        basementsquarefeet = an.BASEMENTSF,
                        finishedbasementsquarefeet = an.FINISHEDBSMNTSF,
                        basementtype = an.BASEMENTTYPE,
                        garagesquarefeet = an.GARAGESF,
                        improvementsquarefeet = an.IMPSF,
                        commercialsquarefeet = an.COMMERCIALSF,
                        outbuildingsquarefeet = an.OUTBUILDINGSF,
                        landtype = an.LANDTYPE,
                        acreage = an.ACREAGE,
                        leacode = an.LEA,
                        landattributes = an.LANDATTRIBUTES,
                        appraisaldateyear = an.APPRDATEYEAR,
                        reappraisalyear = an.REAPPRYEAR,
                        beginperyear = an.BEGPERYEAR,
                        endperyear = an.ENDPERYEAR,
                        cboedeadlinemonth = an.CBOEDEADLINE,
                        printflag = an.PRINTFLAG,
                        bulknovflag = an.BULKNOVFLAG,
                        privateflag = an.PRIVATEFLAG,
                        assessor = an.ASSESSOR,
                        srExemptionDeadline = an.SREXEMPTIONDEADLINE,
                        vetExemptionDeadline = an.VETEXEMPTIONDEADLINE
                    }).ToList<dynamic>();
                #endregion

                log.Info(yr + " NOV Query Complete...{0}:{1}:{2}:{3}", watch.Elapsed.Hours, watch.Elapsed.Minutes, watch.Elapsed.Seconds, watch.Elapsed.Milliseconds);
                //##########################################
                var fileNames = new ConcurrentBag<string>();
                var opts = new ParallelOptions();
                opts.MaxDegreeOfParallelism = 50;  // 1 thread turns out to be fastest.


                ParallelLoopResult Schpongle = Parallel.For(0, realNovEntities.Count(), opts,
                () => new { Files = new List<string>() },
                (i, parState, state) =>
                {

                    string _payload = JsonConvert.SerializeObject(realNovEntities[i]);
                    string filename = realNovEntities[i].taxyear + realNovEntities[i].accountNumber + ".json";
                    string path = baseDir + @"\" + realNovEntities[i].taxyear + @"_new" + DIR_NOV + @"\" + filename;

                    using (FileStream file = new FileStream(path, FileMode.OpenOrCreate, FileAccess.Write, FileShare.None, 8192, FileOptions.None))
                    {
                        byte[] info = new UTF8Encoding(true).GetBytes(_payload);
                        file.Write(info, 0, info.Length);
                    }
                    fileNames.Add(filename);
                    return state;
                },
                state =>
                {
                    foreach (var f in state.Files)
                    {
                        fileNames.Add(f);
                    }
                });

                /*The writes are complete*/
                if (Schpongle.IsCompleted)
                {
                    log.Info(yr + " NOV Results processed...{0}:{1}:{2}:{3}", watch.Elapsed.Hours, watch.Elapsed.Minutes, watch.Elapsed.Seconds, watch.Elapsed.Milliseconds);
                    totalNovProcessed = (int)realNovEntities.LongCount();
                    elapsedNov = MetaHelper.getTimeInMillis() - elapsedNov;
                }
            }

        }

        private string getFormattedDate(string value)
        {
            return getFormattedParamValue("DATE", value);
        }

        private ExpandoObject createParam(v_freeze_parameters p)
        {
            dynamic param = new ExpandoObject();
            (param as IDictionary<string, object>)[p.parameter_name] = p.parameter_value;
            return param;
        }

        public String writeParamJson(string path, string json)
        {
            log.Debug("Writing parameters to: " + path);

            File.WriteAllText(path, json);
            return json;
        }

        private bool isPersonalProperty(dynamic account)
        {
            return ("Personal".Equals("" + account.appraisalType));
        }

        private string getAsJson(dynamic obj)
        {
            return getAsJson(obj, JSON_FORMAT_DEFAULT);
        }

        private string getAsJson(dynamic obj, Formatting jsonFormat)
        {
            return JsonConvert.SerializeObject(obj, jsonFormat, jsonSerializerSettings);
        }

        private void deleteDir(string path)
        {
            log.Debug("deleteDir(" + path + ")");

            String deletingPath = path + "_deleting";
            if (Directory.Exists(deletingPath))
            {
                String deletingPath2 = deletingPath + "2";
                Directory.Move(deletingPath, deletingPath2);
                Directory.Delete(deletingPath2, true);
            }
            if (Directory.Exists(path))
            {
                Directory.Move(path, deletingPath);
                Directory.Delete(deletingPath, true);
            }
        }

    }

    public static class MetaHelper
    {
        public static long getTimeInMillis()
        {
            return DateTime.Now.Ticks / TimeSpan.TicksPerMillisecond;
        }

        public static string getFormattedDuration(long milliseconds)
        {
            double sec = milliseconds / 1000;
            return sec < 60.0 ? sec + " seconds" : string.Format("{0:0.00}", (sec / 60.0)) + " minutes";
        }
        public static string getVersion()
        {
            return Assembly.GetExecutingAssembly().GetName().Version.ToString();
        }
    }

    public static class DbHelper
    {
        public static Entities initEntities(String dtsConnectionString)
        {
            Entities entities = new Entities(getEntityConnection(dtsConnectionString));
            entities.Database.CommandTimeout = 600;
            entities.Configuration.ProxyCreationEnabled = false;

            return entities;
        }

        public static EntityConnection getEntityConnection(string dtsConnectionString)
        {
            return new EntityConnection(CreateMetadataWorkspaceForExecutingAssembly(),
                                        CreateSqlConnectionFromDtsConnectionString(dtsConnectionString));
        }

        public static string DtsToSqlConnectionString(string dtsConnectionString)
        {
            DbConnectionStringBuilder builder = new DbConnectionStringBuilder();
            builder.ConnectionString = dtsConnectionString;
            builder.Remove("Provider");
            builder.Remove("auto translate");
            builder.Add("MultipleActiveResultSets", true);
            return builder.ToString();
        }

        public static SqlConnection CreateSqlConnectionFromDtsConnectionString(string dtsConnectionString)
        {
            return new SqlConnection(DbHelper.DtsToSqlConnectionString(dtsConnectionString));
        }

        public static MetadataWorkspace CreateMetadataWorkspaceForExecutingAssembly()
        {
            return new MetadataWorkspace(new string[] { "res://*/" }, new Assembly[] { Assembly.GetExecutingAssembly() });
        }
    }

    public class Appeal
    {
        public string accountNo { get; set; }
        public int taxYear { get; set; }
        public int appealNo { get; set; }
        public string decision { get; set; }
        public string reason { get; set; }

    }

    public class JsonConverterConfig
    {
        public string ParentDirectory { get; set; }
        public Entities ConverterEntity { get; set; }
        public DetailConfig DetailConfiguration { get; }
        public NOVConfig NOVConfiguration { get; }
        public NODConfig NODConfiguration { get; }
        public Meta MetaConfiguration { get; }


        public string ToJSON()
        {
            return JsonConvert.SerializeObject(this);
        }

        public JsonConverterConfig(bool AssessorJsonShouldRun, string AssessorJsonDataFolder, string AssessorNOVYears)
        {
            this.ParentDirectory = AssessorJsonDataFolder;
            this.DetailConfiguration = BuildDetail("", AssessorJsonDataFolder);
            this.NOVConfiguration = BuildNOVYears(AssessorNOVYears, AssessorJsonDataFolder);
            this.NODConfiguration = BuildNODYears("", AssessorJsonDataFolder);
            this.MetaConfiguration = new Meta(AssessorJsonDataFolder);

        }

        public JsonConverterConfig(bool AssessorJsonShouldRun, string AssessorJsonDataFolder, string AssessorNOVYears,
                 bool AssessorNOVShouldRun, string AssessorNODYears, bool AssessorNodShouldRun, string AssessorDetailYears,
                 bool AssessorDetailShouldRun)
        {
            this.ParentDirectory = AssessorJsonDataFolder;
            this.DetailConfiguration = BuildDetail(AssessorDetailYears, AssessorJsonDataFolder);
            this.NOVConfiguration = BuildNOVYears(AssessorNOVYears, AssessorJsonDataFolder);
            this.NODConfiguration = BuildNODYears(AssessorNODYears, AssessorJsonDataFolder);
            this.MetaConfiguration = new Meta(AssessorJsonDataFolder);
        }


        DetailConfig BuildDetail(string detailYears, string AssessorJsonDataFolder)
        {
            DetailConfig _detailConfig = new DetailConfig();
            List<Detail> _details = new List<Detail>();

            if (detailYears == null)
            {
                _detailConfig.Active = false;
                _details.Add(new Detail(DateTime.Now.Year.ToString(), AssessorJsonDataFolder));
            }
            else
            {
                _detailConfig.Active = true;
                string[] _detailYears = detailYears.Split(new char[] { '-' });
                int _detailCount = 0;

                foreach (var yr in _detailYears)
                {
                    _details.Add(new Detail(yr, AssessorJsonDataFolder));
                }
            }
            _detailConfig.DetailDirectories = _details;

            return _detailConfig;

        }
        NOVConfig BuildNOVYears(string novYears, string AssessorJsonDataFolder)
        {
            NOVConfig _NODConfig = new NOVConfig();
            List<NOV> _NODs = new List<NOV>();
            if (novYears == null)
            {
                _NODConfig.Active = false;
            }
            else
            {
                _NODConfig.Active = true;
                string[] _NODYears = novYears.Split(new char[] { '-' });
                int _NODCount = 0;
                int outInt = 0;
                Regex yearValidity = new Regex("^(19|20)([0-9]{2})$", RegexOptions.None);

                foreach (var yr in _NODYears)
                {
                    if (int.TryParse(yr, out outInt) && yearValidity.IsMatch(yr))
                    {
                        _NODs.Add(new NOV(int.Parse(yr), AssessorJsonDataFolder));
                    }
                    else
                    {
                        throw new ArgumentException("Years for Notices must be a four digit year starting with 19 or 20");
                    }
                }
            }
            _NODConfig.NOVDirectories = _NODs;
            return _NODConfig;

        }
        NODConfig BuildNODYears(string nodYears, string AssessorJsonDataFolder)
        {
            NODConfig _nodConfig = new NODConfig();
            List<NOD> _nods = new List<NOD>();
            if (nodYears == null)
            {
                _nodConfig.Active = false;
            }
            else
            {
                _nodConfig.Active = true;
                string[] _nodYears = nodYears.Split(new char[] { '-' });
                int _nodCount = 0;
                int outInt = 0;
                Regex yearValidity = new Regex("^(19|20)([0-9]{2})$", RegexOptions.None);

                foreach (var yr in _nodYears)
                {
                    if (int.TryParse(yr, out outInt) && yearValidity.IsMatch(yr))
                    {
                        _nods.Add(new NOD(int.Parse(yr), AssessorJsonDataFolder));
                    }
                    else
                    {
                        throw new ArgumentException("Years for Notices must be a four digit year starting with 19 or 20");
                    }
                }
            }
            _nodConfig.NODDirectories = _nods;
            return _nodConfig;

        }
        Meta BuildMetaConfig(string AssessorJsonDataFolder)
        {
            Meta _meta = new Meta(AssessorJsonDataFolder);

            return _meta;
        }

        public class DetailConfig
        {
            public bool Active { get; set; }
            public List<Detail> DetailDirectories { get; set; }
        }
        public class NOVConfig
        {
            public bool Active { get; set; }
            public List<NOV> NOVDirectories { get; set; }
        }
        public class NODConfig
        {
            public bool Active { get; set; }
            public List<NOD> NODDirectories { get; set; }
        }
        public class BaseConfigSet
        {
            public string FileExtension { get { return ".json"; } }
            public string WriteFolder { get; set; }
            public string ArchiveFolder { get; set; }
            public string LiveFolder { get; set; }
        }
        public class NOV : BaseConfigSet
        {
            public int Year { get; set; }
            public NOV(int year, string AssessorJsonDataFolder)
            {
                this.Year = year;
                string prefix = string.Concat(AssessorJsonDataFolder, "\\", year);
                this.WriteFolder = string.Concat(prefix, "\\nov_write");
                this.ArchiveFolder = string.Concat(prefix, "\\nov_old");
                this.LiveFolder = string.Concat(prefix, "\\nov");
            }
        }
        public class Detail : BaseConfigSet
        {
            public Detail(string year, string AssessorJsonDataFolder)
            {
                string prefix = string.Concat(AssessorJsonDataFolder, "\\", year);
                this.WriteFolder = string.Concat(prefix, "\\detail_write");
                this.ArchiveFolder = string.Concat(prefix, "\\detail_old");
                this.LiveFolder = string.Concat(prefix, "\\detail");
            }
        }
        public class NOD : BaseConfigSet
        {
            public int Year { get; set; }
            public NOD(int year, string AssessorJsonDataFolder)
            {
                this.Year = year;
                string prefix = string.Concat(AssessorJsonDataFolder, "\\", year);
                this.WriteFolder = string.Concat(prefix, "\\nod_write");
                this.ArchiveFolder = string.Concat(prefix, "\\nod_old");
                this.LiveFolder = string.Concat(prefix, "\\nod");
            }
        }
        public class Meta
        {
            public string FileName { get; set; }
            public string FileExtension { get { return ".json"; } }
            public Meta(string AssessorJsonDataFolder)
            {
                this.FileName = string.Concat(AssessorJsonDataFolder, "\\meta", this.FileExtension);
            }

        }

    }
}