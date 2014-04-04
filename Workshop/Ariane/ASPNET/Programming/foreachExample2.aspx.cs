using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class foreachExample2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        lblDid.Text = "";
        lblDidnot.Text = "";
        foreach (ListItem liGenre in DropDownList1.Items)
        {
            if (liGenre.Selected)
            {
                lblDid.Text += liGenre.Text + "<br />";
            }
            else
            {
                lblDidnot.Text += liGenre.Text + "<br />";
            }
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        lblDid.Text = "";
        lblDidnot.Text = "";
        foreach (ListItem liGenre in CheckBoxList1.Items)
        {
            if (liGenre.Selected)
            {
                lblDid.Text += liGenre.Text + "<br />";
            }
            else
            {
                lblDidnot.Text += liGenre.Text + "<br />";
            }
        }

    }

  
}