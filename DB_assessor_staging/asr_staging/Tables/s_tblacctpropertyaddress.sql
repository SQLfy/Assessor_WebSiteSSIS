﻿CREATE TABLE [asr_staging].[s_tblacctpropertyaddress] (
    [VERSTART]               NUMERIC (11)    NULL,
    [VEREND]                 NUMERIC (11)    NULL,
    [ACCOUNTNO]              VARCHAR (30)    NULL,
    [BUILDINGID]             VARCHAR (10)    NULL,
    [PREDIRECTION]           VARCHAR (2)     NULL,
    [STREETNO]               VARCHAR (15)    NULL,
    [UNITNAME]               VARCHAR (6)     NULL,
    [POSTDIRECTION]          VARCHAR (2)     NULL,
    [STREETTYPE]             VARCHAR (4)     NULL,
    [STREETNAME]             VARCHAR (50)    NULL,
    [PROPERTYZIPCODE]        VARCHAR (10)    NULL,
    [PROPERTYCITY]           VARCHAR (50)    NULL,
    [ORDERNO]                NUMERIC (5)     NULL,
    [ACCTPROPERTYADDRESSON0] NUMERIC (20, 6) NULL,
    [ACCTPROPERTYADDRESSON1] NUMERIC (20, 6) NULL,
    [ACCTPROPERTYADDRESSON2] NUMERIC (20, 6) NULL,
    [BUSINESSNAME]           VARCHAR (255)   NULL,
    [ACCTPROPERTYADDRESSOD0] VARCHAR (22)    NULL,
    [ACCTPROPERTYADDRESSOD1] VARCHAR (22)    NULL,
    [ACCTPROPERTYADDRESSOM0] VARCHAR (50)    NULL,
    [ACCTPROPERTYADDRESSOM1] VARCHAR (50)    NULL,
    [ACCTPROPERTYADDRESSOT0] VARCHAR (50)    NULL,
    [ACCTPROPERTYADDRESSOT1] VARCHAR (50)    NULL,
    [JURISDICTIONID]         NUMERIC (15)    NULL,
    [PROPERTYADDRESSCODE]    NUMERIC (15)    NULL,
    [WRITEDATE]              VARCHAR (22)    NULL,
    [LOCATIONID]             NUMERIC (15)    NULL,
    [SEQID]                  NUMERIC (15)    NULL,
    [ETL_RUN_TIME]           DATETIME2 (7)   DEFAULT (getdate()) NULL
);


GO
CREATE CLUSTERED INDEX [IX_s_tblacctpropertyaddress_accountno]
    ON [asr_staging].[s_tblacctpropertyaddress]([ACCOUNTNO] ASC);
