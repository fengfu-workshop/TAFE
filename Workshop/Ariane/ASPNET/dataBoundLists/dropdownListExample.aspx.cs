using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class dropdownListExample : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Label1.Text =   "You selected the item with index of: " + ddCategories.SelectedIndex + "<br />" +
                        "You selected: " + ddCategories.SelectedItem.Text + "<br />" +
                        "It has as primary key value of: "  + ddCategories.SelectedValue;
    }
    protected void ddCategories_SelectedIndexChanged(object sender, EventArgs e)
    {
        Button1_Click(sender, e);
    }
}