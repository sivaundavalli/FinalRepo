using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;
using QueryTicketSystem.Classes;
using System.Data;

namespace QueryTicketSystem
{
    public partial class TicketReportForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string strTicID = Convert.ToString(Request.QueryString["TicID"]);
                string strDeptID = Convert.ToString(Request.QueryString["DeptID"]);
                string strStatus = Convert.ToString(Request.QueryString["Status"]);
                BusinessObjects bo = new BusinessObjects();
                DataTable dt = bo.GetReportData(strTicID, strDeptID, strStatus);
                dt.TableName = "TicketMasterTbl";
                RptViewer.Reset();
                RptViewer.LocalReport.DataSources.Clear();
                ReportDataSource datasource = new ReportDataSource("DataSet1", dt);
                RptViewer.ProcessingMode = ProcessingMode.Local;
                RptViewer.LocalReport.ReportPath = Server.MapPath("~/Report/RptTic.rdlc");
                RptViewer.LocalReport.DataSources.Add(datasource);
                RptViewer.ZoomMode = ZoomMode.PageWidth;
                //RptViewer.ReportRefresh();
            }
        }
    }
}