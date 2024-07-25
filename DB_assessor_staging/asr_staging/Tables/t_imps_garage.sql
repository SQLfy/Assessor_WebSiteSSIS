CREATE TABLE [asr_staging].[t_imps_garage] (
    [SEQID]           INT             NULL,
    [ACCOUNTNO]       VARCHAR (30)    NULL,
    [IMPDETAILTYPE]   VARCHAR (30)    NULL,
    [DETAILUNITCOUNT] NUMERIC (15, 4) NULL
);


GO
CREATE CLUSTERED INDEX [IX_T_IMPS_GARAGE]
    ON [asr_staging].[t_imps_garage]([ACCOUNTNO] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_T_IMPS_GARAGE_ACCOUNTNO]
    ON [asr_staging].[t_imps_garage]([ACCOUNTNO] ASC);

