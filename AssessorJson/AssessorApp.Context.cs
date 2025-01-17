﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace AssessorJson
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Core.EntityClient;
    using System.Data.Entity.Infrastructure;
    
    public partial class Entities : DbContext
    {
        public Entities() : base("name=Entities")
        {
        }
    
    	public Entities(EntityConnection connection) : base(connection, true)
    	{
    	}
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<account> accounts { get; set; }
        public virtual DbSet<account_neighborhood> account_neighborhood { get; set; }
        public virtual DbSet<account_owner_address> account_owner_address { get; set; }
        public virtual DbSet<account_property_address> account_property_address { get; set; }
        public virtual DbSet<data_processing_log> data_processing_log { get; set; }
        public virtual DbSet<etl_parameter> etl_parameter { get; set; }
        public virtual DbSet<improvement> improvements { get; set; }
        public virtual DbSet<improvement_built_as> improvement_built_as { get; set; }
        public virtual DbSet<improvement_detail> improvement_detail { get; set; }
        public virtual DbSet<improvement_detail_types> improvement_detail_types { get; set; }
        public virtual DbSet<improvement_occupancy> improvement_occupancy { get; set; }
        public virtual DbSet<land_abstract> land_abstract { get; set; }
        public virtual DbSet<land_attribute> land_attribute { get; set; }
        public virtual DbSet<real_account> real_account { get; set; }
        public virtual DbSet<sale> sales { get; set; }
        public virtual DbSet<sale_account> sale_account { get; set; }
        public virtual DbSet<sale_inventory> sale_inventory { get; set; }
        public virtual DbSet<sale_inventory_detail> sale_inventory_detail { get; set; }
        public virtual DbSet<sub_filing> sub_filing { get; set; }
        public virtual DbSet<tax_authority> tax_authority { get; set; }
        public virtual DbSet<tax_authority_fund> tax_authority_fund { get; set; }
        public virtual DbSet<tax_district> tax_district { get; set; }
        public virtual DbSet<tax_district_authority> tax_district_authority { get; set; }
        public virtual DbSet<value> values { get; set; }
        public virtual DbSet<account_valuation> account_valuation { get; set; }
        public virtual DbSet<v_residential_account_valuation> v_residential_account_valuation { get; set; }
        public virtual DbSet<azure_building_permit_authority> azure_building_permit_authority { get; set; }
        public virtual DbSet<value_from_tsgvacctabstvalue> value_from_tsgvacctabstvalue { get; set; }
        public virtual DbSet<v_freeze_parameters> v_freeze_parameters { get; set; }
        public virtual DbSet<realnov> realnov { get; set; }
        public virtual DbSet<v_nov_tax_years> v_nov_tax_years { get; set; }
        public virtual DbSet<pers_prop_acct> pers_prop_acct { get; set; }
        public virtual DbSet<pers_prop_detail> pers_prop_detail { get; set; }
        public virtual DbSet<pers_prop_type> pers_prop_type { get; set; }
        public virtual DbSet<azure_important_PPLinks> azure_important_PPLinks { get; set; }
        public virtual DbSet<appeal_account> appeal_account { get; set; }
        public virtual DbSet<account_fact> account_fact { get; set; }
        public virtual DbSet<azure_important_dates> azure_important_dates { get; set; }
        public virtual DbSet<account_notification> account_notification { get; set; }
    }
}
