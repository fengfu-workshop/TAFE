using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WizardExample : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Wizard1_FinishButtonClick(object sender, WizardNavigationEventArgs e)
    {
        Label1.Text = "Thank you " + txtFirstName.Text + " " + txtLastName.Text + " Your address is " 
                    + txtAddress.Text + "<br />" + "and contact numbers:<br />Home: " + txtHome.Text 
                    + "<br />Mobile: " + txtMobile.Text;
    }
}