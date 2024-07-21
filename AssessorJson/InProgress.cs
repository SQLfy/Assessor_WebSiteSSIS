//using Newtonsoft.Json;
//using NLog;
//using NLog.Config;
//using NLog.Targets;
//using System;
//using System.Collections.Concurrent;
//using System.Collections.Generic;
//using System.Configuration;
//using System.Data.Common;
//using System.Data.Entity.Core.EntityClient;
//using System.Data.Entity.Core.Metadata.Edm;
//using System.Data.SqlClient;
//using System.Diagnostics;
//using System.Dynamic;
//using System.IO;
//using System.Linq;
//using System.Reflection;
//using System.Security;
//using System.Security.AccessControl;
//using System.Text;
//using System.Text.RegularExpressions;
//using System.Threading;
//using System.Threading.Tasks;

//namespace AssessorJson
//{
//		public class Smeets
//		{

//				#region properties
//				private Logger log = null;
//				private const Formatting JSON_FORMAT_DEFAULT = Formatting.None; // Used for nearly all generated json files
//				private const Formatting JSON_FORMAT_META = Formatting.Indented;  // Used specifically for meta.json (indent for human readability)
//				private Entities entities;
//				JSONDefinitition _DEFINITION;

//				#endregion

//				private static JsonSerializerSettings jsonSerializerSettings = new JsonSerializerSettings
//				{
//						ReferenceLoopHandling = ReferenceLoopHandling.Ignore
//				};

//				public FullPropertyDetailsConverter(string dtsConnectionString, string outputDirectory, string detailYears, string novYears, string nodYears, string CreateJSON)
//				{


//						this._DEFINITION = new JSONDefinitition(dtsConnectionString, outputDirectory,
//								detailYears, novYears, nodYears, CreateJSON);

//						Debug.WriteLine(JsonConvert.SerializeObject(_DEFINITION));

//						initLogging(this._DEFINITION.StagingDirectory);


//						//log.Info("FullPropertyDetailsConverter: {0}", this._DEFINITION.ToJSON());

//						entities = DbHelper.initEntities(this._DEFINITION.ConnectionString);
//						prepDirectories();
//				}

//				public static void Main(string[] args)
//				{
//						// Example Usage
//						string DEFAULT_CONNECTION_STRING = ConfigurationManager.ConnectionStrings["defaultConnection"].ConnectionString;
//						string TEST_OUTPUT_DIR = ConfigurationManager.AppSettings["outputDirectory"];
//						string novYears = ConfigurationManager.AppSettings["novYears"];
//						string nodYears = ConfigurationManager.AppSettings["nodYears"];
//						string detailYears = ConfigurationManager.AppSettings["detailYears"];
//						string CreateJSON = ConfigurationManager.AppSettings["CreateJSON"];


//						FullPropertyDetailsConverter _FPDC = new FullPropertyDetailsConverter(DEFAULT_CONNECTION_STRING, TEST_OUTPUT_DIR,
//								detailYears, novYears, nodYears, CreateJSON);

//						//_FPDC.convertAll();
//						////NEW HOTNESS
//						_FPDC.Invade();
//				}

//				private void initLogging(string baseDir)
//				{
//						createDir(baseDir); // If not already there

//						string version = MetaHelper.getVersion();

//						// Remove any previous log file(s)
//						foreach (var logFile in Directory.EnumerateFiles(baseDir, "log-*.txt"))
//						{
//								if (File.Exists(logFile))
//								{
//										File.Delete(logFile);
//								}
//						}

//						var config = new LoggingConfiguration();
//						var consoleTarget = new ColoredConsoleTarget();
//						config.AddTarget("console", consoleTarget);

//						var fileTarget = new FileTarget();
//						config.AddTarget("file", fileTarget);

//						string outputLayout = @"${date:format=HH\:mm\:ss} ${logger} ${level} - ${message}";
//						consoleTarget.Layout = outputLayout;
//						fileTarget.Layout = outputLayout;
//						fileTarget.FileName = baseDir + @"\log-" + version + ".txt";

//						var rule1 = new LoggingRule("*", LogLevel.Info, consoleTarget);
//						config.LoggingRules.Add(rule1);

//						var rule2 = new LoggingRule("*", LogLevel.Debug, fileTarget);
//						config.LoggingRules.Add(rule2);

//						LogManager.Configuration = config;

//						log = LogManager.GetLogger("FullPropertyDetailsConverter");
//						log.Info("Logging Initialized for version '" + version + "'");
//				}

//				private Boolean createDir(string dir)
//				{
//						Boolean dirExists = Directory.Exists(dir);

//						if (!dirExists)
//						{
//								Directory.CreateDirectory(dir);
//						}

//						File.SetAttributes(dir, FileAttributes.Normal);

//						return !dirExists;
//				}

//				public void prepDirectories()
//				{
//						log.Debug("Prepping Directories...");

//						createDir(_DEFINITION.MainJsonDirectory);

//						log.Info("Ready to create {0} directories from _DEFINITION.ConfigList: {1}", _DEFINITION.ConfigLists.Count(), JsonConvert.SerializeObject(_DEFINITION.ConfigLists.Select(l => l.ConfigType + ":" + l.TaxYear).ToList()));

//						// Setup yearly directories 
//						foreach (var _DirToCreate in _DEFINITION.ConfigLists)
//						{
//								if (!Directory.Exists(_DirToCreate.DestinationFolder))
//								{
//										if (createDir(_DirToCreate.DestinationFolder))
//										{
//												log.Info("Created {0}", _DirToCreate.DestinationFolder);
//										}
//								}
//								if (!Directory.Exists(_DirToCreate.StagingFolder))
//								{
//										if (createDir(_DirToCreate.StagingFolder))
//										{
//												log.Info("Created {0}", _DirToCreate.StagingFolder);
//										}
//								}
//						}
//				}

//				public void finalizeDirectories(List<dynamic> DirectiveDir)
//				{
//						//Rename prev to delete
//						//Rename active to prev
//						//Rename new to active
//						//Delete delete

//						//Accounts!

//						//foreach (var dirs in DirectiveDir)
//						//{
//						//		log.Info("Working Details...");
//						//		if (Directory.Exists(dirs.ArchiveFolder))
//						//		{
//						//				//rename archive to delete
//						//				log.Info("--Moving " + dirs.ArchiveFolder + " to " + dirs.DeleteFolder + "...");
//						//				Directory.Move(dirs.ArchiveFolder, dirs.DeleteFolder);
//						//				while (Directory.Exists(dirs.ArchiveFolder))
//						//				{
//						//						log.Info("--dirs.ArchiveFolder still there...");
//						//						Thread.Sleep(1000);
//						//				}
//						//				log.Info("--Moved " + dirs.ArchiveFolder + " to " + dirs.DeleteFolder + " successfully.");
//						//		}
//						//		else
//						//		{
//						//				//create the archive
//						//				createDir(dirs.ArchiveFolder);
//						//		}

