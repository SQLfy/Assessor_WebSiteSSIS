CREATE TABLE [asr_staging].[s_account_location] (
    [Account_Number]      VARCHAR (50)    NULL,
    [State_Parcel_number] NVARCHAR (15)   NULL,
    [longitude_x]         NUMERIC (30, 8) NULL,
    [latitude_y]          NUMERIC (30, 8) NULL,
    [elevation_z]         NUMERIC (30, 8) NULL,
    [Location]            NVARCHAR (50)   NULL,
    [ETL_RUN_TIME]        DATETIME2 (7)   DEFAULT (getdate()) NULL
);

