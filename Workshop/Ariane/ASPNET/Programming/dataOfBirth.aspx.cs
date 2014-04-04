using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class dataOfBirth : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string strDate = TextBox1.Text;
        string[] arrDate;

        arrDate = strDate.Split('/');

        Label1.Text =   "You were born on the " + arrDate[0] + " day of the " + arrDate[1] + 
                        " month in year " + arrDate[2];
    }
}