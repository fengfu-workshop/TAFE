using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Activity : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Label1.Text = TextBox1.Text.ToLower();
        Label2.Text = TextBox1.Text.ToUpper();
    }
    protected void btnCheckEmail_Click(object sender, EventArgs e)
    {
        if (txtEmail.Text.IndexOf("@") > 0 && txtEmail.Text.IndexOf(".") > 0)
            lblCheckResult.Text = "The email address is OK";
        else
            lblCheckResult.Text = "The email address is invalid";

    }
    protected void btnSubstring_Click(object sender, EventArgs e)
    {
        lblSubstring.Text = txtSubstring.Text.Substring(0, 5);
    }
}