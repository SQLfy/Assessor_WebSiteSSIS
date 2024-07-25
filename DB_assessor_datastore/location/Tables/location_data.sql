CREATE TABLE [location].[location_data] (
    [Account_Number]      VARCHAR (50)    NULL,
    [State_Parcel_number] NVARCHAR (15)   NULL,
    [x]                   NUMERIC (30, 8) NULL,
    [y]                   NUMERIC (30, 8) NULL,
    [Location]            NVARCHAR (32)   NULL,
    [write_date]          DATETIME2 (7)   DEFAULT (getdate()) NULL
);

