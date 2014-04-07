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
            string selectedTheme = Page.Theme;
            HttpCookie preferredTheme = Request.Cookies.Get("PreferredTheme");
            if (preferredTheme != null)
            {
                selectedTheme = preferredTheme.Value;
            }
            if (!string.IsNullOrEmpty(selectedTheme))
            {
                ListItem item = ddlTheme.Items.FindByValue(selectedTheme);
                if (item != null)
                {
                    item.Selected = true;
                }
            }
        }

        //if (!Page.IsPostBack)
        //{
        //    if (!string.IsNullOrEmpty((string)Application["Theme"]))
        //    {
        //        ListItem item = ddlTheme.Items.FindByValue((string)Application["Theme"]);
        //        if (item != null)
        //        {
        //            item.Selected = true;
        //        }
        //    }
        //}
    }

    protected void ddlTheme_SelectedIndexChanged(object sender, EventArgs e)
    {
        Application["Theme"] = ddlTheme.SelectedValue;
        HttpCookie preferredTheme = new HttpCookie("PreferredTheme");
        preferredTheme.Expires = DateTime.Now.AddMonths(3);
        preferredTheme.Value = ddlTheme.SelectedValue;
        Response.Cookies.Add(preferredTheme);
        Response.Redirect(Request.Url.ToString());
        //Response.Redirect("~/Management/Management.aspx");

    }
}
