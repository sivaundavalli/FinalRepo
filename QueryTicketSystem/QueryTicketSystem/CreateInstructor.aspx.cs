using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using System.Data;
using System.Data.SqlClient;
using QueryTicketSystem.Classes;

namespace QueryTicketSystem
{
    public partial class CreateInstructor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Cache[ODS_Inst.CacheKeyDependency] = "InstCache";
                //ViewState["blIsSearch"] = false;
                ODS_Inst.Select();
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                BusinessObjects bo = new BusinessObjects();

                int retValue = bo.CheckDupUser(txtUserID.Text);
                if (retValue > 0)
                {
                    ViewState["UserState"] = "Instructor ID already exists";
                    Page.Validate();
                }
                else
                {
                    //Add user
                    //ViewState["blIsSearch"] = false;
                    ODS_Inst.Insert();
                    ODS_Inst.Select();
                    ResetFields();
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "AlertScript", "AlertBox('Instructor Created Successfully')", true);
                }
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            ResetFields();
        }
        private void ResetFields()
        {
            txtUserID.Text = "";
            txtPwd.Text = "";
            txtConfirmPwd.Text = "";
            ddlDept.SelectedIndex = 0;
            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtPhone.Text = "";
            txtEmail.Text = "";
            chkMale.Checked = false;
            chkFemale.Checked = false;
            chkOther.Checked = false;
            gvInt.DataBind();
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

        protected void ODS_Inst_Inserting(object sender, ObjectDataSourceMethodEventArgs e)
        {
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
            e.InputParameters.Clear();
            e.InputParameters.Add("strInstID", txtUserID.Text);
            //EncryptionDecryption crypt = new EncryptionDecryption();
            string strEncryptedPwd = EncryptDecrypt.Encrypt(txtPwd.Text);
            e.InputParameters.Add("strPwd", strEncryptedPwd);
            e.InputParameters.Add("strInstName", txtFirstName.Text + " " + txtLastName.Text);
            e.InputParameters.Add("strRole", "Instructor");
            e.InputParameters.Add("strDept", ddlDept.SelectedItem.Text);
            e.InputParameters.Add("strPhoneNum", txtPhone.Text);
            e.InputParameters.Add("strEmail", txtEmail.Text);
            e.InputParameters.Add("strSex", strSex);
            
        }
        protected void ODS_Inst_Updating(object sender, ObjectDataSourceMethodEventArgs e)
        {
            string[] arrInst = (string[])ViewState["LstInst"];
            e.InputParameters.Clear();
            e.InputParameters.Add("strInstID", arrInst[0]);
            e.InputParameters.Add("strInstName", arrInst[1]);
            e.InputParameters.Add("strDept", arrInst[2]);
            e.InputParameters.Add("strPhoneNum", arrInst[3]);
            e.InputParameters.Add("strEmail", arrInst[4]);
         }
        protected void gvInt_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvInt.EditIndex = e.NewEditIndex;
            //ViewState["blIsSearch"] = false;
            ODS_Inst.Select();
        }

        protected void gvInt_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = (GridViewRow)gvInt.Rows[e.RowIndex];
            List<string> LstInst = new List<string>();

            Label lblInstID = (gvInt.Rows[e.RowIndex].FindControl("lblInstID") as Label);
            LstInst.Add(lblInstID.Text);
            TextBox txtInstName = (TextBox)row.Cells[1].Controls[0];
            LstInst.Add(txtInstName.Text);
            LstInst.Add((gvInt.Rows[e.RowIndex].FindControl("ddlDept") as DropDownList).SelectedItem.Value);
            TextBox txtPhNum = (TextBox)row.Cells[3].Controls[0];
            if (CheckRegex("^[0-9-]*$", txtPhNum.Text) == false)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "AlertScript", "AlertBox('Invalid Phone#')", true);
                return;
            }
            LstInst.Add(txtPhNum.Text);
            TextBox txtEmailID = (TextBox)row.Cells[4].Controls[0];
            if(CheckRegex(@"^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$",txtEmailID.Text) == false)
            {
                 Page.ClientScript.RegisterStartupScript(this.GetType(), "AlertScript", "AlertBox('Invalid Email ID')", true);
                return;
            }
            LstInst.Add(txtEmailID.Text);
            ViewState["LstInst"] = LstInst.ToArray();
            ODS_Inst.Update();
            gvInt.EditIndex = -1;
            Page.ClientScript.RegisterStartupScript(this.GetType(), "AlertScript", "AlertBox('Record Updated Successfully')", true);
        }

        private bool CheckRegex(string Pattern, string strValue)
        {
            Regex regex = new Regex(Pattern);
            Match match = regex.Match(strValue);
            if (match.Success)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        protected void gvInt_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvInt.EditIndex = -1;
            //ViewState["blIsSearch"] = false;
            ODS_Inst.Select();
        }

        protected void gvInt_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && gvInt.EditIndex == e.Row.RowIndex)
            {
                DropDownList ddlDept = (DropDownList)e.Row.FindControl("ddlDept");
                ddlDept.Items.FindByValue((e.Row.FindControl("lblDept") as Label).Text).Selected = true;
            }
        }

        protected void gvInt_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label lblInstID = (gvInt.Rows[e.RowIndex].FindControl("lblInstID") as Label);
            ViewState["DelInstID"] = lblInstID.Text;
            ODS_Inst.Delete();
            gvInt.EditIndex = -1;
            Page.ClientScript.RegisterStartupScript(this.GetType(), "AlertScript", "AlertBox('Record Deleted Successfully')", true);
        }

        protected void ODS_Inst_Deleting(object sender, ObjectDataSourceMethodEventArgs e)
        {
            string strInstID = Convert.ToString(ViewState["DelInstID"]);
            e.InputParameters.Clear();
            e.InputParameters.Add("strInstID", strInstID);
        }

        protected void ODS_Inst_Filtering(object sender, ObjectDataSourceFilteringEventArgs e)
        {
            if (txtUserID.Text != "")
            {
                e.ParameterValues.Clear();
                e.ParameterValues.Add("User ID", txtUserID.Text);
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (txtUserID.Text == "")
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "AlertScript", "AlertBox('Instructor ID is Required')", true);
            }
            else
            {
                ODS_Inst.FilterExpression = "[User ID]='{0}'";
            }

        }

        protected void gvInt_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvInt.PageIndex = e.NewPageIndex;
            gvInt.DataBind();
        }

       

        
    }
}