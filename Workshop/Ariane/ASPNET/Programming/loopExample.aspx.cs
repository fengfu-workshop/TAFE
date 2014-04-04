using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class loopExample : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int i;

        Label1.Text = "Q1. Using a for loop display numbers from 1 through to 10<br />";
        for (i = 1; i <= 10; i++)
        {
            Label1.Text += i.ToString() + "<br />";
        }

        Label1.Text += "Q2. Change the above code so that it starts at 0 and ends at 7<br />";
        for (i = 0; i <= 7; i++)
        {
            Label1.Text += i.ToString() + "<br />";
        }

        Label1.Text += "Q3. Using a for loop display numbers from 10 down to 1<br />";
        for (i = 10; i >= 1; i--)
        {
            Label1.Text += i.ToString() + "<br />";
        }

        Label1.Text += "Q4. Using a for loop display even numbers from 2 to 10<br />";
        for (i = 2; i <= 10; i+=2)
        {
            Label1.Text += i.ToString() + "<br />";
        }

        i = 1;
        Label1.Text += "Q5. Use a while loop to display numbers from 1 to 7<br />";
        while (i <= 7)
        {
            Label1.Text += i.ToString() + "<br />";
            i++;
        }

        i = 1;
        Label1.Text += "Q6. Use a do while loop to display numbers from 1 to 7<br />";
        do
        {
            Label1.Text += i.ToString() + "<br />";
            i++;
        } while (i <= 7);


    }
}