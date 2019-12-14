using System;
using System.Web.Mvc;
using Friendly.UI.MVC.Models;
using Friendly.DATA.EF;
using Microsoft.AspNet.Identity;
using System.Net.Mail;
using System.Net;

namespace Friendly.UI.MVC.Controllers
{
    public class HomeController : Controller
    {
        FriendlyEntities db = new FriendlyEntities();

        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public ActionResult Support()
        {
            SupportViewModel supportModel = new SupportViewModel();
            supportModel.Name = db.UserDetails.Find(User.Identity.GetUserId()).FullName;
            supportModel.Email = User.Identity.Name;

            return View(supportModel);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Support(SupportViewModel svm)
        {
            if (!ModelState.IsValid)
            {
                svm.Name = db.UserDetails.Find(User.Identity.GetUserId()).FullName;
                svm.Email = User.Identity.Name;

                return View(svm);
            }

            // Enforcing user info
            svm.Name = db.UserDetails.Find(User.Identity.GetUserId()).FullName;
            svm.Email = User.Identity.Name;

            // Building Message
            string message = $"<h1>New Message</h1><h3>From <a href=\"mailto:{svm.Email}\">{svm.Name}</a></h3><hr><h3>{svm.Subject}</h3><p>{svm.Message}</p>";

            MailMessage mm = new MailMessage("from", "to", svm.Subject, message)
            {
                IsBodyHtml = true,
                Priority = MailPriority.High
            };
            mm.ReplyToList.Add(svm.Email);

            SmtpClient client = new SmtpClient("myserver")
            {
                Credentials = new NetworkCredential("username", "password")
            };

            try
            {
                client.Send(mm);
                //TempData["Demo"] = true;
            }
            catch (Exception ex)
            {
                // Didn't work. Send the error and give the inputs back.
                ViewBag.ContactError = $"<h4>Uh oh. An error occurred.</h4>Here's what happened:{ex.StackTrace}";
                return View(svm);
            }

            // Runs if no issues
            TempData["SentMail"] = true;
            return RedirectToAction("Support");
        }
    }
}
