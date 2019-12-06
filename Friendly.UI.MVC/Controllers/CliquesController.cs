using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Friendly.DATA.EF;

namespace Friendly.UI.MVC.Controllers
{
	[Authorize(Roles = "Alpha")]
    public class CliquesController : Controller
    {
        private FriendlyEntities db = new FriendlyEntities();

        // GET: Cliques
        public ActionResult Index()
        {
            var cliques = db.Cliques.Include(c => c.UserDetail);
            return View(cliques.ToList());
        }

        // GET: Cliques/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Clique clique = db.Cliques.Find(id);
            if (clique == null)
            {
                return HttpNotFound();
            }
            return View(clique);
        }

        // GET: Cliques/Create
        public ActionResult Create()
        {
			var managerRoleId = db.AspNetRoles.Where(r => r.Name == "Beta").Select(r => r.Id).Single();
			var betaUsers = db.UserDetails.Where(x => db.AspNetUserRoles.Where(y => y.RoleId == managerRoleId).Select(y => y.UserId).Contains(x.UserId));
			ViewBag.BetaId = new SelectList(betaUsers, "UserId", "FullName");

			return View();
        }

        // POST: Cliques/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "CliqueId,Name,City,State,BetaId")] Clique clique)
        {
            if (ModelState.IsValid)
            {
                db.Cliques.Add(clique);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

			var managerRoleId = db.AspNetRoles.Where(r => r.Name == "Beta").Select(r => r.Id).Single();
			var betaUsers = db.UserDetails.Where(x => db.AspNetUserRoles.Where(y => y.RoleId == managerRoleId).Select(y => y.UserId).Contains(x.UserId));
			ViewBag.BetaId = new SelectList(betaUsers, "UserId", "FullName", clique.BetaId);

			return View(clique);
        }

        // GET: Cliques/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Clique clique = db.Cliques.Find(id);
            if (clique == null)
            {
                return HttpNotFound();
            }
			var managerRoleId = db.AspNetRoles.Where(r => r.Name == "Beta").Select(r => r.Id).Single();
			var betaUsers = db.UserDetails.Where(x => db.AspNetUserRoles.Where(y => y.RoleId == managerRoleId).Select(y => y.UserId).Contains(x.UserId));
			ViewBag.BetaId = new SelectList(betaUsers, "UserId", "FullName", clique.BetaId);

			return View(clique);
        }

        // POST: Cliques/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "CliqueId,Name,City,State,BetaId")] Clique clique)
        {
            if (ModelState.IsValid)
            {
                db.Entry(clique).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
			var managerRoleId = db.AspNetRoles.Where(r => r.Name == "Beta").Select(r => r.Id).Single();
			var betaUsers = db.UserDetails.Where(x => db.AspNetUserRoles.Where(y => y.RoleId == managerRoleId).Select(y => y.UserId).Contains(x.UserId));
			ViewBag.BetaId = new SelectList(betaUsers, "UserId", "FullName", clique.BetaId);

			return View(clique);
        }

        // GET: Cliques/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Clique clique = db.Cliques.Find(id);
            if (clique == null)
            {
                return HttpNotFound();
            }
            return View(clique);
        }

        // POST: Cliques/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Clique clique = db.Cliques.Find(id);
            db.Cliques.Remove(clique);
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
