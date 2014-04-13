using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class searchResults : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblSearch.Text = Request.QueryString["search"];
    }
}