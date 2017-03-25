<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Home.Master" CodeBehind="SearchReport.aspx.cs" Inherits="QueryTicketSystem.SearchReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="User_ContentPlaceHolder" runat="server">
    <link href="Styles/css.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.8.0.min.js"></script>
    <script src="Scripts/jquery.alerts.js"></script>
    <link href="Styles/jquery.alerts.css" rel="stylesheet" />
    <script type="text/javascript">
        function AlertBox(strMsg) {
            jAlert(strMsg, '  Ok  ');
        }
    </script>
     <script>
         function openNewWindow(url) {
             window.open(url,'_blank');
         }
    </script>
     <div class="clsDivInContent">
        <div id="DivReport" class="clsDivTblContent" style="height: 260px;width:750px;">
           <div class="clsDivPageHeading"> <asp:Label ID="Label9" runat="server" Text="Tickets Report"></asp:Label></div>
        <table id="tblRpt" align="center" class="clsTable" style="padding-top:15px">
            <tr class="clsTr">
                <td class="clsTd">
                    <asp:Label ID="Label1" runat="server" Text="Ticket ID"></asp:Label>
                </td>
                <td class="clsTd">
                    <asp:TextBox ID="txtTicID" runat="server" CssClass="clsTxt"></asp:TextBox>
                </td>
            </tr>
            <tr class="clsTr">
                <td class="clsTd">
                    <asp:Label ID="Label2" runat="server" Text="Department"></asp:Label>
                </td>
                <td class="clsTd">
                    <asp:DropDownList ID="ddlDept" runat="server" CssClass="clsddl">
                          <asp:ListItem Selected="True">Select</asp:ListItem>
                          <asp:ListItem>CS(Computer Science)</asp:ListItem>
                          <asp:ListItem>CIS(Computer Information Systems)</asp:ListItem>
                      </asp:DropDownList>
                </td>
            </tr>
            <tr class="clsTr">
                <td class="clsTd">
                    <asp:Label ID="Label3" runat="server" Text="Status"></asp:Label>
                </td>
                <td class="clsTd">
                    <asp:DropDownList ID="ddlStatus" runat="server" CssClass="clsddl">
                        <asp:ListItem Selected="True">Select</asp:ListItem>
                          <asp:ListItem>Open</asp:ListItem>
                          <asp:ListItem>Resolved</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td colspan="2">

                </td>
            </tr>
            <tr class="clsTr">
                <td colspan="2">
                    <asp:Button ID="btnReport" runat="server" Text="Report" CssClass="" OnClick="btnReport_Click"/>
                </td>
            </tr>
            </table>
            </div>
         </div>
</asp:Content>
