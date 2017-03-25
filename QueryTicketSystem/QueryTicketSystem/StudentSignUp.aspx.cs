using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using QueryTicketSystem.Classes;

namespace QueryTicketSystem
{
    public partial class StudentSignUp : System.Web.UI.Page
    {
        public string conString = ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtUserID.Focus();
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
                   
            try
            {
                BusinessObjects bo = new BusinessObjects();
                if (Page.IsValid)
                {
                    //check whether user id already exists 
                    int retValue = bo.CheckDupUser(txtUserID.Text);
                    if (retValue > 0)
                    {
                        ViewState["UserState"] = "User ID already exists";
                        Page.Validate();
                    }
                    else
                    {
                        //Add user
                        string strSex = "";
                        if (chkMale.Checked == true)
                        {
                            strSex = "M";
                        }
                        else if (chkFemale.Checked == true)
                        {
                            strSex = "F";
                        }
                        else if (chkOther.Checked == true)
                        {
                            strSex = "O";
                        }
                        string strName = txtFirstName.Text + " " + txtLastName.Text;
                        //EncryptDecrypt crypt = new EncryptDecrypt();

                        string strEncryptedPwd = EncryptDecrypt.Encrypt(txtPwd.Text);
                        bool blRetval = bo.CreateInst(txtUserID.Text, strEncryptedPwd, strName, "Student", "Student", txtPhone.Text, txtEmail.Text, strSex);

                        Page.ClientScript.RegisterStartupScript(this.GetType(), "AlertScript", "AlertBox()", true);
                        //Response.Redirect("Login.aspx");
                    }
                }
            }
            catch
            {

            }
        }
       
        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtUserID.Text = "";
            txtPwd.Text = "";
            txtConfirmPwd.Text = "";
            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtPhone.Text = "";
            txtEmail.Text = "";
            chkMale.Checked = false;
            chkFemale.Checked = false;
            chkOther.Checked = false;
        }

        protected void btnCacel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
        protected void CV_AddUser_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string strErrMsg = Convert.ToString(ViewState["UserState"]);
            if (strErrMsg != "")
            {
                CV_AddUser.ErrorMessage = strErrMsg;
                ViewState["UserState"] = null;
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            }

        }

        protected void chkMale_CheckedChanged(object sender, EventArgs e)
        {
            if (chkMale.Checked == true)
            {
                chkFemale.Checked = false;
                chkOther.Checked = false;
            }
        }

        protected void chkFemale_CheckedChanged(object sender, EventArgs e)
        {
            if (chkFemale.Checked == true)
            {
                chkMale.Checked = false;
                chkOther.Checked = false;
            }
        }

        protected void chkOther_CheckedChanged(object sender, EventArgs e)
        {
            if (chkOther.Checked == true)
            {
                chkFemale.Checked = false;
                chkMale.Checked = false;
            }
        }
    }
}