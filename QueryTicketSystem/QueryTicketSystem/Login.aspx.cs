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
    public partial class Login : System.Web.UI.Page
    {
        public string conString = ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtUsername.Focus();
            }

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                //if (Page.IsValid)
                //{ 
                    using (SqlConnection con = new SqlConnection(conString))
                    {
                        using (SqlCommand cmd = new SqlCommand("sp_UserChk", con))
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            //EncryptionDecryption crypt = new EncryptionDecryption();
                            //string strEncryptedPwd = EncryptDecrypt.Encrypt(txtPwd.Text);
                            cmd.Parameters.Add("@UserID", SqlDbType.NVarChar).Value = txtUsername.Text;
                            //cmd.Parameters.Add("@Pwd", SqlDbType.NVarChar).Value = strEncryptedPwd;

                            if (con.State == ConnectionState.Closed)
                            {
                                con.Open();
                            }
                            int retVal = Convert.ToInt16(cmd.ExecuteScalar());
                            if (retVal == 1)
                            {
                                ViewState["IsValidUser"] = retVal;
                                Page.Validate();
                            }
                            else
                            {
                                Session["CurrentUser"] = txtUsername.Text;
                                //fetch roletype and then redirect
                                string strRole = GetRoleType();
                                Session["Role"] = strRole;
                                

                                BusinessObjects bo = new BusinessObjects();
                                string strPwd = bo.GetUserPwd(txtUsername.Text);
                                string strDecryptedPwd = strPwd;
                                string strEnteredPwd = txtPwd.Text;
                                if (strRole.ToUpper() != "ADMIN")
                                {
                                    strDecryptedPwd = EncryptDecrypt.Decrypt(strPwd);
                                    strEnteredPwd = txtPwd.Text;
                                }
                                else
                                {
                                    strEnteredPwd = strEnteredPwd.ToUpper();
                                    strDecryptedPwd = strDecryptedPwd.ToUpper();
                                }
                                if (strDecryptedPwd != strEnteredPwd)
                                {
                                    ViewState["IsValidUser"] = 1;
                                    Page.Validate();
                                }
                                else
                                {
                                    
                                    if (strRole.ToUpper() == "ADMIN")
                                    {
                                        Response.Redirect("AdminHome.aspx", false);
                                    }
                                    else if (strRole.ToUpper() == "INSTRUCTOR")
                                    {
                                        Response.Redirect("InstructorHome.aspx", false);
                                    }
                                    else if (strRole.ToUpper() == "STUDENT")
                                    {
                                        Response.Redirect("StudentHome.aspx", false);
                                    }
                                }
                            }

                        }
                    }
                //}
            }
            catch(Exception ex)
            {
                string error = ex.Message.ToString();
            }
        }

        private string GetRoleType()
        {
            string strRoleType="";

            using (SqlConnection con = new SqlConnection(conString))
            {
                using (SqlCommand cmd = new SqlCommand("sp_GetRoleType", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@UserID", SqlDbType.NVarChar).Value = txtUsername.Text;
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    strRoleType = Convert.ToString(cmd.ExecuteScalar());
                }
            }
            return strRoleType;
        }

        protected void CV_UserChk_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (Convert.ToInt16(ViewState["IsValidUser"]) == 1)
            {
                CV_UserChk.ErrorMessage = "Unauthorized User";
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            }

        }
        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            Response.Redirect("StudentSignUp.aspx");
        }

        protected void lnkForgotPwd_Click(object sender, EventArgs e)
        {
            Response.Redirect("ForgotPwd.aspx");
        }

       
    }
}