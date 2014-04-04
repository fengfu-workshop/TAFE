using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class GuessingGame : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnGo_Click(object sender, EventArgs e)
    {
        int intNumber;
        int intGuess;
        //generate a random number between 1 and 10 using the Random class
        Random objRandom = new Random();
        intNumber = objRandom.Next(1, 10);
        //read in the value the user selected from the drop down
        intGuess = Int32.Parse(ddlNumber.SelectedValue);
        if (intGuess > intNumber) {
            lblMessage.Text = "The guess is too high try again. It was " + intNumber.ToString();
        }
        else if (intGuess < intNumber) {
            lblMessage.Text = "The guess is too low try again. It was " + intNumber.ToString();
        }
        else {
            lblMessage.Text = "The guess is correct!!!!!!!!!!!!!!!!!!!!!";
        }
    }
    protected void ddlNumber_SelectedIndexChanged(object sender, EventArgs e)
    {
        btnGo_Click(sender, e);
    }
}