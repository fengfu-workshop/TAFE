using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class buttonExample : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {

    }
    protected void Button1_Click1(object sender, EventArgs e)
    {
        Label1.Text = "You clicked the button control";
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Label1.Text = "You clicked the link button control";

    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        //Label1.Text = "This came from the image button (" + e.X.ToString() + ",  " + e.Y.ToString() + ")";
        Label1.Text = "You clicked the image button control at: (" + e.X + ",  " + e.Y + ")";
    }
}