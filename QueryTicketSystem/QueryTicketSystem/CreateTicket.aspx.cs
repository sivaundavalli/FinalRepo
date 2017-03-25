using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using QueryTicketSystem.Classes;
using System.Net.Mail;
using System.Configuration;

namespace QueryTicketSystem
{
    public partial class CreateTicket : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnPost_Click(object sender, EventArgs e)
        {
            BusinessObjects bo = new BusinessObjects();
            var rnd = new Random(DateTime.Now.Millisecond);
            int ticid = rnd.Next(0, 3000);
            string strTic_ID = "TIC" + ticid.ToString();
            string strCurUser= Convert.ToString(Session["CurrentUser"]);
            bool retVal = bo.PostTicket(strTic_ID, txtTitle.Text, strCurUser, "Open", txtDesc.Text,ddlInst.SelectedItem.Text);
            string strToMailAddr = bo.GetEmailByUser(ddlInst.SelectedItem.Text);
            //SendMail(strTic_ID, strCurUser, strToMailAddr);//Uncomment123 
            if (retVal == true)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "AlertScript", "AlertBox('Ticket Created Successfully')", true);
            }
        }

        private void SendMail(string Tic_ID, string stud_id,string ToMailAddr)
        {
            string SenderMailAddr = ConfigurationManager.AppSettings["FromMailAddr"];
            string SenderMailPwd = ConfigurationManager.AppSettings["FromMailAddrPwd"];
            using (MailMessage mm = new MailMessage(SenderMailAddr, ToMailAddr))
            {
                mm.Subject = "Ticket " + Tic_ID + " has been logged In";
                string MailBody = "<table><tr><td style='font-weight:bold'>Student ID:</td><td>" + stud_id +"</td></tr><tr><td  style='font-weight:bold'>Ticket Title:</td><td></td></tr><tr><td  style='font-weight:bold'>Ticket Description:</td><td></td></tr></table><br><br><br>Regards,<br>Query Ticketing System";
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

        protected void ddlDept_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlDept.SelectedItem.Text != "Select")
            {
                BusinessObjects bo = new BusinessObjects();
                DataSet ds = bo.GetInstByDept(ddlDept.SelectedItem.Text);
                DataRow newRow = ds.Tables[0].NewRow();
                newRow[0] = "Select";
                ds.Tables[0].Rows.InsertAt(newRow, 0);
                ddlInst.DataSource = ds.Tables[0];
                ddlInst.DataTextField = "User_ID";
                ddlInst.DataValueField = "User_ID";
                ddlInst.DataBind();
            }
        }
    }
}