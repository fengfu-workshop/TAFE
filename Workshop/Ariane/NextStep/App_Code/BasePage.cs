using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BasePage
/// </summary>
public class BasePage : System.Web.UI.Page
{
    protected void Page_PreInit(object sender, EventArgs e)
    {
        string themeName = Request.Cookies.Get("Theme") != null ? Request.Cookies.Get("Theme").Value : "";

        if (!string.IsNullOrEmpty(themeName) && Page.Theme != themeName)
            Page.Theme = themeName;

    }

	public BasePage()
	{
        this.PreInit += Page_PreInit;
	}
}