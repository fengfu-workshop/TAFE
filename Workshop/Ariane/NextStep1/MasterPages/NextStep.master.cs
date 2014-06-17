using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPages_NextStep : System.Web.UI.MasterPage
{
    //ShoppingCart Cart = GlobalVar.Cart;

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Page_PreRender(object sender, EventArgs e)
    {
        UpdateCartTotalNumber();
    }

    public void UpdateCartTotalNumber()
    {
        ShoppingCart Cart = (ShoppingCart)Session["Cart"];
        lblNumProducts.Text = Cart.TotalProducts().ToString();
    }
}
