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
    
    public partial class pers_prop_detail
    {
        public int PERS_PROP_DETAIL_EID { get; set; }
        public string ACCOUNT_NO { get; set; }
        public string DETAIL_ID { get; set; }
        public string PERS_PROP_TYPE { get; set; }
        public string ASSET_TYPE_CODE { get; set; }
        public string ASSET_CONDITION_CODE { get; set; }
        public string ACQUIRED_YEAR { get; set; }
        public Nullable<decimal> QUANTITY { get; set; }
        public Nullable<decimal> ORIGINAL_COST { get; set; }
        public string ASSET_DETAIL_DESCR { get; set; }
        public Nullable<System.DateTime> ROW_START_DTM { get; set; }
        public Nullable<System.DateTime> ROW_END_DTM { get; set; }
        public string ROW_CURRENT_FLAG { get; set; }
        public Nullable<System.DateTime> CREATE_DTM { get; set; }
        public string CREATE_USER_ID { get; set; }
        public Nullable<System.DateTime> UPDATE_DTM { get; set; }
        public string UPDATE_USER_ID { get; set; }
    }
}
