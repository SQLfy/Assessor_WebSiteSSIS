USE [master]
GO
/****** Object:  Database [assessor_extract]    Script Date: 2/16/2016 3:49:41 PM ******/
CREATE DATABASE [assessor_extract] ON  PRIMARY 
( NAME = N'assessor_extract', FILENAME = N'E:\Data\assessor_extract.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'assessor_extract_log', FILENAME = N'E:\Log\assessor_extract_log.ldf' , SIZE = 22528KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [assessor_extract] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [assessor_extract].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [assessor_extract] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [assessor_extract] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [assessor_extract] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [assessor_extract] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [assessor_extract] SET ARITHABORT OFF 
GO
ALTER DATABASE [assessor_extract] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [assessor_extract] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [assessor_extract] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [assessor_extract] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [assessor_extract] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [assessor_extract] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [assessor_extract] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [assessor_extract] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [assessor_extract] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [assessor_extract] SET  DISABLE_BROKER 
GO
ALTER DATABASE [assessor_extract] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [assessor_extract] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [assessor_extract] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [assessor_extract] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [assessor_extract] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [assessor_extract] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [assessor_extract] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [assessor_extract] SET RECOVERY FULL 
GO
ALTER DATABASE [assessor_extract] SET  MULTI_USER 
GO
ALTER DATABASE [assessor_extract] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [assessor_extract] SET DB_CHAINING OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'assessor_extract', N'ON'
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [UPGRADER]    Script Date: 2/16/2016 3:49:41 PM ******/
CREATE LOGIN [UPGRADER] WITH PASSWORD=N'K57RCAfUgtZ0PpIgIwnnB9ANX8NFiY/Ed9A1ay5vjcw=', DEFAULT_DATABASE=[DVRW_Patch], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [UPGRADER] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [ted]    Script Date: 2/16/2016 3:49:41 PM ******/
CREATE LOGIN [ted] WITH PASSWORD=N'5c6opW98sVEbiI4L2IOwJo5ZA9po0yRoAkf5f9TQBjA=', DEFAULT_DATABASE=[DVRW], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [ted] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [rwdev]    Script Date: 2/16/2016 3:49:41 PM ******/
CREATE LOGIN [rwdev] WITH PASSWORD=N'+Was4ME7JZJfEAvxpJwrf038X3LyORb3aF5/hRdhLVI=', DEFAULT_DATABASE=[DVRW], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [rwdev] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [rw_readonly]    Script Date: 2/16/2016 3:49:41 PM ******/
CREATE LOGIN [rw_readonly] WITH PASSWORD=N'UYLMQ8o5+Lk3iJgwmZ8oExR41wfVicO8wtcIwl5ttv4=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [rw_readonly] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [ods_extract_asr]    Script Date: 2/16/2016 3:49:41 PM ******/
CREATE LOGIN [ods_extract_asr] WITH PASSWORD=N'2xweGxjNZFkVwRo0F+gHiyAQ+22gwU5hkJJAFGcY6pM=', DEFAULT_DATABASE=[DVRW], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [ods_extract_asr] DISABLE
GO
/****** Object:  Login [NT SERVICE\SQLSERVERAGENT]    Script Date: 2/16/2016 3:49:41 PM ******/
CREATE LOGIN [NT SERVICE\SQLSERVERAGENT] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT SERVICE\MSSQLSERVER]    Script Date: 2/16/2016 3:49:41 PM ******/
CREATE LOGIN [NT SERVICE\MSSQLSERVER] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT AUTHORITY\SYSTEM]    Script Date: 2/16/2016 3:49:41 PM ******/
CREATE LOGIN [NT AUTHORITY\SYSTEM] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [mapapp_user]    Script Date: 2/16/2016 3:49:41 PM ******/
CREATE LOGIN [mapapp_user] WITH PASSWORD=N'TDOzBe8fVqYQFsYuhYe1qhkPKwR5+lEsdDvYWdNrvZk=', DEFAULT_DATABASE=[MAP_APP], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [mapapp_user] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [map_gis]    Script Date: 2/16/2016 3:49:41 PM ******/
CREATE LOGIN [map_gis] WITH PASSWORD=N'fQh4OsA+yBvo3K9G27KYDS0rECcchwFaJ4VylBWABCs=', DEFAULT_DATABASE=[MAP], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [map_gis] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [manu]    Script Date: 2/16/2016 3:49:41 PM ******/
CREATE LOGIN [manu] WITH PASSWORD=N'Ap+89hK4Z9CxeOgsPgjuAkfpGBezwWee1Q41rbPsn0M=', DEFAULT_DATABASE=[DVRW_Patch], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [manu] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [LISTBUILDERRWDM]    Script Date: 2/16/2016 3:49:41 PM ******/
CREATE LOGIN [LISTBUILDERRWDM] WITH PASSWORD=N'Pui+z9m8LAF5gIK4ceNACs1Sbkn+ZCYz1GK3/JGTCD0=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [LISTBUILDERRWDM] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [LISTBUILDERRW]    Script Date: 2/16/2016 3:49:41 PM ******/
CREATE LOGIN [LISTBUILDERRW] WITH PASSWORD=N'r8A5TWFrE1T6tVuX6SC9sWMzfl5fdzFepQ6crGU7qJg=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [LISTBUILDERRW] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [LISTBUILDERCWDM]    Script Date: 2/16/2016 3:49:41 PM ******/
CREATE LOGIN [LISTBUILDERCWDM] WITH PASSWORD=N'M75Fvoylhn6bKHulaKx4TjKxwwSxAX1NV+VNT2nlmVo=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [LISTBUILDERCWDM] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [LISTBUILDERCW]    Script Date: 2/16/2016 3:49:41 PM ******/
CREATE LOGIN [LISTBUILDERCW] WITH PASSWORD=N'z1lDp9KSMyEDaEBJU1P8N0QNjnfHBfG8BwF8vlZE3Kc=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [LISTBUILDERCW] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [gisrw]    Script Date: 2/16/2016 3:49:41 PM ******/
CREATE LOGIN [gisrw] WITH PASSWORD=N'foy6VmwNMKq8A71lhrfToujET1gVEkg9xWbjBhZEs9g=', DEFAULT_DATABASE=[DVRWGIS], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [gisrw] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [gisro]    Script Date: 2/16/2016 3:49:41 PM ******/
CREATE LOGIN [gisro] WITH PASSWORD=N'hAoB3xcOoCLZbGDnwvAOF+pwNIXZcAuGCW+mDb0BoJw=', DEFAULT_DATABASE=[DVRWGIS], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=ON, CHECK_POLICY=ON
GO
ALTER LOGIN [gisro] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [etl_test]    Script Date: 2/16/2016 3:49:41 PM ******/
CREATE LOGIN [etl_test] WITH PASSWORD=N'LT1AeeWnHLXQWt7PmsmKHfG5Wx/A+bpsw3r/fQ1wTiE=', DEFAULT_DATABASE=[DVRW], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=ON, CHECK_POLICY=ON
GO
ALTER LOGIN [etl_test] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [dg]    Script Date: 2/16/2016 3:49:41 PM ******/
CREATE LOGIN [dg] WITH PASSWORD=N'FYoZdPhS0MpRvcJhQ3UkHCO3ihyz8RThMXbqx9HAzCQ=', DEFAULT_DATABASE=[dg], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [dg] DISABLE
GO
/****** Object:  Login [DCGD\wheatley]    Script Date: 2/16/2016 3:49:41 PM ******/
CREATE LOGIN [DCGD\wheatley] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [DCGD\wharvey]    Script Date: 2/16/2016 3:49:41 PM ******/
CREATE LOGIN [DCGD\wharvey] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [DCGD\tsilvest]    Script Date: 2/16/2016 3:49:41 PM ******/
CREATE LOGIN [DCGD\tsilvest] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [DCGD\tobrien]    Script Date: 2/16/2016 3:49:41 PM ******/
CREATE LOGIN [DCGD\tobrien] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [DCGD\tloeweck]    Script Date: 2/16/2016 3:49:41 PM ******/
CREATE LOGIN [DCGD\tloeweck] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [DCGD\tdamisch]    Script Date: 2/16/2016 3:49:41 PM ******/
CREATE LOGIN [DCGD\tdamisch] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [DCGD\SQLAdmins]    Script Date: 2/16/2016 3:49:41 PM ******/
CREATE LOGIN [DCGD\SQLAdmins] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [DCGD\SA_SQLSVCS]    Script Date: 2/16/2016 3:49:41 PM ******/
CREATE LOGIN [DCGD\SA_SQLSVCS] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [DCGD\sa_sqldba]    Script Date: 2/16/2016 3:49:41 PM ******/
CREATE LOGIN [DCGD\sa_sqldba] FROM WINDOWS WITH DEFAULT_DATABASE=[WSOAdmin], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [DCGD\SA_SQLADMIN]    Script Date: 2/16/2016 3:49:41 PM ******/
CREATE LOGIN [DCGD\SA_SQLADMIN] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [DCGD\sa_realware5]    Script Date: 2/16/2016 3:49:41 PM ******/
CREATE LOGIN [DCGD\sa_realware5] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [DCGD\pboyd]    Script Date: 2/16/2016 3:49:41 PM ******/
CREATE LOGIN [DCGD\pboyd] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [DCGD\mdronamr]    Script Date: 2/16/2016 3:49:41 PM ******/
CREATE LOGIN [DCGD\mdronamr] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [DCGD\marvidso]    Script Date: 2/16/2016 3:49:41 PM ******/
CREATE LOGIN [DCGD\marvidso] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [DCGD\jlongach]    Script Date: 2/16/2016 3:49:41 PM ******/
CREATE LOGIN [DCGD\jlongach] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [DCGD\glycas]    Script Date: 2/16/2016 3:49:41 PM ******/
CREATE LOGIN [DCGD\glycas] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [DCGD\ggilman]    Script Date: 2/16/2016 3:49:41 PM ******/
CREATE LOGIN [DCGD\ggilman] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [DCGD\Domain Admins]    Script Date: 2/16/2016 3:49:41 PM ******/
CREATE LOGIN [DCGD\Domain Admins] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [DCGD\dguillen]    Script Date: 2/16/2016 3:49:41 PM ******/
CREATE LOGIN [DCGD\dguillen] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [DCGD\DEPT_Assessor_RealWare_Admin]    Script Date: 2/16/2016 3:49:41 PM ******/
CREATE LOGIN [DCGD\DEPT_Assessor_RealWare_Admin] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [DCGD\dbrooks]    Script Date: 2/16/2016 3:49:41 PM ******/
CREATE LOGIN [DCGD\dbrooks] FROM WINDOWS WITH DEFAULT_DATABASE=[PRRW], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [DCGD\Database_Development]    Script Date: 2/16/2016 3:49:41 PM ******/
CREATE LOGIN [DCGD\Database_Development] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [DCGD\clin]    Script Date: 2/16/2016 3:49:41 PM ******/
CREATE LOGIN [DCGD\clin] FROM WINDOWS WITH DEFAULT_DATABASE=[DVRW_Patch], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [DCGD\agolden]    Script Date: 2/16/2016 3:49:41 PM ******/
CREATE LOGIN [DCGD\agolden] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [DCGD\A_DevSQLAdmins]    Script Date: 2/16/2016 3:49:41 PM ******/
CREATE LOGIN [DCGD\A_DevSQLAdmins] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [DATA_SERVICES]    Script Date: 2/16/2016 3:49:41 PM ******/
CREATE LOGIN [DATA_SERVICES] WITH PASSWORD=N'b3hugOskC76FF3OpBqjN6J4bv791vHgNpLgE8SQYxqs=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [DATA_SERVICES] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [comps_gis_web]    Script Date: 2/16/2016 3:49:41 PM ******/
CREATE LOGIN [comps_gis_web] WITH PASSWORD=N'OAPe+Hj/iPjLWx8+tDZw+AXJpdlzO0fOb2QnT42+cSQ=', DEFAULT_DATABASE=[COMPS_WEB], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [comps_gis_web] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [comps_gis_user]    Script Date: 2/16/2016 3:49:41 PM ******/
CREATE LOGIN [comps_gis_user] WITH PASSWORD=N'Jho1fiZ9AXNEkhGMCejLweHUvFqKTfANHO04CI694II=', DEFAULT_DATABASE=[COMPS2_Test], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [comps_gis_user] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [comps_gis]    Script Date: 2/16/2016 3:49:41 PM ******/
CREATE LOGIN [comps_gis] WITH PASSWORD=N'HpkuHtkhGhBHzF0Ca3mhQ8PZeIAgke9eMQ/PB0n/So0=', DEFAULT_DATABASE=[COMPS_WEB], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [comps_gis] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [CCIAPPUSER_HIDEPRIVATEOWNERS]    Script Date: 2/16/2016 3:49:41 PM ******/
CREATE LOGIN [CCIAPPUSER_HIDEPRIVATEOWNERS] WITH PASSWORD=N'zp0WwEfV2+81PbLb9iNfHo4+vKpncmsynw9vnkEMVu8=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [CCIAPPUSER_HIDEPRIVATEOWNERS] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [CCIAPPUSER]    Script Date: 2/16/2016 3:49:41 PM ******/
CREATE LOGIN [CCIAPPUSER] WITH PASSWORD=N'TjDd1E4OknQo/pqJC5HHeBLhexGiGLMzkvp28eae9sU=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [CCIAPPUSER] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [CCI_SERVICES]    Script Date: 2/16/2016 3:49:41 PM ******/
CREATE LOGIN [CCI_SERVICES] WITH PASSWORD=N'5d0Xza5lKnpnNH8620Wm7/NiwPXlrmYqczyNVj1o6JA=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [CCI_SERVICES] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [camouflage]    Script Date: 2/16/2016 3:49:41 PM ******/
CREATE LOGIN [camouflage] WITH PASSWORD=N'm2OJcX7coLRssslMAz+1vy4O42f+bni6YCU/xb61tSo=', DEFAULT_DATABASE=[DVRWETL], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [camouflage] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [assessortest]    Script Date: 2/16/2016 3:49:41 PM ******/
CREATE LOGIN [assessortest] WITH PASSWORD=N'NFWJ0enI6VoLxqXkvLdZgZGBRysoDz9WC9Qj8TGwI28=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [assessortest] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyTsqlExecutionLogin##]    Script Date: 2/16/2016 3:49:41 PM ******/
CREATE LOGIN [##MS_PolicyTsqlExecutionLogin##] WITH PASSWORD=N'fAya1t8JQqTIVQ6kxOZH2ZTNYTVJy/ws8OeVBuFVYbU=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyTsqlExecutionLogin##] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyEventProcessingLogin##]    Script Date: 2/16/2016 3:49:41 PM ******/
CREATE LOGIN [##MS_PolicyEventProcessingLogin##] WITH PASSWORD=N'rc3tcU9YOHCS4X41jzQPU3B1cArfHLvWNqQPnLfdDzo=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyEventProcessingLogin##] DISABLE
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [rwdev]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\SQLSERVERAGENT]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\MSSQLSERVER]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT AUTHORITY\SYSTEM]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [etl_test]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [DCGD\wheatley]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [DCGD\tloeweck]
GO
ALTER SERVER ROLE [securityadmin] ADD MEMBER [DCGD\tloeweck]
GO
ALTER SERVER ROLE [serveradmin] ADD MEMBER [DCGD\tloeweck]
GO
ALTER SERVER ROLE [setupadmin] ADD MEMBER [DCGD\tloeweck]
GO
ALTER SERVER ROLE [processadmin] ADD MEMBER [DCGD\tloeweck]
GO
ALTER SERVER ROLE [diskadmin] ADD MEMBER [DCGD\tloeweck]
GO
ALTER SERVER ROLE [dbcreator] ADD MEMBER [DCGD\tloeweck]
GO
ALTER SERVER ROLE [bulkadmin] ADD MEMBER [DCGD\tloeweck]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [DCGD\tdamisch]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [DCGD\SQLAdmins]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [DCGD\SA_SQLSVCS]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [DCGD\sa_sqldba]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [DCGD\SA_SQLADMIN]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [DCGD\sa_realware5]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [DCGD\mdronamr]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [DCGD\marvidso]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [DCGD\jlongach]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [DCGD\glycas]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [DCGD\ggilman]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [DCGD\Domain Admins]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [DCGD\dguillen]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [DCGD\DEPT_Assessor_RealWare_Admin]
GO
ALTER SERVER ROLE [securityadmin] ADD MEMBER [DCGD\DEPT_Assessor_RealWare_Admin]
GO
ALTER SERVER ROLE [serveradmin] ADD MEMBER [DCGD\DEPT_Assessor_RealWare_Admin]
GO
ALTER SERVER ROLE [setupadmin] ADD MEMBER [DCGD\DEPT_Assessor_RealWare_Admin]
GO
ALTER SERVER ROLE [processadmin] ADD MEMBER [DCGD\DEPT_Assessor_RealWare_Admin]
GO
ALTER SERVER ROLE [diskadmin] ADD MEMBER [DCGD\DEPT_Assessor_RealWare_Admin]
GO
ALTER SERVER ROLE [dbcreator] ADD MEMBER [DCGD\DEPT_Assessor_RealWare_Admin]
GO
ALTER SERVER ROLE [bulkadmin] ADD MEMBER [DCGD\DEPT_Assessor_RealWare_Admin]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [DCGD\Database_Development]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [DCGD\clin]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [DCGD\agolden]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [DCGD\A_DevSQLAdmins]
GO
ALTER SERVER ROLE [securityadmin] ADD MEMBER [DCGD\A_DevSQLAdmins]
GO
ALTER SERVER ROLE [serveradmin] ADD MEMBER [DCGD\A_DevSQLAdmins]
GO
ALTER SERVER ROLE [setupadmin] ADD MEMBER [DCGD\A_DevSQLAdmins]
GO
ALTER SERVER ROLE [processadmin] ADD MEMBER [DCGD\A_DevSQLAdmins]
GO
ALTER SERVER ROLE [diskadmin] ADD MEMBER [DCGD\A_DevSQLAdmins]
GO
ALTER SERVER ROLE [dbcreator] ADD MEMBER [DCGD\A_DevSQLAdmins]
GO
ALTER SERVER ROLE [bulkadmin] ADD MEMBER [DCGD\A_DevSQLAdmins]
GO
USE [assessor_extract]
GO
/****** Object:  User [DCGD\dbrooks]    Script Date: 2/16/2016 3:49:41 PM ******/
CREATE USER [DCGD\dbrooks] FOR LOGIN [DCGD\dbrooks] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [DCGD\dbrooks]
GO
/****** Object:  Schema [rw_extract]    Script Date: 2/16/2016 3:49:41 PM ******/
CREATE SCHEMA [rw_extract]
GO
/****** Object:  Table [rw_extract].[etl_parameter]    Script Date: 2/16/2016 3:49:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [rw_extract].[etl_parameter](
	[PARAMETER_NAME] [varchar](50) NULL,
	[PARAMETER_VALUE] [varchar](100) NULL,
	[PARAMETER_DESCR] [varchar](1000) NULL,
	[CREATE_DTM] [datetime2](7) NULL,
	[CREATE_USER_ID] [varchar](30) NULL,
	[UPDATE_DTM] [datetime2](7) NULL,
	[UPDATE_USER_ID] [varchar](30) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [rw_extract].[etl_parameter_BACKUP]    Script Date: 2/16/2016 3:49:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [rw_extract].[etl_parameter_BACKUP](
	[PARAMETER_NAME] [varchar](50) NOT NULL,
	[PARAMETER_VALUE] [varchar](100) NOT NULL,
	[PARAMETER_DESCR] [varchar](1000) NULL,
	[CREATE_DTM] [varchar](22) NULL,
	[CREATE_USER_ID] [varchar](30) NULL,
	[UPDATE_DTM] [varchar](22) NULL,
	[UPDATE_USER_ID] [varchar](30) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [rw_extract].[etl_parameter_BACKUP2]    Script Date: 2/16/2016 3:49:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [rw_extract].[etl_parameter_BACKUP2](
	[PARAMETER_NAME] [varchar](50) NOT NULL,
	[PARAMETER_VALUE] [varchar](100) NOT NULL,
	[PARAMETER_DESCR] [varchar](1000) NULL,
	[CREATE_DTM] [varchar](22) NULL,
	[CREATE_USER_ID] [varchar](30) NULL,
	[UPDATE_DTM] [varchar](22) NULL,
	[UPDATE_USER_ID] [varchar](30) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [rw_extract].[V_TBLACCT]    Script Date: 2/16/2016 3:49:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE VIEW [rw_extract].[V_TBLACCT]
AS
SELECT T1.VERSTART
      ,T1.VEREND
      ,ACCOUNTNO
      ,PARCELNO
      ,LOCALNO
      ,MAPNO
      ,ACCTSTATUSCODE
      ,ACCTTYPE
      ,ASSIGNEDTO
      ,VALUEAREACODE
      ,ASSOCIATEDACCT
      ,APPRAISALTYPE
      ,ECONOMICAREACODE
      ,CAST(ACCTDATECREATED AS VARCHAR(22) ) ACCTDATECREATED
      ,DEFAULTAPPROACHTYPE
      ,DEFAULTTAXDISTRICT
      ,BUSINESSLICENSE
      ,MAPGROUP
      ,CONTROLMAP
      ,PROPERTYIDENTIFIER
      ,SPECIALINTERESTNUMBER
      ,ACCTON0
      ,ACCTON1
      ,ACCTON2
      ,PRIMARYUSECODE
      ,WARD
      ,CAST(ACCTOD0 AS VARCHAR(22) ) ACCTOD0
      ,CAST(ACCTOD1 AS VARCHAR(22) ) ACCTOD1
      ,ACCTOM0
      ,ACCTOM1
      ,STRIPPEDACCOUNTNO
      ,JURISDICTIONID
      ,ACCTOT0
      ,ACCTOT1
      ,CAST(WRITEDATE AS VARCHAR(22) ) WRITEDATE
      ,CENSUSTRACT
      ,CENSUSBLOCK
      ,MOBILEHOMESPACE
      ,EFILEFLAG
      ,BUSINESSNAME
      ,COSTHYBRIDPERCENT
      ,MARKETHYBRIDPERCENT
      ,INCOMEHYBRIDPERCENT
      ,RECONCILEDHYBRIDPERCENT
      ,PARCELSEQUENCE
      ,PROPERTYCLASSID
      ,SEQID
      ,CAST(DETAILEDREVIEWDATE  AS VARCHAR(22) ) DETAILEDREVIEWDATE
  FROM PRRW.ENCOMPASS.TBLACCT T1
    ,(select cast(parameter_value as numeric) verstart
        from rw_extract.ETL_PARAMETER 
       where PARAMETER_NAME = 'ASR_EXTRACT_VERSION_START_DATE' ) p1
    ,(select cast(parameter_value as numeric) verend
        from rw_extract.ETL_PARAMETER 
       where PARAMETER_NAME = 'ASR_EXTRACT_VERSION_END_DATE' ) p2
where T1.VERSTART <= p1.verstart
  and T1.VEREND > p2.verend;  







GO
/****** Object:  View [rw_extract].[V_TBLACCTLEGAL]    Script Date: 2/16/2016 3:49:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [rw_extract].[V_TBLACCTLEGAL]
AS
SELECT T1.VERSTART
      ,T1.VEREND
      ,ACCOUNTNO
      ,CAST(LEGAL AS VARCHAR(4000) ) LEGAL
      ,ACCTLEGALON0
      ,ACCTLEGALON1
      ,ACCTLEGALON2
      ,CAST(ACCTLEGALOD0 AS VARCHAR(22) ) ACCTLEGALOD0
      ,CAST(ACCTLEGALOD1 AS VARCHAR(22) ) ACCTLEGALOD1
      ,ACCTLEGALOM0
      ,ACCTLEGALOM1
      ,ACCTLEGALOT0
      ,ACCTLEGALOT1
      ,JURISDICTIONID
      ,CAST(WRITEDATE AS VARCHAR(22) ) WRITEDATE
      ,SEQID
      ,SHORTDESCRIPTION
  FROM PRRW.ENCOMPASS.TBLACCTLEGAL T1
    ,(select cast(parameter_value as numeric) verstart
        from rw_extract.ETL_PARAMETER 
       where PARAMETER_NAME = 'ASR_EXTRACT_VERSION_START_DATE' ) p1
    ,(select cast(parameter_value as numeric) verend
        from rw_extract.ETL_PARAMETER 
       where PARAMETER_NAME = 'ASR_EXTRACT_VERSION_END_DATE' ) p2
where T1.VERSTART <= p1.verstart
  and T1.VEREND > p2.verend
  and  ACCOUNTNO not like 'P%';






GO
/****** Object:  View [rw_extract].[V_TBLACCTNBHD]    Script Date: 2/16/2016 3:49:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Object:  View [ODS_EXTRACT_ASR].[V_TBLACCTNBHD]    Script Date: 10/30/2013 11:58:51 AM ******/


