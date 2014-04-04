using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class arrayExample : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int[] arrSalesPerDay = new int[7];
        arrSalesPerDay[0] = 73;
        arrSalesPerDay[1] = 3;
        arrSalesPerDay[2] = 7;
        arrSalesPerDay[3] = 4;
        arrSalesPerDay[4] = 5;
        arrSalesPerDay[5] = 6;
        arrSalesPerDay[6] = 7;

        lblOutput.Text = "";
        foreach (int i in arrSalesPerDay)
            lblOutput.Text += i.ToString() +"<br />";
    }
}