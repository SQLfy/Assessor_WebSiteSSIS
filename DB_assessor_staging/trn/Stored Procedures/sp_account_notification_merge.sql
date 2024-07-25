CREATE PROCEDURE [trn].[sp_account_notification_merge]
AS /**************************************Comments***************************************
**************************************************************************************
Mod #:	Mod Date:   Developer:		Comments:	  
1		02/03/2023	Paul Mathews	Initital Creation
*************************************************************************************/
BEGIN
	SET NOCOUNT ON;

	DECLARE @account_notification as table (
		[ACCOUNTNO] [varchar](30) NOT NULL,
		[NOTEID] [int] NOT NULL,
		[NOTE] [nvarchar](1000) NULL,
		[NOTE_DESC] [nvarchar](4000) NULL,
		[NOTE_ACTIVE] [nchar](1) NULL,
		[NOTE_VALID_FROM] [date] NULL,
		[NOTE_VALID_TO] [date] NULL
		PRIMARY KEY CLUSTERED ([ACCOUNTNO] ASC,[NOTEID] ASC)
	);

	WITH tmp(ACCOUNTNO, NoteId, String) AS (
		SELECT
			ACCOUNTNO,
			DataItem = convert(varchar(30),LEFT(LOCALNO, CHARINDEX(',', LOCALNO + ',') - 1)),
			STUFF(LOCALNO, 1, CHARINDEX(',', LOCALNO + ','), '')
		FROM [asr_staging].[s_tblacct]
		where LOCALNO is not null
		UNION all
		SELECT
			ACCOUNTNO,
			DataItem = convert(varchar(30),LEFT(String, CHARINDEX(',', String + ',') - 1)),
			STUFF(String, 1, CHARINDEX(',', String + ','), '')
		FROM tmp
		WHERE String > ''
	)
	insert into @account_notification (ACCOUNTNO, NOTEID, NOTE, NOTE_DESC, NOTE_ACTIVE, NOTE_VALID_FROM, NOTE_VALID_TO)
	select 
		a.ACCOUNTNO
		,NoteId = try_convert(int,a.NoteId)
		,NOTE = isnull(w.NOTE,'')
		,w.NOTE_DESC
		,w.NOTE_ACTIVE
		,w.NOTE_VALID_FROM
		,w.NOTE_VALID_TO
	from tmp a 
		join [asr_staging].[s_tblacctwebnotes] w on a.NoteId = w.NOTEID
	where try_convert(int,a.NoteId) is not null

	MERGE assessor_datastore.asr_datastore.account_notification AS t
	USING @account_notification AS s
	ON 
		t.ACCOUNTNO = s.ACCOUNTNO
		AND t.NOTEID = s.NOTEID
	WHEN MATCHED 
		AND (  t.[NOTE] <> s.NOTE
			or t.[NOTE_DESC] <> s.[NOTE_DESC]
			or t.[NOTE_ACTIVE] <> s.[NOTE_ACTIVE]
			or t.[NOTE_VALID_FROM] <> s.[NOTE_VALID_FROM]
			or t.[NOTE_VALID_TO] <> s.[NOTE_VALID_TO])
		 THEN
			UPDATE SET  t.[NOTE] = s.NOTE
					   ,t.[NOTE_DESC] = s.[NOTE_DESC]
					   ,t.[NOTE_ACTIVE] = s.[NOTE_ACTIVE]
					   ,t.[NOTE_VALID_FROM] = s.[NOTE_VALID_FROM]
					   ,t.[NOTE_VALID_TO] = s.[NOTE_VALID_TO]

	WHEN NOT MATCHED BY TARGET 
		 THEN
		 INSERT (
				ACCOUNTNO
				,NOTEID
				,NOTE
				,NOTE_DESC
				,NOTE_ACTIVE
				,NOTE_VALID_FROM
				,NOTE_VALID_TO
				)
		 VALUES (
				 s.ACCOUNTNO
				,s.NOTEID
				,s.NOTE
				,s.NOTE_DESC
				,s.NOTE_ACTIVE
				,s.NOTE_VALID_FROM
				,s.NOTE_VALID_TO
				)

	WHEN NOT MATCHED BY SOURCE
		 THEN
		 DELETE;

END