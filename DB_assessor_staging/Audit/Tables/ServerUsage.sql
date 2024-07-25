CREATE TABLE [Audit].[ServerUsage] (
    [ServerUsageID]       INT           IDENTITY (1, 1) NOT NULL,
    [ServerName]          VARCHAR (255) NULL,
    [DatabaseName]        VARCHAR (255) NULL,
    [LoginName]           VARCHAR (255) NULL,
    [NumberOfConnections] SMALLINT      NULL,
    [CreatedDateTime]     DATETIME2 (0) DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([ServerUsageID] ASC)
);

