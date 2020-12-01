using System.Web.Optimization;

namespace LMS.UI.MVC
{
    public class BundleConfig
    {
        // For more information on bundling, visit http://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.validate*"));

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at http://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            bundles.Add(new ScriptBundle("~/bundles/template").Include(
                      "~/Content/plugins/jQuery/jquery.min.js",
                      "~/Scripts/jquery.dataTables.min.js",
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
                      "~/Content/css/jquery.dataTables.min.css",
                      "~/Content/css/style.css"));
        }
    }
}
