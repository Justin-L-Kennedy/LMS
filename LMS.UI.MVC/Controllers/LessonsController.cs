using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using LMS.DATA.EF;
using LMS.UI.MVC.Utilities; //added for access to Utilities

namespace LMS.UI.MVC.Controllers
{
    public class LessonsController : Controller
    {
        private LMSEntities db = new LMSEntities();

        // GET: Lessons
        public ActionResult Index()
        {
            var lessons = db.Lessons.Include(l => l.Course);
            return View(lessons.ToList());
        }

        // GET: Lessons/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Lesson lesson = db.Lessons.Find(id);
            if (lesson == null)
            {
                return HttpNotFound();
            }
            return View(lesson);
        }

        // GET: Lessons/Create
        public ActionResult Create()
        {
            ViewBag.CourseID = new SelectList(db.Courses, "CourseID", "CourseName");
            return View();
        }

        // POST: Lessons/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "LessonID,LessonTitle,CourseID,Introduction,VideoURL,PdfFilename,IsActive")] Lesson lesson, HttpPostedFileBase lessonFile)
        {
            if (ModelState.IsValid)
            {
                #region File Upload
                string file = "JustinLKennedyResume.pdf";
                if (lessonFile != null)
                {
                    file = lessonFile.FileName;
                    string[] goodExts = new string[] { ".jpg", ".jpeg", ".png", ".gif", ".pdf" };
                    //check that the uploaded file ext is in our list of good file extensions && check file size <= 4mb (max by default from ASP.NET)
                    if (goodExts.Contains(file.Substring(file.LastIndexOf("."))) && lessonFile.ContentLength <= 4194304)
                    {
                        lessonFile.SaveAs(Server.MapPath("~/Content/images/lessons/" + file));
                    }
                }
                lesson.PdfFilename = file;
                #endregion

                db.Lessons.Add(lesson);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.CourseID = new SelectList(db.Courses, "CourseID", "CourseName", lesson.CourseID);
            return View(lesson);
        }

        // GET: Lessons/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Lesson lesson = db.Lessons.Find(id);
            if (lesson == null)
            {
                return HttpNotFound();
            }
            ViewBag.CourseID = new SelectList(db.Courses, "CourseID", "CourseName", lesson.CourseID);
            return View(lesson);
        }

        // POST: Lessons/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "LessonID,LessonTitle,CourseID,Introduction,VideoURL,PdfFilename,IsActive")] Lesson lesson, HttpPostedFileBase lessonFile)
        {
            if (ModelState.IsValid)
            {
                #region File Upload
                if (lessonFile != null)
                {
                    string file = lessonFile.FileName;
                    string[] goodExts = new string[] { ".jpg", ".jpeg", ".png", ".gif", ".pdf" };
                    //check that the uploaded file ext is in our list of good file extensions && check file size <= 4mb (max by default from ASP.NET)
                    if (goodExts.Contains(file.Substring(file.LastIndexOf("."))) && lessonFile.ContentLength <= 4194304)
                    {
                        if (lesson.PdfFilename != null && lesson.PdfFilename != "JustinLKennedyResume.pdf") //Delete the old file of the record that is being edited
                        {
                            string path = Server.MapPath("~/Content/images/lessons/");
                            UploadUtility.Delete(path, lesson.PdfFilename);
                        }
                        lessonFile.SaveAs(Server.MapPath("~/Content/images/lessons/" + file));
                    }
                    lesson.PdfFilename = file;
                }
                #endregion

                db.Entry(lesson).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CourseID = new SelectList(db.Courses, "CourseID", "CourseName", lesson.CourseID);
            return View(lesson);
        }

        // GET: Lessons/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Lesson lesson = db.Lessons.Find(id);
            if (lesson == null)
            {
                return HttpNotFound();
            }
            return View(lesson);
        }

        // POST: Lessons/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Lesson lesson = db.Lessons.Find(id);
            //Delete the file of the record that is being removed
            if (lesson.PdfFilename != null)
            {
                string path = Server.MapPath("~/Content/images/lessons/");
                UploadUtility.Delete(path, lesson.PdfFilename);
            }
            db.Lessons.Remove(lesson);
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
