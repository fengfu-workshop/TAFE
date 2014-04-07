using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BasePage
/// </summary>
public class BasePage : System.Web.UI.Page
{
    private void Page_PreRender(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(this.Title))
        {
            throw new Exception("Page title must be specified.");
        }
    }

    protected void Page_PreInit(object sender, EventArgs e)
    {
        HttpCookie preferredTheme = Request.Cookies.Get("PreferredTheme");
        if (preferredTheme != null)
        {
            string folder = Server.MapPath("~/App_Themes/" + preferredTheme.Value);
            if (System.IO.Directory.Exists(folder))
            {
                Page.Theme = preferredTheme.Value;
            }
        }
    }

	public BasePage()
	{
        this.PreRender += Page_PreRender;
        this.PreInit += Page_PreInit;
	}
}