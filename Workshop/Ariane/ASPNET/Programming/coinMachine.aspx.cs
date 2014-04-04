using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class coinMachine : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        int intLeftOver;
        //read value enetered into an integer
        if (!Int32.TryParse(txtCents.Text, out intLeftOver)) {
            lblError.Text = "The value you entered was not an integer";
            btnReset_Click(sender, e);
            return;
        }
        lblError.Text = "";
        intLeftOver = Int32.Parse(txtCents.Text);

        //calculate 100 dollars
        lbl100D.Text = (intLeftOver / 10000).ToString();
        intLeftOver %= 10000;
        //calculate $50
        lbl50D.Text = (intLeftOver / 5000).ToString();
        intLeftOver %= 5000;
        //calculate $20
        lbl20D.Text = (intLeftOver / 2000).ToString();
        intLeftOver %= 2000;
        //calculate $10
        lbl10D.Text = (intLeftOver / 1000).ToString();
        intLeftOver %= 1000;
        //calculate $5
        lbl5D.Text = (intLeftOver / 500).ToString();
        intLeftOver %= 500;
        //calculate $2
        lbl2D.Text = (intLeftOver / 200).ToString();
        intLeftOver %= 200;
        //calculate $1
        lbl1D.Text = (intLeftOver / 100).ToString();
        intLeftOver %= 100;
        //calculate 50c
        lbl50c.Text = (intLeftOver / 50).ToString();
        intLeftOver %= 50;
        //calculate 20c
        lbl20c.Text = (intLeftOver / 20).ToString();
        intLeftOver %= 20;
        //calculate 10c
        lbl10c.Text = (intLeftOver / 10).ToString();
        intLeftOver %= 10;
        //calculate 5c
        lbl5c.Text = (intLeftOver / 5).ToString();
        intLeftOver %= 5;
        lbl1c.Text = intLeftOver.ToString();

    }
    protected void btnReset_Click(object sender, EventArgs e)
    {
        txtCents.Text = "0";
        lbl100D.Text = "";
        lbl50D.Text = "";
        lbl20D.Text = "";
        lbl10D.Text = "";
        lbl5D.Text = "";
        lbl2D.Text = "";
        lbl1D.Text = "";
        lbl50c.Text = "";
        lbl20c.Text = "";
        lbl10c.Text = "";
        lbl5c.Text = "";
        lbl1c.Text = "";
    }
}