CREATE VIEW [rw_extract].[V_TBLACCTNBHD]
AS
SELECT T1.VERSTART
      ,T1.VEREND
      ,ACCOUNTNO
      ,NBHDCODE
      ,NBHDEXTENSION
      ,PROPERTYTYPE
      ,NBHDADJUSTMENTVALUE
      ,ACCTNBHDON0
      ,ACCTNBHDON1
      ,ACCTNBHDON2
      ,CAST(ACCTNBHDOD0 AS VARCHAR(22) ) ACCTNBHDOD0
      ,CAST(ACCTNBHDOD1 AS VARCHAR(22) ) ACCTNBHDOD1
      ,ACCTNBHDOM0
      ,ACCTNBHDOM1
      ,ACCTNBHDOT0
      ,ACCTNBHDOT1
      ,JURISDICTIONID
      ,CAST(WRITEDATE AS VARCHAR(22) )  WRITEDATE
      ,SEQID
  FROM PRRW.ENCOMPASS.TBLACCTNBHD T1
    ,(select cast(parameter_value as numeric) verstart
        from rw_extract.ETL_PARAMETER 
       where PARAMETER_NAME = 'ASR_EXTRACT_VERSION_START_DATE' ) p1
    ,(select cast(parameter_value as numeric) verend
        from rw_extract.ETL_PARAMETER 
       where PARAMETER_NAME = 'ASR_EXTRACT_VERSION_END_DATE' ) p2
