//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Friendly.DATA.EF
{
    using System;
    using System.Collections.Generic;
    
    public partial class Friendship
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Friendship()
        {
            this.OpenFriendships = new HashSet<OpenFriendship>();
        }
    
        public int FriendshipId { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<OpenFriendship> OpenFriendships { get; set; }
    }
}