//						//		try
//						//		{
//						//				log.Info("--Examining ArchiveFolder (" + dirs.ArchiveFolder + ")");
//						//				if (Directory.Exists(dirs.ArchiveFolder))
//						//				{
//						//						log.Info("--dirs.ArchiveFolder (" + dirs.ArchiveFolder + ") exists.");

//						//						log.Info("--Moving " + dirs.ArchiveFolder + "to " + dirs.DeleteFolder + "...");
//						//						Directory.Move(dirs.ArchiveFolder, dirs.DeleteFolder);
//						//						while (Directory.Exists(dirs.ArchiveFolder))
//						//						{
//						//								log.Info("--dirs.ArchiveFolder still there...");
//						//								Thread.Sleep(1000);
//						//						}
//						//						log.Info("--" + dirs.ArchiveFolder + " moved successfully.");

//						//						log.Info("Deleting " + dirs.DeleteFolder + ".");

//						//						deleteDir(dirs.DeleteFolder);

//						//						while (Directory.Exists(dirs.DeleteFolder))
//						//						{
//						//								log.Info("--dirs.DeleteFolder still there...");
//						//								Thread.Sleep(1000);
//						//						}
//						//						log.Info("--" + dirs.DeleteFolder + " deleted successfully.");
//						//				}
//						//				else
//						//				{
//						//						log.Info("--dirs.ArchiveFolder (" + dirs.ArchiveFolder + ") doesn't exist.");
//						//				}

//						//				/*Surgically move foldders...*/

//						//				if (totalAccountsProcessed > 0)
//						//				{

//						//						if (Directory.Exists(dirs.ArchiveFolder))
//						//						{
//						//								log.Info("--Moving " + dirs.ArchiveFolder + " to " + dirs.DeleteFolder + "...");
//						//								Directory.Move(dirs.ArchiveFolder, dirs.DeleteFolder);
//						//								while (Directory.Exists(dirs.DestinationFolder))
//						//								{
//						//										log.Info("--dirs.ArchiveFolder still there...");
//						//										Thread.Sleep(1000);
//						//								}
//						//								log.Info("M--oved " + dirs.ArchiveFolder + " to " + dirs.DeleteFolder + " successfully.");

//						//						}
//						//						else
//						//						{
//						//								createDir(dirs.ArchiveFolder);
//						//						}

//						//						if (Directory.Exists(dirs.ArchiveFolder))
//						//						{
//						//								log.Info("C--leaning " + dirs.ArchiveFolder + " to receive " + dirs.DestinationFolder + "...");
//						//								Directory.Delete(dirs.ArchiveFolder, true);
//						//						}

//						//						log.Info("--Moving " + dirs.DestinationFolder + " to " + dirs.ArchiveFolder + "...");
//						//						Directory.Move(dirs.DestinationFolder, dirs.ArchiveFolder);
//						//						while (Directory.Exists(dirs.DestinationFolder))
//						//						{
//						//								log.Info("--liveDir still there...");
//						//								Thread.Sleep(1000);
//						//						}
//						//						log.Info("--Moved " + dirs.DestinationFolder + " to " + dirs.ArchiveFolder + " successfully.");

//						//						log.Info("--Moving " + dirs.StagingFolder + " to " + dirs.DestinationFolder + "...");
//						//						Directory.Move(dirs.StagingFolder, dirs.DestinationFolder);
//						//						while (Directory.Exists(dirs.StagingFolder))
//						//						{
//						//								log.Info("--newDir still there...");
//						//								Thread.Sleep(1000);
//						//						}
//						//						log.Info("--Moved " + dirs.StagingFolder + " to " + dirs.DestinationFolder + " successfully.");
//						//				}

//						//		}
//						//		catch (DirectoryNotFoundException dnf)
//						//		{
//						//				log.Error("--" + dnf.Message + " _ " + dnf.StackTrace);
//						//		}
//						//		catch (ArgumentNullException argNull)
//						//		{
//						//				log.Error("--" + argNull.Message + " _ " + argNull.StackTrace);
//						//		}
//						//		catch (ArgumentException arg)
//						//		{
//						//				log.Error("--" + arg.Message + " _ " + arg.StackTrace);
//						//		}
//						//		catch (IOException io)
//						//		{
//						//				log.Error("--" + io.Message + " _ " + io.StackTrace);
//						//		}
//						//		catch (SecurityException sec)
//						//		{
//						//				log.Error("--" + sec.Message + " _ " + sec.StackTrace);
//						//		}
//						//		catch (Exception ex)
//						//		{
//						//				log.Error("--finalizeDirectories error: " + ex.Message);
//						//		}
//						//}
//				}

//				public void Invade()
//				{
//						List<Task> _Tak = new List<Task>();
//						List<BagLoad> TheSack = new List<BagLoad>();

//						foreach (JSONDefinitition.ConfigDefinition _ConfigType in _DEFINITION.ConfigLists)
//						{
//								foreach (FileBatch _Batch in _ConfigType.FileBatches)
//								{
//										Stopwatch _sw = new Stopwatch();
//										_sw.Start();
//										log.Info("Invading......{0}:{1}:{2}:{3}", _sw.Elapsed.Hours, _sw.Elapsed.Minutes, _sw.Elapsed.Seconds, _sw.Elapsed.Milliseconds);

//										try
//										{
//												if (_ConfigType.ConfigType == "detail")
//												{
//														Task<List<dynamic>> t1 = Task.Factory.StartNew<List<dynamic>>((args) =>
//														{
//																List<dynamic> ld = (List<dynamic>)args;
//																FileBatch _batch = ld[0];
//																JSONDefinitition.ConfigDefinition _cDef = ld[1];

//																return convertAccount(_batch, _cDef);

//														}, new List<dynamic>() { _Batch, _ConfigType });



//														Task t2 = t1.ContinueWith((predecessor) =>
//														{
//																log.Info("Loading files...");

//																ConcurrentBag<BagLoad> load = LoadFiles(predecessor.Result, _Batch, _ConfigType);

//																TheSack.AddRange(load);
//																log.Info("BagSize: {0}", TheSack.Count());

//														});
//														_Tak.Add(t2);

//												}

//												//if (_ConfigType.ConfigType == "nov")
//												//{
//												//		Task<List<dynamic>> t1 = Task.Factory.StartNew<List<dynamic>>((args) =>
//												//		{
//												//				List<dynamic> ld = (List<dynamic>)args;
//												//				FileBatch _batch = ld[0];
//												//				JSONDefinitition.ConfigDefinition _cDef = ld[1];

//												//				return convertNov(_batch, _cDef);

//												//		}, new List<dynamic>() { _Batch, _ConfigType });
//												//		_Tak.Add(t1);
//												//		Task t2 = t1.ContinueWith((predecessor) =>
//												//		{
//												//				log.Info( "Task {0} finished.", predecessor.Id);
//												//				//WriteFiles(predecessor.Result, _Batch);
//												//		});
//												//}												
//										}
//										catch (Exception ex)
//										{
//												_ConfigType.Errors.Add(ex);
//										}

