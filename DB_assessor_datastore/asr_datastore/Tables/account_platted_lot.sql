CREATE TABLE [asr_datastore].[account_platted_lot] (
    [ACCOUNT_NO]     VARCHAR (30) NOT NULL,
    [PARCEL_NO]      VARCHAR (30) NOT NULL,
    [LOT]            VARCHAR (30) NULL,
    [TRACT]          VARCHAR (30) NULL,
    [BLOCK]          VARCHAR (30) NULL,
    [CREATE_DTM]     DATETIME     NULL,
    [CREATE_USER_ID] VARCHAR (30) NULL,
    [UPDATE_DTM]     DATETIME     NULL,
    [UPDATE_USER_ID] VARCHAR (30) NULL,
    CONSTRAINT [PK_account_platted_lot] PRIMARY KEY CLUSTERED ([ACCOUNT_NO] ASC)
);


GO
CREATE NONCLUSTERED INDEX [_dta_index_account_platted_lot_16_350624292__K1_2_3_4_5]
    ON [asr_datastore].[account_platted_lot]([ACCOUNT_NO] ASC)
    INCLUDE([PARCEL_NO], [LOT], [TRACT], [BLOCK]);


GO
CREATE STATISTICS [_dta_stat_350624292_1_2]
    ON [asr_datastore].[account_platted_lot]([ACCOUNT_NO], [PARCEL_NO]);

