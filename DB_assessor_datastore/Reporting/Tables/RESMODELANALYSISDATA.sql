CREATE TABLE [Reporting].[RESMODELANALYSISDATA] (
    [RESMODELANALYSISDATAID] INT              IDENTITY (1, 1) NOT NULL,
    [NBHD]                   VARCHAR (21)     NOT NULL,
    [SUBNAME]                VARCHAR (255)    NOT NULL,
    [ACCOUNTNO]              VARCHAR (30)     NOT NULL,
    [PARCELNO]               VARCHAR (30)     NULL,
    [STREETADDRESS]          VARCHAR (100)    NULL,
    [ANALYSISMODEL]          VARCHAR (30)     NULL,
    [PLANMODEL]              VARCHAR (30)     NULL,
    [ADJYEARBUILT]           NUMERIC (18)     NULL,
    [IMPQUALITY]             VARCHAR (15)     NULL,
    [PROPERTYTYPE]           VARCHAR (15)     NULL,
    [IMPUNITTYPE]            VARCHAR (30)     NULL,
    [CURRIMPCOUNT]           NUMERIC (18)     NULL,
    [BLTASDESCRIPTION]       VARCHAR (50)     NOT NULL,
    [HVACTYPE]               VARCHAR (30)     NULL,
    [BATHCOUNT]              NUMERIC (7, 2)   NULL,
    [FPCOUNT]                NUMERIC (18)     NULL,
    [BLTASSF]                NUMERIC (18)     NULL,
    [BASEMENTSF]             NUMERIC (18)     NULL,
    [FINISHEDBASEMENTSF]     NUMERIC (18)     NULL,
    [GARAGESF]               NUMERIC (18)     NULL,
    [CARPORTSF]              NUMERIC (18)     NULL,
    [PORCHSF]                NUMERIC (18)     NULL,
    [BASEMENT]               VARCHAR (50)     NULL,
    [LANDSF]                 NUMERIC (20, 6)  NULL,
    [GOLF]                   VARCHAR (50)     NULL,
    [GREENBELT]              VARCHAR (50)     NULL,
    [POWERLINE]              VARCHAR (50)     NULL,
    [SUPVIEW]                VARCHAR (50)     NULL,
    [TRAFFIC]                VARCHAR (50)     NULL,
    [CULDESAC]               VARCHAR (50)     NULL,
    [TREED]                  VARCHAR (50)     NULL,
    [CORNERLOT]              VARCHAR (50)     NULL,
    [RAILROAD]               VARCHAR (50)     NULL,
    [UNPAVEDROAD]            VARCHAR (50)     NULL,
    [RECEPTIONNO]            VARCHAR (30)     NULL,
    [SALEDATE]               DATE             NULL,
    [ADJSALEPRICE]           NUMERIC (15, 2)  NULL,
    [TASP]                   NUMERIC (15, 2)  NULL,
    [VALID1FLAG]             NUMERIC (18)     NULL,
    [EXCLUDECODE1]           VARCHAR (10)     NULL,
    [NEWCONSTRUCTION]        NUMERIC (18)     NULL,
    [SALESRATIO]             NUMERIC (15, 10) NULL,
    [PREVIOUSVALUE]          NUMERIC (15, 2)  NOT NULL,
    [PREVIOUSYEAR]           NUMERIC (4)      NOT NULL,
    [CURRENTVALUE]           NUMERIC (15, 2)  NOT NULL,
    [CURRENTYEAR]            NUMERIC (4)      NOT NULL,
    [VALUECHANGE]            NUMERIC (15, 10) NULL,
    [PRICEPERSF]             NUMERIC (15, 2)  NULL,
    [COUNTAPPEAL]            NUMERIC (18)     NULL,
    [UNIQUEFEATURE]          VARCHAR (1000)   NULL,
    [AG]                     NUMERIC (18)     NOT NULL,
    [SALEPRICEPERSF]         NUMERIC (15, 2)  NULL,
    [Create_Datetime]        DATETIME2 (7)    NULL,
    [Create_User_ID]         VARCHAR (60)     NULL,
    [Update_Datetime]        DATETIME2 (7)    NULL,
    [Update_User_ID]         VARCHAR (60)     NULL,
    [Rowhash]                VARBINARY (8000) NULL,
    CONSTRAINT [PK_Reporting_RESMODELANALYSISDATA] PRIMARY KEY CLUSTERED ([RESMODELANALYSISDATAID] ASC)
);






GO



GO



GO



GO


