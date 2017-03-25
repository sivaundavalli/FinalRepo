﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TicketReportForm.aspx.cs" Inherits="QueryTicketSystem.TicketReportForm" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div>
        <rsweb:ReportViewer ID="RptViewer" runat="server" Font-Names="Verdana" Font-Size="8pt" Height="673px" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="1026px">
           <%-- <LocalReport ReportEmbeddedResource="QueryTicketSystem.Report.RptTickets.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="TicDataSet" />
                </DataSources>
            </LocalReport>--%>
        </rsweb:ReportViewer>
        <%--<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" TypeName="TicDataSetTableAdapters."></asp:ObjectDataSource>--%>
    </div>
    </form>
</body>
</html>
