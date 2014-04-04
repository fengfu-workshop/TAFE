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
        string strMessage = "You have studied: <br />";

        //for (int i = 0; i < 4; i++)
        //if (CheckBoxList1.Items[i].Selected)
        //    strMessage += CheckBoxList1.Items[i].Value + "<br />";

        foreach (ListItem item in CheckBoxList1.Items)
        {
            strMessage += item.Value + "<br />";
        }

        Label1.Text = strMessage;

     }
}