using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebPages_ShoppingList : System.Web.UI.Page
{
    string PrimaryKey;

    protected void Page_Load(object sender, EventArgs e)
    {
        ShoppingCart Cart = (ShoppingCart)Session["Cart"];

        if (Cart.Count <= 0) Response.Redirect("~/WebPages/ItemsSearch.aspx");

        var products = from product in Cart.Products
                       select product.Value;
        GridView1.DataSource = products;
        GridView1.DataBind();
        GridView2.DataSource = products;
        GridView2.DataBind();
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        ShoppingCart Cart = (ShoppingCart)Session["Cart"];
        switch (e.CommandName)
        {
            case "MyDelete":
                Cart.RemoveProduct(e.CommandArgument.ToString());
                break;
            case "MinusOne":
                Cart.RemoveProduct(e.CommandArgument.ToString(), 1);
                break;
            case "PlusOne":
                Cart.AddProduct(e.CommandArgument.ToString(), 1);
                break;
        }

        //((MasterPages_NextStep)Page.Master).UpdateCartTotalNumber();
        Response.Redirect(Request.RawUrl);
    }
    protected void GridView1_DataBound(object sender, GridViewRowEventArgs e)
    {
        ShoppingCart Cart = (ShoppingCart)Session["Cart"];
        if (e.Row.RowType == DataControlRowType.Footer)
        {
            Label lblTotal = (Label)e.Row.FindControl("lblTotalPrice");
            lblTotal.Text = "$" + Cart.TotalPrice().ToString();
        }
    }
    protected void lbCheckOut_Click(object sender, EventArgs e)
    {
        ShoppingCart Cart = (ShoppingCart)Session["Cart"];
        if (Cart.Count > 0)
        {
            pnlCheckout.Visible = !pnlCheckout.Visible;
        }
    }

    private void On_Inserted(Object sender, SqlDataSourceStatusEventArgs e)
    {
        DbCommand command = e.Command;

        PrimaryKey = command.Parameters["@NewId"].Value.ToString();

        lblOrderNo.Text = "ORD" + Int32.Parse(PrimaryKey).ToString("D6");

    }

    private void On_Selected(Object sender, SqlDataSourceStatusEventArgs e)
    {
        //DbCommand command = e.Command;

        //PrimaryKey = command.Parameters["OrderId"].Value.ToString();
    }

    protected bool SaveOrder()
    {
        SqlDataSource source = new SqlDataSource();
        bool success;
        Parameter param = new Parameter();
        param.Name = "NewID";
        param.DbType = DbType.Int32;
        param.Direction = ParameterDirection.Output;
        param.DefaultValue = "0"; //if you want to add default value

        source.ConnectionString = WebConfigurationManager.ConnectionStrings["NextStepConnectionString"].ConnectionString;
        source.Inserted += On_Inserted;
        source.Selected += On_Selected;

        source.InsertParameters.Add("FirstName", tbFirstName.Text);
        source.InsertParameters.Add("LastName", tbLastName.Text);
        source.InsertParameters.Add("Address", tbAddress.Text);
        source.InsertParameters.Add("ContactNumber", tbContactNumber.Text);
        source.InsertParameters.Add("Email", tbEmailAddress.Text);
        source.InsertParameters.Add("Payment", tbContactNumber.Text);
        source.InsertParameters.Add("CreditCardNo", tbCreditCard.Text);
        source.InsertParameters.Add("ExpiryDate", tbExpiry.Text);
        source.InsertParameters.Add("NameOnCard", tbNameOnCard.Text);
        //source.InsertParameters.Add("@NewId", "0");
        source.InsertParameters.Add(param);

        source.InsertCommand = "INSERT INTO [Order] ([FirstName], [LastName], [Address], [ContactNumber], [Email], [Payment], [CreditCardNo], [ExpiryDate], [NameOnCard]) VALUES (@FirstName, @LastName, @Address, @ContactNumber, @Email, @Payment, @CreditCardNo, @ExpiryDate, @NameOnCard)"
                                + "; SET @NewId = Scope_Identity()";
        //source.SelectCommand = "SET @NewId = Scope_Identity()";


        success = (source.Insert() == 1);
        //source.Select(DataSourceSelectArguments.Empty);
        return success;
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            string fileName = Server.MapPath("~/App_Data/CheckoutTemplate.txt");
            string mailBody = File.ReadAllText(fileName);
            mailBody = mailBody.Replace("##FirstName##", tbFirstName.Text);
            mailBody = mailBody.Replace("##LastName##", tbLastName.Text);
            mailBody = mailBody.Replace("##Email##", tbEmailAddress.Text);
            mailBody = mailBody.Replace("##ContactNumber##", tbContactNumber.Text);
            mailBody = mailBody.Replace("##Address##", tbAddress.Text);
            MailMessage myMessage = new MailMessage();
            myMessage.Subject = "Your purchase details from NextStep";
            myMessage.Body = mailBody;
            myMessage.From = new MailAddress("contact@nextstep.com", "NextStep Sales");
            myMessage.To.Add(new MailAddress("information@sportsshop.com.au", "Information"));
            myMessage.ReplyToList.Add(new MailAddress(tbEmailAddress.Text));
            SmtpClient mySmtpClient = new SmtpClient();
            mySmtpClient.Send(myMessage);

            if (SaveOrder())
            {
                ShoppingCart Cart = (ShoppingCart)Session["Cart"];
                pnlCheckout.Visible = false;
                pnlList.Visible = false;
                pnlPurchased.Visible = true;
                Cart.ClearProducts();
            }
            //pnlMailSent.Visible = true;
            //palContactForm.Visible = false;
        }
        
    }

    public void valCreditCard_Validation(object source, ServerValidateEventArgs arguments)
    {
        CardList cards = GlobalVar.ValidCards;

        arguments.IsValid = cards.ValidCard((string)tbCreditCard.Text, DateTime.Parse(tbExpiry.Text), (string)tbNameOnCard.Text);
    }
}