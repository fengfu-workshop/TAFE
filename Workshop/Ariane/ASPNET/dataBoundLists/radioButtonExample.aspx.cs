using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class radioButtonExample : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Label1.Text = "Yoou selected: " + RadioButtonList1.SelectedItem.Text + "<br />" + 
                        "The primary key is " + RadioButtonList1.SelectedValue;
    }
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Button1_Click(sender, e);
    }
}