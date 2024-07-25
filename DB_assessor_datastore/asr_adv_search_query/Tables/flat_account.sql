CREATE TABLE [asr_adv_search_query].[flat_account] (
    [account_no]                             VARCHAR (30)     NOT NULL,
    [state_parcel_no]                        VARCHAR (30)     NULL,
    [tax_district_no]                        VARCHAR (30)     NOT NULL,
    [sub_filing_recording_no]                VARCHAR (30)     NULL,
    [account_type]                           VARCHAR (30)     NOT NULL,
    [appraisal_type]                         VARCHAR (30)     NOT NULL,
    [account_status]                         VARCHAR (30)     NOT NULL,
    [account_status_description]             VARCHAR (100)    NULL,
    [legal_description]                      VARCHAR (MAX)    NULL,
    [longitude_x]                            NUMERIC (30, 8)  NULL,
    [latitude_y]                             NUMERIC (30, 8)  NULL,
    [location]                               VARCHAR (50)     NULL,
    [create_datetime]                        DATETIME2 (7)    NOT NULL,
    [create_user_id]                         VARCHAR (60)     NOT NULL,
    [update_datetime]                        DATETIME2 (7)    NULL,
    [update_user_id]                         VARCHAR (60)     NULL,
    [rowhash]                                VARBINARY (8000) NULL,
    [elevation_z]                            NUMERIC (30, 8)  NULL,
    [bldg_permit_auth_id]                    INT              NULL,
    [quarter]                                VARCHAR (15)     NULL,
    [section]                                VARCHAR (15)     NULL,
    [township]                               VARCHAR (15)     NULL,
    [range]                                  VARCHAR (15)     NULL,
    [primary_owner_name]                     VARCHAR (256)    NULL,
    [primary_owner_address]                  VARCHAR (436)    NULL,
    [actual_value_sum]                       NUMERIC (38, 2)  NULL,
    [assessed_value_sum]                     NUMERIC (38, 2)  NULL,
    [net_acres_sum]                          NUMERIC (38, 4)  NULL,
    [subdivision]                            VARCHAR (256)    NULL,
    [filing]                                 VARCHAR (114)    NULL,
    [primary_property_unit_no]               VARCHAR (30)     NULL,
    [primary_property_address_number]        VARCHAR (15)     NULL,
    [primary_property_address_number_suffix] VARCHAR (30)     NULL,
    [primary_property_pre_direction_code]    VARCHAR (50)     NULL,
    [primary_property_street_name]           VARCHAR (80)     NULL,
    [primary_property_street_type_code]      VARCHAR (30)     NULL,
    [primary_property_post_direction_code]   VARCHAR (50)     NULL,
    [primary_property_city]                  VARCHAR (50)     NULL,
    [primary_property_zip_code]              VARCHAR (10)     NULL,
    [lot]                                    VARCHAR (30)     NULL,
    [tract]                                  VARCHAR (30)     NULL,
    [block]                                  VARCHAR (30)     NULL,
    [recording_nos]                          NVARCHAR (MAX)   NULL,
    [tax_authority_nos]                      NVARCHAR (MAX)   NULL,
    [land_attributes]                        NVARCHAR (MAX)   NULL
);




GO
CREATE NONCLUSTERED INDEX [ix_fa_account_no]
    ON [asr_adv_search_query].[flat_account]([account_no] ASC);