//										_sw.Stop();
//										log.Info("Invasion complete...{0}:{1}:{2}:{3}", _sw.Elapsed.Hours, _sw.Elapsed.Minutes, _sw.Elapsed.Seconds, _sw.Elapsed.Milliseconds);
//								}
//						}

//						//log.Info("Converting Meta / ETL Parameters");

//						//getMetaAsJson();

//						//// Finalizing directories after run
//						//log.Info("Finalizing directories after run");

//						////finalizeDirectories();

//						while (_Tak.Count > 0)
//						{
//								int _taskIndex = Task.WaitAny(_Tak.ToArray());
//								log.Info("Task {0} finished.", _Tak[_taskIndex].Id);
//								_Tak.RemoveAt(_taskIndex);
//						}

//						Task t_WriteFiles = Task.Factory.StartNew((args) => {
//								WriteFiles((List<BagLoad>)args);

//						}, TheSack);
//						_Tak.Add(t_WriteFiles);
//						while (_Tak.Count > 0)
//						{
//								int _taskIndex = Task.WaitAny(_Tak.ToArray());
//								log.Info("Task {0} finished.", _Tak[_taskIndex].Id);
//								_Tak.RemoveAt(_taskIndex);
//						}

//						log.Info("Process Complete.");

//				}

//				public class BagLoad
//				{
//						public string path { get; set; }
//						public string payload { get; set; }

//						public BagLoad(string path, string payload)
//						{
//								this.path = path;
//								this.payload = payload;
//						}
//				}
//				public ConcurrentBag<BagLoad> LoadFiles(List<dynamic> records, FileBatch batch, JSONDefinitition.ConfigDefinition _cDef)
//				{
//						Stopwatch _sw = new Stopwatch();

//						var fileNames = new ConcurrentBag<BagLoad>();
//						var opts = new ParallelOptions();
//						opts.MaxDegreeOfParallelism = 1;  // 1 thread turns out to be fastest.


//						ParallelLoopResult Schpongle = Parallel.For(0, records.Count(), opts,
//						() => new { Files = new List<BagLoad>() },
//						(i, parState, state) =>
//						{
//								string FileName = new Regex("^(no[vd])$", RegexOptions.IgnoreCase).IsMatch(_cDef.ConfigType) ? _cDef.TaxYear + records[i].accountNumber + _cDef.FileExtension : records[i].accountNumber + _cDef.FileExtension;

//								string _payload = JsonConvert.SerializeObject(records[i]);

//								var filePath = Path.Combine(_cDef.StagingFolder, FileName);

//								fileNames.Add(new BagLoad(filePath, _payload));

//								return state;
//						},
//						state =>
//						{
//								foreach (var f in state.Files)
//								{
//										fileNames.Add(f);
//								}
//						});

//						/*The writes are complete*/
//						if (Schpongle.IsCompleted)
//						{
//								_cDef.RecordsProcessed += batch.PageSize;
//								return fileNames;
//						}
//						return fileNames;
//				}

//				public void WriteFiles(List<BagLoad> records)
//				{
//						Stopwatch _sw = new Stopwatch();

//						var fileNames = new ConcurrentBag<string>();
//						var opts = new ParallelOptions();
//						opts.MaxDegreeOfParallelism = 50;  // 1 thread turns out to be fastest.


//						ParallelLoopResult Schpongle = Parallel.For(0, records.Count(), opts,
//						() => new { Files = new List<string>() },
//						(i, parState, state) =>
//						{

//								using (FileStream file = new FileStream(records[i].path, FileMode.OpenOrCreate, FileAccess.Write, FileShare.None, 8192, FileOptions.None))
//								{
//										byte[] info = new UTF8Encoding(true).GetBytes(records[i].payload);
//										file.Write(info, 0, info.Length);
//								}
//								fileNames.Add(records[i].path);
//								if (i % 5000 == 0) { log.Info("{0} files written...", i); }
//								return state;
//						},
//						state =>
//						{
//								foreach (var f in state.Files)
//								{
//										fileNames.Add(f);
//								}
//						});

//						/*The writes are complete*/
//						if (Schpongle.IsCompleted)
//						{
//								log.Info("Files written.");
//						}
//				}

//				public List<dynamic> convertAccount(FileBatch batch, JSONDefinitition.ConfigDefinition _cDef)
//				{
//						Stopwatch _sw = new Stopwatch();
//						_sw.Start();
//						Entities entities = DbHelper.initEntities(_DEFINITION.ConnectionString);
//						List<dynamic> accounts = new List<dynamic>();

//						log.Info("Beginning {2} {3} batch {0} of {1} records.", batch.BatchID, batch.PageSize, _cDef.TaxYear, _cDef.ConfigType);

//						#region LINQ Query
//						accounts = entities.accounts
//						 .OrderBy(a => a.rowhash)
//						 .Skip(batch.Skip)
//						 .Take(batch.PageSize)
//						 .Select(a => new
//						 {
//								 appeals = entities.appeal_account.Where(apps => apps.ACCOUNT_NO == a.account_no)
//							 .Where(t => t.TAX_YEAR.ToString() == _cDef.TaxYear)
//							 .Select(app =>
//								 new
//								 {
//										 accountNo = app.ACCOUNT_NO,
//										 appealNo = (int)app.APPEAL_NO,
//										 decision = app.APPEAL_DECISION,
//										 reason = app.APPEAL_ACCT_REASON_DESC,
//										 taxYear = (int)app.TAX_YEAR
//								 }),
//								 accountNumber = a.account_no,
//								 accountType = a.account_type,
//								 appraisalType = a.appraisal_type,
//								 stateParcelNumber = a.state_parcel_no,
//								 legalDescription = a.legal_description,
//								 taxDistrictNumber = a.tax_district.tax_district_no,
//								 zoningCode = a.real_account.zoning_code,
//								 zoningCodeDescription = a.real_account.zoning_code_description,
//								 defaultLea = a.real_account.default_lea,
//								 defaultLeaDescription = a.real_account.default_lea_description,
//								 totalImprovementInterestPercent = a.real_account.total_improvement_interest_percent,
//								 totalLandInterestPercent = a.real_account.total_land_interest_percent,
//								 isVacant = (Boolean?)a.real_account.vacant_flag,
//								 isImprovementOnly = (Boolean?)a.real_account.improvement_only_flag,
//								 isTif = (Boolean?)a.real_account.tif_flag,
//								 isPlatted = (Boolean?)a.real_account.platted_flag,
//								 numberOfBuildings = a.real_account.no_of_buildings,
//								 //neighborhoods = entities.account_neighborhood
//								 //.Where(an => an.account_no == a.account_no)
//								 //.Select(an => new
//								 //{
//								 //	 code = an.neighborhood_code,
//								 //	 extension = an.neighborhood_extension
//								 //}),
//								 latitude = a.latitude_y,
//								 longitude = a.longitude_x,
//								 elevation = a.elevation_z,
//								 quartersection = a.qtr,
//								 section = a.section,
//								 township = a.township,
//								 range = a.range,
//								 //subdivision = entities.sub_filing
//								 //.Where(sub => sub.sub_filing_recording_no == a.sub_filing_recording_no)
//								 //.Select(sub => new
//								 //{
//								 //	 name = sub.subdivision_name,
//								 //	 filingNumber = sub.filing_no,
//								 //	 recordingNumber = sub.sub_filing_recording_no
//								 //}),
//								 isPrivate = a.account_owner_address.FirstOrDefault().private_flag,
//								 //owners = entities.account_owner_address
//								 //.Where(aoa => aoa.account_no == a.account_no)
//								 //.Select(aoa => new
//								 //{
//								 //	 isPrimary = aoa.primary_owner_flag,
//								 //	 name = aoa.owner_name,
//								 //	 mailingAddress = new
//								 //	 {
//								 //			 street = aoa.address_line_1,
//								 //			 street2 = aoa.address_line_2,
//								 //			 city = aoa.city_name,
//								 //			 state = aoa.state,
//								 //			 zipCode = aoa.zip_code
//								 //	 }
//								 //}),
//								 //addresses = entities.account_property_address
//								 //.Where(apa => apa.account_no == a.account_no)
//								 //.Select(apa => new
//								 //{
//								 //	 isPrimary = apa.primary_address_flag,
//								 //	 street = apa.concatenated_property_address,
//								 //	 city = apa.city_name,
//								 //	 zipCode = apa.location_zip_code
//								 //}),

