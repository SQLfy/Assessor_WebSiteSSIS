CREATE PROCEDURE [asr_app].[sp_account_notification_merge]
AS /**************************************Comments***************************************
Mod #:  1
Mod Date:     02/03/2023
Developer:    Paul Mathews
Comments:	  Initial creation
*************************************************************************************/
BEGIN
	SET NOCOUNT ON;

	delete from asr_app.account_notification 
	where noteid = 0

	MERGE asr_app.account_notification AS myTarget
	USING assessor_datastore.asr_datastore.account_notification AS mySource
	ON  
		myTarget.account_no = mySource.ACCOUNTNO
		AND myTarget.noteid = mySource.NOTEID

	WHEN MATCHED 
		AND (  myTarget.[note]				<> mySource.NOTE
			or myTarget.[note_description]	<> mySource.[NOTE_DESC]
			or myTarget.[note_active]		<> mySource.[NOTE_ACTIVE] )
		 THEN
			UPDATE SET  myTarget.[NOTE]				= mySource.NOTE
					   ,myTarget.[note_description]	= mySource.[NOTE_DESC]
					   ,myTarget.[NOTE_ACTIVE]		= mySource.[NOTE_ACTIVE]
					   ,myTarget.[update_datetime]	= SYSDATETIME()
					   ,myTarget.[update_user_id]	= SUSER_SNAME()

	WHEN NOT MATCHED BY TARGET 
		 THEN
		 INSERT (account_no
				,noteid
				,note
				,note_description
				,note_active
				,create_datetime
				,create_user_id
				)
		 VALUES (mySource.ACCOUNTNO 
				,mySource.NOTEID
				,mySource.NOTE
				,mySource.NOTE_DESC
				,mySource.NOTE_ACTIVE
				,SYSDATETIME()
				,SUSER_SNAME()			      
				)

	WHEN NOT MATCHED BY SOURCE
		 THEN
		 DELETE;

	insert into [asr_app].[account_notification] ([account_no],[noteid],[note],[note_description],[note_active])
	select 
		a.account_no
		,0
		,''
		,'Blank Note'
		,'Y'
	from [asr_app].[account] a
		where not exists (select * from [asr_app].[account_notification] n where n.account_no = a.account_no)

END