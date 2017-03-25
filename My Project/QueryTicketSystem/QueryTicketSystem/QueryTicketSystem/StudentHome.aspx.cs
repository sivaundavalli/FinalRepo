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
    public partial class StudentHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ODS_MyTics.Select();
            }
        }

        //protected void btnSearch_Click(object sender, EventArgs e)
        //{
          
        //    if (ddlSearchBy.SelectedItem.Text == "Select")
        //    {
        //        Page.ClientScript.RegisterStartupScript(this.GetType(), "AlertScript", "AlertBox('Search By is Required')", true);
        //    }
        //    else if (txtSearch.Text == "")
        //    {
        //        Page.ClientScript.RegisterStartupScript(this.GetType(), "AlertScript", "AlertBox('Search Value is Required')", true);
        //    }
        //    else
        //    {
        //        if (ddlSearchBy.SelectedItem.Text == "Ticket ID")
        //        {
        //            ODS_MyTics.FilterExpression = "[Ticket_ID]='{0}'";
        //        }
        //        if (ddlSearchBy.SelectedItem.Text == "Status")
        //        {
        //            ODS_MyTics.FilterExpression = "[strStatus]='{0}'";
        //        }
        //    }
        //}

        protected void ODS_MyTics_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
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

        //protected void ODS_MyTics_Filtering(object sender, ObjectDataSourceFilteringEventArgs e)
        //{
        //    if (txtSearch.Text != "")
        //    {
        //        e.ParameterValues.Clear();
        //        if (ddlSearchBy.SelectedItem.Text == "Ticket ID")
        //        {
        //            e.ParameterValues.Add("Ticket_ID", txtSearch.Text);
        //        }
        //        else
        //        {
        //            e.ParameterValues.Add("strStatus", txtSearch.Text);
        //        }
        //    }
        //}

      
    }
}