//								 //taxauth = entities.tax_district_authority
//								 //	 .Join(
//								 //			 entities.tax_authority,
//								 //			 tda => tda.tax_authority_no,
//								 //			 ta => ta.tax_authority_no,
//								 //			 (tda, ta) => new { tda, ta }
//								 //	 ).Where(tt => tt.tda.tax_district_no == a.tax_district_no)
//								 //	 .Select(t => new
//								 //	 {
//								 //			 id = t.ta.tax_authority_no,
//								 //			 name = t.ta.contact_person,
//								 //			 pointOfContact = t.ta.contact_person,
//								 //			 contactPhone = t.ta.contact_phone,
//								 //			 street = t.ta.contact_address_line_1,
//								 //			 street2 = t.ta.contact_address_line_2,
//								 //			 city = t.ta.contact_city_name,
//								 //			 zipCode = t.ta.contact_zip_code,
//								 //			 funds = entities.tax_authority_fund
//								 //			 .Where(taf => taf.tax_authority_no == t.tda.tax_authority_no)
//								 //			 .Select(taf => new
//								 //			 {
//								 //					 description = taf.tax_fund_description,
//								 //					 millLevy = taf.assessed_mill_levy
//								 //			 })

//								 //	 }),
//								 //valuesByAbstractCode = entities.value_from_tsgvacctabstvalue
//								 //.Select(av => new
//								 //{
//								 //	 taxYear = av.tax_year,
//								 //	 abstractCode = av.valuation_class_code,
//								 //	 abstractCodeDescription = av.valuation_class_code_description,
//								 //	 netAcres = av.net_acres,
//								 //	 actualValue = av.actual_value,
//								 //	 assessedValue = av.raw_assessed_value,
//								 //	 millLevy = av.mill_levy,
//								 //	 taxDollars = av.raw_tax_dollars
//								 //}),
//								 //sales = entities.sale_account
//								 //.Select(sa => new
//								 //{
//								 //	 recordingNumber = sa.sale.recording_no,
//								 //	 grantor = sa.sale.grantor,
//								 //	 grantee = sa.sale.grantee,
//								 //	 date = sa.sale.sale_date,
//								 //	 price = sa.sale.sale_price,
//								 //	 deedType = sa.sale.deed_code_description,
//								 //	 book = sa.sale.book,
//								 //	 page = sa.sale.page,
//								 //	 isValid1 = sa.sale.valid1_flag,
//								 //	 isImproved = sa.sale.improved_flag
//								 //}),
//								 //buildings =
//								 //entities.improvements.Select(i => new
//								 //{
//								 //	 buildingNumber = i.improvement_no,
//								 //	 propertyType = i.property_type,
//								 //	 completedPercent = i.completed_percent,
//								 //	 quality = i.improvement_quality,
//								 //	 perimeter = i.improvement_perimeter,
//								 //	 squareFeet = i.improvement_sf,
//								 //	 netSquareFeet = i.improvement_net_sf,
//								 //	 isPrimary = i.primary_flag,
//								 //	 unitType = i.improvement_unit_type,
//								 //	 approachType = i.approach_type,
//								 //	 conditionType = i.condition_type,
//								 //	 details = entities.improvement_detail
//								 //	 .Where(id => id.account_no == a.account_no)
//								 //	 .Select(id => new
//								 //	 {
//								 //			 type = id.improvement_detail_type,
//								 //			 subtype = id.improvement_detail_type_description,
//								 //			 unitCount = id.detail_unit_count,
//								 //			 builtYear = id.detail_built_year,
//								 //			 addonCode = id.addon_code,
//								 //			 addonCodeDescription = id.addon_code_description
//								 //	 }),
//								 //	 uses = entities.improvement_occupancy
//								 //	 .Where(io => io.account_no == a.account_no)
//								 //	 .Select(io => new
//								 //	 {
//								 //			 useCode = io.occupancy_code,
//								 //			 useCodeDescription = io.occupancy_code_description,
//								 //			 usePercentage = io.occupancy_percent,
//								 //			 abstractCode = io.abstract_code,
//								 //			 abstractCodeDescription = io.abstract_code_description,
//								 //			 abstractValue = io.abstract_value,
//								 //			 isPrimary = io.primary_flag
//								 //	 }),
//								 //	 styles = entities.improvement_built_as
//								 //	 .Where(iba => iba.account_no == a.account_no)
//								 //	 .Select(iba => new
//								 //	 {
//								 //			 styleCode = iba.built_as_code,
//								 //			 styleCodeDescription = iba.built_as_code_description,
//								 //			 builtYear = iba.built_year,
//								 //			 squareFeet = iba.built_as_sf,
//								 //			 abstractCode = iba.class_code,
//								 //			 abstractCodeDescription = iba.class_code_description,
//								 //			 bedroomCount = iba.bedroom_count,
//								 //			 bathroomCount = iba.bathroom_count,
//								 //			 effectiveAge = iba.effective_age,
//								 //			 exteriorConstructionType = iba.exterior_construction_type,
//								 //			 floorMaterialType = iba.floor_material_type,
//								 //			 heatType = iba.heat_type,
//								 //			 hvacPercent = iba.hvac_percent,
//								 //			 interiorFinishType = iba.interior_finish_type,
//								 //			 numberOfStories = iba.no_of_story,
//								 //			 remodeledPercent = iba.remodeled_percent,
//								 //			 remodeledYear = iba.remodeled_year,
//								 //			 roofConstructionType = iba.roof_construction_type,
//								 //			 roofMaterialType = iba.roof_material_type,
//								 //			 numberOfRooms = iba.room_count,
//								 //			 sprinklerCoverageSquareFeet = iba.sprinkler_coverage_sf,
//								 //			 totalUnitCount = iba.total_unit_count,
//								 //			 typicalStoryHeight = iba.typical_story_height,
//								 //			 isPrimary = iba.primary_flag,
//								 //			 length = iba.built_as_length,
//								 //			 width = iba.built_as_width,
//								 //			 height = iba.built_as_height,
//								 //			 mobileHomeMake = iba.mobile_home_make,
//								 //			 mobileHomeModelType = iba.mobile_home_model_type,
//								 //			 mobileHomeSkirt = iba.mobile_home_skirt,
//								 //			 mobileHomeSkirtLinearFeet = iba.mobile_home_skirt_linear_feet,
//								 //			 mobileHomeWallType = iba.mobile_home_wall_type
//								 //	 })
//								 //}),
//								 //landAttributes = entities.land_attribute
//								 //.Where(la => la.account_no == a.account_no)
//								 //.Select(lat => new
//								 //{
//								 //	 attributeType = lat.attribute_type,
//								 //	 attributeTypeDescription = lat.attribute_subtype,
//								 //	 attributeAdjustment = lat.attribute_adjustment
//								 //}),
//								 //landSegments = entities.land_abstract
//								 //.Where(la => la.account_no == a.account_no)
//								 //.Select(la => new
//								 //{
//								 //	 abstractCode = la.abstract_code,
//								 //	 abstractCodeDescription = la.abstract_code_description,
//								 //	 type = la.land_type,
//								 //	 acres = la.land_acres,
//								 //	 actualValue = la.land_actual_value
//								 //}),
//								 //buildingPermitAuthority = new
//								 //{
//								 //	 name = a.azure_building_permit_authority.authority_name,
//								 //	 phone = a.azure_building_permit_authority.phone,
//								 //	 email = a.azure_building_permit_authority.email,
//								 //	 url = a.azure_building_permit_authority.URL,
//								 //	 street = a.azure_building_permit_authority.street,
//								 //	 city = a.azure_building_permit_authority.city,
//								 //	 zipCode = a.azure_building_permit_authority.zip
//								 //},
//								 novTaxYears = a.realnov.Select(rn => rn.TAXYEAR)
//						 }).ToList<dynamic>();
//						#endregion

