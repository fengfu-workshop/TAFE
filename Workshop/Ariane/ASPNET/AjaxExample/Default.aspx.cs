using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblPageLoad.Text = DateTime.Now.ToString();
    }
    protected void btnFull_Click(object sender, EventArgs e)
    {
        lblFullPostback.Text = DateTime.Now.ToString();
    }
    protected void btnPartial_Click(object sender, EventArgs e)
    {
        lblPartialPostback.Text = DateTime.Now.ToString();
    }
}