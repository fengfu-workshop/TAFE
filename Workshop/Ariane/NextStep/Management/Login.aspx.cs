using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Management_Login : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.UrlReferrer != null)
            Login1.DestinationPageUrl = Request.UrlReferrer.ToString();
    }
    protected void Login1_LoggedIn(object sender, EventArgs e)
    {
        Session["UserName"] = Login1.UserName;
    }
}