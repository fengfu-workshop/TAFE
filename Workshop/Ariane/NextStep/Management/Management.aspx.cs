using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Management_Management : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Page_PreInit(object sender, EventArgs e)
    {
        //HttpCookie preferredTheme = Request.Cookies.Get("PreferredTheme");
        //if (preferredTheme != null)
        //{
        //    string folder = Server.MapPath("~/App_Themes/" + preferredTheme.Value);
        //    if (System.IO.Directory.Exists(folder))
        //    {
        //        Page.Theme = preferredTheme.Value;
        //    }
        //}

        //if (!String.IsNullOrEmpty((string) Application["Theme"]))
        //{
        //    Page.Theme = (string)Application["Theme"];
        //}
    }
}