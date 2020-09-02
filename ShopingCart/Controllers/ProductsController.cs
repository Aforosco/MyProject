using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using System.Net.Mail;

using Microsoft.Ajax.Utilities;
using ShopingCart.Migrations;
using ShopingCart.Models;

namespace ShopingCart.Controllers
{
    public class ProductsController : Controller


    {

        private string senderPass = "Password50.";
        private string senderEmail = "oregbemijohn77@gmail.com";
        private string senderName = "Afolabi John";
        private string mailSubject = "Message from Tasty Customer";
        private MyDbcontext db = new MyDbcontext();

        // GET: Products
        public ActionResult Index(string searchString)
        {
            var myproducts = from p in db.products select p;
            if (!String.IsNullOrEmpty(searchString))
            {
                myproducts = myproducts.Where(p => p.Name.Contains(searchString));
                return View(myproducts.ToList());
            }
            var products = db.products.Include(p => p.Category);
            return View(products.ToList());
        }

        public ActionResult ProductList()
        {
            return View(db.products.ToList());
        }

        // GET: Products/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Products products = db.products.Find(id);
            if (products == null)
            {
                return HttpNotFound();
            }
            return View(products);
        }

        // GET: Products/Create
        public ActionResult Create()
        {
            ViewBag.CatId = new SelectList(db.Categories, "CatId", "CategoryName");
            return View();
        }

        // POST: Products/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Name,Price,imageUrl,CatId")] Products products, HttpPostedFileBase UploadImage)
        {
            if (ModelState.IsValid)
            {

                if (UploadImage != null)
                {

                    if (UploadImage.ContentType == "Image/jpg" || UploadImage.ContentType == "image/jpeg" || UploadImage.ContentType == "image/png")
                    {
                        UploadImage.SaveAs(Server.MapPath("/") + "/Content/images/" + UploadImage.FileName);
                        // Add product name to the object property
                        products.ImageUrl = UploadImage.FileName;
                    }
                    else
                    {
                        return View();
                    }

                }
                else
                {
                    return View();
                }

                db.products.Add(products);
                db.SaveChanges();
                ViewBag.message = products.Name + " " + "Successfully Added";
                return RedirectToAction("Index");
            }

            ViewBag.CatId = new SelectList(db.Categories, "CatId", "CategoryName", products.CatId);
            return View(products);
        }

        // GET: Products/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Products products = db.products.Find(id);
            if (products == null)
            {
                return HttpNotFound();
            }
            ViewBag.CatId = new SelectList(db.Categories, "CatId", "CategoryName", products.CatId);
            return View(products);
        }

        // POST: Products/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Name,Price,imageUrl,CatId")] Products products)
        {
            if (ModelState.IsValid)
            {
                db.Entry(products).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CatId = new SelectList(db.Categories, "CatId", "CategoryName", products.CatId);
            return View(products);
        }

        // GET: Products/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Products products = db.products.Find(id);
            if (products == null)
            {
                return HttpNotFound();
            }
            return View(products);
        }

        // POST: Products/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Products products = db.products.Find(id);
            db.products.Remove(products);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        public ActionResult AddToCart(int Id)
        {
            if (Session["cart"] == null)
            {

                var cart = new List<Item>();
                var product = db.products.Find(Id);

                cart.Add(new Item()
                {
                    product = product,
                    Quantity = 1
                });
                Session["cart"] = cart;
            }

            else
            {
                var cart = (List<Item>)Session["cart"];
                var product = db.products.Find(Id);
                foreach (var item in cart)
                {

                    if (item.product.Id == Id)
                    {

                        int prevQuantity = item.Quantity;
                        cart.Remove(item);

                        cart.Add(new Item()
                        {
                            product = product,
                            Quantity = prevQuantity + 1
                        });

                    }
                    else
                    {

                        cart.Add(new Item()
                        {
                            product = product,
                            Quantity = 1
                        });

                    }

                    break;
                }
                Session["cart"] = cart;
            }



            return RedirectToAction("Index");
        }

        public ActionResult RemoveFromCart(int Id)
        {
            var cart = new List<Item>();

            cart = (List<Item>)Session["cart"];

            foreach (var item in cart)
            {

                if (item.product.Id == Id)
                    cart.Remove(item);
                break;
            }
            Session["cart"] = cart;
            return RedirectToAction("Index");
        }

        

        public ActionResult ProceedToPay()

        {

            return View();
        }
        [HttpGet]
        public ActionResult Contact()
        {


            return View();
        }

        [HttpPost]
        public ActionResult Contact(EmailModel model)
        {
            if (ModelState != null)
            {
                using (MailMessage client = new MailMessage())
                {
                    client.From = new MailAddress(senderEmail, senderName);
                    client.To.Add(model.UserEmail);
                    client.Subject = mailSubject;
                    client.Body = "You have a message from <br> <b>Fullname:</b>" + model.Fullname + "<br><b>Email:</b>" + model.Message;

                    client.IsBodyHtml = true;

                    using (SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587))
                    {
                        smtp.UseDefaultCredentials = false;
                        smtp.Credentials = new NetworkCredential(senderEmail, senderPass);
                        smtp.EnableSsl = true;
                        smtp.Send(client);


                    }
                }

            }



            ViewBag.Message = "Message have been sent.";

            ModelState.Clear();
            return View();

        }

        public ActionResult About()
        {
            

            return View();
        }



    }
}
