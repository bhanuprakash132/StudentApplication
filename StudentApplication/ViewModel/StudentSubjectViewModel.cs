using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace StudentApplication.ViewModel
{
    public class StudentSubjectViewModel
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string ClassName { get; set; }
        public int SerialNo { get; set; }

        public int SubjectId { get; set; }
        public string SubjectName { get; set; }

        public int MarkId { get; set; }
        public int? StudentId { get; set; }
        public int? SubId { get; set; }
        public decimal? Marks { get; set; }
    }
}
