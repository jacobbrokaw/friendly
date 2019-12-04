using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Friendly.DATA.EF;
using Microsoft.AspNet.Identity; // added

namespace Friendly.UI.MVC.Controllers
{
	public class ApplicationsController : Controller
	{
		private FriendlyEntities db = new FriendlyEntities();

		// GET: Applications
		public ActionResult Index()
		{
			var applications = db.Applications.Include(a => a.ApplicationStatus).Include(a => a.OpenFriendship).Include(a => a.UserDetail);
			return View(applications.ToList());
		}

		// GET: Applications/Details/5
		public ActionResult Details(int? id)
		{
			if (id == null)
			{
				return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
			}
			Application application = db.Applications.Find(id);
			if (application == null)
			{
				return HttpNotFound();
			}
			return View(application);
		}

		#region 1 Click Apply
		//GET: Application/Apply
		public ActionResult Apply(int openFriendshipId)
		{
			var userId = User.Identity.GetUserId();

			Application application = new Application();
			application.ApplicationStatusId = 1;
			application.ApplicationDate = DateTime.Now;
			application.UserId = userId;
			application.OpenFriendshipId = openFriendshipId;
			application.ResumeFilename = db.UserDetails.Find(userId).ResumeFilename;

			db.Applications.Add(application);
			db.SaveChanges();
			return RedirectToAction("Index", "OpenFriendships");

		}
		#endregion

		// GET: Applications/Create
		public ActionResult Create()
		{
			ViewBag.ApplicationStatus = new SelectList(db.ApplicationStatuses, "ApplicationStatusId", "StatusName");
			ViewBag.OpenFriendshipId = new SelectList(db.OpenFriendships, "OpenFriendshipId", "OpenFriendshipId");
			ViewBag.UserId = new SelectList(db.UserDetails, "UserId", "FirstName");
			return View();
		}

		// POST: Applications/Create
		// To protect from overposting attacks, please enable the specific properties you want to bind to, for 
		// more details see https://go.microsoft.com/fwlink/?LinkId=317598.
		[HttpPost]
		[ValidateAntiForgeryToken]
		public ActionResult Create([Bind(Include = "ApplicationId,OpenFriendshipId,UserId,ApplicationDate,ManagerNotes,ApplicationStatus,ResumeFilename")] Application application)
		{
			if (ModelState.IsValid)
			{
				db.Applications.Add(application);
				db.SaveChanges();
				return RedirectToAction("Index");
			}

			ViewBag.ApplicationStatus = new SelectList(db.ApplicationStatuses, "ApplicationStatusId", "StatusName", application.ApplicationStatus);
			ViewBag.OpenFriendshipId = new SelectList(db.OpenFriendships, "OpenFriendshipId", "OpenFriendshipId", application.OpenFriendshipId);
			ViewBag.UserId = new SelectList(db.UserDetails, "UserId", "FirstName", application.UserId);
			return View(application);
		}

		// GET: Applications/Edit/5
		public ActionResult Edit(int? id)
		{
			if (id == null)
			{
				return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
			}
			Application application = db.Applications.Find(id);
			if (application == null)
			{
				return HttpNotFound();
			}
			ViewBag.ApplicationStatus = new SelectList(db.ApplicationStatuses, "ApplicationStatusId", "StatusName", application.ApplicationStatus);
			ViewBag.OpenFriendshipId = new SelectList(db.OpenFriendships, "OpenFriendshipId", "OpenFriendshipId", application.OpenFriendshipId);
			ViewBag.UserId = new SelectList(db.UserDetails, "UserId", "FirstName", application.UserId);
			return View(application);
		}

		// POST: Applications/Edit/5
		// To protect from overposting attacks, please enable the specific properties you want to bind to, for 
		// more details see https://go.microsoft.com/fwlink/?LinkId=317598.
		[HttpPost]
		[ValidateAntiForgeryToken]
		public ActionResult Edit([Bind(Include = "ApplicationId,OpenFriendshipId,UserId,ApplicationDate,ManagerNotes,ApplicationStatus,ResumeFilename")] Application application)
		{
			if (ModelState.IsValid)
			{
				db.Entry(application).State = EntityState.Modified;
				db.SaveChanges();
				return RedirectToAction("Index");
			}
			ViewBag.ApplicationStatus = new SelectList(db.ApplicationStatuses, "ApplicationStatusId", "StatusName", application.ApplicationStatus);
			ViewBag.OpenFriendshipId = new SelectList(db.OpenFriendships, "OpenFriendshipId", "OpenFriendshipId", application.OpenFriendshipId);
			ViewBag.UserId = new SelectList(db.UserDetails, "UserId", "FirstName", application.UserId);
			return View(application);
		}

		// GET: Applications/Delete/5
		public ActionResult Delete(int? id)
		{
			if (id == null)
			{
				return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
			}
			Application application = db.Applications.Find(id);
			if (application == null)
			{
				return HttpNotFound();
			}
			return View(application);
		}

		// POST: Applications/Delete/5
		[HttpPost, ActionName("Delete")]
		[ValidateAntiForgeryToken]
		public ActionResult DeleteConfirmed(int id)
		{
			Application application = db.Applications.Find(id);
			db.Applications.Remove(application);
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
	}
}
