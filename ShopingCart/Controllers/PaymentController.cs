using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PayPal.Api;
using System.Web.Mvc;
using ShopingCart.Models;
using Item = PayPal.Api.Item;
using PayPal.Util;

namespace ShopingCart.Controllers
{
    public class PaymentController : Controller
    {
        // GET: Payment
        public ActionResult PaymentWithPaypal()
        {
            APIContext apicontext = PaypalConfiguration.GetAPIContext();

            try
            {
                string PayerId = Request.Params["PayerID"];

                if (string.IsNullOrEmpty(PayerId))
                {
                    string baseURi = Request.Url.Scheme + "://" + Request.Url.Authority +
                        "PaymentWithPaypal/PaymentWithPaypal?";

                    var Guid = Convert.ToString((new Random()).Next(10000000));

                    var createPayment = this.CreatePayment(apicontext, baseURi, "guid=" + Guid);
                    var links = createPayment.links.GetEnumerator();
                    string paypalRedirectUrl = null;

                    while (links.MoveNext())
                    {
                        Links ink = links.Current;

                        if (ink.rel.ToLower().Trim().Equals("approval_url"))
                        {
                            paypalRedirectUrl = ink.href;
                        }
                    }


                }

                else
                {
                    var guid = Request.Params["guid"];
                    var executePayment = ExecutePayment(apicontext, PayerId, Session["guid"] as string);
                    if (executePayment.ToString().ToLower() != "approved")
                    {
                        return View("FailureView");
                    }
                }
            }
            catch (Exception ex)
            {

                return View("FailureView");
            }

            return View("SuccessView");
        }


        private PayPal.Api.Payment payment;
        private Payment ExecutePayment(APIContext apicontext, string payerId, string PaymentId)
        {
            var paymentExecution = new PaymentExecution() { payer_id = payerId };
            this.payment = new Payment() { id = PaymentId };
            return this.payment.Execute(apicontext, paymentExecution);



        }

        
        private Payment CreatePayment(APIContext apicontext, string baseURi, string redirectURl)
        {
            {
                var itemList = new ItemList() { items = new List<Item>() };

                if (Session["cart"] != null)
                {
                    List<Models.Item> cart = (List<Models.Item>)(Session["cart"]);
                    foreach (var item in cart)
                    {
                        itemList.items.Add(new Item()
                        {

                            name = item.product.Name,
                            currency = "TK",
                            price = item.product.Price.ToString(),
                            quantity = item.Quantity.ToString(),
                            sku = "sku"

                        });
                        var payer = new Payer { payment_method = "paypal" };

                        var redirurl = new RedirectUrls()
                        {
                            cancel_url = redirectURl + "&Cancel = true ",
                            return_url = redirectURl

                        };

                        var details = new Details()
                        {
                            tax = "1",
                            shipping = "1",
                            subtotal = "1"

                        };

                        var amount = new Amount()
                        {

                            currency = "USD",
                            total = Session["Sestotal"].ToString(),
                            details = details

                        };

                        var TrasactionList = new List<Transaction>();
                        TrasactionList.Add(new Transaction
                        {
                            description = "Trasaction Description",
                            invoice_number = "#100000",
                            amount = amount,
                            item_list = itemList


                        });
                        this.payment = new Payment()
                        {
                            intent = "sale",
                            payer = payer,
                            transactions = TrasactionList,
                            redirect_urls = redirurl

                        };
                    }

                    
                }

            }
            return this.payment.Create(apicontext);
        }

    }
}
    
