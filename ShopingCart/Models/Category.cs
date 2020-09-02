using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace ShopingCart.Models
{
    public class Category
    {
        [Key]
        public int CatId  { get; set; }

        [Required(ErrorMessage = "Please Enter your Name")]
        [StringLength(150, MinimumLength = 2)]
        public string CategoryName { get; set; }

        public List <Products> products { get; set; }
    }
}