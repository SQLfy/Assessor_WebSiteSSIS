CREATE TABLE [asr_staging].[s_tblpersonsecure] (
    [VERSTART]       NUMERIC (11)    NULL,
    [VEREND]         NUMERIC (11)    NULL,
    [PERSONCODE]     NUMERIC (15)    NULL,
    [NAME1]          VARCHAR (60)    NULL,
    [NAME2]          VARCHAR (60)    NULL,
    [PHONE]          VARCHAR (18)    NULL,
    [FAX]            VARCHAR (18)    NULL,
    [MOBILE]         VARCHAR (18)    NULL,
    [PAGER]          VARCHAR (18)    NULL,
    [EMAILADDRESS]   VARCHAR (100)   NULL,
    [FEDERALIDNO]    VARCHAR (30)    NULL,
    [PRIVATEFLAG]    NUMERIC (1)     NULL,
    [PERSONON0]      NUMERIC (20, 6) NULL,
    [PERSONON1]      NUMERIC (20, 6) NULL,
    [PERSONON2]      NUMERIC (20, 6) NULL,
    [ALTNAME1]       VARCHAR (60)    NULL,
    [PERSONTYPEID]   NUMERIC (15)    NULL,
    [JURISDICTIONID] NUMERIC (15)    NULL,
    [PERSONOD0]      VARCHAR (22)    NULL,
    [PERSONOD1]      VARCHAR (22)    NULL,
    [PERSONOM0]      VARCHAR (50)    NULL,
    [PERSONOM1]      VARCHAR (50)    NULL,
    [PERSONOT0]      VARCHAR (50)    NULL,
    [PERSONOT1]      VARCHAR (50)    NULL,
    [WRITEDATE]      VARCHAR (22)    NULL,
    [SEQID]          NUMERIC (15)    NULL,
    [ETL_RUN_TIME]   DATETIME2 (7)   DEFAULT (getdate()) NULL
);


GO
CREATE NONCLUSTERED INDEX [IX_s_tblpersonsecure_NonClusteredIndex-NAME1]
    ON [asr_staging].[s_tblpersonsecure]([NAME1] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_s_tblpersonsecure_NonClusteredIndex-NAME2]
    ON [asr_staging].[s_tblpersonsecure]([NAME2] ASC);


GO
CREATE NONCLUSTERED INDEX [ix_tblpersonsecure]
    ON [asr_staging].[s_tblpersonsecure]([PERSONCODE] ASC)
    INCLUDE([NAME1], [NAME2], [FEDERALIDNO]);

