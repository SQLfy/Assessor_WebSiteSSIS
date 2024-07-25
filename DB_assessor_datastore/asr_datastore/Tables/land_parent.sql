CREATE TABLE [asr_datastore].[land_parent] (
    [state_parcel_no]  VARCHAR (30) NOT NULL,
    [parent_parcel_no] VARCHAR (30) NOT NULL,
    [create_dtm]       DATETIME     NULL,
    [create_user_id]   VARCHAR (30) CONSTRAINT [DF_land_parent_CREATE_USER_ID] DEFAULT ('SSIS_ETL') NULL,
    [update_dtm]       DATETIME     NULL,
    [update_user_id]   VARCHAR (30) NULL,
    CONSTRAINT [PK_land_parent] PRIMARY KEY CLUSTERED ([state_parcel_no] ASC, [parent_parcel_no] ASC)
);

