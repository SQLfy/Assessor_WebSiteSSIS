CREATE TABLE [Reporting].[RESMODELSALES] (
    [RESMODELSALESID] INT              IDENTITY (1, 1) NOT NULL,
    [NBHD]            VARCHAR (21)     NOT NULL,
    [SUBNAME]         VARCHAR (255)    NOT NULL,
    [ACCOUNTNO]       VARCHAR (30)     NOT NULL,
    [PARCELNO]        VARCHAR (30)     NULL,
    [STREETADDRESS]   VARCHAR (100)    NULL,
    [PLANMODEL]       VARCHAR (30)     NULL,
    [RECEPTIONNO]     VARCHAR (30)     NULL,
    [SALEDATE]        DATE             NULL,
    [ADJSALEPRICE]    NUMERIC (15, 2)  NULL,
    [TASP]            NUMERIC (15, 2)  NULL,
    [VALID1FLAG]      NUMERIC (18)     NULL,
    [EXCLUDECODE1]    VARCHAR (10)     NULL,
    [NEWCONSTRUCTION] NUMERIC (18)     NULL,
    [SALESRATIO]      NUMERIC (15, 10) NULL,
    [CURRENTVALUE]    NUMERIC (15, 2)  NOT NULL,
    [CURRENTYEAR]     NUMERIC (4)      NOT NULL,
    [Create_Datetime] DATETIME2 (7)    NULL,
    [Create_User_ID]  VARCHAR (60)     NULL,
    [Update_Datetime] DATETIME2 (7)    NULL,
    [Update_User_ID]  VARCHAR (60)     NULL,
    [Rowhash]         VARBINARY (8000) NULL,
    CONSTRAINT [PK_Reporting_RESMODELSALES] PRIMARY KEY CLUSTERED ([RESMODELSALESID] ASC)
);




GO



GO



GO



GO


