using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class switchExample : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        char grade;

        grade = Convert.ToChar(TextBox1.Text);

        switch (grade)
        {
            case 'A':
                lblResult.Text = "Outstanding, result between 90-100";
                break;
            case 'B':
                lblResult.Text = "Well done, result between 80-89";
                break;
            case 'C':
                lblResult.Text = "Good you had a result between 70-79";
                break;
            case 'D':
                lblResult.Text = "You passed, result between 50-69";
                break;
            case 'F':
                lblResult.Text = "Sorry you had a result between 0-49";
                break;
            default:
                lblResult.Text = "Invalid grade";
                break;
        }
    }
}