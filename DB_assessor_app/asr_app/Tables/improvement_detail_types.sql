CREATE TABLE [asr_app].[improvement_detail_types] (
    [id]                      BIGINT        IDENTITY (1, 1) NOT NULL,
    [detail_type]             VARCHAR (50)  NULL,
    [detail_type_description] VARCHAR (100) NULL,
    [is_publishable]          BIT           CONSTRAINT [DF_improvement_detail_types_is_publishable] DEFAULT ((1)) NULL,
    CONSTRAINT [PK_improvement_detail_types] PRIMARY KEY CLUSTERED ([id] ASC)
);