//						_sw.Stop();
//						log.Info("Batch {4} query for {5} {6} complete: {0}:{1}:{2}:{3}",
//								_sw.Elapsed.Hours, _sw.Elapsed.Minutes, _sw.Elapsed.Seconds, _sw.Elapsed.Milliseconds, batch.Skip, _cDef.TaxYear, _cDef.ConfigType);
//						return accounts;
//				}

//				public List<dynamic> convertNov(FileBatch batch, JSONDefinitition.ConfigDefinition _cDef)
//				{
//						Stopwatch watch = new Stopwatch();
//						watch.Start();
//						#region NOV Query
//						List<dynamic> novRecords = entities.realnov
//							.AsNoTracking()
//							.Where(n => n.TAXYEAR.ToString() == _cDef.TaxYear)
//							.OrderBy(a => a.account_no)
//							.Select(an => new
//							{
//									taxyear = an.TAXYEAR,
//									accountNumber = an.account_no,
//									parcelnumber = an.PARCELNO,
//									propertyaddress = an.PROPADDRESS,
//									legalDescription1 = an.LEGALDESCRIPTION1,
//									legalDescription2 = an.LEGALDESCRIPTION2,
//									legalDescription3 = an.LEGALDESCRIPTION3,
//									name1 = an.NAME1,
//									name2 = an.NAME2,
//									pname1 = an.PNAME1,
//									pname2 = an.PNAME2,
//									owneraddress1 = an.OWNERADDRESS1,
//									owneraddress2 = an.OWNERADDRESS2,
//									ownercity = an.OWNERCITY,
//									ownerstate = an.OWNERSTATE,
//									ownerzip = an.OWNERZIP,
//									propertyclass1 = an.PROPCLASS1,
//									priorvalue1 = an.PRIORVALUE1,
//									currentvalue1 = an.CURRENTVALUE1,
//									increasedecrease1 = an.INCREASEDECREASE1,
//									propertyclass2 = an.PROPCLASS2,
//									priorvalue2 = an.PRIORVALUE2,
//									currentvalue2 = an.CURRENTVALUE2,
//									increasedecrease2 = an.INCREASEDECREASE2,
//									propertyclass3 = an.PROPCLASS3,
//									priorvalue3 = an.PRIORVALUE3,
//									currentvalue3 = an.CURRENTVALUE3,
//									increasedecrease3 = an.INCREASEDECREASE3,
//									propertyclass4 = an.PROPCLASS4,
//									priorvalue4 = an.PRIORVALUE4,
//									currentvalue4 = an.CURRENTVALUE4,
//									increasedecrease4 = an.INCREASEDECREASE4,
//									propertyclass5 = an.PROPCLASS5,
//									priorvalue5 = an.PRIORVALUE5,
//									currentvalue5 = an.CURRENTVALUE5,
//									increasedecrease5 = an.INCREASEDECREASE5,
//									propertyclass6 = an.PROPCLASS6,
//									priorvalue6 = an.PRIORVALUE6,
//									currentvalue6 = an.CURRENTVALUE6,
//									increasedecrease6 = an.INCREASEDECREASE6,
//									totalpriorvalue = an.TOTALPRIOR,
//									totalcurrentvalue = an.TOTALCURRENT,
//									totalincreasedecreasevalue = an.TOTALINCREASEDECREASE,
//									valueyear = an.VALUEYEAR,
//									propertytype = an.PROPERTYTYPE,
//									primarybuilding = an.PRIMARYBUILDING,
//									buildingcount = an.BUILDINGCOUNT,
//									subdivision = an.SUBDIVISION,
//									neighborhood = an.NEIGHBORHOOD,
//									residentialsquarefeet = an.RESIDENTIALSF,
//									style = an.STYLE,
//									quality = an.QUALITY,
//									yearbuilt = an.YEARBUILT,
//									heattype = an.HEATTYPE,
//									basementsquarefeet = an.BASEMENTSF,
//									finishedbasementsquarefeet = an.FINISHEDBSMNTSF,
//									basementtype = an.BASEMENTTYPE,
//									garagesquarefeet = an.GARAGESF,
//									improvementsquarefeet = an.IMPSF,
//									commercialsquarefeet = an.COMMERCIALSF,
//									outbuildingsquarefeet = an.OUTBUILDINGSF,
//									landtype = an.LANDTYPE,
//									acreage = an.ACREAGE,
//									leacode = an.LEA,
//									landattributes = an.LANDATTRIBUTES,
//									appraisaldateyear = an.APPRDATEYEAR,
//									reappraisalyear = an.REAPPRYEAR,
//									beginperyear = an.BEGPERYEAR,
//									endperyear = an.ENDPERYEAR,
//									cboedeadlinemonth = an.CBOEDEADLINE,
//									printflag = an.PRINTFLAG,
//									bulknovflag = an.BULKNOVFLAG,
//									privateflag = an.PRIVATEFLAG,
//									assessor = an.ASSESSOR,
//									srExemptionDeadline = an.SREXEMPTIONDEADLINE,
//									vetExemptionDeadline = an.VETEXEMPTIONDEADLINE
//							}).ToList<dynamic>();
//						#endregion

