using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Drawing;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using LMS.DATA.EF;
using LMS.UI.MVC.Utilities; //added for access to Utilities
using LMS.UI.MVC.Models;
using Microsoft.AspNet.Identity;

namespace LMS.UI.MVC.Controllers
{
    public class CoursesController : Controller
    {
        private LMSEntities db = new LMSEntities();

        // GET: Courses
        public ActionResult Index()
        {
            string currentUserID = User.Identity.GetUserId();
            if (User.IsInRole("Talent"))
            {
                var courses = db.Courses;
                var courseCompletions = db.CourseCompletions.Where(cc => cc.UserID == currentUserID);
                foreach (var item in courses)
                {
                    foreach (var complete in courseCompletions)
                    {
                        if (complete.CourseID == item.CourseID)
                        {
                            item.HasCompleted = true;
                            item.DateCompleted = complete.DateCompleted;
                        }
                    }
                }
                return View(courses.ToList());
            }
            return View(db.Courses.ToList());
        }

        // GET: CoursesTable
        public ActionResult CoursesTable()
        {
            string currentUserID = User.Identity.GetUserId();
            if (User.IsInRole("Talent"))
            {
                var courses = db.Courses;
                var courseCompletions = db.CourseCompletions.Where(cc => cc.UserID == currentUserID);
                foreach (var item in courses)
                {
                    foreach (var complete in courseCompletions)
                    {
                        if (complete.CourseID == item.CourseID)
                        {
                            item.HasCompleted = true;
                            item.DateCompleted = complete.DateCompleted;
                        }
                    }
                }
                return View(courses.ToList());
            }
            return View(db.Courses.ToList());
        }

        // GET: Courses/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Course course = db.Courses.Find(id);
            if (course == null)
            {
                return HttpNotFound();
            }

            string currentUserID = User.Identity.GetUserId();
            if (User.IsInRole("Talent"))
            {
                var lessons = db.Lessons.Include(l => l.Course).Where(l => l.CourseID == id);
                var lessonViews = db.LessonViews.Where(lv => lv.UserID == currentUserID);
                foreach (var item in lessons)
                {
                    foreach (var view in lessonViews)
                    {
                        if (view.LessonID == item.LessonID)
                        {
                            item.HasViewed = true;
                            item.DateViewed = view.DateViewed;
                        }
                    }
                }
                ViewBag.LessonViewsCount = db.LessonViews.Where(lv => lv.UserID == currentUserID && lv.Lesson.CourseID == id && lv.DateViewed != new DateTime(0001, 1, 1)).Count();

                var courseCompletions = db.CourseCompletions.Where(cc => cc.UserID == currentUserID);
                foreach (var complete in courseCompletions)
                {
                    if (complete.CourseID == course.CourseID)
                    {
                        course.HasCompleted = true;
                        course.DateCompleted = complete.DateCompleted;
                    }
                }
            }

            return View(course);
        }

        // GET: Courses/Create
        [Authorize(Roles = "Admin")]
        public ActionResult Create()
        {
            return View();
        }

        // POST: Courses/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public ActionResult Create([Bind(Include = "CourseID,CourseName,CourseDescription,CourseImage,IsActive")] Course course, HttpPostedFileBase courseImage)
        {
            if (ModelState.IsValid)
            {
                #region File Upload
                string file = "NoImage.png";
                if (courseImage != null)
                {
                    file = courseImage.FileName;
                    string ext = file.Substring(file.LastIndexOf('.'));
                    string[] goodExts = { ".jpeg", ".jpg", ".png", ".gif" };
                    //check that the uploaded file ext is in our list of good file extensions
                    if (goodExts.Contains(ext))
                    {
                        //if valid ext, check file size <= 4mb (max by default from ASP.NET)
                        if (courseImage.ContentLength <= 4194304)
                        {
                            //create a new file name using a guid
                            //file = Guid.NewGuid() + ext;

                            #region Resize Image
                            string savePath = Server.MapPath("~/Content/images/courses/");
                            Image convertedImage = Image.FromStream(courseImage.InputStream);
                            int maxImageSize = 800;
                            int maxThumbSize = 350;
                            UploadUtility.ResizeImage(savePath, file, convertedImage, maxImageSize, maxThumbSize);
                            #endregion
                        }
                    }
                }
                course.CourseImage = file;
                #endregion

                db.Courses.Add(course);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(course);
        }

        // GET: Courses/Edit/5
        [Authorize(Roles = "Admin")]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Course course = db.Courses.Find(id);
            if (course == null)
            {
                return HttpNotFound();
            }
            return View(course);
        }

        // POST: Courses/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public ActionResult Edit([Bind(Include = "CourseID,CourseName,CourseDescription,CourseImage,IsActive")] Course course, HttpPostedFileBase courseImage)
        {
            if (ModelState.IsValid)
            {
                #region File Upload
                if (courseImage != null)
                {
                    string file = courseImage.FileName;
                    string ext = file.Substring(file.LastIndexOf('.'));
                    string[] goodExts = { ".jpeg", ".jpg", ".png", ".gif" };
                    //check that the uploaded file ext is in our list of good file extensions
                    if (goodExts.Contains(ext))
                    {
                        //if valid ext, check file size <= 4mb (max by default from ASP.NET)
                        if (courseImage.ContentLength <= 4194304)
                        {
                            //create a new file name using a guid
                            //file = Guid.NewGuid() + ext;

                            #region Resize Image
                            string savePath = Server.MapPath("~/Content/images/courses/");
                            Image convertedImage = Image.FromStream(courseImage.InputStream);
                            int maxImageSize = 800;
                            int maxThumbSize = 350;
                            UploadUtility.ResizeImage(savePath, file, convertedImage, maxImageSize, maxThumbSize);
                            #endregion

                            if (course.CourseImage != null && course.CourseImage != "NoImage.png")
                            {
                                string path = Server.MapPath("~/Content/images/courses/");
                                UploadUtility.Delete(path, course.CourseImage);
                            }
                        }
                    }
                    course.CourseImage = file;
                }
                #endregion

                db.Entry(course).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(course);
        }

        // GET: Courses/Delete/5
        [Authorize(Roles = "Admin")]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Course course = db.Courses.Find(id);
            if (course == null)
            {
                return HttpNotFound();
            }
            return View(course);
        }

        // POST: Courses/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public ActionResult DeleteConfirmed(int id)
        {
            Course course = db.Courses.Find(id);
            //Delete the image file of the record that is being removed
            if (course.CourseImage != null && course.CourseImage != "NoImage.png")
            {
                string path = Server.MapPath("~/Content/images/courses/");
                UploadUtility.Delete(path, course.CourseImage);
            }
            db.Courses.Remove(course);
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
