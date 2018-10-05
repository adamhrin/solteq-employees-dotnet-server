using System;
using System.Collections.Generic;

namespace EmployeesApi.Models
{
    public partial class Employee
    {
        public Employee()
        {
            Salaries = new HashSet<YearSalary>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }

        public ICollection<YearSalary> Salaries { get; set; }
    }
}
