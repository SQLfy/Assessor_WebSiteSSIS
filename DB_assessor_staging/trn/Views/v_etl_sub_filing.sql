






CREATE VIEW [trn].[v_etl_sub_filing]
/**************************************Comments***************************************
**************************************************************************************
Mod #:  1
Mod Date:      1/27/2016
Developer:     Christine Lin
Comments:      Initial creation
               List all subdivision filings
*************************************************************************************/
AS
SELECT sf.SUBNO AS sub_filing_recording_no
      ,sf.SUBFILINGRECORDINGNO AS subdivision_no
	  ,s.SUBNAME AS subdivision_name
	  ,sf.FILINGNO AS filing_no
	  ,sf.SUBFILINGDESCRIPTION AS filing_description
	  ,NULL AS dedicated_sub_filing_name
	  ,GETDATE() AS create_datetime
	  ,SUSER_NAME () AS create_user_id
	  ,HASHBYTES('SHA2_256', 
				  ISNULL(RTRIM(sf.SUBNO), 'DBNULL_TEXT') 
				+ ISNULL(RTRIM(sf.SUBFILINGRECORDINGNO), 'DBNULL_TEXT') 
				+ ISNULL(RTRIM(s.SUBNAME), 'DBNULL_TEXT') 
				+ ISNULL(RTRIM(sf.FILINGNO), 'DBNULL_TEXT') 
				+ ISNULL(RTRIM(sf.SUBFILINGDESCRIPTION), 'DBNULL_TEXT') 
				) AS rowhash
  FROM dqm.q_tbnsubfiling sf
  INNER JOIN asr_staging.s_tbnsubdivision s 
        ON sf.SUBNO = s.SUBNO;









