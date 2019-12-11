using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace Friendly.UI.MVC.Models
{
    public class SupportViewModel
    {
        [Display(Name = "Name")]
        public string Name { get; set; }

        [Display(Name = "Email")]
        public string Email { get; set; }

        [Display(Name = "Subject")]
        public string Subject { get; set; }

        [Required(ErrorMessage = "*")]
        [UIHint("MultilineText")]
        [Display(Name = "Message")]
        public string Message { get; set; }
    }
}