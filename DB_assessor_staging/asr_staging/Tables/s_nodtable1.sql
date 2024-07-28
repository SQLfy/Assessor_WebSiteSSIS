﻿CREATE TABLE [asr_staging].[s_nodtable1] (
    [HEADER]            VARCHAR (2)   NOT NULL,
    [AGENT_FLAG]        VARCHAR (1)   NOT NULL,
    [REVIEWNUMBER]      NUMERIC (15)  NOT NULL,
    [TAXYEAR]           NUMERIC (4)   NOT NULL,
    [OWNERNAME1]        VARCHAR (60)  NULL,
    [OWNERNAME2]        VARCHAR (60)  NULL,
    [OWNERADDRESS1]     VARCHAR (50)  NULL,
    [OWNERADDRESS2]     VARCHAR (50)  NULL,
    [OWNERCITY]         VARCHAR (50)  NULL,
    [OWNERSTATE]        VARCHAR (2)   NULL,
    [OWNERZIP]          VARCHAR (10)  NULL,
    [LOCATION]          VARCHAR (71)  NULL,
    [SUBNAME]           VARCHAR (255) NULL,
    [VALUEDESCRIPTION1] VARCHAR (500) NULL,
    [VALUEDESCRIPTION2] VARCHAR (500) NULL,
    [VALUEDESCRIPTION3] VARCHAR (500) NULL
);
