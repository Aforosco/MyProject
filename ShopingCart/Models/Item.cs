using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ShopingCart.Models
{
    public class Item
    {
        public Products product { get; set; }

        public int Quantity { get; set; }
    }
}