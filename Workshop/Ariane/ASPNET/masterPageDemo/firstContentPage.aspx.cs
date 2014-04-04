using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class firstContentPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Title = "It's my title";//string.Format("Page Title at {0}", DateTime.Now());

        //ArtSupplies theMasterPage;

        //theMasterPage = (ArtSupplies)Page.Master;
        //theMasterPage.mainHeading = "This is a heading from the content page";

        Literal liPageHeading;
        liPageHeading = (Literal)Page.Master.FindControl("liHeading");
        liPageHeading.Text = "This is changed using find control";
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        ArtSupplies theMasterPage;
        theMasterPage = (ArtSupplies)Page.Master;
        theMasterPage.UpdateTheDate();
    }
}