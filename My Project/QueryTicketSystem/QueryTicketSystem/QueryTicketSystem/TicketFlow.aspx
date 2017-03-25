<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TicketFlow.aspx.cs" Inherits="QueryTicketSystem.TicketFlow" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Ticket Summary</title>
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
        //function showResDiv() {
        //    document.getElementById("divResponse").style.display = "block";
        //    return false;
        //}
        $(function () {
            $("#divResponse").hide();
            $("#btnRespond").on("click", function () {
                $("#divResponse").show();
            });
        });
    </script>
</head>
<body style="background:#e6e6e6">
   
    <form id="form1" runat="server" >
         <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div>
        <div style="text-align:right;font-weight:bold;color:red;padding-top:5px;padding-right:5px;">
           Logged In User:  <asp:Label ID="lblLoggedID" runat="server" Text="" ForeColor="Green"></asp:Label>
        </div>
        <div style="padding-left:20px;padding-top:30px;">
           <table style="font-weight:bold;font-size:18px;color:#990000">
                <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Ticket ID:"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblTicID" runat="server" Text=""></asp:Label>
                </td>
            </tr>
             <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Ticket Title:"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblTitle" runat="server" Text=""></asp:Label>
                </td>
            </tr>
               <%-- <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Instructor:"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblInst" runat="server" Text=""></asp:Label>
                </td>
            </tr>--%>
           </table>
        </div>
        
        <br />
    <div id="divTicSum">
         <asp:UpdatePanel ID="UP_TicSum" runat="server">
                    <ContentTemplate>
        <asp:GridView ID="gv_TicSummary" runat="server" AutoGenerateColumns="False" DataSourceID="ODS_TicSummary" Width="98%" EmptyDataText="No Records Found" 
            OnRowDeleting="gv_TicSummary_RowDeleting"  CssClass="Grid"                    
                      AlternatingRowStyle-CssClass="alt"
                      PagerStyle-CssClass="pgr">
            <AlternatingRowStyle CssClass="alt" />
            <Columns>
                <asp:TemplateField Visible="false">
                               <ItemTemplate>
        <asp:Label ID="lblDescID" runat="server" Text='<%# Eval("Desc_ID")%>'></asp:Label>
    </ItemTemplate>
                    </asp:TemplateField>
                <%--<asp:BoundField DataField="Desc_ID" Visible="False" />--%>
                <asp:BoundField DataField="User_ID" HeaderText="Posted By">
                <ItemStyle Font-Bold="True" Font-Italic="True" HorizontalAlign="Left" VerticalAlign="Top" Width="100px" />
                </asp:BoundField>
                <asp:BoundField DataField="Ticket_Desc" HeaderText="Ticket Summary">
                <HeaderStyle Width="300px" />
                <ItemStyle Width="300px" />
                </asp:BoundField>
                <asp:BoundField DataField="Created_dt" HeaderText="Posted On" >
                <HeaderStyle Width="70px" />
                <ItemStyle VerticalAlign="Top" Width="100px" />
                </asp:BoundField>
                <asp:CommandField ShowDeleteButton="True" Visible="False" >
                <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" Width="30px" ForeColor="Red" />
                </asp:CommandField>
            </Columns>
            <PagerStyle CssClass="pgr" />
        </asp:GridView> 
                        <asp:Timer ID="Timer1" runat="server" Interval="5000" OnTick="Timer1_Tick"></asp:Timer>
                        </ContentTemplate>
             </asp:UpdatePanel>      
    </div>
        <br />
        <br />
        <span style="padding-left:20px;">
        <%--<asp:Button ID="btnRespond" runat="server" Text="Respond" CssClass="clsBtns"/>--%>
            <input type="button" id="btnRespond" class="clsBtns" runat="server" value="Respond" />
            </span>
        <br />
        <br />
        <div style="padding-left:20px;" id="divResponse">
            <table>
                <tr>
                    <td>
                         <asp:TextBox ID="txtResponse" runat="server" TextMode="MultiLine" Width="600px" Height="90px" CssClass="clsMulTxt"></asp:TextBox>
                    </td>
                    <td valign="top">
                        <asp:RequiredFieldValidator ID="RFV_Response" runat="server" ErrorMessage="Response is Required" ControlToValidate="txtResponse" ForeColor="Red" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="btnSend" runat="server" Text="Send" CssClass="clsBtns" OnClick="btnSend_Click"/>
                    </td>
                </tr>
            </table>
            </div>
         <asp:ObjectDataSource ID="ODS_TicSummary" runat="server" OnSelecting="ODS_TicSummary_Selecting" SelectMethod="GetTicSummary" TypeName="QueryTicketSystem.Classes.BusinessObjects" DeleteMethod="DeleteComments" OnDeleting="ODS_TicSummary_Deleting">
             <DeleteParameters>
                 <asp:Parameter Name="intDescID" Type="Int32" />
             </DeleteParameters>
             <SelectParameters>
                 <asp:Parameter Name="strTic" Type="String" />
             </SelectParameters>
        </asp:ObjectDataSource>
    </div>
    </form>
</body>
</html>