//						log.Info("{4} NOV Query Complete...{0}:{1}:{2}:{3}",
//								watch.Elapsed.Hours, watch.Elapsed.Minutes, watch.Elapsed.Seconds, watch.Elapsed.Milliseconds, _cDef.TaxYear);
//						return novRecords;
//				}

//				public dynamic getPersonalPropertyAccount(string acctNo, Boolean formatAsJson)
//				{
//						if (acctNo == null)
//						{
//								log.Error("Unexpected condition: getPersonalPropertyAccount invoked with null account number, exiting");
//								return "";
//						}

//						// Create json for personal property account  
//						IQueryable<dynamic> ppAcct = entities.pers_prop_acct
//							.Where(acct => acct.ACCOUNT_NO.Equals(acctNo))
//							.Select(acct => new
//							{
//									businessName = acct.BUSINESS_NAME,
//									businessTypeDescription = acct.BUSINESS_TYPE_DESCRIPTION,
//									businessTypeCode = acct.BUSINESS_TYPE,
//									associatedAcct = acct.ASSOCIATED_ACCOUNT
//							});

//						IQueryable<dynamic> propAddress = entities.account_property_address
//							.Where(acct => acct.account_no.Equals(acctNo))
//							.Select(acct => new
//							{
//									address = acct.concatenated_property_address,
//									city = acct.city_name,
//									zip = acct.location_zip_code
//							});

//						if (ppAcct != null && propAddress != null)
//						{
//								dynamic personalProperty = new
//								{
//										propertyAccount = ppAcct,
//										propertyAddress = propAddress
//								};

//								if (formatAsJson)
//								{
//										return getAsJson(personalProperty);
//								}
//								else
//								{
//										return personalProperty;
//								}
//						}

//						// TODO: Determine what should be returned here... if anything
//						return "";
//				}

//				public dynamic getTaxYears()
//				{
//						// Create json for distinct years table  
//						IQueryable<dynamic> taxYearList = entities.v_nov_tax_years
//							.Select(p => p.TaxYear).Distinct();

//						return taxYearList;
//				}

//				public void getMetaAsJson()
//				{
//						var _accountProcessDuration = _DEFINITION.ConfigLists
//												.Where(acc => acc.ConfigType == "detail")
//												.Select(a => a.FileBatches.Sum(f => f.Elapsed.Ticks));

//						//var meta = new
//						//{
//						//		version = MetaHelper.getVersion(),
//						//		processRunDate = String.Format("{0:G}", DateTime.Now),
//						//		metrics = new
//						//		{



//						//				novProcessDuration = MetaHelper.getFormattedDuration(elapsedNov),
//						//				nodProcessDuration = MetaHelper.getFormattedDuration(elapsedNod),

//						//				totalAccountsProcessed = totalAccountsProcessed,
//						//				totalPersonalProperty = totalPersonalProperty,
//						//				totalNovProcessed = totalNovProcessed,
//						//				totalDuration = MetaHelper.getFormattedDuration(elapsedTotal),
//						//		},
//						//		taxYears = getTaxYears(),
//						//		etlParameters = getEtlParameters(),
//						//		importantLinks = getImportantLinks(),
//						//		importantDates = getImportantDates()
//						//};

//						//File.WriteAllText(_DEFINITION.MetaConfiguration.FileName, getAsJson(meta, JSON_FORMAT_META));
//				}

//				public dynamic getImportantLinks()
//				{
//						IQueryable<dynamic> importantLinks = entities.azure_important_PPLinks
//							.Select(p => new
//							{
//									name = p.LinkName,
//									url = p.LinkURL,
//									order = (int)p.LinkOrder,
//							});

//						return importantLinks;
//				}

//				public dynamic getImportantDates()
//				{
//						IQueryable<dynamic> importantDates = entities.azure_important_dates
//							.Select(dates => new
//							{
//									id = dates.ID,
//									description = dates.Description,
//									reappraisalDate = dates.Reappraisal,
//									eventName = dates.Event_Name,
//									eventTitle = "Title TBD in ETL", //TODO: load real value once in ETL
//									interveningDate = dates.Intervening,
//									category = dates.Category
//							});

//						return importantDates;
//				}

//				public dynamic getEtlParameters()
//				{
//						// Create json for etl_parameter table        
//						IQueryable<dynamic> parms = entities.etl_parameter
//							.Select(p => new
//							{
//									name = p.parameter_name,
//									value = p.parameter_value,
//									descr = p.parameter_description
//							});

//						// TODO The following only works if parameter_name values are unique; we should add a unique constraint to that field if it isn't there.
//						dynamic normalizedParams = new ExpandoObject();
//						foreach (dynamic parm in parms)
//						{
//								dynamic value = dynamicFormatting(parm.value);
//								(normalizedParams as IDictionary<string, object>)[parm.name] = new { value, parm.descr };
//						}

//						return normalizedParams;
//				}

//				private string getDefaultOutputDateFormat(string value, string outputFormat)
//				{
//						return DateTime.ParseExact(value, outputFormat, null).ToString("yyyy-MM-ddTHH:mm:ss");
//				}

//				/// <summary>
//				/// Receives a value and determines if it needs to be formatted if it matches a specific pattern
//				/// </summary>
//				/// <param name="valToFormat"></param>
//				/// <returns>Formatted value based on the determined type</returns>
//				public dynamic dynamicFormatting(dynamic valToFormat)
//				{
//						dynamic result = null;
//						valToFormat = valToFormat.ToString();
//						List<KeyValuePair<string, bool>> status = new List<KeyValuePair<string, bool>>();
//						status.Add(new KeyValuePair<string, bool>(key: "formatDateTime", value: new Regex(@"^(\d){5,}$", RegexOptions.IgnoreCase).IsMatch(valToFormat)));
//						//status.Add(new KeyValuePair<string, bool>(key: "formatDateString", value: new Regex(@"^(([01][1-9])\/)(([0-2][1-9]\/)|(3[01])\/)(20[0-9][0-9])$", RegexOptions.IgnoreCase).IsMatch(valToFormat)));
//						status.Add(new KeyValuePair<string, bool>(key: "formatBool", value: new Regex(@"^(Y|N)$", RegexOptions.IgnoreCase).IsMatch(valToFormat)));

//						var x = status.Where(s => s.Value == true).Select(d => d.Key).FirstOrDefault();
//						if (x != null)
//						{
//								MethodInfo info = this.GetType().GetMethod(x);
//								result = info.Invoke(this, new string[] { valToFormat });

//						}
//						else
//						{
//								result = valToFormat;
//						}
//						return result;
//				}

