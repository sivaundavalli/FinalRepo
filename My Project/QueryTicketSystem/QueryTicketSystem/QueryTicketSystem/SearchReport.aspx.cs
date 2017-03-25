using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QueryTicketSystem
{
    public partial class SearchReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnReport_Click(object sender, EventArgs e)
        {
            string strDept = "";
            string strStatus = "";
            if (ddlDept.SelectedItem.Text != "Select")
            {
                strDept = ddlDept.SelectedItem.Text;
            }
            if (ddlStatus.SelectedItem.Text != "Select")
            {
                strStatus = ddlStatus.SelectedItem.Text;
            }
            string strurl = "TicketReportForm.aspx?TicID=" + txtTicID.Text + "&DeptID=" + strDept + "&Status=" + strStatus;
            Page.ClientScript.RegisterStartupScript(this.GetType(), "openwindow", "openNewWindow('" + strurl + "')", true);
        }
    }
}