using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class listBoxExample : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string strMessage = "You have selected: <br />";

        foreach (ListItem item in ListBox1.Items)
        {
            if (item.Selected) strMessage += item.Value + "<br />";
        }

        Label1.Text = strMessage;
    }
}