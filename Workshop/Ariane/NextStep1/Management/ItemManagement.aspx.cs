using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Management_ItemManagement : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Session["UserName"] == null) Response.Redirect("~/Management/Login.aspx");
        if (!Page.IsPostBack)
            ListView1.InsertItemPosition = InsertItemPosition.None;
        if (!Page.IsPostBack)
        {
            string product = Request.Cookies.Get("Product") != null ? Request.Cookies.Get("Product").Value : "";
            if (!string.IsNullOrEmpty(product))
            {
                txtProduct.Text = product;
            }
        }
    }

    protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        HttpCookie category = new HttpCookie("Category");
        category.Expires = DateTime.Now.AddDays(7);
        category.Value = ddlCategory.SelectedValue;
        Response.Cookies.Add(category);
        Response.Redirect(Request.Url.ToString());
    }

    protected void btnInsert_Click(object sender, EventArgs e)
    {
        ListView1.InsertItemPosition = (ListView1.InsertItemPosition == InsertItemPosition.FirstItem) ? InsertItemPosition.None : InsertItemPosition.FirstItem;
    }

   
    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        //lblDebug.Text = "ItemCommand "; 

        if (e.CommandName == "Update")
        {
            try
            {
                FileUpload fileUpload = ListView1.EditItem.FindControl("FileUpload1") as FileUpload;

                if (fileUpload.HasFile)
                {
                    string filename = Path.GetFileName(fileUpload.FileName);
                    TextBox txtPhoto = ListView1.EditItem.FindControl("PhotoNameTextBox") as TextBox;
                    string guidString = Guid.NewGuid().ToString("N");
                    string oldGuidString;

                    fileUpload.SaveAs(Server.MapPath("~/Images/Items/") + guidString);
                    txtPhoto.Text = filename;
                    txtPhoto = ListView1.EditItem.FindControl("PhotoGuidTextBox") as TextBox;
                    oldGuidString = txtPhoto.Text;
                    txtPhoto.Text = guidString;

                    System.Drawing.Image img1 = System.Drawing.Image.FromFile(Server.MapPath("~/Images/Items/") + guidString);
                    double width, height, denominator;
                    denominator = (img1.Width > img1.Height) ? img1.Width : img1.Height;
                    width = 160.0 * img1.Width / denominator;
                    height = 160.0 * img1.Height / denominator;

                    System.Drawing.Image bmp1 = img1.GetThumbnailImage((int)width, (int)height, null, IntPtr.Zero);
                    bmp1.Save(Server.MapPath("~/Images/Thumbs/") + guidString);

                    File.Delete(Server.MapPath("~/Images/Items/") + oldGuidString);
                    File.Delete(Server.MapPath("~/Images/Thumbs/") + oldGuidString);

                }

            }
            catch (Exception ex)
            {
                Console.WriteLine("Update data error: {0}", ex.Source);
            }

        }
        else if (e.CommandName == "Insert")
        {
            //lblDebug.Text = "Insert "; 

            try
            {

                FileUpload fileUpload = ListView1.InsertItem.FindControl("FileUpload1") as FileUpload;

                if (fileUpload.HasFile)
                {
                    string filename = Path.GetFileName(fileUpload.FileName);
                    TextBox txtPhoto = ListView1.InsertItem.FindControl("PhotoNameTextBox") as TextBox;
                    string guidString = Guid.NewGuid().ToString("N");

                    fileUpload.SaveAs(Server.MapPath("~/Images/Items/") + guidString);
                    txtPhoto.Text = filename;
                    txtPhoto = ListView1.InsertItem.FindControl("PhotoGuidTextBox") as TextBox;
                    txtPhoto.Text = guidString;

                    System.Drawing.Image img1 = System.Drawing.Image.FromFile(Server.MapPath("~/Images/Items/") + guidString);
                    double width, height, denominator;
                    denominator = (img1.Width > img1.Height) ? img1.Width : img1.Height;
                    width = 160.0 * img1.Width / denominator;
                    height = 160.0 * img1.Height / denominator;

                    System.Drawing.Image bmp1 = img1.GetThumbnailImage((int)width, (int)height, null, IntPtr.Zero);
                    bmp1.Save(Server.MapPath("~/Images/Thumbs/") + guidString);

                }

            }
            catch (Exception ex)
            {
                Console.WriteLine("Insert Data Error: {0}", ex.Source);
                //throw;
            }

        }
    }
    protected void btnFindProduct_Click(object sender, EventArgs e)
    {
        //if (ddlCategory.SelectedIndex == 0)
        //    ItemSource.SelectCommand = "SELECT * FROM [Item] WHERE ([ItemName] LIKE '%' + @ItemName + '%')";
        //else
        //    ItemSource.SelectCommand = "SELECT * FROM [Item] WHERE (([CategoryId] = @CategoryId) AND ([ItemName] LIKE '%' + @ItemName + '%'))";
        //ItemSource.DataBind();
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

    protected void txtProduct_TextChanged(object sender, EventArgs e)
    {
        HttpCookie product = new HttpCookie("Product");
        product.Expires = DateTime.Now.AddDays(7);
        product.Value = txtProduct.Text;
        Response.Cookies.Add(product);
        Response.Redirect(Request.Url.ToString());
    }
}