where T1.VERSTART <= p1.verstart
  and T1.VEREND > p2.verend;





GO
/****** Object:  View [rw_extract].[V_TBLACCTOWNERADDRESS]    Script Date: 2/16/2016 3:49:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [rw_extract].[V_TBLACCTOWNERADDRESS]
AS
SELECT T1.VERSTART
      ,T1.VEREND
      ,T1.ACCOUNTNO
      ,T1.PERSONCODE
      ,T1.ADDRESSCODE
      ,PRIMARYOWNERFLAG
      ,ACCTOWNERADDRESSON0
      ,ACCTOWNERADDRESSON1
      ,ACCTOWNERADDRESSON2
      ,CAST(ACCTOWNERADDRESSOD0 AS VARCHAR(22) ) ACCTOWNERADDRESSOD0
      ,CAST(ACCTOWNERADDRESSOD1 AS VARCHAR(22) ) ACCTOWNERADDRESSOD1
      ,ACCTOWNERADDRESSOM0
      ,ACCTOWNERADDRESSOM1
      ,ACCTOWNERADDRESSOT0
      ,ACCTOWNERADDRESSOT1
      ,T1.JURISDICTIONID
      ,T1.OWNERPERCENT
      ,CAST(T1.WRITEDATE AS VARCHAR(22) ) WRITEDATE
      ,T1.SEQID
      ,OWNERSHIPTYPE
  FROM PRRW.ENCOMPASS.TBLACCTOWNERADDRESS T1, 
       PRRW.ENCOMPASS.TBLACCT A 
    ,(select cast(parameter_value as numeric) verstart
        from rw_extract.ETL_PARAMETER 
       where PARAMETER_NAME = 'ASR_EXTRACT_VERSION_START_DATE' ) p1
    ,(select cast(parameter_value as numeric) verend
        from rw_extract.ETL_PARAMETER 
       where PARAMETER_NAME = 'ASR_EXTRACT_VERSION_END_DATE' ) p2
where T1.VERSTART <= p1.verstart
  and T1.VEREND > p2.verend
  and A.accountno = T1.accountno
  and A.VERSTART <= p1.verstart
  and A.VEREND > p2.verend; 




GO
/****** Object:  View [rw_extract].[V_TBLACCTPROPERTYADDRESS]    Script Date: 2/16/2016 3:49:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/****** Object:  View [ODS_EXTRACT_ASR].[V_TBLACCTPROPERTYADDRESS]    Script Date: 10/30/2013 11:58:51 AM ******/


