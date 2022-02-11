using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace StudentApplication.Models
{
    public partial class Mark
    {
        public int MarkId { get; set; }
        public int? StudentId { get; set; }
        public int? SubId { get; set; }
        public decimal? Marks { get; set; }

        public virtual Student Student { get; set; }
        public virtual Subject Sub { get; set; }
    }
}
