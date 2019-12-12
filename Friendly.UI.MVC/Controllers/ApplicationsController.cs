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
	[Authorize]
	public class ApplicationsController : Controller
	{
		private FriendlyEntities db = new FriendlyEntities();

		// GET: Applications
		public ActionResult Index()
		{
			// TODO: Only send a list of the applications that apply to logged in user.
			// Example: Someone in the Friend role should only see their applications.
			//			Someone in the Beta role (Superior) should only see the applications
			//			for the locations they manage.
			//			Someone in the Alpha role (Admin) should see all applications

			var applications = db.Applications.Include(a => a.ApplicationStatus).Include(a => a.OpenFriendship).Include(a => a.UserDetail);
			string userId = User.Identity.GetUserId();

			if (User.IsInRole("Friend"))
			{
				applications = applications.Where(a => a.UserId == userId);
				//var applicationsFiltered = applications.Where(a => a.UserId == User.Identity.GetUserId());
			}

			if (User.IsInRole("Beta"))
			{
				applications = applications.Where(a => a.OpenFriendship.Clique.BetaId == userId);
			}
			//var applications = db.Applications.Include(a => a.ApplicationStatus).Include(a => a.OpenFriendship).Include(a => a.UserDetail);
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
		//GET: Application/Apply/[openFriendshipId]
		public ActionResult Apply(int openFriendshipId)
		{
			if (User.IsInRole("Friend"))
			{
				var userId = User.Identity.GetUserId();

				if (db.UserDetails.Find(userId).ResumeFilename == null)
				{
					TempData["ErrorMessage"] = "Please upload a resume before applying";
					TempData["ApplyingTo"] = openFriendshipId;
					return RedirectToAction("Index", "Manage");
				}

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

			return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

		}
		#endregion

		#region Accept Application
		//GET: Application/Accept/[applicationId]
        [Authorize(Roles = "Beta")]
		public ActionResult Accept(int id)
		{
			Application application = db.Applications.Find(id);

            if (application.OpenFriendship.Clique.BetaId != User.Identity.GetUserId())
            {
                return new HttpStatusCodeResult(HttpStatusCode.Forbidden);
            }

			if (!application.ApplicationStatusId.Equals(1))
			{
				// The application has already been accepted/rejected
				return Content("{\"status\": 400, \"message\": \"The application has already been responded to\"}", "application/json");
			}

			application.ApplicationStatusId = 2;

			db.Entry(application).State = EntityState.Modified;
			db.SaveChanges();
			return Content("{\"status\": 200, \"message\": \"The application has been accepted\"}", "application/json");
		}
		#endregion

		#region Reject Application
		//GET: Application/Accept/[applicationId]
        [Authorize(Roles = "Beta")]
		public ActionResult Reject(int id)
		{
			Application application = db.Applications.Find(id);

            if (application.OpenFriendship.Clique.BetaId != User.Identity.GetUserId())
            {
                return new HttpStatusCodeResult(HttpStatusCode.Forbidden);
            }

            if (!application.ApplicationStatusId.Equals(1))
			{
				// The application has already been accepted/rejected
				return Content("{\"status\": 400, \"message\": \"The application has already been responded to\"}", "application/json");
			}

			application.ApplicationStatusId = 3;

			db.Entry(application).State = EntityState.Modified;
			db.SaveChanges();
			return Content("{\"status\": 200, \"message\": \"The application has been rejected\"}", "application/json");
		}
		#endregion

		#region Create & Edit
		//// GET: Applications/Create
		//public ActionResult Create()
		//{
		//	ViewBag.ApplicationStatus = new SelectList(db.ApplicationStatuses, "ApplicationStatusId", "StatusName");
		//	ViewBag.OpenFriendshipId = new SelectList(db.OpenFriendships, "OpenFriendshipId", "OpenFriendshipId");
		//	ViewBag.UserId = new SelectList(db.UserDetails, "UserId", "FirstName");
		//	return View();
		//}

		//// POST: Applications/Create
		//// To protect from overposting attacks, please enable the specific properties you want to bind to, for 
		//// more details see https://go.microsoft.com/fwlink/?LinkId=317598.
		//[HttpPost]
		//[ValidateAntiForgeryToken]
		//public ActionResult Create([Bind(Include = "ApplicationId,OpenFriendshipId,UserId,ApplicationDate,ManagerNotes,ApplicationStatus,ResumeFilename")] Application application)
		//{
		//	if (ModelState.IsValid)
		//	{
		//		db.Applications.Add(application);
		//		db.SaveChanges();
		//		return RedirectToAction("Index");
		//	}

		//	ViewBag.ApplicationStatus = new SelectList(db.ApplicationStatuses, "ApplicationStatusId", "StatusName", application.ApplicationStatus);
		//	ViewBag.OpenFriendshipId = new SelectList(db.OpenFriendships, "OpenFriendshipId", "OpenFriendshipId", application.OpenFriendshipId);
		//	ViewBag.UserId = new SelectList(db.UserDetails, "UserId", "FirstName", application.UserId);
		//	return View(application);
		//}

		//// GET: Applications/Edit/5
		//public ActionResult Edit(int? id)
		//{
		//	if (id == null)
		//	{
		//		return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
		//	}
		//	Application application = db.Applications.Find(id);
		//	if (application == null)
		//	{
		//		return HttpNotFound();
		//	}
		//	ViewBag.ApplicationStatus = new SelectList(db.ApplicationStatuses, "ApplicationStatusId", "StatusName", application.ApplicationStatus);
		//	ViewBag.OpenFriendshipId = new SelectList(db.OpenFriendships, "OpenFriendshipId", "OpenFriendshipId", application.OpenFriendshipId);
		//	ViewBag.UserId = new SelectList(db.UserDetails, "UserId", "FirstName", application.UserId);
		//	return View(application);
		//}

		//// POST: Applications/Edit/5
		//// To protect from overposting attacks, please enable the specific properties you want to bind to, for 
		//// more details see https://go.microsoft.com/fwlink/?LinkId=317598.
		//[HttpPost]
		//[ValidateAntiForgeryToken]
		//public ActionResult Edit([Bind(Include = "ApplicationId,OpenFriendshipId,UserId,ApplicationDate,ManagerNotes,ApplicationStatus,ResumeFilename")] Application application)
		//{
		//	if (ModelState.IsValid)
		//	{
		//		db.Entry(application).State = EntityState.Modified;
		//		db.SaveChanges();
		//		return RedirectToAction("Index");
		//	}
		//	ViewBag.ApplicationStatus = new SelectList(db.ApplicationStatuses, "ApplicationStatusId", "StatusName", application.ApplicationStatus);
		//	ViewBag.OpenFriendshipId = new SelectList(db.OpenFriendships, "OpenFriendshipId", "OpenFriendshipId", application.OpenFriendshipId);
		//	ViewBag.UserId = new SelectList(db.UserDetails, "UserId", "FirstName", application.UserId);
		//	return View(application);
		//}
		#endregion

		#region Update Notes
		// POST: Applications/UpdateNotes
		[HttpPost]
		[ValidateAntiForgeryToken]
		public ActionResult UpdateNotes(int? id, string ManagerNotes)
		{
			if (id == null)
			{
				return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
			}

			Application application = db.Applications.Find(id);
			application.ManagerNotes = ManagerNotes;

			db.SaveChanges();
			return RedirectToAction("Details", new { id });
		}
		#endregion

		//// GET: Applications/Delete/5
		//public ActionResult Delete(int? id)
		//{
		//	if (id == null)
		//	{
		//		return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
		//	}
		//	Application application = db.Applications.Find(id);
		//	if (application == null)
		//	{
		//		return HttpNotFound();
		//	}
		//	return View(application);
		//}

		//// POST: Applications/Delete/5
		//[HttpPost, ActionName("Delete")]
		//[ValidateAntiForgeryToken]
		//public ActionResult DeleteConfirmed(int id)
		//{
		//	Application application = db.Applications.Find(id);
		//	db.Applications.Remove(application);
		//	db.SaveChanges();
		//	return RedirectToAction("Index");
		//}

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
