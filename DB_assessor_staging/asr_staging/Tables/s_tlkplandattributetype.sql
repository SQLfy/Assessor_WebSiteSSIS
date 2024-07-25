CREATE TABLE [asr_staging].[s_tlkplandattributetype] (
    [ATTRIBUTETYPE]             VARCHAR (30)    NULL,
    [ATTRIBUTESUBTYPE]          VARCHAR (50)    NULL,
    [ATTRIBUTEADJUSTMENT]       NUMERIC (15, 6) NULL,
    [FILTERTYPE]                VARCHAR (15)    NULL,
    [ACTIVEFLAG]                NUMERIC (1)     NULL,
    [USEINANALYSISFLAG]         NUMERIC (1)     NULL,
    [JURISDICTIONID]            NUMERIC (15)    NULL,
    [SORTORDER]                 NUMERIC (9)     NULL,
    [LASTUPDATED]               VARCHAR (22)    NULL,
    [EXECUTIONORDER]            NUMERIC (9)     NULL,
    [ADJUSTMENTCALCULATIONTYPE] VARCHAR (1)     NULL
);

