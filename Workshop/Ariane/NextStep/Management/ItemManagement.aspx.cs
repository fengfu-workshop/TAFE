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
        if (!IsPostBack)
            ListView1.InsertItemPosition = InsertItemPosition.None;
    }
    protected void btnInsert_Click(object sender, EventArgs e)
    {
        ListView1.InsertItemPosition = (ListView1.InsertItemPosition == InsertItemPosition.FirstItem) ? InsertItemPosition.None : InsertItemPosition.FirstItem;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            FileUpload fileUpload = ListView1.EditItem.FindControl("FileUpload1") as FileUpload;

            
            if (fileUpload.HasFile)
            {
                string filename = Path.GetFileName(fileUpload.FileName);
                TextBox txtPhoto = ListView1.EditItem.FindControl("PhotoNameTextBox") as TextBox;
                txtPhoto.Text = filename;
                fileUpload.SaveAs(Server.MapPath("~/Images/") + filename);
            }

        }
        catch (Exception ex)
        {
        }
    }

   
    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        lblDebug.Text = "ItemCommand "; 

        if (e.CommandName == "Update")
        {
            try
            {
                FileUpload fileUpload = ListView1.EditItem.FindControl("FileUpload1") as FileUpload;

                if (fileUpload.HasFile)
                {
                    string filename = Path.GetFileName(fileUpload.FileName);
                    TextBox txtPhoto = ListView1.EditItem.FindControl("PhotoNameTextBox") as TextBox;
                    txtPhoto.Text = filename;
                    fileUpload.SaveAs(Server.MapPath("~/Images/Items/") + filename);
                }

            }
            catch (Exception ex)
            {
            }

        }
        else if (e.CommandName == "Insert")
        {
            lblDebug.Text = "Insert "; 

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
                    double width, height;
                    if (img1.Width > img1.Height)
                    {
                        width = img1.Width;
                        height = 1.0 * img1.Height * img1.Height / img1.Width;
                    }
                    else
                    {
                        height = img1.Height;
                        width = 1.0 * img1.Width * img1.Width / img1.Height;
                    }
                    System.Drawing.Image bmp1 = img1.GetThumbnailImage((int)width, (int)height, null, IntPtr.Zero);
                    bmp1.Save(MapPath("~/Images/Thumbs/") + guidString);

                }

            }
            catch (Exception ex)
            {
                Console.WriteLine("Can't save uploaded image: {0}", ex.Source);
                //throw;
            }

        }
    }
}