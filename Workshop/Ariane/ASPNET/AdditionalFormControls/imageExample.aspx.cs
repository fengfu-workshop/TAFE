using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class imageExample : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Image1.AlternateText == "Purple Ball")
        {
            Image1.ImageUrl = "~/Images/blue.png";
            Image1.AlternateText = "Blue Ball";
        }
        else
        {
            Image1.ImageUrl = "~/Images/purple.png";
            Image1.AlternateText = "Purple Ball";
        }
    }
}