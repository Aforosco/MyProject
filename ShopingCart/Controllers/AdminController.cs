using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ShopingCart.Models;

namespace ShopingCart.Controllers
{
    public class AdminController : Controller
    {
        private MyDbcontext db = new MyDbcontext();

        // GET: Admin
        public ActionResult Index()
        {
            return View(db.Users.ToList());
        }

        // GET: Admin/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Admin admin = db.Users.Find(id);
            if (admin == null)
            {
                return HttpNotFound();
            }
            return View(admin);
        }

        // GET: Admin/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "UserId,FirstName,LastName,Email,UserName,Password,ConfirmPassword")] Admin admin)
        {
            if (ModelState.IsValid)
            {
                db.Users.Add(admin);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(admin);
        }

        // GET: Admin/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Admin admin = db.Users.Find(id);
            if (admin == null)
            {
                return HttpNotFound();
            }
            return View(admin);
        }

        // POST: Admin/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "UserId,FirstName,LastName,Email,UserName,Password,ConfirmPassword")] Admin admin)
        {
            if (ModelState.IsValid)
            {
                db.Entry(admin).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(admin);
        }

        // GET: Admin/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Admin admin = db.Users.Find(id);
            if (admin == null)
            {
                return HttpNotFound();
            }
            return View(admin);
        }

        // POST: Admin/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Admin admin = db.Users.Find(id);
            db.Users.Remove(admin);
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

        public ActionResult UserList()
        {
            ViewBag.title = "Admin List";
            using (MyDbcontext db = new MyDbcontext())
            {
                var user = db.Users.ToList();
                return View(user);
            }


        }

        public ActionResult Registration()
        {
            ViewBag.title = "Registration";
            return View();

        }

        [HttpPost]
        public ActionResult Registration(Admin account)
        {

            if (ModelState.IsValid)
            {
                using (MyDbcontext db = new MyDbcontext())
                {
                    db.Users.Add(account);
                    db.SaveChanges();
                }
                ModelState.Clear();

                ViewBag.Message = account.UserName + " " + "Successfully Registered";
            }
            return View();


        }

        public ActionResult Login()
        {
            ViewBag.title = "Login";
            return View();
        }

        [HttpPost]
        public ActionResult Login(Admin user)
        {
            using (MyDbcontext db = new MyDbcontext())
            {
                var usr = db.Users.Single(u => u.UserName == user.UserName && u.Password == user.Password);

                if (usr != null)
                {
                    Session["Userid"] = usr.UserId.ToString();
                    Session["Username"] = usr.UserName.ToString();
                    return RedirectToAction("Loggedin");
                }

                else
                {

                    ModelState.AddModelError("", "Username or password is Invalid");
                }

            }
            return View();
        }

        public ActionResult LoggedIn()
        {
            ViewBag.title = "DASHBOARD";
            if (Session["UserId"] != null)
            {
                return View();

            }
            else
            {
                return RedirectToAction("Login");

            }

        }

        public ActionResult LogOut()
        {
            Session.Clear();



            return RedirectToAction("Login");
        }
    }
}
