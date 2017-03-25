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
                string strViewStatus = "";
                string strSubType = "";
                if (ds.Tables[0].Rows.Count > 0)
                {
                    lblTitle.Text = ds.Tables[0].Rows[0]["Ticket_Title"].ToString();
                    //lblInst.Text = ds.Tables[0].Rows[0]["Instructor_ID"].ToString();
                    ViewState["InstID"] = ds.Tables[0].Rows[0]["Instructor_ID"].ToString();
                   // ViewState["ViewStatus"] = ds.Tables[0].Rows[0]["View_Status"].ToString();
                    strViewStatus = ds.Tables[0].Rows[0]["View_Status"].ToString();
                    //ViewState["SubType"] = ds.Tables[0].Rows[0]["Subject_Type"].ToString();
                    strSubType = ds.Tables[0].Rows[0]["Subject_Type"].ToString();
                }
                string strRole = Convert.ToString(Session["Role"]);
                if (strRole.ToUpper() == "STUDENT")
                {
                    lblViewStatus.Visible = false;
                    lblVS.Visible = false;
                    lnkSave1.Visible = false;
                    ddlTicViewStatus.Visible = false;
                    lblSubType.Visible = false;
                    lblST.Visible = false;
                    lnkSave2.Visible = false;
                    ddlSubType.Visible = false;
                }
                else
                {
                    if (strViewStatus != null && strViewStatus != "")
                    {
                        lblVS.Visible = true;
                        lblVS.Text = strViewStatus;
                        lnkSave1.Text = "[Edit]";
                        ddlTicViewStatus.SelectedValue = strViewStatus;
                        ddlTicViewStatus.Visible = false;
                    }
                    else
                    {
                        lblVS.Visible = false;
                        lblVS.Text = "";
                        lnkSave1.Text = "[Save]";
                        ddlTicViewStatus.Visible = true;
                        ddlTicViewStatus.SelectedValue = "Select";
                    }
                    if (strSubType != null && strSubType != "")
                    {
                        lblST.Visible = true;
                        lblST.Text = strSubType;
                        lnkSave2.Text = "[Edit]";
                        ddlSubType.SelectedValue = strSubType;
                        ddlSubType.Visible = false;
                    }
                    else
                    {
                        lblST.Visible = false;
                        lblST.Text = "";
                        lnkSave2.Text = "[Save]";
                        ddlSubType.Visible = true;
                        ddlSubType.SelectedValue = "Select";
                    }
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
            string strRole = Convert.ToString(Session["Role"]);
            if (strRole.ToUpper() != "STUDENT")
            {
                if (ddlTicViewStatus.SelectedItem.Text == "Select")
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "AlertScript", "AlertBox('Please select ,who all can view this ticket')", true);
                    return;
                }
                if (ddlSubType.SelectedItem.Text == "Select")
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "AlertScript", "AlertBox('Subject Type is Required')", true);
                    return;
                }
            }
            
            string strTicID = Request.QueryString["TicId"].ToString();
            string strCurUser=Convert.ToString(Session["CurrentUser"]);
           
            BusinessObjects bo = new BusinessObjects();
            bool retval = bo.AddTicResponses(strTicID, lblTitle.Text, strCurUser, txtResponse.Text);
           
            string strToMailAddr="";
            if (strRole.ToUpper() == "INSTRUCTOR")
            {
                strToMailAddr = bo.GetEmailByTicID(strTicID);
                //SendMail(strTicID, "Instructor", strCurUser, strToMailAddr);//Uncomment123 
            }
            else if (strRole.ToUpper() == "STUDENT")
            {
                strToMailAddr= bo.GetEmailByUser(Convert.ToString(ViewState["InstID"]));
                //SendMail(strTicID, "Student", strCurUser, strToMailAddr);//Uncomment123 
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

        protected void lnkSave1_Click(object sender, EventArgs e)
        {
            if (lnkSave1.Text == "[Edit]")
            {
                AddDDlItems("ViewStatus");
                ddlTicViewStatus.Visible = true;
                ddlTicViewStatus.Text = lblVS.Text; 
                lblVS.Visible = false;
                lblVS.Text = "";
                lnkSave1.Text = "[Save]";    
            }
            else
            {
                if (ddlTicViewStatus.SelectedItem.Text == "Select")
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "AlertScript", "AlertBox('Please select ,who all can view this ticket')", true);
                    return;
                }
                BusinessObjects bo = new BusinessObjects();
                string strTicID = Request.QueryString["TicId"].ToString();
                bool fl = bo.UpdateStatus(strTicID, ddlTicViewStatus.SelectedItem.Text, "ViewStatus");
                lblVS.Visible = true;
                lblVS.Text = ddlTicViewStatus.SelectedItem.Text;
                lnkSave1.Text = "[Edit]";
                ddlTicViewStatus.Visible = false;
                if (fl == true)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "AlertScript", "AlertBox('View Status updated Successfully')", true);
                }
                //update field in sp
            }
        }

        protected void lnkSave2_Click(object sender, EventArgs e)
        {
            if (lnkSave2.Text == "[Edit]")
            {
                AddDDlItems("SubjectType");
                ddlSubType.Visible = true;
                ddlSubType.Text = lblST.Text;
                lblST.Visible = false;
                lblST.Text = "";
                lnkSave2.Text = "[Save]";
               
            }
            else
            {
                if (ddlSubType.SelectedItem.Text == "Select")
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "AlertScript", "AlertBox('Subject Type is Required')", true);
                    return;
                }
                BusinessObjects bo = new BusinessObjects();
                string strTicID = Request.QueryString["TicId"].ToString();
                bool fl = bo.UpdateStatus(strTicID, ddlSubType.SelectedItem.Text, "SubjectType");
                lblST.Visible = true;
                lblST.Text = ddlSubType.SelectedItem.Text;
                lnkSave2.Text = "[Edit]";
                ddlSubType.Visible = false;
                if (fl == true)
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "AlertScript", "AlertBox('Subject Type updated Successfully')", true);
                }
                //update field in sp
            }
        }
        private void AddDDlItems(string flag)
        {
            if (flag == "ViewStatus")
            {
                ddlTicViewStatus.Items.Clear();
                ddlTicViewStatus.Items.Add("Select");
                ddlTicViewStatus.Items.Add("Public");
                ddlTicViewStatus.Items.Add("Private");
            }
            else
            {
                ddlSubType.Items.Clear();
                ddlSubType.Items.Add("Select");
                ddlSubType.Items.Add("Subject");
                ddlSubType.Items.Add("Non-Subject");
            }
        }
        //protected void gv_TicSummary_RowDeleted(object sender, GridViewDeletedEventArgs e)
        //{
        //      //Page.ClientScript.RegisterStartupScript(this.GetType(), "AlertScript", "AlertBox('Record Deleted Successfully')", true);
           
        //}
    }
}