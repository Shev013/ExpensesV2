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
    
    public partial class MortagesSubTypes
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public MortagesSubTypes()
        {
            this.Mortages = new HashSet<Mortages>();
        }
    
        public int id { get; set; }
        public string Description { get; set; }
        public int idType { get; set; }
        public bool Active { get; set; }
        public Nullable<decimal> InicialValue { get; set; }
        public bool Base { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Mortages> Mortages { get; set; }
        public virtual MortagesTypes MortagesTypes { get; set; }
    }
}