//				/// <summary>
//				/// Formats the SQL date of 11 numbers into a correct JSON date object
//				/// </summary>
//				/// <param name="valToFormat">the date object to be formatted. </param>
//				/// <returns>DateTime if successful, the original valuie if not</returns>
//				public dynamic formatDateTime(string valToFormat)
//				{
//						DateTime outDate;
//						dynamic m = new Regex(@"(\d\d\d\d)(\d\d)(\d\d)", RegexOptions.None).Match(valToFormat).Groups;
//						Regex _y = new Regex(@"^(19|20)", RegexOptions.None);

//						if (_y.IsMatch(m[1].Value) && int.Parse(m[2].Value) <= 12 && int.Parse(m[3].Value) <= 31)
//						{
//								return new DateTime(int.Parse(m[1].Value), int.Parse(m[2].Value), int.Parse(m[3].Value)).ToUniversalTime();
//						}
//						else
//						{
//								return valToFormat;
//						}
//				}

//				/// <summary>
//				/// Formats the date string in mm/dd/yyy format into a correct JSON date object
//				/// </summary>
//				/// <param name="valToFormat">the date object to be formatted. </param>
//				/// <returns>DateTime if successful, the original valuie if not</returns>        
//				public dynamic formatDateString(string valToFormat)
//				{
//						DateTime outDate;
//						dynamic m = new Regex(@"([\d]+)\/([\d]+)\/([\d]+)", RegexOptions.None).Match(valToFormat).Groups;
//						Regex _y = new Regex(@"^(19|20)", RegexOptions.None);

//						if (_y.IsMatch(m[3].Value) && int.Parse(m[1].Value) <= 12 && int.Parse(m[2].Value) <= 31)
//						{
//								return new DateTime(int.Parse(m[3].Value), int.Parse(m[1].Value), int.Parse(m[2].Value)).ToUniversalTime();
//						}
//						else
//						{
//								return valToFormat;
//						}
//				}

//				/// <summary>
//				/// Converts a string to a boolean value
//				/// </summary>
//				/// <param name="valToFormat"></param>
//				/// <returns>Boolean</returns>
//				public dynamic formatBool(string valToFormat)
//				{
//						return valToFormat == "Y" ? true : false;
//				}

//				private string getFormattedParamValue(string paramName, string paramValue)
//				{
//						if (paramName.ToUpper().EndsWith("DATE"))
//						{
//								//log.Debug("Converting date param: " + paramName + " = " + paramValue);

//								if (paramValue.Length == 10)
//								{
//										paramValue = getDefaultOutputDateFormat(paramValue, "MM/dd/yyyy");
//								}
//								else if (paramValue.Length == 11)
//								{
//										if (!Char.IsLetter(paramValue.FirstOrDefault()))
//										{
//												paramValue = paramValue.Remove(paramValue.Length - 3);
//												paramValue = getDefaultOutputDateFormat(paramValue, "yyyyMMdd");
//										}
//										else
//										{
//												paramValue = getDefaultOutputDateFormat(paramValue, "MMM dd yyyy");
//										}
//								}

//						}

//						return paramValue;
//				}

//				public string getEtlParametersAsJson()
//				{
//						return getAsJson(getEtlParameters());
//				}

//				private string getFormattedDate(string value)
//				{
//						return getFormattedParamValue("DATE", value);
//				}

//				private ExpandoObject createParam(v_freeze_parameters p)
//				{
//						dynamic param = new ExpandoObject();
//						(param as IDictionary<string, object>)[p.parameter_name] = p.parameter_value;
//						return param;
//				}

//				public String writeParamJson(string path, string json)
//				{
//						log.Debug("Writing parameters to: " + path);

//						File.WriteAllText(path, json);
//						return json;
//				}

//				private bool isPersonalProperty(dynamic account)
//				{
//						return ("Personal".Equals("" + account.appraisalType));
//				}

//				private string getAsJson(dynamic obj)
//				{
//						return getAsJson(obj, JSON_FORMAT_DEFAULT);
//				}

//				private string getAsJson(dynamic obj, Formatting jsonFormat)
//				{
//						return JsonConvert.SerializeObject(obj, jsonFormat, jsonSerializerSettings);
//				}

//				private void deleteDir(string path)
//				{
//						log.Debug("deleteDir(" + path + ")");

//						String deletingPath = path + "_deleting";
//						if (Directory.Exists(deletingPath))
//						{
//								String deletingPath2 = deletingPath + "2";
//								Directory.Move(deletingPath, deletingPath2);
//								Directory.Delete(deletingPath2, true);
//						}
//						if (Directory.Exists(path))
//						{
//								Directory.Move(path, deletingPath);
//								Directory.Delete(deletingPath, true);
//						}
//				}

//		}
//		public static class MetaHelper
//		{
//				public static long getTimeInMillis()
//				{
//						return DateTime.Now.Ticks / TimeSpan.TicksPerMillisecond;
//				}
//				public static string getFormattedDuration(long milliseconds)
//				{
//						double sec = milliseconds / 1000;
//						return sec < 60.0 ? sec + " seconds" : string.Format("{0:0.00}", (sec / 60.0)) + " minutes";
//				}
//				public static string getVersion()
//				{
//						return Assembly.GetExecutingAssembly().GetName().Version.ToString();
//				}
//		}

//		public class Meta
//		{
//				public string FileName { get; set; }
//				public Meta(string AssessorJsonDataFolder)
//				{
//						this.FileName = Path.Combine(AssessorJsonDataFolder, "meta.json");
//				}

//		}
//		public static class DbHelper
//		{
//				public static Entities initEntities(String dtsConnectionString)
//				{
//						Entities entities = new Entities(getEntityConnection(dtsConnectionString));
//						entities.Database.CommandTimeout = 600;
//						entities.Configuration.ProxyCreationEnabled = false;

//						return entities;
//				}

//				public static EntityConnection getEntityConnection(string dtsConnectionString)
//				{
//						return new EntityConnection(CreateMetadataWorkspaceForExecutingAssembly(),
//													CreateSqlConnectionFromDtsConnectionString(dtsConnectionString));
//				}

//				public static string DtsToSqlConnectionString(string dtsConnectionString)
//				{
//						DbConnectionStringBuilder builder = new DbConnectionStringBuilder();
//						builder.ConnectionString = dtsConnectionString;
//						builder.Remove("Provider");
//						builder.Remove("auto translate");
//						builder.Add("MultipleActiveResultSets", true);
//						return builder.ToString();
//				}

//				public static SqlConnection CreateSqlConnectionFromDtsConnectionString(string dtsConnectionString)
//				{
//						return new SqlConnection(DbHelper.DtsToSqlConnectionString(dtsConnectionString));
//				}

//				public static MetadataWorkspace CreateMetadataWorkspaceForExecutingAssembly()
//				{
//						return new MetadataWorkspace(new string[] { "res://*/" }, new Assembly[] { Assembly.GetExecutingAssembly() });
//				}
//		}

