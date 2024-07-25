using Microsoft.VisualStudio.TestTools.UnitTesting;
using AssessorJson;
using System;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;
using Newtonsoft.Json;


namespace AssessorJson.Tests
{
		[TestClass()]
		public class FullPropertyDetailsConverterTests
		{
				private string DEFAULT_CONNECTION_STRING = ConfigurationManager.ConnectionStrings["defaultConnection"].ConnectionString;
				private string TEST_OUTPUT_DIR = ConfigurationManager.AppSettings["outputDirectory"];
				private int testPageSize = int.Parse(ConfigurationManager.AppSettings["testPageSize"]);
				private int testMaxPages = int.Parse(ConfigurationManager.AppSettings["testMaxPages"]);
				private string detailYear = ConfigurationManager.AppSettings["detailYears"];
				private string novYears = ConfigurationManager.AppSettings["novYears"];
				private string nodYears = ConfigurationManager.AppSettings["nodYears"];
				string RunDetailsJSON = ConfigurationManager.AppSettings["RunDetailsJSON"];

				[TestInitialize()]
				public void initializeTest()
				{
						string baseDir = TEST_OUTPUT_DIR;

						Console.WriteLine("Initializing Test");

						bool removePreviousOutput = false;

						if (removePreviousOutput && Directory.Exists(baseDir))
						{
								Console.WriteLine("Removing existing output directory from previous run");
								Directory.Delete(baseDir, true);
						}
				}

				[TestMethod()]
				public void constructorTest()
				{
						//string dtsConnectionString, string baseDir, string novYears, string detailYears, string RunDetailsJSON
						FullPropertyDetailsConverter _converter = new FullPropertyDetailsConverter(DEFAULT_CONNECTION_STRING, TEST_OUTPUT_DIR, detailYear, novYears, nodYears, RunDetailsJSON);
						Assert.IsNotNull(_converter);
				}

				[TestMethod()]
				public void dirTest()
				{
						FullPropertyDetailsConverter _converter = new FullPropertyDetailsConverter(DEFAULT_CONNECTION_STRING, TEST_OUTPUT_DIR, detailYear, novYears, nodYears, RunDetailsJSON);

						string baseDir = TEST_OUTPUT_DIR;
						string liveDir = baseDir + @"\" + DateTime.Now.Year;

						// TODO: Consider dir prep scenarios and tests to verify cleanup, etc            
						Assert.AreEqual(liveDir, _converter.getLiveDir(), "unexpected liveDir mismatch: " + _converter.getLiveDir());
						Assert.AreEqual(liveDir + "_new", _converter.getNewDir(), "unexpected new dir mismatch: " + _converter.getNewDir());
						Assert.AreEqual(liveDir + "_prev", _converter.getPrevDir(), "unexpected prev dir mismatch: " + _converter.getPrevDir());
						Assert.AreEqual(liveDir + "_old", _converter.getOldDir(), "unexpected old dir mismatch: " + _converter.getOldDir());
						Assert.AreEqual(baseDir + @"\meta.json", _converter.getMetaPath(), "unexpected meta path mismatch: " + _converter.getMetaPath());

						Console.WriteLine("Live Dir: " + _converter.getLiveDir());
				}

				[TestMethod()]
				public void convertAllTest()
				{
						FullPropertyDetailsConverter _converter = new FullPropertyDetailsConverter(DEFAULT_CONNECTION_STRING, TEST_OUTPUT_DIR, detailYear, novYears, nodYears, RunDetailsJSON);

						// Prod settings use -1
						Console.WriteLine("convertAllTest():Entry.");
						var resultStatus = _converter.convertAll(testPageSize); // 100 for testing takes about a minute

						Console.WriteLine(resultStatus);
				}

				[TestMethod()]
				public void convertAccountTest()
				{
						FullPropertyDetailsConverter _converter = new FullPropertyDetailsConverter(DEFAULT_CONNECTION_STRING, TEST_OUTPUT_DIR, detailYear, novYears, nodYears, RunDetailsJSON);

						Console.WriteLine("Starting convertAccountTest()");
						_converter.convertAccounts(testPageSize, testMaxPages);
				}

