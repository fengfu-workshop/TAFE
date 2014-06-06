using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Test_Test1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string value = "345";
        int intValue = Int32.Parse(value);
        lblFormat.Text = "ORD"+Int32.Parse(value).ToString("D8");
                                    
    }

    protected void OnRecordDeleted(object source, SqlDataSourceStatusEventArgs e)
    {

        if (e.Exception != null)
        {
            Label1.Text = e.Exception.Message;
            if (e.Exception.Message.Contains("REFERENCE"))
            {
                Response.Write(@"<script language='javascript'>alert('The following errors have occurred: \n\n" + "This category can not be deleted" + " .');</script>");
                e.ExceptionHandled = true;
            }           
        }
    }

}