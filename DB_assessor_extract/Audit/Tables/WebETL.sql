CREATE TABLE [Audit].[WebETL] (
    [ID]             INT            IDENTITY (1, 1) NOT NULL,
    [ParamID]        INT            NOT NULL,
    [ParameterName]  NVARCHAR (100) NOT NULL,
    [ParameterValue] NVARCHAR (100) NOT NULL,
    [Action]         NVARCHAR (10)  NOT NULL,
    [RowType]        NVARCHAR (10)  NOT NULL,
    [ChangedDate]    DATETIME       DEFAULT (getdate()) NOT NULL,
    [ChangedBy]      NVARCHAR (100) DEFAULT (suser_sname()) NOT NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC)
);

