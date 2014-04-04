using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class checkboxExample : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Label1.Text = "";
        if (cbMon.Checked)
            Label1.Text += "Monday is correct <br />";
        if (cbTue.Checked)
            Label1.Text += "Tuesday is correct <br />";
        if (cbWed.Checked)
            Label1.Text += "Wednesday is incorrect <br />";
        if (cbThu.Checked)
            Label1.Text += "Thursday is correct <br />";
        if (cbFri.Checked)
            Label1.Text += "Friday is correct <br />";

    }
    protected void cbWed_CheckedChanged(object sender, EventArgs e)
    {

        Label1.Text = (cbWed.Checked) ? "Are you sure ?" : "";
    }
}