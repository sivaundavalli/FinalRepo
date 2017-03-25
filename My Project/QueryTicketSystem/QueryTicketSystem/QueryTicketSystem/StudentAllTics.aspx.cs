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
    public partial class StudentAllTics : System.Web.UI.Page
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

        protected void gvTics_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvTics.PageIndex = e.NewPageIndex;
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

    }
}