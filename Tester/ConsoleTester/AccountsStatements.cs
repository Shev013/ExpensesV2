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
    
    public partial class AccountsStatements
    {
        public int id { get; set; }
        public int idAccount { get; set; }
        public decimal Value { get; set; }
        public int month { get; set; }
        public int year { get; set; }
    
        public virtual Accounts Accounts { get; set; }
    }
}
