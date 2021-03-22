//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DemEkzDemo.ModelDb
{
    using System;
    using System.Collections.Generic;
    
    public partial class Client_Import_good
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Client_Import_good()
        {
            this.ClientServiceGoods = new HashSet<ClientServiceGood>();
            this.Tags = new HashSet<Tag>();
        }
    
        public int ID { get; set; }
        public string Surname { get; set; }
        public string Name { get; set; }
        public string LastName { get; set; }
        public string Gender { get; set; }
        public string Phone { get; set; }
        public string ClientPhoto { get; set; }
        public System.DateTime DateOfBirth { get; set; }
        public string Email { get; set; }
        public System.DateTime RegistrationDate { get; set; }
        public Nullable<int> TagID { get; set; }
    
        public virtual Gender Gender1 { get; set; }
        public virtual Tag Tag { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ClientServiceGood> ClientServiceGoods { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Tag> Tags { get; set; }
    }
}