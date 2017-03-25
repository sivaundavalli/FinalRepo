<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Home.Master" CodeBehind="AdminHome.aspx.cs" Inherits="QueryTicketSystem.AdminHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="User_ContentPlaceHolder" runat="server">
     <script>
         function openChildWindow(url, width, height) {
             window.open(url, "child", "toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,width=" + width + ",height=" + height + ",top=60,left=100,resize=0");
         }
    </script>
 
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
     <div class="clsDivInContent">   
         
         <div style="padding-left:400px;padding-top:30px">
        <div class="clsDivStudTic" style="width:65%;height:480px;">
            <div class="clsDivPageHeading"> <asp:Label ID="Label9" runat="server" Text="All Tickets"></asp:Label></div>
            
           <%-- <span style="padding-left:10px">
            <asp:Button ID="btnCreateTic" runat="server" Text="Create Ticket" CssClass="clsBtns" OnClientClick="javascript:openChildWindow('CreateTicket.aspx',730,280)" />
                </span>
            <br />--%>
           
           <%-- <div align="left" style="padding-right:10px">
                <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox> 
                <asp:DropDownList ID="ddlSearchBy" runat="server">
                    <asp:ListItem>Search By</asp:ListItem>
                     <asp:ListItem>Ticket ID</asp:ListItem>
                     <asp:ListItem>Status</asp:ListItem>
                </asp:DropDownList>
                <asp:Button ID="btnSearch" runat="server" CssClass="clsBtns" Text="Search" OnClick="btnSearch_Click" />
            </div> --%>
            <div style="padding-left:10px;padding-top:10px">
            <div class="clsdivGrid" style="width:99%;height:420px;">
                <asp:UpdatePanel ID="UP_MyTics" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="gvTics" runat="server" AutoGenerateColumns="False" Width="100%" Height="100%" EmptyDataText="No Records Found" 
                            DataSourceID="ODS_AllTics" CssClass="Grid"                    
                      AlternatingRowStyle-CssClass="alt"
                      PagerStyle-CssClass="pgr" AllowPaging="True" PageSize="20" OnRowDataBound="gvTics_RowDataBound">
                            <AlternatingRowStyle CssClass="alt" />
                            <Columns>
                                <asp:TemplateField HeaderText="Ticket ID">
                                    <ItemTemplate> 
                                    <a style="color:red;" href="javascript:openChildWindow('TicketFlow.aspx?TicId=<%# Eval("Ticket_ID") %>&AllTics=Yes',1000,700)"> <%#Eval("Ticket_ID")%></a>
                                    </ItemTemplate>
                                </asp:TemplateField>
                               
                                <asp:BoundField DataField="Ticket_Title" HeaderText="Title" />
                                <asp:BoundField DataField="Created_dt" HeaderText="Created Date" />
                                <asp:BoundField DataField="strStatus" HeaderText="Status" >
                                <ItemStyle Font-Bold="True" />
                                </asp:BoundField>
                            </Columns>
                            
                            <PagerStyle CssClass="pgr" />
                            
                        </asp:GridView>
                        <asp:Timer ID="Timer1" runat="server" Interval="5000" OnTick="Timer1_Tick"></asp:Timer>
                    </ContentTemplate>
                </asp:UpdatePanel>
                
            </div>
                </div>
        </div>
             </div>
        
         <asp:ObjectDataSource ID="ODS_AllTics" runat="server" SelectMethod="GetAllTickets" TypeName="QueryTicketSystem.Classes.BusinessObjects" OnSelecting="ODS_AllTics_Selecting">
             <SelectParameters>
                 <asp:Parameter Name="strRole" Type="String" />
                 <asp:Parameter Name="strCurUser" Type="String" />
             </SelectParameters>
         </asp:ObjectDataSource>
    </div>

</asp:Content>