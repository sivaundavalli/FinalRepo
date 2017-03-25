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
    public partial class InstructorHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ODS_InstTics.Select();
            }

        }

        protected void ODS_InstTics_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
        {
            string strUserID = Convert.ToString(Session["CurrentUser"]);
            e.InputParameters.Clear();
            e.InputParameters.Add("strUserID", strUserID);
        }
        protected void Timer1_Tick(object sender, EventArgs e)
        {
            gvMyTics.DataBind();
        }

        protected void gvMyTics_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvMyTics.PageIndex = e.NewPageIndex;
            gvMyTics.DataBind();
        }

        protected void gvMyTics_RowDataBound(object sender, GridViewRowEventArgs e)
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

    }
}