CREATE VIEW [rw_extract].[V_TBLACCTPROPERTYADDRESS]
AS
SELECT T1.VERSTART
      ,T1.VEREND
      ,T1.ACCOUNTNO
      ,T1.BUILDINGID
      ,T1.PREDIRECTION
      ,STREETNO
      ,UNITNAME
      ,POSTDIRECTION
      ,STREETTYPE
      ,STREETNAME
      ,PROPERTYZIPCODE
      ,PROPERTYCITY
      ,ORDERNO
      ,ACCTPROPERTYADDRESSON0
      ,ACCTPROPERTYADDRESSON1
      ,ACCTPROPERTYADDRESSON2
      ,T1.BUSINESSNAME
      ,CAST(ACCTPROPERTYADDRESSOD0 AS VARCHAR(22) ) ACCTPROPERTYADDRESSOD0
      ,CAST(ACCTPROPERTYADDRESSOD1 AS VARCHAR(22) ) ACCTPROPERTYADDRESSOD1
      ,ACCTPROPERTYADDRESSOM0
      ,ACCTPROPERTYADDRESSOM1
      ,ACCTPROPERTYADDRESSOT0
      ,ACCTPROPERTYADDRESSOT1
      ,T1.JURISDICTIONID
      ,PROPERTYADDRESSCODE
      ,CAST(T1.WRITEDATE AS VARCHAR(22) ) WRITEDATE
      ,LOCATIONID
      ,T1.SEQID
  FROM PRRW.ENCOMPASS.TBLACCTPROPERTYADDRESS T1
        , PRRW.ENCOMPASS.TBLACCT A
    ,(select cast(parameter_value as numeric) verstart
        from rw_extract.ETL_PARAMETER 
       where PARAMETER_NAME = 'ASR_EXTRACT_VERSION_START_DATE' ) p1
    ,(select cast(parameter_value as numeric) verend
        from rw_extract.ETL_PARAMETER 
       where PARAMETER_NAME = 'ASR_EXTRACT_VERSION_END_DATE' ) p2
