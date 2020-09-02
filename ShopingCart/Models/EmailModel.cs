using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel;

namespace ShopingCart.Models
{
    public class EmailModel
    {
       
            [Required(ErrorMessage = "Fullname is Required")]
           
            public string Fullname { get; set; }

           
                
            [DisplayName("USER EMAIL")]
            [Required(ErrorMessage = "Email is Required")]
            [EmailAddress(ErrorMessage = "Invalid Email")]
            public string UserEmail { get; set; }

            [Required(ErrorMessage = "Message is Required")]
            public string Message { get; set; }
        

    }
}