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
	[Authorize]
    public class OpenFriendshipsController : Controller
    {
        private FriendlyEntities db = new FriendlyEntities();

        // GET: OpenFriendships
        public ActionResult Index()
        {
            var openFriendships = db.OpenFriendships.Include(o => o.Clique).Include(o => o.Friendship);
            return View(openFriendships.ToList());
        }

        // GET: OpenFriendships/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
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

        // GET: OpenFriendships/Create
        public ActionResult Create()
        {
            ViewBag.CliqueId = new SelectList(db.Cliques, "CliqueId", "Name");
            ViewBag.FriendshipId = new SelectList(db.Friendships, "FriendshipId", "Title");
            return View();
        }

        // POST: OpenFriendships/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "OpenFriendshipId,FriendshipId,CliqueId")] OpenFriendship openFriendship)
        {
            if (ModelState.IsValid)
            {
                db.OpenFriendships.Add(openFriendship);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.CliqueId = new SelectList(db.Cliques, "CliqueId", "Name", openFriendship.CliqueId);
            ViewBag.FriendshipId = new SelectList(db.Friendships, "FriendshipId", "Title", openFriendship.FriendshipId);
            return View(openFriendship);
        }

        // GET: OpenFriendships/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            OpenFriendship openFriendship = db.OpenFriendships.Find(id);
            if (openFriendship == null)
            {
                return HttpNotFound();
            }
            ViewBag.CliqueId = new SelectList(db.Cliques, "CliqueId", "Name", openFriendship.CliqueId);
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
            if (ModelState.IsValid)
            {
                db.Entry(openFriendship).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CliqueId = new SelectList(db.Cliques, "CliqueId", "Name", openFriendship.CliqueId);
            ViewBag.FriendshipId = new SelectList(db.Friendships, "FriendshipId", "Title", openFriendship.FriendshipId);
            return View(openFriendship);
        }

        // GET: OpenFriendships/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
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
