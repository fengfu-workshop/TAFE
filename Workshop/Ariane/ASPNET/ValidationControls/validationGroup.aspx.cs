using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class validationGroup : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        ValidationSummary1.ValidationGroup = "Group1";
        //Page.Validate();

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        ValidationSummary1.ValidationGroup = "Group2";
        //Page.Validate();
    }
}