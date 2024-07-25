CREATE TABLE [Reporting].[TBLMLSHISTORY] (
    [TBLMLSHISTORY]      INT              IDENTITY (1, 1) NOT NULL,
    [MLSMONTH]           INT              NOT NULL,
    [MLSYEAR]            INT              NOT NULL,
    [MLSTYPE]            VARCHAR (25)     NOT NULL,
    [MONTHSOFINVENTORY]  INT              NULL,
    [ACTIVELISTINGCOUNT] INT              NULL,
    [AVGDOM]             INT              NULL,
    [MEDIANDOM]          INT              NULL,
    [SALESCOUNT]         INT              NULL,
    [AVGLISTPRICE]       NUMERIC (15)     NULL,
    [MEDIANLISTPRICE]    NUMERIC (15)     NULL,
    [AVGCLOSEPRICE]      NUMERIC (15)     NULL,
    [MEDIANCLOSEPRICE]   NUMERIC (15)     NULL,
    [Create_Datetime]    DATETIME2 (7)    NULL,
    [Create_User_ID]     VARCHAR (60)     NULL,
    [Update_Datetime]    DATETIME2 (7)    NULL,
    [Update_User_ID]     VARCHAR (60)     NULL,
    [Rowhash]            VARBINARY (8000) NULL,
    CONSTRAINT [PK_Reporting_TBLMLSHISTORY] PRIMARY KEY CLUSTERED ([TBLMLSHISTORY] ASC)
);





