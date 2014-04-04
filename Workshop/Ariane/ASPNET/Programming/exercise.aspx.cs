using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class exercise : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Activity 1
        int Num1 = 3;
        int Num2 = 4;
        int Num3 = 5;
        int Num4 = 6;
        int Total = 0;

        Total = Num1 + Num2;
        lblAddition.Text = Total.ToString();

        Total = Num3 - Num2;
        lblSubstraction.Text = Total.ToString();

        Total = Num1 * Num2;
        lblMultiplication.Text = Total.ToString();

        Total = Num4 / Num1;
        lblDivision.Text = Total.ToString();

        // Activity 2
        string strMessage1 = "ASP.NET";
        string strMessage2 = "Won't be that hard in a few weeks.";
        lblMessage.Text = strMessage1 + " " + strMessage2;
        strMessage1 += " " + strMessage2;
        lblMessage.Text = strMessage1;

        // Activity 3
        int Number = 10;
        lblMessage.Text = "";
        if (Number == 10) lblMessage.Text = "value matched to 10";

        lblMessage.Text = "";
        Number = 2;
        if (Number == 10) lblMessage.Text = "value matched to 10";

        lblMessage.Text = "";
        Number = 10;
        if (Number == 10) lblMessage.Text = "value matched to 10";
        else lblMessage.Text = "value not matched to 10";

        // Activity 4
        string strWeekDay = "Wednesday";
        if (strWeekDay == "Monday") lblMessage.Text = "Monday we come to TAFE";
        else if (strWeekDay == "Tuesday") lblMessage.Text = "Tuesday we come to TAFE";
        else if (strWeekDay == "Thursday") lblMessage.Text = "Thursday we come to TAFE";
        else if (strWeekDay == "Friday") lblMessage.Text = "Friday we come to TAFE";
        else if (strWeekDay == "Wednesday") lblMessage.Text = "Wednesday we don't come to TAFE";
        else lblMessage.Text = "Weekend";

        switch (strWeekDay)
        {
            case "Monday":
            case "Tuesday":
            case "Thursday":
            case "Friday":
                lblMessage.Text = strWeekDay + " we come to TAFE";
                break;
            case "Wednesday":
                lblMessage.Text = "Wednesday we don't come to TAFE";
                break;
            default:
                lblMessage.Text = "Weekend";
                break;
        }

        // Activity 5

        int i;
        lblMessage.Text = "";
        for (i = 1; i <= 5; i++)
            lblMessage.Text += i.ToString() + "<br />";

        lblMessage.Text = "";
        for (i = 5; i >= 1; i--)
            lblMessage.Text += i.ToString() + "<br />";

        lblMessage.Text = "";
        for (i = 0; i <= 10; i += 2)
            lblMessage.Text += i.ToString() + "<br />";

        lblMessage.Text = "";
        i = 1;
        while (i <= 5)
        {
            lblMessage.Text += i.ToString() + "<br />";
            i++;
        }

        lblMessage.Text = "";
        i = 5;
        while (i >= 1)
        {
            lblMessage.Text += i.ToString() + "<br />";
            i--;
        }

        lblMessage.Text = "";
        i = 0;
        while (i <= 10)
        {
            lblMessage.Text += i.ToString() + "<br />";
            i += 2;
        }
       

    }
}