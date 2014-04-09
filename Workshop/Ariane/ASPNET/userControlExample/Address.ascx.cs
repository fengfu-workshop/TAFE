using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Address : System.Web.UI.UserControl
{
    public string Street
    {
        get
        {
            return txtStreet.Text;
        }
        set
        {
            txtStreet.Text = value;
        }
    }

    public string City
    {
        get
        {
            return txtCity.Text;
        }
        set
        {
            txtCity.Text = value;
        }
    }

    public string State
    {
        get
        {
            return txtState.Text;
        }
        set
        {
            txtState.Text = value;
        }
    }

    public string Postcode
    {
        get
        {
            return txtPostCode.Text;
        }
        set
        {
            txtPostCode.Text = value;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {

    }
}