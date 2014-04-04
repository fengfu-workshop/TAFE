using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;

public partial class sendingEmailDemo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        MailMessage mm = new MailMessage("kentroad@gmail.com", "kentroad1@gmali.com");
        mm.Subject = "Test Subject";
        mm.Body = "<h1>Hello, </h1> This is a mail test.";
        mm.IsBodyHtml = true;

        SmtpClient smtp = new SmtpClient();
        smtp.DeliveryMethod = SmtpDeliveryMethod.SpecifiedPickupDirectory;
        smtp.PickupDirectoryLocation = "C:\\TempMail";

        //SmtpClient smtp = new SmtpClient();
        //smtp.Host = "smtp.gmail.com";
        //smtp.EnableSsl = true;
        //NetworkCredential NetworkCred = new NetworkCredential("kentroad@gmail.com", "pisces6");
        //smtp.UseDefaultCredentials = true;
        //smtp.Credentials = NetworkCred;
        //smtp.Port = 587;

        smtp.Send(mm);

    }
}