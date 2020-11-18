using System.Web.Optimization;

namespace LMS.UI.MVC
{
    public class BundleConfig
    {
        // For more information on bundling, visit http://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/template").Include(
                      "~/Content/plugins/jQuery/jquery.min.js",
                      "~/Content/plugins/bootstrap/bootstrap.min.js",
                      "~/Content/plugins/slick/slick.min.js",
                      "~/Content/plugins/aos/aos.js",
                      "~/Content/plugins/venobox/venobox.min.js",
                      "~/Content/plugins/filterizr/jquery.filterizr.min.js",
                      "~/Content/plugins/google-map/gmap.js",
                      "~/Content/js/script.js"));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                      "~/Content/plugins/bootstrap/bootstrap.min.css",
                      "~/Content/plugins/slick/slick.css",
                      "~/Content/plugins/themify-icons/themify-icons.css",
                      "~/Content/plugins/animate/animate.css",
                      "~/Content/plugins/aos/aos.css",
                      "~/Content/plugins/venobox/venobox.css",
                      "~/Content/css/style.css"));
        }
    }
}
