﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using LMS.DATA.EF;
using Microsoft.AspNet.Identity;

namespace LMS.UI.MVC.Controllers
{
    public class LessonViewsController : Controller
    {
        private LMSEntities db = new LMSEntities();

        // GET: LessonViews
        [Authorize(Roles = "Admin, Manager, Talent")]
        public ActionResult Index()
        {
            string currentUserID = User.Identity.GetUserId();
            if (User.IsInRole("Talent"))
            {
                var lessonViews = db.LessonViews.Include(l => l.Lesson).Include(l => l.UserDetail).Where(lv => lv.UserID == currentUserID);
                return View(lessonViews.ToList());
            }
            else
            {
                var lessonViews = db.LessonViews.Include(l => l.Lesson).Include(l => l.UserDetail);
                return View(lessonViews.ToList());
            }
        }

        // GET: LessonViews/Details/5
        [Authorize(Roles = "Admin")]
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LessonView lessonView = db.LessonViews.Find(id);
            if (lessonView == null)
            {
                return HttpNotFound();
            }
            return View(lessonView);
        }

        // GET: LessonViews/Create
        [Authorize(Roles = "Admin")]
        public ActionResult Create()
        {
            ViewBag.LessonID = new SelectList(db.Lessons, "LessonID", "LessonTitle");
            ViewBag.UserID = new SelectList(db.UserDetails, "UserID", "FirstName");
            return View();
        }

        // POST: LessonViews/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public ActionResult Create([Bind(Include = "LessonViewID,UserID,LessonID,DateViewed")] LessonView lessonView)
        {
            if (ModelState.IsValid)
            {
                db.LessonViews.Add(lessonView);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.LessonID = new SelectList(db.Lessons, "LessonID", "LessonTitle", lessonView.LessonID);
            ViewBag.UserID = new SelectList(db.UserDetails, "UserID", "FirstName", lessonView.UserID);
            return View(lessonView);
        }

        // GET: LessonViews/Edit/5
        [Authorize(Roles = "Admin")]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LessonView lessonView = db.LessonViews.Find(id);
            if (lessonView == null)
            {
                return HttpNotFound();
            }
            ViewBag.LessonID = new SelectList(db.Lessons, "LessonID", "LessonTitle", lessonView.LessonID);
            ViewBag.UserID = new SelectList(db.UserDetails, "UserID", "FirstName", lessonView.UserID);
            return View(lessonView);
        }

        // POST: LessonViews/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public ActionResult Edit([Bind(Include = "LessonViewID,UserID,LessonID,DateViewed")] LessonView lessonView)
        {
            if (ModelState.IsValid)
            {
                db.Entry(lessonView).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.LessonID = new SelectList(db.Lessons, "LessonID", "LessonTitle", lessonView.LessonID);
            ViewBag.UserID = new SelectList(db.UserDetails, "UserID", "FirstName", lessonView.UserID);
            return View(lessonView);
        }

        // GET: LessonViews/Delete/5
        [Authorize(Roles = "Admin")]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LessonView lessonView = db.LessonViews.Find(id);
            if (lessonView == null)
            {
                return HttpNotFound();
            }
            return View(lessonView);
        }

        // POST: LessonViews/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public ActionResult DeleteConfirmed(int id)
        {
            LessonView lessonView = db.LessonViews.Find(id);
            db.LessonViews.Remove(lessonView);
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