where T1.VERSTART <= p1.verstart
  and T1.VEREND > p2.verend
  and A.accountno = T1.accountno
  and A.VERSTART <= p1.verstart
  and A.VEREND > p2.verend;







GO
/****** Object:  View [rw_extract].[V_TBLADDRESSSECURE]    Script Date: 2/16/2016 3:49:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Object:  View [ODS_EXTRACT_ASR].[V_TBLADDRESSSECURE]    Script Date: 10/30/2013 11:58:51 AM ******/


CREATE VIEW [rw_extract].[V_TBLADDRESSSECURE]
AS
SELECT T1.VERSTART
      ,T1.VEREND
      ,ADDRESSCODE
      ,ADDRESS1
      ,ADDRESS2
      ,CITY
      ,STATECODE
      ,ZIPCODE
      ,PERSONCODE
      ,PROVINCE
      ,ADDRESSON0
      ,ADDRESSON1
      ,ADDRESSON2
      ,JURISDICTIONID
      ,COUNTRY
      ,POSTALCODE
      ,CAST(ADDRESSOD0 AS VARCHAR(22) ) ADDRESSOD0
      ,CAST(ADDRESSOD1 AS VARCHAR(22) ) ADDRESSOD1
      ,ADDRESSOM0
      ,ADDRESSOM1
      ,ADDRESSOT0
      ,ADDRESSOT1
      ,ADDRESSVALIDFLAG
      ,CAST(WRITEDATE AS VARCHAR(22) ) WRITEDATE
      ,SEQID
  FROM PRRW.ENCOMPASS.TBLADDRESSSECURE T1
    ,(select cast(parameter_value as numeric) verstart
        from rw_extract.ETL_PARAMETER 
       where PARAMETER_NAME = 'ASR_EXTRACT_VERSION_START_DATE' ) p1
    ,(select cast(parameter_value as numeric) verend
        from rw_extract.ETL_PARAMETER 
       where PARAMETER_NAME = 'ASR_EXTRACT_VERSION_END_DATE' ) p2
