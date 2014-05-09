using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Management_CategoryManagement : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserName"] == null) Response.Redirect("~/Management/Login.aspx");
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //if (e.Row.RowType == DataControlRowType.DataRow)
        //{
        //    LinkButton lb = (LinkButton)e.Row.FindControl("LinkButton1");
        //    lb.Attributes.Add("onclick", "javascript:return " +
        //    "confirm('Are you sure you want to delete this Category " +
        //    DataBinder.Eval(e.Row.DataItem, "CategoryID") + "')");
        //}
    }
}