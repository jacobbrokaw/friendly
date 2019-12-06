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
	public class OpenFriendshipsController : Controller
	{
		private FriendlyEntities db = new FriendlyEntities();

		// GET: OpenFriendships
		public ActionResult Index()
		{
			if (User.IsInRole("Beta"))
			{
				string userId = User.Identity.GetUserId();
				var openFriendships = db.OpenFriendships.Include(o => o.Clique).Include(o => o.Friendship).Where(o => o.Clique.BetaId == userId);
				return View(openFriendships.ToList());
			}
			else
			{
				var openFriendships = db.OpenFriendships.Include(o => o.Clique).Include(o => o.Friendship);
				return View(openFriendships.ToList());
			}
		}

		// GET: OpenFriendships/Details/5
		public ActionResult Details(int? id)
		{
			if (id == null)
			{
				return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
			}
			OpenFriendship openFriendship = db.OpenFriendships.Find(id);
			string userId = User.Identity.GetUserId();
			// if the the openFriendship doesn't exist OR you are a Beta (Superior) AND you don't manage that position, OR
			// the openFriendship has been applied to
			if (openFriendship == null ||
				(User.IsInRole("Beta") && db.OpenFriendships.Find(id).Clique.BetaId != userId))
			{
				return HttpNotFound();
			}

			return View(openFriendship);
		}

		// GET: OpenFriendships/Create
		[Authorize(Roles = "Beta")]
		public ActionResult Create()
		{
			string userId = User.Identity.GetUserId();
			ViewBag.CliqueId = new SelectList(db.Cliques.Where(c => c.BetaId == userId), "CliqueId", "Name");
			ViewBag.FriendshipId = new SelectList(db.Friendships, "FriendshipId", "Title");
			return View();
		}

		// POST: OpenFriendships/Create
		// To protect from overposting attacks, please enable the specific properties you want to bind to, for 
		// more details see https://go.microsoft.com/fwlink/?LinkId=317598.
		[HttpPost]
		[ValidateAntiForgeryToken]
		[Authorize(Roles = "Beta")]
		public ActionResult Create([Bind(Include = "OpenFriendshipId,FriendshipId,CliqueId")] OpenFriendship openFriendship)
		{
			if (ModelState.IsValid)
			{
				db.OpenFriendships.Add(openFriendship);
				db.SaveChanges();
				return RedirectToAction("Index");
			}

			string userId = User.Identity.GetUserId();
			ViewBag.CliqueId = new SelectList(db.Cliques.Where(c => c.BetaId == userId), "CliqueId", "Name", openFriendship.CliqueId);
			ViewBag.FriendshipId = new SelectList(db.Friendships, "FriendshipId", "Title", openFriendship.FriendshipId);
			return View(openFriendship);
		}

		// GET: OpenFriendships/Edit/5
		public ActionResult Edit(int? id)
		{
			string userId = User.Identity.GetUserId();
			OpenFriendship openFriendship = db.OpenFriendships.Find(id);
			string openFriendshipBetaId = openFriendship.Clique.BetaId;

			if (id == null)
			{
				// You didn't pass an ID
				return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
			}
			if (openFriendship == null || openFriendshipBetaId != userId)
			{
				// It doesn't exist OR you don't manage it
				return HttpNotFound();
			}
			if (openFriendship.Applications.Count != 0)
			{
				// People have applied already
				return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
			}

			ViewBag.CliqueId = new SelectList(db.Cliques.Where(c => c.BetaId == userId), "CliqueId", "Name", openFriendship.CliqueId);
			ViewBag.FriendshipId = new SelectList(db.Friendships, "FriendshipId", "Title", openFriendship.FriendshipId);
			return View(openFriendship);
		}

		// POST: OpenFriendships/Edit/5
		// To protect from overposting attacks, please enable the specific properties you want to bind to, for 
		// more details see https://go.microsoft.com/fwlink/?LinkId=317598.
		[HttpPost]
		[ValidateAntiForgeryToken]
		public ActionResult Edit([Bind(Include = "OpenFriendshipId,FriendshipId,CliqueId")] OpenFriendship openFriendship)
		{

			if (openFriendship.Applications.Count != 0)
			{
				return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
			}

			if (ModelState.IsValid)
			{
				db.Entry(openFriendship).State = EntityState.Modified;
				db.SaveChanges();
				return RedirectToAction("Index");
			}

			string userId = User.Identity.GetUserId();

			ViewBag.CliqueId = new SelectList(db.Cliques.Where(c => c.BetaId == userId), "CliqueId", "Name", openFriendship.CliqueId);
			ViewBag.FriendshipId = new SelectList(db.Friendships, "FriendshipId", "Title", openFriendship.FriendshipId);
			return View(openFriendship);
		}

		// GET: OpenFriendships/Delete/5
		public ActionResult Delete(int? id)
		{
			string userId = User.Identity.GetUserId();
			string openFriendshipBetaId = db.OpenFriendships.Find(id).Clique.BetaId;

			if (id == null || openFriendshipBetaId != userId)
			{
				return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
			}
			OpenFriendship openFriendship = db.OpenFriendships.Find(id);
			if (openFriendship == null)
			{
				return HttpNotFound();
			}
			return View(openFriendship);
		}

		// POST: OpenFriendships/Delete/5
		[HttpPost, ActionName("Delete")]
		[ValidateAntiForgeryToken]
		public ActionResult DeleteConfirmed(int id)
		{
			string userId = User.Identity.GetUserId();
			string openFriendshipBetaId = db.OpenFriendships.Find(id).Clique.BetaId;
			if (openFriendshipBetaId != userId)
			{
				return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
			}

			OpenFriendship openFriendship = db.OpenFriendships.Find(id);
			db.OpenFriendships.Remove(openFriendship);
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