where T1.VERSTART <= p1.verstart
  and T1.VEREND > p2.verend;





GO
/****** Object:  View [rw_extract].[V_TBLPERSONSECURE]    Script Date: 2/16/2016 3:49:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Object:  View [ODS_EXTRACT_ASR].[V_TBLPERSONSECURE]    Script Date: 10/30/2013 11:58:51 AM ******/


CREATE VIEW [rw_extract].[V_TBLPERSONSECURE]
AS
SELECT T1.VERSTART
      ,T1.VEREND
      ,PERSONCODE
      ,NAME1
      ,NAME2
      ,PHONE
      ,FAX
      ,MOBILE
      ,PAGER
      ,EMAILADDRESS
      ,FEDERALIDNO
      ,PRIVATEFLAG
      ,PERSONON0
      ,PERSONON1
      ,PERSONON2
      ,ALTNAME1
      ,PERSONTYPEID
      ,JURISDICTIONID
      ,CAST(PERSONOD0 AS VARCHAR(22) ) PERSONOD0
      ,CAST(PERSONOD1 AS VARCHAR(22) ) PERSONOD1 
      ,PERSONOM0
      ,PERSONOM1
      ,PERSONOT0
      ,PERSONOT1
      ,CAST(WRITEDATE AS VARCHAR(22) ) WRITEDATE
      ,SEQID
  FROM PRRW.ENCOMPASS.TBLPERSONSECURE T1
    ,(select cast(parameter_value as numeric) verstart
        from rw_extract.ETL_PARAMETER 
       where PARAMETER_NAME = 'ASR_EXTRACT_VERSION_START_DATE' ) p1
    ,(select cast(parameter_value as numeric) verend
        from rw_extract.ETL_PARAMETER 
       where PARAMETER_NAME = 'ASR_EXTRACT_VERSION_END_DATE' ) p2
where T1.VERSTART <= p1.verstart
  and T1.VEREND > p2.verend;





GO
/****** Object:  View [rw_extract].[V_TBLSUBACCOUNT]    Script Date: 2/16/2016 3:49:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/****** Object:  View [ODS_EXTRACT_ASR].[V_TBLSUBACCOUNT]    Script Date: 10/30/2013 11:58:51 AM ******/


CREATE VIEW [rw_extract].[V_TBLSUBACCOUNT]
AS
SELECT T1.VERSTART
      ,T1.VEREND
      ,SUBNO
      ,FILINGNO
      ,T1.ACCOUNTNO
      ,BLOCK
      ,LOT
      ,TRACT
      ,SUBACCOUNTON0
      ,SUBACCOUNTON1
      ,SUBACCOUNTON2
      ,CAST(SUBACCOUNTOD0 AS VARCHAR(22) ) SUBACCOUNTOD0
      ,CAST(SUBACCOUNTOD1 AS VARCHAR(22) ) SUBACCOUNTOD1
      ,SUBACCOUNTOM0
      ,SUBACCOUNTOM1
      ,SUBACCOUNTOT0
      ,SUBACCOUNTOT1
      ,T1.JURISDICTIONID
      ,CAST(T1.WRITEDATE AS VARCHAR(22) ) WRITEDATE
      ,T1.SEQID
      ,PRIORSUBNO
      ,PRIORFILINGNO
  FROM PRRW.ENCOMPASS.TBLSUBACCOUNT T1
    , PRRW.ENCOMPASS.TBLACCT A
    ,(select cast(parameter_value as numeric) verstart
        from rw_extract.ETL_PARAMETER 
       where PARAMETER_NAME = 'ASR_EXTRACT_VERSION_START_DATE' ) p1
    ,(select cast(parameter_value as numeric) verend
        from rw_extract.ETL_PARAMETER 
       where PARAMETER_NAME = 'ASR_EXTRACT_VERSION_END_DATE' ) p2
where T1.VERSTART <= p1.verstart
  and T1.VEREND > p2.verend
  and A.accountno = T1.accountno
  and A.VERSTART <= p1.verstart
  and A.VEREND > p2.verend;





