using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace LMS.DATA.EF//.Metadata
{
    #region Course Metadata
    public class CourseMetadata
    {
        [Display(Name = "Course ID")]
        public int CourseID { get; set; }

        [Required(ErrorMessage = "* Course Name is required")]
        [StringLength(200, ErrorMessage = "* Course Name cannot be longer than 200 characters")]
        [UIHint("MultilineText")]
        [Display(Name = "Course Name")]
        public string CourseName { get; set; }

        [DisplayFormat(NullDisplayText = "N/A")]
        [StringLength(500, ErrorMessage = "* Course Description cannot be longer than 500 characters")]
        [UIHint("MultilineText")]
        [Display(Name = "Course Description")]
        public string CourseDescription { get; set; }

        [Display(Name = "Is Active")]
        public bool IsActive { get; set; }
    }

    [MetadataType(typeof(CourseMetadata))]
    public partial class Course
    {

    }
    #endregion

    #region CourseCompletion Metadata
    public class CourseCompletionMetadata
    {
        [Display(Name = "Course Completion ID")]
        public int CourseCompletionID { get; set; }

        [Display(Name = "User ID")]
        public string UserID { get; set; }

        [Display(Name = "Course ID")]
        public int CourseID { get; set; }

        [DisplayFormat(DataFormatString = "{0:d}", ApplyFormatInEditMode = true)]
        [Display(Name = "Date Completed")]
        public System.DateTime DateCompleted { get; set; }
    }

    [MetadataType(typeof(CourseCompletionMetadata))]
    public partial class CourseCompletion
    {

    }
    #endregion

    #region Lesson Metadata
    public class LessonMetadata
    {
        [Display(Name = "Lesson ID")]
        public int LessonID { get; set; }

        [Required(ErrorMessage = "* Lesson Title is required")]
        [StringLength(200, ErrorMessage = "* Lesson Title cannot be longer than 200 characters")]
        [UIHint("MultilineText")]
        [Display(Name = "Lesson Title")]
        public string LessonTitle { get; set; }

        [Display(Name = "Course ID")]
        public int CourseID { get; set; }

        [DisplayFormat(NullDisplayText = "N/A")]
        [StringLength(300, ErrorMessage = "* Introduction cannot be longer than 300 characters")]
        [UIHint("MultilineText")]
        public string Introduction { get; set; }

        [DisplayFormat(NullDisplayText = "N/A")]
        [StringLength(250, ErrorMessage = "* Video URL cannot be longer than 250 characters")]
        [Display(Name = "Video URL")]
        public string VideoURL { get; set; }

        [DisplayFormat(NullDisplayText = "N/A")]
        [StringLength(100, ErrorMessage = "* Pdf Filename cannot be longer than 100 characters")]
        [Display(Name = "Pdf Filename")]
        public string PdfFilename { get; set; }

        [Display(Name = "Is Active")]
        public bool IsActive { get; set; }
    }

    [MetadataType(typeof(LessonMetadata))]
    public partial class Lesson
    {

    }
    #endregion

    #region LessonView Metadata
    public class LessonViewMetadata
    {
        [Display(Name = "Lesson View ID")]
        public int LessonViewID { get; set; }

        [Display(Name = "User ID")]
        public string UserID { get; set; }

        [Display(Name = "Lesson ID")]
        public int LessonID { get; set; }

        [DisplayFormat(DataFormatString = "{0:d}", ApplyFormatInEditMode = true)]
        [Display(Name = "Date Viewed")]
        public System.DateTime DateViewed { get; set; }
    }

    [MetadataType(typeof(LessonViewMetadata))]
    public partial class LessonView
    {

    }
    #endregion

    #region UserDetail Metadata
    public class UserDetailMetadata
    {
        [Display(Name = "User ID")]
        public string UserID { get; set; }

        [Required(ErrorMessage = "* First Name is required")]
        [StringLength(50, ErrorMessage = "* First Name cannot be longer than 50 characters")]
        [Display(Name = "First Name")]
        public string FirstName { get; set; }

        [Required(ErrorMessage = "* Last Name is required")]
        [StringLength(50, ErrorMessage = "* Last Name cannot be longer than 50 characters")]
        [Display(Name = "Last Name")]
        public string LastName { get; set; }
    }

    [MetadataType(typeof(UserDetailMetadata))]
    public partial class UserDetail
    {
        [Display(Name = "Name")]
        public string FullName { get { return FirstName + " " + LastName; } }
    }
    #endregion
}