//		public class JSONDefinitition
//		{
//				public string ParentDirectory { get; set; }
//				public string StagingDirectory { get; set; }
//				public string MainJsonDirectory { get; set; }
//				public List<ConfigDefinition> ConfigLists { get; set; }
//				public string ConnectionString { get; set; }
//				public Meta MetaConfiguration { get; }
//				public string ToJSON()
//				{
//						return JsonConvert.SerializeObject(this);
//				}

//				public JSONDefinitition(string dtsConnectionString, string baseDir,
//						string detailYears, string novYears, string nodYears, string RunDetailsJSON)
//				{
//						Regex reg = new Regex("(DATA(\\-?[DQUAV]+)?)", RegexOptions.IgnoreCase);
//						this.MainJsonDirectory = baseDir;
//						this.ParentDirectory = reg.Replace(this.MainJsonDirectory, "");
//						this.StagingDirectory = reg.Replace(this.MainJsonDirectory, "STAGING");
//						this.MetaConfiguration = new Meta(this.MainJsonDirectory);
//						this.ConnectionString = dtsConnectionString;
//						this.ConfigLists = new List<ConfigDefinition>();
//						BuildDefinition("detail", detailYears);
//						BuildDefinition("nov", novYears);
//						BuildDefinition("nod", nodYears);
//				}

//				ConfigDefinition BuildDefinition(string _configType, string _taxYearArray)
//				{

//						ConfigDefinition _ConfigDef = new ConfigDefinition();

//						if (_taxYearArray == null || _taxYearArray.Trim() == "")
//						{
//								_ConfigDef.Active = false;
//						}
//						else
//						{

//								string[] _taxYears = _taxYearArray.Split(new char[] { '-' });

//								Regex _yearValidity = new Regex("^(19|20)([0-9]{2})$", RegexOptions.None);

//								foreach (var _year in _taxYears)
//								{
//										_ConfigDef = new ConfigDefinition();
//										try
//										{
//												if (_year == "" || _yearValidity.IsMatch(_year) == false)
//												{
//														_ConfigDef.Active = false;
//												}
//												else
//												{
//														Entities entities = DbHelper.initEntities(this.ConnectionString);
//														decimal recordCount = 0;

//														_ConfigDef.ConfigType = _configType;

//														try
//														{
//																if (_configType == "detail")
//																{
//																		/*
//																		 * WARNING: Will only currently operate for current tax data in the Acocunts Table
//																		 * Will write same data to each year specified until further notice.
//																		 */
//																		recordCount = entities.accounts
//																				.Select(a => a).Count();
//																}
//																if (_configType == "nov")
//																{
//																		recordCount = entities.realnov
//																				.Where(t => t.TAXYEAR.ToString() == _year)
//																				.Select(a => a).Count();
//																}
//																if (_configType == "nod")
//																{
//																		recordCount = 0;
//																		//entities.realnov
//																		//.Where(t => t.TAXYEAR.ToString() == _year)
//																		//.Select(a => a).Count();
//																}
//														}
//														catch (Exception ex)
//														{
//																_ConfigDef.Errors.Add(ex);
//														}

//														_ConfigDef.RecordCount = recordCount;
//														_ConfigDef.Active = true;
//														_ConfigDef.ArchiveFolder = Path.Combine(this.MainJsonDirectory, Path.Combine(_year, _configType + ConfigFolderType.Prev.Value));
//														_ConfigDef.StagingFolder = Path.Combine(this.StagingDirectory, Path.Combine(_year, _configType + ConfigFolderType.Stage.Value));
//														_ConfigDef.DestinationFolder = Path.Combine(this.MainJsonDirectory, Path.Combine(_year, _configType + ConfigFolderType.Live.Value));
//														_ConfigDef.DeleteFolder = Path.Combine(this.MainJsonDirectory, Path.Combine(_year, _configType + ConfigFolderType.Delete.Value));
//														_ConfigDef.EnvironmentDir = this.MainJsonDirectory;
//														_ConfigDef.TaxYear = _year;
//														_ConfigDef.FileBatches = BatchBuilder(_configType, recordCount, 5000, this.ConnectionString);

//														this.ConfigLists.Add(_ConfigDef);

//														entities.Dispose();

//												}
//										}
//										catch (Exception ex)
//										{
//												_ConfigDef.Active = false;
//												_ConfigDef.Errors.Add(ex);
//										}
//								}

//						}
//						return _ConfigDef;

//				}

//				Meta BuildMetaConfig(string AssessorJsonDataFolder)
//				{
//						Meta _meta = new Meta(AssessorJsonDataFolder);

//						return _meta;
//				}


//				public class ConfigDefinition
//				{
//						public string ConfigType { get; set; }
//						public bool Active { get; set; }
//						public string TaxYear { get; set; } /* 2017 */
//						public string EnvironmentDir { get; set; } /* \\prrwapp.dcgd.douglas.co.us\photos\DATA-DV*/
//						public decimal RecordCount { get; set; }
//						public int RecordsProcessed { get; set; } /* 0 */
//						public string FileExtension { get { return ".json"; } }
//						public string StagingFolder { get; set; } /* _new */
//						public string ArchiveFolder { get; set; }/* _prev */
//						public string DestinationFolder { get; set; } /* */
//						public string DeleteFolder { get; set; }/* _delete */
//						public List<Exception> Errors { get; set; }/* */
//						public List<FileBatch> FileBatches { get; set; }/* */
//				}

//				public class ConfigFolderType
//				{
//						private ConfigFolderType(string value) { Value = value; }
//						public string Value { get; set; }
//						public static ConfigFolderType Stage { get { return new ConfigFolderType("_stage"); } }
//						public static ConfigFolderType Prev { get { return new ConfigFolderType("_prev"); } }
//						public static ConfigFolderType Live { get { return new ConfigFolderType(""); } }
//						public static ConfigFolderType Delete { get { return new ConfigFolderType("_delete"); } }
//				}

//				private List<FileBatch> BatchBuilder(string _configType, decimal _recordCount, int _PageSize, string _conn)
//				{
//						List<FileBatch> _batches = new List<FileBatch>();


//						decimal wholeRounds = Math.Floor((decimal)_recordCount / _PageSize);
//						decimal shortRound = _recordCount % _PageSize;
//						int lastSkip = 0;

//						for (int i = 0; i < wholeRounds; i++)
//						{
//								_batches.Add(new FileBatch(i, _PageSize, i * _PageSize));
//								lastSkip = i * _PageSize;
//						}

//						_batches.Add(new FileBatch(_batches.Count, (int)shortRound, lastSkip + _PageSize));

//						return _batches;
//				}

//		}
//		public class FileBatch
//		{
//				public int BatchID { get; set; }
//				public int PageSize { get; set; }
//				public int Skip { get; set; }
//				public TimeSpan Elapsed { get; set; }

//				public FileBatch(int _id, int _pageSize, int _skip)
//				{
//						this.BatchID = _id;
//						this.PageSize = _pageSize;
//						this.Skip = _skip;
//				}
//		}
//}