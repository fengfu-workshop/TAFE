using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class textboxExample : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Label1.Text = TextBox1.Text + "<br />";
        Label1.Text += TextBox2.Text + "<br />";
        Label1.Text += TextBox3.Text + "<br />";
        Label1.Text += TextBox4.Text + "<br />";
        Label1.Text += TextBox5.Text + "<br />";
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Label2.Text = TextBox6.Text + "<br />";
        Label2.Text += TextBox7.Text + "<br />";
        Label2.Text += TextBox8.Text + "<br />";

    }
}