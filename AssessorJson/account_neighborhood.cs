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
    
    public partial class account_neighborhood
    {
        public string account_no { get; set; }
        public string neighborhood_code { get; set; }
        public string property_type { get; set; }
        public string neighborhood_extension { get; set; }
        public System.DateTime create_datetime { get; set; }
        public string create_user_id { get; set; }
        public Nullable<System.DateTime> update_datetime { get; set; }
        public string update_user_id { get; set; }
    
        public virtual account account { get; set; }
    }
}
