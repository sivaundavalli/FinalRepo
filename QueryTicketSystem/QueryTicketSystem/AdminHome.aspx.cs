using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;

namespace QueryTicketSystem
{
    public partial class AdminHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ODS_AllTics.Select();
            }
        }
        protected void Timer1_Tick(object sender, EventArgs e)
        {
            gvTics.DataBind();
        }

        protected void gvTics_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string status = e.Row.Cells[3].Text;

                if (status == "Open")
                {
                    e.Row.Cells[3].ForeColor = Color.Red;
                }
                else
                {
                    e.Row.Cells[3].ForeColor = Color.Green;
                }
            }
        }

        protected void ODS_AllTics_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
        {
            string strRole = Convert.ToString(Session["Role"]);
            string strCurUser = Convert.ToString(Session["CurrentUser"]);
            e.InputParameters.Clear();
            e.InputParameters.Add("strRole", strRole);
            e.InputParameters.Add("strCurUser", strCurUser);
        }

    }
}