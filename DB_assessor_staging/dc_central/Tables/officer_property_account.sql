CREATE TABLE [dc_central].[officer_property_account] (
    [PROPERTY_ACCOUNT_NO]    VARCHAR (8)   NOT NULL,
    [STATE_PARCEL_NO]        VARCHAR (15)  NOT NULL,
    [OWNER_NAME]             VARCHAR (80)  NOT NULL,
    [MAILING_STREET_ADDRESS] VARCHAR (100) NOT NULL,
    [MAILING_CITY]           VARCHAR (40)  NOT NULL,
    [MAILING_ZIP_CODE]       VARCHAR (15)  NOT NULL,
    [MAILING_STATE_CODE]     VARCHAR (2)   NOT NULL,
    [CREATE_DATE]            DATE          NOT NULL,
    [CREATE_USER_ID]         VARCHAR (20)  NOT NULL,
    [DELETED_DATE]           DATE          NULL,
    [UPDATE_DATE]            DATE          NULL,
    [UPDATE_USER_ID]         VARCHAR (20)  NULL
);

