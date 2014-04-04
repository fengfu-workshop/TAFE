using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class customValidation2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        int intValue;

        intValue = int.Parse(args.Value);
        args.IsValid = (intValue % 2) == 0;

    }
    protected void Button1_Click(object sender, EventArgs e)
    {

    }
}