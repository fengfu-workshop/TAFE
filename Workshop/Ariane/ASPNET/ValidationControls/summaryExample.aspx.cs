using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class summaryExample : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        Label1.Text = (Page.IsValid) ? "Every thing goes fine" : "";
        Page.Validate();
        if (Page.IsValid)
        {
            Label1.Text = "page is valid";
        }
        else
        {
            Label1.Text = "page is invalid";
        }
    }
}