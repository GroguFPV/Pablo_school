//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Pablo_school.Res
{
    using System;
    using System.Collections.Generic;
    
    public partial class Employee
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Employee()
        {
            this.Engineer = new HashSet<Engineer>();
            this.Exam = new HashSet<Exam>();
        }
    
        public int TabNumber { get; set; }
        public Nullable<int> Kaf_id { get; set; }
        public string LastName { get; set; }
        public Nullable<int> PositionID { get; set; }
        public Nullable<int> Salary { get; set; }
        public Nullable<int> Shef { get; set; }
    
        public virtual Kafedra Kafedra { get; set; }
        public virtual Position Position { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Engineer> Engineer { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Exam> Exam { get; set; }
        public virtual Teacher Teacher { get; set; }
    }
}
