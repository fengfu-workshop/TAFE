using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class testWeather : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Weather1.getWeather(1);
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Weather1.getWeather(int.Parse(DropDownList1.SelectedValue));
    }
}