				[TestMethod()]
				public void convertPersonalProperty()
				{
						FullPropertyDetailsConverter _converter = new FullPropertyDetailsConverter(DEFAULT_CONNECTION_STRING, TEST_OUTPUT_DIR, detailYear, novYears, nodYears, RunDetailsJSON);

						// Personal
						String resultJson = _converter.getPersonalPropertyAccount("P0505196", true);
						Console.WriteLine("Personal:\n" + resultJson);

						// Leasing
						resultJson = _converter.getPersonalPropertyAccount("P0280241", true);
						Console.WriteLine("Leasing:\n" + resultJson);

						// Exempt
						resultJson = _converter.getPersonalPropertyAccount("P0331501", true);
						Console.WriteLine("Exempt:\n" + resultJson);
				}


				[TestMethod()]
				public void getMetaTest()
				{
						FullPropertyDetailsConverter _converter = new FullPropertyDetailsConverter(DEFAULT_CONNECTION_STRING, TEST_OUTPUT_DIR, detailYear, novYears, nodYears, RunDetailsJSON);

						String json = _converter.getMetaAsJson();
						File.WriteAllText(TEST_OUTPUT_DIR + "\\meta.json", json);

						Console.WriteLine("Got Json: \n" + json); // debugging
				}

				[TestMethod()]
				public void getEtlParametersAsJsonTest()
				{
						FullPropertyDetailsConverter _converter = new FullPropertyDetailsConverter(DEFAULT_CONNECTION_STRING, TEST_OUTPUT_DIR, detailYear, novYears, nodYears, RunDetailsJSON);

						String json = _converter.getEtlParametersAsJson();
						// Console.WriteLine("Got Json: \n" + json); // debugging

						// Test something was created
						Assert.IsNotNull(json, "JSON should not be null");

						// Adjust output dir for testing
						String etlParamsOutputPath = TEST_OUTPUT_DIR + @"\test_etl_parameter.json";

						// Clean up previous test run
						if (File.Exists(etlParamsOutputPath))
						{
								File.Delete(etlParamsOutputPath);
						}

						// Write out json to adjusted output dir using converter
						_converter.writeParamJson(etlParamsOutputPath, json);

						// Test it was created
						Assert.IsTrue(File.Exists(etlParamsOutputPath));
				}

				[TestMethod()]
				public void convertNovTest()
				{
						FullPropertyDetailsConverter _converter = new FullPropertyDetailsConverter(DEFAULT_CONNECTION_STRING, TEST_OUTPUT_DIR, detailYear, novYears, nodYears, RunDetailsJSON);
						_converter.convertNov(-1);
						_converter.finalizeDirectories();
				}


				[TestMethod()]
				public void testDynamicFormat()
				{
						FullPropertyDetailsConverter _converter = new FullPropertyDetailsConverter(DEFAULT_CONNECTION_STRING, TEST_OUTPUT_DIR, detailYear, novYears, nodYears, RunDetailsJSON);
						List<TestData> tests = new List<TestData>()
			{
				new TestData("20161031999","DateTime"),
				new TestData(20161031999,"DateTime"),
				new TestData("Y","Boolean"),
				new TestData("N","Boolean"),
				new TestData("Slappy","String"),
				new TestData(1234,"String")
			};

						List<Boolean> dynamo = new List<Boolean>();

						foreach (TestData t in tests)
						{
								Boolean tmpVal = _converter.dynamicFormatting(t.testValue).GetType().Name == t.testResult;
								Console.WriteLine("Testing {0} against {1}... {2}", t.testValue, t.testResult, tmpVal);
								dynamo.Add(tmpVal);
						}

						var flat = dynamo.Distinct();
						var determination = flat.Count() > 1 ? flat.Select(s => s).First() == flat.Select(s => s).Last() : flat.Select(s => s).First() == true;

						if (!determination) { throw new Exception("TEST FAILED"); }

				}

				class TestData
				{
						public dynamic testValue { get; set; }
						public string testResult { get; set; }


						public TestData(dynamic d, string r)
						{
								this.testValue = d;
								this.testResult = r;
						}
				}
		}
}