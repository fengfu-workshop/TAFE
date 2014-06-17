using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Test_ContactUs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            string fileName = Server.MapPath("~/App_Data/MailTemplate.txt");
            string mailBody = File.ReadAllText(fileName);
            mailBody = mailBody.Replace("##FirstName##", tbFirstName.Text);
            mailBody = mailBody.Replace("##LastName##", tbLastName.Text);
            mailBody = mailBody.Replace("##Email##", tbEmailAddress.Text);
            mailBody = mailBody.Replace("##ContactNumber##", tbContactNumber.Text);
            mailBody = mailBody.Replace("##Question##", tbQuestion.Text);
            MailMessage myMessage = new MailMessage();
            myMessage.Subject = "Response from NextStep";
            myMessage.Body = mailBody;
            myMessage.From = new MailAddress("contact@nextstep.com", "NextStep Sales");
            myMessage.To.Add(new MailAddress("information@sportsshop.com.au", "Information"));
            myMessage.ReplyToList.Add(new MailAddress(tbEmailAddress.Text));

            SmtpClient mySmtpClient = new SmtpClient();
            if (!String.IsNullOrEmpty(mySmtpClient.PickupDirectoryLocation) && !Directory.Exists(mySmtpClient.PickupDirectoryLocation))
            {
                Directory.CreateDirectory(mySmtpClient.PickupDirectoryLocation);
            }
            mySmtpClient.Send(myMessage);
            pnlMailSent.Visible = true;
            palContactForm.Visible = false;
        }
       
    }
}