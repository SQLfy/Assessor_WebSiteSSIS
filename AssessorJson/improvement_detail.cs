//------------------------------------------------------------------------------
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
    using System.Collections.Generic;
    
    public partial class improvement_detail
    {
        public string account_no { get; set; }
        public decimal improvement_no { get; set; }
        public decimal improvement_detail_id { get; set; }
        public string improvement_detail_type { get; set; }
        public string improvement_detail_type_description { get; set; }
        public Nullable<decimal> detail_unit_count { get; set; }
        public string addon_code { get; set; }
        public string addon_code_description { get; set; }
        public string detail_built_year { get; set; }
        public System.DateTime create_datetime { get; set; }
        public string create_user_id { get; set; }
        public Nullable<System.DateTime> update_datetime { get; set; }
        public string update_user_id { get; set; }
        public byte[] rowhash { get; set; }
    
        public virtual account account { get; set; }
        public virtual improvement improvement { get; set; }
    }
}
