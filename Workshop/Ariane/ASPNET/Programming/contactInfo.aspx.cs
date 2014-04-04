using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class contactInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string contactMethod;

        contactMethod = ddlContact.SelectedValue.ToUpper();

        switch (contactMethod)
        {
            case "FAX":
                lblContact.Text = "our fax number is 78898765 you will need tosend us a fax to confirm";
                break;
            case "EMAIL":
                lblContact.Text = "Email will be sent to you shortly";
                break;
            case "PHONE":
                lblContact.Text = "Thank you we will be in touch";
                break;
            default:
                lblContact.Text = "You will not be contacted";
                break;
        }
    }

    protected void ddlContact_SelectedIndexChanged(object sender, EventArgs e)
    {
        string contactMethod;

        contactMethod = ddlContact.SelectedValue.ToUpper();

        if (contactMethod == "FAX")
        {
            lblContact.Text = "our fax number is 78898765 you will need tosend us a fax to confirm";
        }
        else if (contactMethod == "EMAIL")
        {
            lblContact.Text = "Email will be sent to you shortly";
        }
        else if (contactMethod == "PHONE")
        {
            lblContact.Text = "Thank you we will be in touch";
        }
        else
        {
            lblContact.Text = "You will not be contacted";
        }

    }
    protected void lbContact_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblMultiContact.Text = "Your choice: <br />";
        foreach (ListItem item in lbContact.Items)
        {
            if (item.Selected) lblMultiContact.Text += item.Text.ToUpper() +"<br />";
        }

    }
}