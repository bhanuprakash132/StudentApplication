using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace StudentApplication.ViewModel
{
    public class ManageStudentSubjectViewModel
    {
        public int SubjectId { get; set; }
        public string SubjectName { get; set; }
        //public bool Selected { get; set; }
        public int StudentId { get; set; }
        public decimal? Marks { get; set; }
    }
}
