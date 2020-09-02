using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;

namespace ShopingCart.Models
{
    public class MyDbcontext: DbContext
    {
        public MyDbcontext():base("MyConn") { }
        public DbSet<Products> products { get; set; }
        public DbSet<Admin> Users { get; set; }
        public DbSet<Category> Categories { get; set; }
    }
}