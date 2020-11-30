using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Mvc;
using LMS.DATA.EF;
using LMS.UI.MVC.Utilities; //added for access to Utilities
using Microsoft.AspNet.Identity;

namespace LMS.UI.MVC.Controllers
{
    public class LessonsController : Controller
    {
        private LMSEntities db = new LMSEntities();

        // GET: Lessons
        public ActionResult Index(int? id)
        {
            string currentUserID = User.Identity.GetUserId();
            if (id == null)
            {
                var lessons = db.Lessons.Include(l => l.Course);
                return View(lessons.ToList());
            }
            else
            {
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
                    return View(lessons.ToList());
                }
                else
                {
                    var lessons = db.Lessons.Include(l => l.Course).Where(l => l.CourseID == id);
                    return View(lessons.ToList());
                }
            }
        }

        // GET: Lessons/Details/5
        public ActionResult Details(int id)
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

            #region Lesson View DateTime
            string currentUserID = User.Identity.GetUserId();
            if (User.IsInRole("Talent"))
            {
                LessonView lessonView = new LessonView();
                lessonView.UserID = currentUserID;
                lessonView.LessonID = id;
                lessonView.DateViewed = DateTime.Now;

                var viewDate = db.LessonViews.Where(lv => lv.LessonID == id && lv.UserID == currentUserID).FirstOrDefault();
                if (viewDate == null)
                {
                    db.LessonViews.Add(lessonView);
                    db.SaveChanges();
                }
            }
            #endregion

            #region Course Completion DateTime
            if (User.IsInRole("Talent"))
            {
                int totalLessons = db.Lessons.Where(l => l.CourseID == lesson.CourseID && l.IsActive == true).Count();
                int viewedLessons = db.LessonViews.Where(lv => lv.Lesson.CourseID == lesson.CourseID && lv.Lesson.IsActive == true && lv.UserID == currentUserID).Count();
                if (viewedLessons == totalLessons)
                {
                    CourseCompletion courseCompletion = new CourseCompletion();
                    courseCompletion.UserID = currentUserID;
                    courseCompletion.CourseID = lesson.CourseID;
                    courseCompletion.DateCompleted = DateTime.Now;

                    var completionDate = db.CourseCompletions.Where(cc => cc.CourseID == lesson.CourseID && cc.UserID == currentUserID).FirstOrDefault();
                    if (completionDate == null)
                    {
                        db.CourseCompletions.Add(courseCompletion);
                        db.SaveChanges();

                        #region Course Completion Email
                        string emailBody = $"{courseCompletion.UserDetail.FullName} completed the {courseCompletion.Course.CourseName} course on {courseCompletion.DateCompleted:d}.";
                        MailMessage completionMsg = new MailMessage(
                            "no-reply@justinlkennedy.com",
                            "justin.l.kennedy@outlook.com",
                            "Just Act! Course Completion",
                            emailBody);
                        completionMsg.IsBodyHtml = true;
                        completionMsg.Priority = MailPriority.High;
                        SmtpClient client = new SmtpClient("mail.justinlkennedy.com");
                        client.Credentials = new NetworkCredential("no-reply@justinlkennedy.com", "C3ntr!q");
                        #endregion
                    }
                }
            }
            #endregion

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
