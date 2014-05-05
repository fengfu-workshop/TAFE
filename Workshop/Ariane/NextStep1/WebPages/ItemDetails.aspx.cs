using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Test_ItemDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "AddToCart")
        {
            //ShoppingCart Cart = GlobalVar.Cart;
            ShoppingCart Cart = (ShoppingCart)Session["Cart"];
            Product prd;
            prd = new Product();
            TextBox txtValue = e.Item.FindControl("txtQuantity") as TextBox;

            prd.Quantity = 1;

            Label lblValue = e.Item.FindControl("lblItemId") as Label;
            prd.ItemId = lblValue.Text;

            lblValue = e.Item.FindControl("ItemNameLabel") as Label;
            prd.ItemName = lblValue.Text;

            lblValue = e.Item.FindControl("lblPhotoGuid") as Label;
            prd.PhotoGuid = lblValue.Text;

            lblValue = e.Item.FindControl("PriceLabel") as Label;
            prd.Price = Convert.ToDouble(lblValue.Text.Substring(1));

            Cart.AddProduct(prd, Int32.Parse(txtValue.Text));

            Response.Redirect(Request.RawUrl); // Force refresh page inside Update Panel
        }
    }

}