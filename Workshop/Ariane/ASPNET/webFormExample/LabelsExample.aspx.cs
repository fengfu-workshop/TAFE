using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LabelsExample : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        message1.Text = "Hornsby";
        message2.Text = "TAFE";
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}