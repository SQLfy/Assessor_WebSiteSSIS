CREATE TABLE [asr_datastore].[nod_table_1] (
    [header]              VARCHAR (2)   NOT NULL,
    [agent_flag]          VARCHAR (1)   NOT NULL,
    [review_number]       NUMERIC (15)  NOT NULL,
    [tax_year]            NUMERIC (4)   NOT NULL,
    [owner_name_1]        VARCHAR (60)  NULL,
    [owner_name_2]        VARCHAR (60)  NULL,
    [owner_address_1]     VARCHAR (50)  NULL,
    [owner_address_2]     VARCHAR (50)  NULL,
    [owner_city]          VARCHAR (50)  NULL,
    [owner_state]         VARCHAR (2)   NULL,
    [owner_zip]           VARCHAR (10)  NULL,
    [location]            VARCHAR (71)  NULL,
    [sub_name]            VARCHAR (255) NULL,
    [value_description_1] VARCHAR (500) NULL,
    [value_description_2] VARCHAR (500) NULL,
    [value_description_3] VARCHAR (500) NULL,
    [create_datetime]     DATETIME2 (7) NOT NULL,
    [create_user_id]      VARCHAR (60)  NOT NULL
);

