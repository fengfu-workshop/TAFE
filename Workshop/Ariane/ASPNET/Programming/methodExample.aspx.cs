using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class methodExample : System.Web.UI.Page
{
    //private void Greeting(string strName, string last)
    //{
    //    lblGreeting.Text = "Hello " + strName + " " + last;
    //}

    private int calculate(int num1, int num2)
    {
        return num1 + num2;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //Greeting(TextBox1.Text, TextBox2.Text); 
        lblGreeting.Text = calculate(3, 6).ToString();
    }
}