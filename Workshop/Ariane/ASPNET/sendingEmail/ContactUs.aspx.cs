using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.IO;

public partial class ContactUs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSend_Click(object sender, EventArgs e)
    {
        string filename = Server.MapPath("~/App_Data/contactForm.txt");
        string mailBody = File.ReadAllText(filename);
        mailBody = mailBody.Replace("##Name##", txtName.Text);
        mailBody = mailBody.Replace("##Email##", txtEmail.Text);
        mailBody = mailBody.Replace("##Phone##", txtPhone.Text);
        mailBody = mailBody.Replace("##Comment##", txtComment.Text);

        MailMessage mm = new MailMessage();
        mm.Subject = "Response from websitet";
        mm.From = new MailAddress("kentroad@gmail.com", "Sender Name");
        mm.To.Add(new MailAddress("kentroad@gmali.com", "Receiver Name"));

        mm.ReplyToList.Add(new MailAddress(txtEmail.Text));

        mm.Body = mailBody;
        mm.IsBodyHtml = true;

        SmtpClient smtp = new SmtpClient();
        smtp.DeliveryMethod = SmtpDeliveryMethod.SpecifiedPickupDirectory;
        smtp.PickupDirectoryLocation = "C:\\TempMail";

        smtp.Send(mm);

    }
}