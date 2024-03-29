﻿// <auto-generated />
using System;
using EmployeesApi.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

namespace EmployeesApi.Migrations
{
    [DbContext(typeof(EmployeesDbContext))]
    [Migration("20181009160327_Migration2")]
    partial class Migration2
    {
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "2.1.4-rtm-31024")
                .HasAnnotation("Relational:MaxIdentifierLength", 128)
                .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

            modelBuilder.Entity("EmployeesApi.Models.Employee", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("Email")
                        .HasMaxLength(50)
                        .IsUnicode(false);

                    b.Property<string>("Name")
                        .HasMaxLength(50)
                        .IsUnicode(false);

                    b.Property<string>("Phone")
                        .HasMaxLength(50)
                        .IsUnicode(false);

                    b.HasKey("Id");

                    b.ToTable("Employee");
                });

            modelBuilder.Entity("EmployeesApi.Models.YearSalary", b =>
                {
                    b.Property<int>("Year");

                    b.Property<int>("IdEmployee")
                        .HasColumnName("Id_Employee");

                    b.Property<float?>("Apr");

                    b.Property<float?>("Aug");

                    b.Property<float?>("Dec");

                    b.Property<float?>("Feb");

                    b.Property<float?>("Jan");

                    b.Property<float?>("Jul");

                    b.Property<float?>("Jun");

                    b.Property<float?>("Mar");

                    b.Property<float?>("May");

                    b.Property<float?>("Nov");

                    b.Property<float?>("Okt");

                    b.Property<float?>("Sep");

                    b.HasKey("Year", "IdEmployee");

                    b.HasIndex("IdEmployee");

                    b.ToTable("YearSalary");
                });

            modelBuilder.Entity("EmployeesApi.Models.YearSalary", b =>
                {
                    b.HasOne("EmployeesApi.Models.Employee", "IdEmployeeNavigation")
                        .WithMany("Salaries")
                        .HasForeignKey("IdEmployee")
                        .HasConstraintName("FK_YearSalary_ToEmployee");
                });
#pragma warning restore 612, 618
        }
    }
}
