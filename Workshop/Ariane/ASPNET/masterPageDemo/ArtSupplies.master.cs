using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ArtSupplies : System.Web.UI.MasterPage
{
    public string mainHeading 
    {
        set
        {
            liHeading.Text = value;
        }
        get
        {
            return liHeading.Text;
        }

    }

    protected void Page_Load(object sender, EventArgs e)
    {
        //liHeading.Text = "";
    }

    public void UpdateTheDate()
    {
        lblDate.Text = DateTime.Now.ToString();
    }

}
