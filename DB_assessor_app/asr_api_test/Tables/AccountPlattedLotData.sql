CREATE TABLE [asr_api_test].[AccountPlattedLotData] (
    [id]            INT          IDENTITY (1, 1) NOT NULL,
    [stateParcelNo] VARCHAR (30) NULL,
    [lotNo]         VARCHAR (30) NULL,
    [tractNo]       VARCHAR (30) NULL,
    [blockNo]       VARCHAR (30) NULL,
    CONSTRAINT [PK_AccountPlattedLotData] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [idx_LotNo]
    ON [asr_api_test].[AccountPlattedLotData]([lotNo] ASC);


GO
CREATE NONCLUSTERED INDEX [idx_TractNo]
    ON [asr_api_test].[AccountPlattedLotData]([tractNo] ASC);


GO
CREATE NONCLUSTERED INDEX [idx_BlockNo]
    ON [asr_api_test].[AccountPlattedLotData]([blockNo] ASC);

