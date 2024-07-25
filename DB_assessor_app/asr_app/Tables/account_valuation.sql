CREATE TABLE [asr_app].[account_valuation] (
    [account_no]                       VARCHAR (30)     NOT NULL,
    [valuation_class_code]             VARCHAR (50)     NOT NULL,
    [actual_value]                     NUMERIC (15, 2)  NULL,
    [assessed_value]                   NUMERIC (15, 2)  NULL,
    [net_acres]                        NUMERIC (15, 4)  NULL,
    [new_growth_flag]                  BIT              NULL,
    [valuation_class_code_description] VARCHAR (100)    NULL,
    [create_datetime]                  DATETIME2 (7)    NULL,
    [create_user_id]                   VARCHAR (60)     NULL,
    [update_datetime]                  DATETIME2 (7)    NULL,
    [update_user_id]                   VARCHAR (60)     NULL,
    [rowhash]                          VARBINARY (8000) NULL,
    [account_type]                     VARCHAR (30)     NULL,
    CONSTRAINT [pk_account_valuation] PRIMARY KEY CLUSTERED ([account_no] ASC, [valuation_class_code] ASC),
    CONSTRAINT [fk_av_account] FOREIGN KEY ([account_no]) REFERENCES [asr_app].[account] ([account_no]) ON DELETE CASCADE
);


GO
ALTER TABLE [asr_app].[account_valuation] NOCHECK CONSTRAINT [fk_av_account];

