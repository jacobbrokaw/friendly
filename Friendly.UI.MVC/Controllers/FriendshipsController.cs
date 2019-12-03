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
    public class FriendshipsController : Controller
    {
        private FriendlyEntities db = new FriendlyEntities();

        // GET: Friendships
        public ActionResult Index()
        {
            return View(db.Friendships.ToList());
        }

        // GET: Friendships/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Friendship friendship = db.Friendships.Find(id);
            if (friendship == null)
            {
                return HttpNotFound();
            }
            return View(friendship);
        }

        // GET: Friendships/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Friendships/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "FriendshipId,Title,Description")] Friendship friendship)
        {
            if (ModelState.IsValid)
            {
                db.Friendships.Add(friendship);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(friendship);
        }

        // GET: Friendships/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Friendship friendship = db.Friendships.Find(id);
            if (friendship == null)
            {
                return HttpNotFound();
            }
            return View(friendship);
        }

        // POST: Friendships/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "FriendshipId,Title,Description")] Friendship friendship)
        {
            if (ModelState.IsValid)
            {
                db.Entry(friendship).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(friendship);
        }

        // GET: Friendships/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Friendship friendship = db.Friendships.Find(id);
            if (friendship == null)
            {
                return HttpNotFound();
            }
            return View(friendship);
        }

        // POST: Friendships/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Friendship friendship = db.Friendships.Find(id);
            db.Friendships.Remove(friendship);
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
