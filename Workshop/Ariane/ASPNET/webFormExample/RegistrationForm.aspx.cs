using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RegistrationForm : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string strMessage = "";

        strMessage += tbFirstName.Text + " ";
        strMessage += tblastName.Text + "<br />";
        strMessage += tbAddress.Text + "<br />";

        strMessage += "Your favourite colour is: " + rbFavourite.SelectedValue + "<br />";

        strMessage += "You enjoy eating:" + "<br />";
        for (int i = 0; i < 4; i++)
            if (cbEnjoy.Items[i].Selected)
                strMessage += cbEnjoy.Items[i].Value + "<br />";

        Label1.Text = strMessage;

    }
}