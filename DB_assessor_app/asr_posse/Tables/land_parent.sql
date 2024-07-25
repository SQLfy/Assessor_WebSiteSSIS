CREATE TABLE [asr_posse].[land_parent] (
    [land_parent_eid]  NUMERIC (38) IDENTITY (1, 1) NOT NULL,
    [state_parcel_no]  VARCHAR (30) NOT NULL,
    [parent_parcel_no] VARCHAR (30) NOT NULL,
    [create_dtm]       VARCHAR (20) NULL,
    [create_user_id]   VARCHAR (30) CONSTRAINT [DF_land_parent_CREATE_USER_ID] DEFAULT ('SSIS_ETL') NULL,
    [update_dtm]       VARCHAR (20) NULL,
    [update_user_id]   VARCHAR (30) NULL
);

