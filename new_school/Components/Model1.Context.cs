﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace new_school.Components
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class EPEntities : DbContext
    {
        public EPEntities()
            : base("name=EPEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Academics> Academics { get; set; }
        public virtual DbSet<Animal> Animal { get; set; }
        public virtual DbSet<Control> Control { get; set; }
        public virtual DbSet<Discipline> Discipline { get; set; }
        public virtual DbSet<Engineer> Engineer { get; set; }
        public virtual DbSet<EnSpec> EnSpec { get; set; }
        public virtual DbSet<Exam> Exam { get; set; }
        public virtual DbSet<Flowers> Flowers { get; set; }
        public virtual DbSet<Kafedra> Kafedra { get; set; }
        public virtual DbSet<Position> Position { get; set; }
        public virtual DbSet<Specialty> Specialty { get; set; }
        public virtual DbSet<Student> Student { get; set; }
        public virtual DbSet<Student_sch> Student_sch { get; set; }
        public virtual DbSet<sysdiagrams> sysdiagrams { get; set; }
        public virtual DbSet<Teacher> Teacher { get; set; }
        public virtual DbSet<Licei> Licei { get; set; }
        public virtual DbSet<Employee> Employee { get; set; }
    }
}
