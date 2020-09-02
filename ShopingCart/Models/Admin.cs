using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel;
using System.Web.ModelBinding;

namespace ShopingCart.Models
{
    public class Admin
    {
        [DisplayName("USER ID")]
        [Key]
        public int  UserId { get; set; }

        [DisplayName("FIRST NAME")]
        [Required(ErrorMessage ="Please Enter Your First Name")]
        public string FirstName { get; set; }

        [DisplayName("LAST NAME")]
        [Required(ErrorMessage = "Please Enter Your Last Name")]
        public string LastName { get; set; }

        [DisplayName("E-MAIL")]
        [Required(ErrorMessage = "Please Enter Your Email")]
        [EmailAddress(ErrorMessage ="Invalid Email")]
        public string Email { get; set; }

       [DisplayName("USERNAME")]
        [Required(ErrorMessage = "Please Enter Your UserName")]
        public string UserName { get; set; }

       [DataType(DataType.Password)]
        [Required(ErrorMessage = "Please Enter Your Password")]
        public string Password { get; set; }

        [DataType(DataType.Password)]
        [Required(ErrorMessage = "Please Confirm Your Password")]
        [DisplayName("Confirm Password")]
        public string ConfirmPassword { get; set; }


    }
}