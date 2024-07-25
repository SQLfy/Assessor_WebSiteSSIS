CREATE TABLE [asr_staging].[s_tbladdresssecure] (
    [VERSTART]         NUMERIC (11)    NULL,
    [VEREND]           NUMERIC (11)    NULL,
    [ADDRESSCODE]      NUMERIC (15)    NULL,
    [ADDRESS1]         VARCHAR (50)    NULL,
    [ADDRESS2]         VARCHAR (50)    NULL,
    [CITY]             VARCHAR (50)    NULL,
    [STATECODE]        VARCHAR (2)     NULL,
    [ZIPCODE]          VARCHAR (10)    NULL,
    [PERSONCODE]       NUMERIC (15)    NULL,
    [PROVINCE]         VARCHAR (50)    NULL,
    [ADDRESSON0]       NUMERIC (20, 6) NULL,
    [ADDRESSON1]       NUMERIC (20, 6) NULL,
    [ADDRESSON2]       NUMERIC (20, 6) NULL,
    [JURISDICTIONID]   NUMERIC (15)    NULL,
    [COUNTRY]          VARCHAR (100)   NULL,
    [POSTALCODE]       VARCHAR (20)    NULL,
    [ADDRESSOD0]       VARCHAR (22)    NULL,
    [ADDRESSOD1]       VARCHAR (22)    NULL,
    [ADDRESSOM0]       VARCHAR (50)    NULL,
    [ADDRESSOM1]       VARCHAR (50)    NULL,
    [ADDRESSOT0]       VARCHAR (50)    NULL,
    [ADDRESSOT1]       VARCHAR (50)    NULL,
    [ADDRESSVALIDFLAG] NUMERIC (1)     NULL,
    [WRITEDATE]        VARCHAR (22)    NULL,
    [SEQID]            NUMERIC (15)    NULL,
    [ETL_RUN_TIME]     DATETIME2 (7)   DEFAULT (getdate()) NULL
);


GO
CREATE NONCLUSTERED INDEX [IX_s_tbladdresssecure_NonClusteredIndex-ADDRESS1]
    ON [asr_staging].[s_tbladdresssecure]([ADDRESS1] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_s_tbladdresssecure_NonClusteredIndex-ADDRESS2]
    ON [asr_staging].[s_tbladdresssecure]([ADDRESS2] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_s_tbladdresssecure_NonClusteredIndex-CITY]
    ON [asr_staging].[s_tbladdresssecure]([CITY] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_s_tbladdresssecure_NonClusteredIndex-STATECODE]
    ON [asr_staging].[s_tbladdresssecure]([STATECODE] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_s_tbladdresssecure_NonClusteredIndex-ZIPCODE]
    ON [asr_staging].[s_tbladdresssecure]([ZIPCODE] ASC);


GO
CREATE NONCLUSTERED INDEX [ix_tbladdresssecure]
    ON [asr_staging].[s_tbladdresssecure]([ADDRESSCODE] ASC, [PERSONCODE] ASC)
    INCLUDE([ADDRESS1], [ADDRESS2], [CITY], [STATECODE], [ZIPCODE], [COUNTRY]);

