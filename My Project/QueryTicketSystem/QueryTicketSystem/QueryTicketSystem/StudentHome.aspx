<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Home.Master" CodeBehind="StudentHome.aspx.cs" Inherits="QueryTicketSystem.StudentHome" %>



<asp:Content ID="Content1" ContentPlaceHolderID="User_ContentPlaceHolder" runat="server">
      <script src="Scripts/jquery-1.8.0.min.js"></script>
    <script src="Scripts/jquery.alerts.js"></script>
    <link href="Styles/jquery.alerts.css" rel="stylesheet" />
    <script type="text/javascript">
        function AlertBox(strMsg) {
            jAlert(strMsg, '  Ok  ');
        }
    </script>
    <script>
        function openChildWindow(url,width,height) {
            window.open(url, "child", "toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,width=" + width + ",height=" + height + ",top=60,left=100,resize=0");
        }
    </script>
 
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
     <div class="clsDivInContent">   
         
         <div style="padding-left:400px;padding-top:30px">
        <div class="clsDivStudTic" style="width:65%;height:480px;">
            <div class="clsDivPageHeading"> <asp:Label ID="Label9" runat="server" Text="My Tickets"></asp:Label></div>
            <br />
            <span style="padding-left:10px">
            <asp:Button ID="btnCreateTic" runat="server" Text="Create Ticket" CssClass="clsBtns" OnClientClick="javascript:openChildWindow('CreateTicket.aspx',730,295)" />
                </span>
            <br />
            <br />
           <%-- <div align="right" style="padding-right:10px">
                <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox> 
                <asp:DropDownList ID="ddlSearchBy" runat="server">
                    <asp:ListItem>Search By</asp:ListItem>
                     <asp:ListItem>Ticket ID</asp:ListItem>
                     <asp:ListItem>Status</asp:ListItem>
                </asp:DropDownList>
                <asp:Button ID="btnSearch" runat="server" CssClass="clsBtns" Text="Search" OnClick="btnSearch_Click" />
            </div> --%>
            <div style="padding-left:10px;padding-top:10px">
            <div class="clsdivGrid" style="width:99%;height:350px;">
                <asp:UpdatePanel ID="UP_MyTics" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="gvMyTics" runat="server" AutoGenerateColumns="False" DataSourceID="ODS_MyTics" Width="100%" Height="100%"
                             CssClass="Grid"                    
                      AlternatingRowStyle-CssClass="alt"
                      PagerStyle-CssClass="pgr" AllowPaging="True" OnPageIndexChanging="gvMyTics_PageIndexChanging" EmptyDataText="No Recods Found" OnRowDataBound="gvMyTics_RowDataBound" PageSize="20" >
                            <AlternatingRowStyle CssClass="alt" />
                            <Columns>
                                <asp:TemplateField HeaderText="Ticket ID">
                                    <ItemTemplate>
                                       
                                    <a style="color:red" href="javascript:openChildWindow('TicketFlow.aspx?TicId=<%# Eval("Ticket_ID") %>',1000,700)"> <%#Eval("Ticket_ID")%></a>
                                      
                                    </ItemTemplate>
                                    <ItemStyle ForeColor="Red" />
                                </asp:TemplateField>
                                <%--<asp:HyperLinkField DataTextField="Ticket_ID" DataNavigateUrlFields="Ticket_ID"  HeaderText="Ticket ID" DataNavigateUrlFormatString="~/TicketFlow.aspx?TicId={0}"/>--%>
                                <asp:BoundField DataField="Ticket_Title" HeaderText="Title" />
                                <asp:BoundField DataField="Created_dt" HeaderText="Created Date" />
                                <asp:BoundField DataField="strStatus" HeaderText="Status" >
                                <ItemStyle Font-Bold="True" />
                                </asp:BoundField>
                            </Columns>
                            
                            <PagerStyle />
                        </asp:GridView>
                        <asp:Timer ID="Timer1" runat="server" Interval="2000" OnTick="Timer1_Tick"></asp:Timer>
                    </ContentTemplate>
                </asp:UpdatePanel>
                
            </div>
                </div>
        </div>
             </div>
         <asp:ObjectDataSource ID="ODS_MyTics" runat="server" SelectMethod="GetMyTics_Student" TypeName="QueryTicketSystem.Classes.BusinessObjects" OnSelecting="ODS_MyTics_Selecting" ><%--OnFiltering="ODS_MyTics_Filtering"--%>
             <SelectParameters>
                 <asp:Parameter Name="strUserID" Type="String" />
             </SelectParameters>
         </asp:ObjectDataSource>
     
    </div>
</asp:Content>