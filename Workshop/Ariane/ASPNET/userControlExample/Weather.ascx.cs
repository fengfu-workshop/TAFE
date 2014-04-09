using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Weather : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public void getWeather(int weatherType)
    {
        switch (weatherType)
        {
            case 1:
                lblMin.Text = "20";
                lblMax.Text = "27";
                imgWeather.AlternateText = lblCondition.Text = "Sunny";
                imgWeather.ImageUrl = "~/images/sunny.png";
                break;
            case 2:
                lblMin.Text = "13";
                lblMax.Text = "20";
                imgWeather.AlternateText = lblCondition.Text = "Rain";
                imgWeather.ImageUrl = "~/images/patchyRain.png";
                break;
            case 3:
                lblMin.Text = "20";
                lblMax.Text = "27";
                imgWeather.AlternateText = lblCondition.Text = "Showers";
                imgWeather.ImageUrl = "~/images/showers.png";
                break;
        }
    }
}