GO
/****** Object:  View [rw_extract].[V_TBNSUBDIVISION]    Script Date: 2/16/2016 3:49:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [rw_extract].[V_TBNSUBDIVISION]
AS
SELECT SUBNO
      ,SUBNAME
      ,CAST(SUBDATECREATED AS VARCHAR(22) ) SUBDATECREATED
      ,SUBON2
      ,SUBOT0
      ,SUBOT1
      ,CAST(SUBOD0 AS VARCHAR(22) ) SUBOD0
      ,CAST(SUBOD1 AS VARCHAR(22) ) SUBOD1
      ,SUBOM0
      ,SUBOM1
      ,SUBON0
      ,SUBON1
      ,JURISDICTIONID
      ,CAST(LASTUPDATED AS VARCHAR(22) ) LASTUPDATED
  FROM PRRW.ENCOMPASS.TBNSUBDIVISION;


GO
/****** Object:  View [rw_extract].[V_TBNSUBFILING]    Script Date: 2/16/2016 3:49:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








CREATE VIEW [rw_extract].[V_TBNSUBFILING]
AS
SELECT SUBNO
      ,FILINGNO
      ,SUBFILINGDESCRIPTION
      ,SUBFILINGRECORDINGNO
      ,SUBFILINGCITY
      ,DEFAULTSECTION
      ,DEFAULTTOWNSHIP
      ,DEFAULTRANGE
      ,DEFAULTQTR
      ,DEFAULTQTRQTR
      ,CAST(SUBFILINGDATERECORDED AS VARCHAR(22) ) SUBFILINGDATERECORDED
      ,DEFAULTLEA
      ,DEFAULTTAXDISTRICT
      ,MAPNO
      ,ECONOMICAREACODE
      ,ACCOUNTTYPE
      ,LANDCERTIFICATIONCODE
      ,FLAGTYPE
      ,SUBFILINGSTATUS
      ,DEFAULTAPPROACHTYPE
      ,VALUEAREACODE
      ,ZONINGCODE
      ,BLOCKCOUNT
      ,LOTCOUNT
      ,TRACTCOUNT
      ,SUBFILINGMHTITLEFLAG
      ,SUBFILINGNOTESFLAG
      ,SUBFILINGNEWCONSTFLAG
      ,SUBFILINGPHOTOSFLAG
      ,SUBFILINGSKETCHESFLAG
      ,SUBFILINGTAXYEAR
      ,SUBFILINGON0
      ,SUBFILINGON1
      ,SUBFILINGON2
      ,ASSIGNEDTO
      ,CAST(SUBFILINGOD0 AS VARCHAR(22) ) SUBFILINGOD0
      ,CAST(SUBFILINGOD1 AS VARCHAR(22) ) SUBFILINGOD1
      ,SUBFILINGOM0
      ,SUBFILINGOM1
      ,SUBFILINGOT0
      ,SUBFILINGOT1
      ,JURISDICTIONID
      ,CAST(DEFAULTLEGAL AS VARCHAR(4000) ) DEFAULTLEGAL
      ,CAST(LASTUPDATED AS VARCHAR(22) ) LASTUPDATED
      ,PRIMARYUSECODE
      ,APPRAISALTYPE
  FROM PRRW.ENCOMPASS.TBNSUBFILING;


GO
/****** Object:  View [rw_extract].[V_TLKPACCTTYPE]    Script Date: 2/16/2016 3:49:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [rw_extract].[V_TLKPACCTTYPE]
AS
SELECT ACCTTYPE
      ,APPRAISALTYPE
      ,SORTORDER
      ,ACTIVEFLAG
      ,MHLPFLAG
      ,JURISDICTIONID
      ,MASSINCLUDEFLAG
      ,CAST(LASTUPDATED AS VARCHAR(22) ) LASTUPDATED 
FROM PRRW.ENCOMPASS.TLKPACCTTYPE;


GO
/****** Object:  View [rw_extract].[V_TLKPSTATUSACCT]    Script Date: 2/16/2016 3:49:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [rw_extract].[V_TLKPSTATUSACCT]
AS
SELECT ACCTSTATUSCODE
      ,ACCTSTATUSDESCRIPTION
      ,ACTIVEFLAG
      ,SORTORDER
      ,JURISDICTIONID
      ,CAST(LASTUPDATED AS VARCHAR(22) ) LASTUPDATED
FROM PRRW.ENCOMPASS.TLKPSTATUSACCT;





GO
/****** Object:  View [rw_extract].[V_TLKPTAXAUTHORITY]    Script Date: 2/16/2016 3:49:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [rw_extract].[V_TLKPTAXAUTHORITY]
AS
SELECT TAXAUTHORITY
      ,STATEAUTHORITYCODE
      ,AUTHORITYTYPE
      ,AUTHORITYNAME
      ,CAST(CREATIONDATE AS VARCHAR(22) ) CREATIONDATE
      ,CONTACTPERSON
      ,CONTACTADDRESS1
      ,CONTACTADDRESS2
      ,CONTACTCITY
      ,CONTACTSTATE
      ,CONTACTZIPCODE
      ,AFFILIATE
      ,AUTHORITYSIZE
      ,SORTORDER
      ,ACTIVEFLAG
      ,JURISDICTIONID
      ,CAST(LASTUPDATED AS VARCHAR(22) ) LASTUPDATED
      ,CONTACTPHONE
      ,AUTHORITYVALUETYPE
      ,ISURBANRENEWALAUTHORIZERFLAG
FROM PRRW.ENCOMPASS.TLKPTAXAUTHORITY;


GO
/****** Object:  View [rw_extract].[V_TLKPTAXAUTHORITYDETAIL]    Script Date: 2/16/2016 3:49:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [rw_extract].[V_TLKPTAXAUTHORITYDETAIL]
AS
SELECT TAXAUTHORITY
      ,T1.TAXYEAR
      ,NETASSESSED
      ,GROSSASSESSED
      ,TIFDISTRICTINCREMENT
      ,NEWCONSTRUCTION
      ,PRODUCINGMINEINCREMENT
      ,ANNEXINCLUSIONS
      ,PREVIOUSEXEMPTFEDERAL
      ,NEWPRIMARYOIL
      ,TAXOMITTEDPROPERTY
      ,TAXESABATEDREFUNDED
      ,REALACTUALVALUE
      ,REALNEWCONSTACTUALVALUE
      ,NEWANNEXACTUALVALUE
      ,PRODUCINGMINEACTUALVALUE
      ,PREVIOUSEXEMPTACTUALVALUE
      ,NEWWELLPRODUCINGACTUALVALUE
      ,REALOMITTEDACTUALVALUE
      ,REALDESTROYEDACTUALVALUE
      ,DISCONNECTEXCLACTUALVALUE
      ,PREVIOUSTAXACTUALVALUE
      ,GROSSACTUALVALUE
      ,ACTIVEFLAG
      ,SORTORDER
      ,JURISDICTIONID
      ,MAXASSESSEDMILLLEVY
      ,CAST(LASTUPDATED AS VARCHAR(22) ) LASTUPDATED
FROM PRRW.ENCOMPASS.TLKPTAXAUTHORITYDETAIL  T1
    ,(SELECT  cast(parameter_value AS numeric(4,0)) taxyear 
        from rw_extract.ETL_PARAMETER 
       where PARAMETER_NAME = 'ASSESSMENT_TAX_YEAR' ) P1
WHERE T1.TAXYEAR = p1.taxyear;


GO
/****** Object:  View [rw_extract].[V_TLKPTAXDISTRICT]    Script Date: 2/16/2016 3:49:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [rw_extract].[V_TLKPTAXDISTRICT]
AS
SELECT TAXDISTRICT
      ,TAXDISTRICTNAME
      ,TAXAREA
      ,CAST(CREATIONDATE AS VARCHAR(22) ) CREATIONDATE
      ,SORTORDER
      ,ACTIVEFLAG
      ,JURISDICTIONID
      ,TAXDISTRICTCATEGORY
      ,CAST(LASTUPDATED AS VARCHAR(22) ) LASTUPDATED
      ,TAXDISTRICTTYPE
      ,TAXDISTRICTID
      ,ASSOCIATEDURBANRENEWALPLAN
      ,REPORTINGTAXDISTRICT 
FROM PRRW.ENCOMPASS.TLKPTAXDISTRICT;


GO
/****** Object:  View [rw_extract].[V_TMAPTAXDISTRICTAUTHORITY]    Script Date: 2/16/2016 3:49:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [rw_extract].[V_TMAPTAXDISTRICTAUTHORITY]
AS
SELECT --details for the ASSESSMENT_TAX_YEAR
       TAXDISTRICT
      ,TAXAUTHORITY
      ,T1.TAXYEAR
      ,SORTORDER
      ,JURISDICTIONID
      ,CAST(LASTUPDATED AS VARCHAR(22) ) LASTUPDATED
      ,TIFAUTHORITY
      ,TIFPERCENTAGE
      ,EXCESSVALUE
      ,EXCESSVALUENOTUSED
FROM PRRW.ENCOMPASS.TMAPTAXDISTRICTAUTHORITY T1
    ,(SELECT  cast(parameter_value AS numeric(4,0)) taxyear 
        from rw_extract.ETL_PARAMETER 
       where PARAMETER_NAME = 'ASSESSMENT_TAX_YEAR' ) P1
WHERE T1.TAXYEAR = p1.taxyear
UNION ALL
SELECT --add last known details for tax_districts that are no longer active but are needed for references by 
       --inactive or deleted accounts
	   X.TAXDISTRICT
      ,X.TAXAUTHORITY
      ,X.TAXYEAR
      ,X.SORTORDER
      ,X.JURISDICTIONID
      ,CAST(X.LASTUPDATED AS VARCHAR(22) ) LASTUPDATED
      ,X.TIFAUTHORITY
      ,X.TIFPERCENTAGE
      ,X.EXCESSVALUE
      ,X.EXCESSVALUENOTUSED
FROM PRRW.ENCOMPASS.TMAPTAXDISTRICTAUTHORITY X
INNER JOIN ( --identify the last known details
			select O.TAXDISTRICT
				  ,MAX(O.TAXYEAR) AS LAST_KNOWN_TAXYEAR
			FROM PRRW.ENCOMPASS.TMAPTAXDISTRICTAUTHORITY O
			LEFT OUTER JOIN (SELECT DISTINCT TAXDISTRICT 
							  FROM PRRW.ENCOMPASS.TMAPTAXDISTRICTAUTHORITY T1
							  INNER JOIN (SELECT CAST(parameter_value AS NUMERIC(4,0)) taxyear 
										  FROM   rw_extract.ETL_PARAMETER 
										  WHERE  PARAMETER_NAME = 'ASSESSMENT_TAX_YEAR' ) P1
							  ON T1.TAXYEAR = P1.taxyear
							) C
			ON O.TAXDISTRICT = C.TAXDISTRICT 
			WHERE C.TAXDISTRICT IS NULL
			GROUP BY O.TAXDISTRICT ) L
ON X.TAXDISTRICT = L.TAXDISTRICT 
AND X.TAXYEAR = L.LAST_KNOWN_TAXYEAR;



GO
/****** Object:  View [rw_extract].[V_TMAPTAXDISTRICTAUTHORITY_orig]    Script Date: 2/16/2016 3:49:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [rw_extract].[V_TMAPTAXDISTRICTAUTHORITY_orig]
AS
SELECT TAXDISTRICT
      ,TAXAUTHORITY
      ,T1.TAXYEAR
      ,SORTORDER
      ,JURISDICTIONID
      ,CAST(LASTUPDATED AS VARCHAR(22) ) LASTUPDATED
      ,TIFAUTHORITY
      ,TIFPERCENTAGE
      ,EXCESSVALUE
      ,EXCESSVALUENOTUSED
FROM PRRW.ENCOMPASS.TMAPTAXDISTRICTAUTHORITY T1
    ,(SELECT  cast(parameter_value AS numeric(4,0)) taxyear 
        from rw_extract.ETL_PARAMETER 
       where PARAMETER_NAME = 'ASSESSMENT_TAX_YEAR' ) P1
WHERE T1.TAXYEAR = p1.taxyear;



GO
/****** Object:  StoredProcedure [rw_extract].[update_etl_parameter_table]    Script Date: 2/16/2016 3:49:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		David Guillen
-- Create date: 01/28/2016
-- Description:	udpate etl parameter table extract ver start and end with completion date
-- =============================================

CREATE PROCEDURE [rw_extract].[update_etl_parameter_table]
	-- Add the parameters for the stored procedure here
	
	

AS
BEGIN

	DECLARE @v_ext_date_as_text  VARCHAR(12)

    SELECT @v_ext_date_as_text = CAST(YEAR(GETDATE()) AS VARCHAR)+RIGHT('0' + RTRIM(MONTH(getdate())), 2)+RIGHT('0' + RTRIM(DAY(getdate())), 2)+'999'


    UPDATE [rw_extract].[ETL_PARAMETER] SET PARAMETER_VALUE = @v_ext_date_as_text
	   WHERE PARAMETER_NAME = 'ASR_EXTRACT_VERSION_START_DATE'
	UPDATE [rw_extract].[ETL_PARAMETER] SET PARAMETER_VALUE = @v_ext_date_as_text
	   WHERE PARAMETER_NAME = 'ASR_EXTRACT_VERSION_END_DATE'

    UPDATE [rw_extract].[ETL_PARAMETER] SET PARAMETER_VALUE = getdate()
	   WHERE PARAMETER_NAME = 'ASR_LAST_REFREST_START_DATE'
	UPDATE [rw_extract].[ETL_PARAMETER] SET PARAMETER_VALUE = getdate()
	   WHERE PARAMETER_NAME = 'ASR_LAST_REFRESH_END_DATE'

	UPDATE [rw_extract].[ETL_PARAMETER] SET PARAMETER_VALUE = getdate()
	   WHERE PARAMETER_NAME = 'ASR_ODS_LAST_LOAD_HIST_START_DATE'
	UPDATE [rw_extract].[ETL_PARAMETER] SET PARAMETER_VALUE = getdate()
	   WHERE PARAMETER_NAME = 'ASR_ODS_LAST_LOAD_HIST_END_DATE'



END



GO
USE [master]
GO
ALTER DATABASE [assessor_extract] SET  READ_WRITE 
GO
