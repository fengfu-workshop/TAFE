using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Test_Test : System.Web.UI.Page
{
    //ShoppingCart Cart = GlobalVar.Cart;


    protected void GetCreditCard()
    {
        /*
        SqlDataSource srcCreditCard;
        srcCreditCard = new SqlDataSource();
        srcCreditCard.ConnectionString = WebConfigurationManager.ConnectionStrings["NextStepConnectionString"].ConnectionString;

        srcCreditCard.SelectCommand = "SELECT * FROM CreditCard";

        DataView dv = (DataView)srcCreditCard.Select(DataSourceSelectArguments.Empty);
        int nRecords = (int)dv.Table.Rows.Count;
        CardList validCards = GlobalVar.ValidCards;
        for (int i = 0; i < nRecords; i++)
        {
            validCards.AddCard((string)dv.Table.Rows[i][0], (DateTime)dv.Table.Rows[i][1], (string)dv.Table.Rows[i][2]);
        }

        bool valid;
        for (int i = 0; i < nRecords; i++)
        {
            valid = validCards.ValidCard((string)dv.Table.Rows[i][0], (DateTime)dv.Table.Rows[i][1], (string)dv.Table.Rows[i][2]);
        }
        valid = validCards.ValidCard("9999-9999-9999-9999", (DateTime)dv.Table.Rows[0][1], (string)dv.Table.Rows[1][2]);
        valid = validCards.ValidCard((string)dv.Table.Rows[0][0], (DateTime)dv.Table.Rows[0][1], (string)dv.Table.Rows[1][2]);
        valid = validCards.ValidCard((string)dv.Table.Rows[0][0], (DateTime)dv.Table.Rows[1][1], (string)dv.Table.Rows[0][2]);

        srcCreditCard.Dispose();
        */
        CardList cardList = GlobalVar.ValidCards;
        bool valid;
        valid = cardList.ValidCard("1111-1111-1111-1111", DateTime.Parse("1 DEC 2021"), "Name1");
        valid = cardList.ValidCard("2222-2222-2222-2222", DateTime.Parse("1 DEC 2022"), "Name2");
        valid = cardList.ValidCard("3333-3333-3333-3333", DateTime.Parse("1 DEC 2023"), "Name3");
        valid = cardList.ValidCard("1111-3333-3333-3333", DateTime.Parse("1 DEC 2023"), "Name3");
        valid = cardList.ValidCard("3333-3333-3333-3333", DateTime.Parse("2 DEC 2023"), "Name3");
        valid = cardList.ValidCard("3333-3333-3333-3333", DateTime.Parse("1 DEC 2023"), "Name1");
    }

    protected void Page_Load(object sender, EventArgs e)
    {

        //var intValue = Convert.ToInt32("Text"); // for error message testing
        Trace.Write("Debug Info");

        GetCreditCard();

        ShoppingCart Cart = (ShoppingCart)Session["Cart"];

        lblCart.Visible = Cart.Count > 0;
        var products = from product in Cart.Products
                       select product.Value;
        GridView1.DataSource = products;
        GridView1.DataBind();

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        ShoppingCart Cart = (ShoppingCart)Session["Cart"];

        Label1.Text = "";
        foreach (KeyValuePair<string, Product> item in Cart.Products)
        {
            System.Diagnostics.Debug.WriteLine("Key={0}: Value={1}", item.Key, item.Value);
            Label1.Text += item.Value.ItemId + ":" + item.Value.ItemName + " (" + item.Value.Quantity + ")<br />" +
                            item.Value.PhotoGuid + "  " + item.Value.Price + "  " + item.Value.SubTotal + "<br />";
        }

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        ShoppingCart Cart = (ShoppingCart)Session["Cart"];

        Cart.ClearProducts();
        Button1_Click(sender, e);
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        ShoppingCart Cart = (ShoppingCart)Session["Cart"];
        if (e.CommandName == "MyDelete")
        {
            Cart.RemoveProduct(e.CommandArgument.ToString());
            Response.Redirect(Request.RawUrl);
        }
    }

    protected void GridView1_DataBound(object sender, GridViewRowEventArgs e)
    {
        ShoppingCart Cart = (ShoppingCart)Session["Cart"];
        if (e.Row.RowType == DataControlRowType.Footer)
        {
            Label lblTotal = (Label)e.Row.FindControl("lblTotalPrice");
            lblTotal.Text = Cart.TotalPrice().ToString();
        }
    }
    protected void btnInsertData_Click(object sender, EventArgs e)
    {
        SqlDataSource source = new SqlDataSource();
        source.ConnectionString = WebConfigurationManager.ConnectionStrings["NextStepConnectionString"].ConnectionString;
 
        source.InsertParameters.Add("FirstName", "First Name");
        source.InsertParameters.Add("LastName", "Last Name");
        source.InsertParameters.Add("Address", "Address");
        source.InsertParameters.Add("ContactNumber", "12345678");
        source.InsertParameters.Add("Email", "sales@abc.com");
        source.InsertParameters.Add("Payment", "CreditCard");
        source.InsertParameters.Add("CreditCardNo", "1111-1111-1111-1111");
        source.InsertParameters.Add("ExpiryDate", "1 DEC 2021");
        source.InsertParameters.Add("NameOnCard", "Name1");

        source.InsertCommand = "INSERT INTO [Order] ([FirstName], [LastName], [Address], [ContactNumber], [Email], [Payment], [CreditCardNo], [ExpiryDate], [NameOnCard]) VALUES (@FirstName, @LastName, @Address, @ContactNumber, @Email, @Payment, @CreditCardNo, @ExpiryDate, @NameOnCard)";

        if (source.Insert() != 1) // error
        {
        }

        source.Dispose();
    }
}

