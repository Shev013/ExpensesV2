//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ConsoleTester
{
    using System;
    using System.Collections.Generic;
    
    public partial class Income
    {
        public int id { get; set; }
        public int Type { get; set; }
        public System.DateTime RecordDate { get; set; }
        public int Person { get; set; }
        public decimal Value { get; set; }
        public string Observations { get; set; }
        public Nullable<System.DateTime> EntranceDate { get; set; }
    
        public virtual IncomeTypes IncomeTypes { get; set; }
        public virtual Users Users { get; set; }
    }
}