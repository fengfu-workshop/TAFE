using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebPages_ShoppingList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public void lbDelete_Click(Object sender, EventArgs e)
    {
        ShoppingCart Cart = (ShoppingCart)Session["Cart"];
        //Cart.RemoveProduct(sender.CommandArgument.ToString());
        Response.Redirect(Request.RawUrl);

    }
}