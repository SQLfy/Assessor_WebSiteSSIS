CREATE TABLE [asr_api_test].[SearchSubdivision] (
    [id]                      INT           IDENTITY (1, 1) NOT NULL,
    [accountNumber]           VARCHAR (30)  NOT NULL,
    [subdivision_name]        VARCHAR (255) NOT NULL,
    [subdivision_no]          VARCHAR (30)  NOT NULL,
    [sub_filing_recording_no] VARCHAR (30)  NOT NULL,
    [filing_description]      VARCHAR (80)  NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

