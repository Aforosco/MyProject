using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace ShopingCart.Models
{
    public class Products
    {
        [Key]
        public int Id { get; set; }

        [Required(ErrorMessage ="Please Enter your Name")]
        [StringLength(150,MinimumLength =2)]
        public string  Name { get; set; }

        public double Price { get; set; }

        public string ImageUrl { get; set; }

        public int CatId { get; set; }

        public Category  Category { get; set; }
    }
}