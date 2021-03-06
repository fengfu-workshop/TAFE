﻿using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Management_ItemManagement : BasePage
{
    string deletedFileName;
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (Session["UserName"] == null) Response.Redirect("~/Management/Login.aspx");

        if (!Page.IsPostBack)
        {
            ListView1.InsertItemPosition = InsertItemPosition.None;
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
        //Response.Redirect(Request.Url.ToString());
    }

    protected void btnInsert_Click(object sender, EventArgs e)
    {
        ListView1.InsertItemPosition = (ListView1.InsertItemPosition == InsertItemPosition.FirstItem) ? InsertItemPosition.None : InsertItemPosition.FirstItem;
        btnInsert.Text = (ListView1.InsertItemPosition == InsertItemPosition.None) ? "Insert Item" : "End Insert";
        ListView1.EditIndex = -1;
    }

    private void SaveThumbAndPhoto(string guidString)
    {

        System.Drawing.Image img1 = System.Drawing.Image.FromFile(Server.MapPath("~/Images/Items/") + guidString);
        double width, height, denominator;
        denominator = (img1.Width > img1.Height) ? img1.Width : img1.Height;
        width = 160.0 * img1.Width / denominator;
        height = 160.0 * img1.Height / denominator;

        System.Drawing.Image bmp1 = img1.GetThumbnailImage((int)width, (int)height, null, IntPtr.Zero);
        bmp1.Save(Server.MapPath("~/Images/Thumbs/") + guidString, System.Drawing.Imaging.ImageFormat.Jpeg);

    }

    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        //lblDebug.Text = "ItemCommand ";      

        if (e.CommandName == "Edit")
        {
            ListView1.InsertItemPosition = InsertItemPosition.None;
            btnInsert.Text = "Insert Item";
        }
        else if (e.CommandName == "Delete")
        {
            
        }
        else if (e.CommandName == "Update")
        {
            try
            {
                FileUpload fileUpload = ListView1.EditItem.FindControl("FileUpload1") as FileUpload;

                if (fileUpload.HasFile)
                {

                    string oldGuidString;

                    string filename = Path.GetFileName(fileUpload.FileName);
                    TextBox txtPhoto = ListView1.EditItem.FindControl("PhotoNameTextBox") as TextBox;
                    string guidString = Guid.NewGuid().ToString("N");

                    fileUpload.SaveAs(Server.MapPath("~/Images/Items/") + guidString);
                    txtPhoto.Text = filename;
                    txtPhoto = ListView1.EditItem.FindControl("PhotoGuidTextBox") as TextBox;
                    oldGuidString = txtPhoto.Text;
                    txtPhoto.Text = guidString;

                    File.Delete(Server.MapPath("~/Images/Items/") + oldGuidString);
                    File.Delete(Server.MapPath("~/Images/Thumbs/") + oldGuidString);

                    SaveThumbAndPhoto(guidString);

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

                    SaveThumbAndPhoto(guidString);

                }

            }
            catch (Exception ex)
            {
                Console.WriteLine("Insert Data Error: {0}", ex.Source);
                //throw;
            }

        }
    }

    protected void ListView1_ItemDeleted(object sender, ListViewDeletedEventArgs e)
    {
        string strFileName;

        if (e.AffectedRows == 1 && deletedFileName.Length > 0)
        {
            //strFileName = e.Values["imgPhoto"].ToString();
            strFileName = deletedFileName;
            File.Delete(MapPath(strFileName));
            strFileName = strFileName.Replace("Thumbs", "Items");
            File.Delete(MapPath(strFileName));
            ListView1.DataBind();
        }
    }

    protected void ListView1_ItemDeleting(object sender, ListViewDeleteEventArgs e)
    {
        Image imgTempPhoto = (Image)ListView1.Items[e.ItemIndex].FindControl("imgPhoto");
        deletedFileName = imgTempPhoto.ImageUrl;
    }

    protected void btnFindProduct_Click(object sender, EventArgs e)
    {

        ListView1.InsertItemPosition = InsertItemPosition.None;
        btnInsert.Text = "Insert Item";
        ListView1.EditIndex = -1;

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
        //btnFindProduct_Click(sender, e);
    }

    protected void ddlCategoryEdit_DataBound(object sender, EventArgs e)
    {
        string category = Request.Cookies.Get("Category") != null ? Request.Cookies.Get("Category").Value : "";
        if (!string.IsNullOrEmpty(category))
        {
            DropDownList ddl = (DropDownList)sender;
            ListItem item = ddl.Items.FindByValue(category);
            if (item != null) item.Selected = true;
        }
    }


    protected void txtProduct_TextChanged(object sender, EventArgs e)
    {
        HttpCookie product = new HttpCookie("Product");
        product.Expires = DateTime.Now.AddDays(7);
        product.Value = txtProduct.Text;
        Response.Cookies.Add(product);
        //Response.Redirect(Request.Url.ToString());
    }
    protected void OnRecordDeleted(object source, SqlDataSourceStatusEventArgs e)
    {

        if (e.Exception != null)
        {
            if (e.Exception.Message.Contains("REFERENCE"))
            {
                e.ExceptionHandled = true;
                Response.Write(@"<script language='javascript'>alert('\nThis item can not be deleted,\n because it is referenced by other order(s)');</script>");
            }

        }
    }
}