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
    
    public partial class tax_district_authority
    {
        public string tax_district_no { get; set; }
        public string tax_authority_no { get; set; }
        public System.DateTime create_datetime { get; set; }
        public string create_user_id { get; set; }
        public Nullable<System.DateTime> update_datetime { get; set; }
        public string update_user_id { get; set; }
    
        public virtual tax_authority tax_authority { get; set; }
        public virtual tax_district tax_district { get; set; }
    }
}
