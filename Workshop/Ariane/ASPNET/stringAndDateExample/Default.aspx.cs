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
        string strText;
        int intLength;

        strText = "This is some text";
        intLength = strText.Length;
        lblOutput.Text = intLength.ToString();

        lblOutput.Text = strText.ToUpper();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        TextBox2.Text = TextBox1.Text.Trim();
        lblOutput.Text = TextBox1.Text;
    }
}