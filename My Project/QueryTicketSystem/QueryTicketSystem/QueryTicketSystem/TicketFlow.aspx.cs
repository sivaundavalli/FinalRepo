using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using QueryTicketSystem.Classes;
using System.Configuration;
using System.Net.Mail;

namespace QueryTicketSystem
{
    public partial class TicketFlow : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ODS_TicSummary.Select();
                string strTicID = Request.QueryString["TicId"].ToString();
                lblTicID.Text = strTicID;
                BusinessObjects bo = new BusinessObjects();
                DataSet ds = bo.GetStudTic_details(strTicID);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    lblTitle.Text = ds.Tables[0].Rows[0]["Ticket_Title"].ToString();
                    //lblInst.Text = ds.Tables[0].Rows[0]["Instructor_ID"].ToString();
                    ViewState["InstID"] = ds.Tables[0].Rows[0]["Instructor_ID"].ToString();
                }
                if (gv_TicSummary.Rows.Count == 0)
                {
                    btnRespond.Visible = false;
                }
                else
                {
                    btnRespond.Visible = true;
                }
                if (Request.QueryString["AllTics"] != null)
                {
                    string strAllTics = Request.QueryString["AllTics"].ToString();
                    if (strAllTics == "Yes")
                    {
                        btnRespond.Visible = false;
                    }
                }
                string strCurUser = Convert.ToString(Session["CurrentUser"]);
                if (strCurUser.ToUpper() == "ADMIN")
                {
                    btnRespond.Visible = false;
                    gv_TicSummary.Columns[4].Visible = true;
                }
                lblLoggedID.Text = strCurUser;
            }

        }

        protected void ODS_TicSummary_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
        {
            string strTicID = Request.QueryString["TicId"].ToString();
            e.InputParameters.Clear();
            e.InputParameters.Add("strTic", strTicID);
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            string strTicID = Request.QueryString["TicId"].ToString();
            string strCurUser=Convert.ToString(Session["CurrentUser"]);
           
            BusinessObjects bo = new BusinessObjects();
            bool retval = bo.AddTicResponses(strTicID, lblTitle.Text, strCurUser, txtResponse.Text);
            string strRole = Convert.ToString(Session["Role"]);
            string strToMailAddr="";
            if (strRole.ToUpper() == "INSTRUCTOR")
            {
                strToMailAddr = bo.GetEmailByTicID(strTicID);
                SendMail(strTicID, "Instructor", strCurUser, strToMailAddr);
            }
            else if (strRole.ToUpper() == "STUDENT")
            {
                strToMailAddr= bo.GetEmailByUser(Convert.ToString(ViewState["InstID"]));
                SendMail(strTicID, "Student", strCurUser, strToMailAddr);
            }

            

            if (retval == true)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "AlertScript", "AlertBox('Responded Successfully')", true);
            }
            txtResponse.Text = "";
        }
        private void SendMail(string Tic_ID, string key, string userid, string ToMailAddr)
        {
            string SenderMailAddr = ConfigurationManager.AppSettings["FromMailAddr"];
            string SenderMailPwd = ConfigurationManager.AppSettings["FromMailAddrPwd"];
            using (MailMessage mm = new MailMessage(SenderMailAddr, ToMailAddr))
            {
                mm.Subject = "Ticket " + Tic_ID + " has been logged In";
                string MailBody = "<table><tr><td style='font-weight:bold'>" + key + " ID:</td><td>" + userid + "</td></tr><tr><td  style='font-weight:bold'>Ticket Title:</td><td></td></tr><tr><td  style='font-weight:bold'>Ticket Description:</td><td></td></tr></table><br><br><br>Regards,<br>Query Ticketing System";
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
        protected void Timer1_Tick(object sender, EventArgs e)
        {
            gv_TicSummary.DataBind();
        }

        protected void gv_TicSummary_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label lblDescID = (gv_TicSummary.Rows[e.RowIndex].FindControl("lblDescID") as Label);
            ViewState["lblDescID"] = lblDescID.Text;
            ODS_TicSummary.Delete();
            gv_TicSummary.EditIndex = -1;
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "AlertBox('Record Deleted Successfully')", true);
        }

        protected void ODS_TicSummary_Deleting(object sender, ObjectDataSourceMethodEventArgs e)
        {
            int DescID = Convert.ToInt16(ViewState["lblDescID"]);
            e.InputParameters.Clear();
            e.InputParameters.Add("intDescID", DescID);
        }

        //protected void gv_TicSummary_RowDeleted(object sender, GridViewDeletedEventArgs e)
        //{
        //      //Page.ClientScript.RegisterStartupScript(this.GetType(), "AlertScript", "AlertBox('Record Deleted Successfully')", true);
           
        //}
    }
}