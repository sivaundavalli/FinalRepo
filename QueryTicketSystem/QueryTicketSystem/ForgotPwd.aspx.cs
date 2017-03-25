using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QueryTicketSystem.Classes;
using System.Configuration;
using System.Net.Mail;

namespace QueryTicketSystem
{
    public partial class ForgotPwd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (txtUsername.Text == "" && txtEmail.Text == "")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "AlertScript", "AlertBox('User ID or Email ID is Required')", true);
                return;
            }
            BusinessObjects bo = new BusinessObjects();
            string strPwd = bo.ForgotPwd(txtUsername.Text, txtEmail.Text);
            //EncryptionDecryption crypt = new EncryptionDecryption();
            string strDecryptedPwd = EncryptDecrypt.Decrypt(strPwd);

            if (strDecryptedPwd == "" || strDecryptedPwd == null)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "AlertScript", "AlertBox('Invalid User ID or Email ID')", true);
                return;
            }

            string strEmail = "";
            if (txtUsername.Text != "")
            {
                strEmail = bo.GetEmailByUser(txtUsername.Text);
                if (strEmail == "" || strEmail == null)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "AlertScript", "AlertBox('Invalid User ID')", true);
                    return;
                }
            }
            if (txtEmail.Text != "")
            {
                int retVal = bo.ChkEmailID(txtEmail.Text);
                if (retVal == 1)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "AlertScript", "AlertBox('Invalid Email ID')", true);
                    return;
                }
                strEmail = txtEmail.Text;
            }
            //SendMail(strEmail, strDecryptedPwd);Uncomment123
            Page.ClientScript.RegisterStartupScript(this.GetType(), "AlertScript", "ReAlertBox()", true);
        }

        private void SendMail(string ToMailAddr,string Pwd)
        {
            string SenderMailAddr = ConfigurationManager.AppSettings["FromMailAddr"];
            string SenderMailPwd = ConfigurationManager.AppSettings["FromMailAddrPwd"];
            using (MailMessage mm = new MailMessage(SenderMailAddr, ToMailAddr))
            {
                mm.Subject = "QTS - Password Recovery";
                string MailBody = "<table><tr><td style='font-weight:bold'>Password Is:</td><td>" + Pwd + "</td></tr></table><br><br><br>Regards,<br>Query Ticketing System";
                mm.Body = MailBody;

                mm.IsBodyHtml = true;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.EnableSsl = true;
                System.Net.NetworkCredential credentials = new System.Net.NetworkCredential();
                credentials.UserName = SenderMailAddr;
                credentials.Password = SenderMailPwd;
                smtp.UseDefaultCredentials = true;
                smtp.Credentials = credentials;
                smtp.Port = 587;
                smtp.Send(mm);

            }
        }
    }
}