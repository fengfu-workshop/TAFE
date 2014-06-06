using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Test_ItemsSearch : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            string product = Request.Cookies.Get("Product") != null ? Request.Cookies.Get("Product").Value : "";
            if (!string.IsNullOrEmpty(product))
            {
                txtProduct.Text = product;
            }
        }
    }

    protected void ddlCategory_DataBound(object sender, EventArgs e)
    {
        ddlCategory.Items.Insert(0, new ListItem("All Category", "0"));
        string category = Request.Cookies.Get("Category") != null ? Request.Cookies.Get("Category").Value : "";
        if (!string.IsNullOrEmpty(category))
        {
            ListItem item = ddlCategory.Items.FindByValue(category);
            if (item != null) item.Selected = true;
        }
        btnFindProduct_Click(sender, e);
    }

    protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        HttpCookie category = new HttpCookie("Category");
        category.Expires = DateTime.Now.AddDays(7);
        category.Value = ddlCategory.SelectedValue;
        Response.Cookies.Add(category);
        //Response.Redirect(Request.Url.ToString());
    }
    protected void btnFindProduct_Click(object sender, EventArgs e)
    {

        // SQL Injection Test
        if (ddlCategory.SelectedIndex == 0)
        {
            // ItemSource.SelectCommand = "SELECT * FROM [Item] WHERE ([ItemName] LIKE '%' + @ItemName + '%')";
            ItemSource.SelectCommand = "SELECT * FROM [Item] WHERE ([ItemName] LIKE '%" + txtProduct.Text + "%')";
        }
        else
        {
            ItemSource.SelectCommand = "SELECT * FROM [Item] WHERE (([CategoryId] = @CategoryId) AND ([ItemName] LIKE '%' + @ItemName + '%'))";
        }
        ItemSource.DataBind();
    }

    protected void txtProduct_TextChanged(object sender, EventArgs e)
    {
        HttpCookie product = new HttpCookie("Product");
        product.Expires = DateTime.Now.AddDays(7);
        product.Value = txtProduct.Text;
        Response.Cookies.Add(product);
        //Response.Redirect(Request.Url.ToString());
    }

    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "AddToCart")
        {
            //ShoppingCart Cart = GlobalVar.Cart;
            ShoppingCart Cart = (ShoppingCart)Session["Cart"];
            Product prd;
            prd = new Product();

            prd.Quantity = 1;            
            
            Label lblValue = e.Item.FindControl("lblItemId") as Label;
            prd.ItemId = lblValue.Text;

            lblValue = e.Item.FindControl("ItemNameLabel") as Label;
            prd.ItemName = lblValue.Text;

            lblValue = e.Item.FindControl("lblPhotoGuid") as Label;
            prd.PhotoGuid = lblValue.Text;

            lblValue = e.Item.FindControl("PriceLabel") as Label;
            prd.Price = Convert.ToDouble(lblValue.Text.Substring(1));

            Cart.AddProduct(prd);

            //((MasterPages_NextStep)Page.Master).UpdateCartTotalNumber();
            Response.Redirect(Request.RawUrl); // Force refresh page inside Update Panel
        }
    }
}