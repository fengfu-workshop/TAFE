using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class employeeListView : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        Image imgTempPhoto;

        if (e.Item.ItemType == ListViewItemType.DataItem)
        {
            imgTempPhoto = (Image)e.Item.FindControl("IdOfImageControl");

            if (imgTempPhoto.ImageUrl == "")
            {
                imgTempPhoto.ImageUrl = "~/images/unavailable.gif";
            }
        }

       
    }
}