﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations.Schema;

namespace EmployeesApi.Models
{
    public partial class YearSalary
    {
        public int Year { get; set; }
        public int IdEmployee { get; set; }
        [DefaultValue(0)]
        public float Jan { get; set; }
        [DefaultValue(0)]
        public float Feb { get; set; }
        [DefaultValue(0)]
        public float Mar { get; set; }
        [DefaultValue(0)]
        public float Apr { get; set; }
        [DefaultValue(0)]
        public float May { get; set; }
        [DefaultValue(0)]
        public float Jun { get; set; }
        [DefaultValue(0)]
        public float Jul { get; set; }
        [DefaultValue(0)]
        public float Aug { get; set; }
        [DefaultValue(0)]
        public float Sep { get; set; }
        [DefaultValue(0)]
        public float Okt { get; set; }
        [DefaultValue(0)]
        public float Nov { get; set; }
        [DefaultValue(0)]
        public float Dec { get; set; }

        public Employee IdEmployeeNavigation { get; set; }
    }
}
