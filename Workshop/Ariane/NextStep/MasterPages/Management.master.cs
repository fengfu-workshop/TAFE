using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPages_Management : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            string themeName = Request.Cookies.Get("Theme") != null ? Request.Cookies.Get("Theme").Value : "";
            if (!string.IsNullOrEmpty(themeName))
            {
                ListItem item = ddlTheme.Items.FindByValue(themeName);
                if (item != null) item.Selected = true;
            }
        }

    }

    protected void ddlTheme_SelectedIndexChanged(object sender, EventArgs e)
    {
        HttpCookie theme = new HttpCookie("Theme");
        theme.Expires = DateTime.Now.AddDays(7);
        theme.Value = ddlTheme.SelectedValue;
        Response.Cookies.Add(theme);
        Response.Redirect(Request.Url.ToString());
    }

    protected void LoginStatus1_LoggedOut(Object sender, System.EventArgs e)
    {
        Session["UserName"] = null;
    }
}
