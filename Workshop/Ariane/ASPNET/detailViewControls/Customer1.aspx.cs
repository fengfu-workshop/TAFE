using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Customer1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = "Hello";
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        //DropDownList ddlTempCust;
        //ddlTempCust = (DropDownList)sender;
        //DetailsView1.PageIndex = ddlTempCust.SelectedIndex;
    }
}