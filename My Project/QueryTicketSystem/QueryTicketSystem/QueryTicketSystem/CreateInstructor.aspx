<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Home.Master" CodeBehind="CreateInstructor.aspx.cs" Inherits="QueryTicketSystem.CreateInstructor" %>

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
     <div class="clsDivInContent">
        <div id="DivInst" class="clsDivTblContent" style="height: 260px;width:750px;">
           <div class="clsDivPageHeading"> <asp:Label ID="Label9" runat="server" Text="Create Instructor"></asp:Label></div>
        <table id="tblSignup" align="center" class="clsTable" style="padding-top:15px">
            <tr class="clsTr">
                <td class="clsTd">
                    <asp:Label ID="Label1" runat="server" Text="Instructor ID"></asp:Label>
                </td>
                <td class="clsTd">
                    <asp:TextBox ID="txtUserID" runat="server" MaxLength="50" TabIndex="1" CssClass="clsTxt"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RFV_UserID" runat="server" ErrorMessage="Instructor ID is Required" ControlToValidate="txtUserID" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                </td>
               <td class="clsTd">
                     <asp:Label ID="Label4" runat="server" Text="First Name"></asp:Label>
                </td>
                  <td class="clsTd">
                      <asp:TextBox ID="txtFirstName" runat="server" TabIndex="6" CssClass="clsTxt"></asp:TextBox>
                </td>
                <td>
                  
                     </td>
            </tr>
          
            <tr class="clsTr">
               <td class="clsTd">
                    <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
                </td>
                <td class="clsTd">
                    <asp:TextBox ID="txtPwd" runat="server" TextMode="Password" MaxLength="10" TabIndex="2" CssClass="clsTxt"></asp:TextBox>
                </td>
                  <td>
  <asp:RequiredFieldValidator ID="RFV_Pwd" runat="server" ErrorMessage="Password is Required" ControlToValidate="txtPwd" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                </td>
                 <td>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                </td>
                 <td class="clsTd">
                     <asp:Label ID="Label3" runat="server" Text="Last Name"></asp:Label>
                </td>
                  <td class="clsTd">
                      <asp:TextBox ID="txtLastName" runat="server" TabIndex="7" CssClass="clsTxt"></asp:TextBox>
                </td>
                  <td>
                </td>
            </tr>
           
            <tr class="clsTr">
                 <td class="clsTd">
                    <asp:Label ID="Label8" runat="server" Text="Confirm Password"></asp:Label>
                </td>
                <td class="clsTd">
                    <asp:TextBox ID="txtConfirmPwd" runat="server" TextMode="Password" TabIndex="3" CssClass="clsTxt"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RFV_ConPwd" runat="server" ErrorMessage="Confirm Password is Required" ControlToValidate="txtConfirmPwd" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                    
                </td>
                 <td>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                </td>
                <td class="clsTd">
                     <asp:Label ID="Label5" runat="server" Text="Phone#"></asp:Label>
                </td>
                  <td class="clsTd">
                      <asp:TextBox ID="txtPhone" runat="server" MaxLength="15" TabIndex="8" CssClass="clsTxt"></asp:TextBox>
                </td>
                  <td>

                </td>
            </tr>
           
             <tr class="clsTr">
                <td class="clsTd">
                     <asp:Label ID="Label6" runat="server" Text="Department"></asp:Label>
                </td>
                  <td class="clsTd">
                      <asp:DropDownList ID="ddlDept" runat="server" TabIndex="4" CssClass="clsddl">
                          <asp:ListItem Selected="True">Select</asp:ListItem>
                          <asp:ListItem>CS(Computer Science)</asp:ListItem>
                          <asp:ListItem>CIS(Computer Information Systems)</asp:ListItem>

                      </asp:DropDownList>
                      <%--<asp:TextBox ID="txtEmail" runat="server" MaxLength="50" TabIndex="4"></asp:TextBox>--%>
                </td>
                  <td>
                      <asp:RequiredFieldValidator ID="RFV_ddlDept" runat="server" ErrorMessage="Department is Required" ForeColor="Red" ControlToValidate="ddlDept" InitialValue="Select">*</asp:RequiredFieldValidator>
                </td>
                  <td>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                </td>
                 <td class="clsTd">
                     <asp:Label ID="Label7" runat="server" Text="Sex"></asp:Label>
                </td>
                  <td class="clsTd">
                      <asp:CheckBox ID="chkMale" runat="server" Text="Male" OnCheckedChanged="chkMale_CheckedChanged" TabIndex="9" />
                      <asp:CheckBox ID="chkFemale" runat="server" Text="Female" OnCheckedChanged="chkFemale_CheckedChanged" TabIndex="10" />
                      <asp:CheckBox ID="chkOther" runat="server" Text="Other" OnCheckedChanged="chkOther_CheckedChanged" TabIndex="11"/>
                </td>
                  <td>

                </td>
                 </tr>
               <tr class="clsTr">
                <td class="clsTd">
                     <asp:Label ID="Label10" runat="server" Text="Email Id"></asp:Label>
                </td>
                  <td class="clsTd">
                      <asp:TextBox ID="txtEmail" runat="server" MaxLength="50" TabIndex="5" CssClass="clsTxt"></asp:TextBox>
                </td>
                  <td>
                      <asp:RequiredFieldValidator ID="RFV_Email" runat="server" ErrorMessage="Email Id is Required" ForeColor="Red" ControlToValidate="txtEmail" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                </td>
                  <td>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                </td>
                 <td class="clsTd">
                    
                </td>
                  <td class="clsTd">
                      
                </td>
                  <td>

                </td>
                 </tr>
            <tr >
                <td colspan="7">

                </td>
            </tr>
            <tr class="clsTr">
                <td colspan="7">
                    <asp:Button ID="btnAdd" CssClass="clsBtns" runat="server" Text="Add" OnClick="btnAdd_Click" TabIndex="12"/>
                    <asp:Button ID="btnReset" CssClass="clsBtns" runat="server" Text="Reset" OnClick="btnReset_Click" CausesValidation="false" TabIndex="13" />
                    <asp:Button ID="btnSearch" CssClass="clsBtns" runat="server" Text="Search" CausesValidation="false" OnClick="btnSearch_Click" />
                </td>
            </tr>
                          
        </table>
            <br />
           <div class="clsdivGrid" style="height:190px;width:750px;">
                       <asp:GridView ID="gvInt" width="100%" Height="100%" runat="server" DataSourceID="ODS_Inst" AutoGenerateColumns="False" 
                           EmptyDataText="No Records Found" OnRowEditing="gvInt_RowEditing" OnRowUpdating="gvInt_RowUpdating" 
                           OnRowCancelingEdit="gvInt_RowCancelingEdit" OnRowDataBound="gvInt_RowDataBound" OnRowDeleting="gvInt_RowDeleting" 
                           AllowPaging="True" CssClass="Grid"                    
                      AlternatingRowStyle-CssClass="alt"
                      PagerStyle-CssClass="pgr" OnPageIndexChanging="gvInt_PageIndexChanging">
<AlternatingRowStyle CssClass="alt"></AlternatingRowStyle>
                           <Columns>
                               <%--<asp:BoundField DataField="User ID" HeaderText="Instructor ID" ReadOnly="True" />--%>
                                 <asp:TemplateField HeaderText = "Instructor ID">
                               <ItemTemplate>
        <asp:Label ID="lblInstID" runat="server" Text='<%# Eval("User ID")%>'></asp:Label>
    </ItemTemplate>
                                     </asp:TemplateField>
                               <asp:BoundField DataField="Name" HeaderText="Name" />
                               <%--<asp:BoundField DataField="Department" HeaderText="Department" />--%>
                               <asp:TemplateField HeaderText = "Department">
    <ItemTemplate>
        <asp:Label ID="lblDept" runat="server" Text='<%# Eval("Department")%>'></asp:Label>
    </ItemTemplate>
    <EditItemTemplate>
            <asp:Label ID="lblDept" runat="server" Text='<%# Eval("Department")%>' Visible = "false"></asp:Label>
    <asp:DropDownList ID = "ddlDept" runat = "server">
        <asp:ListItem>CS(Computer Science)</asp:ListItem>
                          <asp:ListItem>CIS(Computer Information Systems)</asp:ListItem>
    </asp:DropDownList>
    </EditItemTemplate>
    </asp:TemplateField>
                               <asp:BoundField DataField="Phone#" HeaderText="Phone#" />
                               <asp:BoundField DataField="Email" HeaderText="Email" />
                               <asp:CommandField ShowEditButton="True" CausesValidation="false">
                               <ItemStyle ForeColor="Red" />
                               </asp:CommandField>
                               <asp:CommandField ShowCancelButton="False" ShowDeleteButton="True" CausesValidation="false">
                               <ItemStyle ForeColor="Red" />
                               </asp:CommandField>
                           </Columns>
                          
<PagerStyle CssClass="pgr"></PagerStyle>
                          
                       </asp:GridView>
                   </div>
           
            </div>
         <div id="DivCreateInstErrors">
             <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="BulletList" HeaderText="Following are the errors..." ShowSummary="true" ForeColor="#cc0000"/>
             <asp:CustomValidator ID="CV_AddUser" runat="server" Display="None" ForeColor="Red" OnServerValidate="CV_AddUser_ServerValidate"></asp:CustomValidator>
          
                <asp:CompareValidator ID="CV_Pwd" runat="server" Display="None" ErrorMessage="Passowrd and Confirm Password does not match" ControlToCompare="txtPwd" ForeColor="Red" SetFocusOnError="True" ControlToValidate="txtConfirmPwd"></asp:CompareValidator>  
          
                <asp:RegularExpressionValidator ID="REV_Phone" Display="None" runat="server" ErrorMessage="Ivalid Phone#" ForeColor="Red" ControlToValidate="txtPhone" SetFocusOnError="true" ValidationExpression="^[0-9-]*$"></asp:RegularExpressionValidator>
         
                <asp:RegularExpressionValidator ID="REV_Email" Display="None" runat="server" ErrorMessage="Invalid Email ID" ForeColor="Red" ControlToValidate="txtEmail" SetFocusOnError="True" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$"></asp:RegularExpressionValidator>
       </div>
         <asp:ObjectDataSource ID="ODS_Inst" runat="server" SelectMethod="GetInst" TypeName="QueryTicketSystem.Classes.BusinessObjects" 
             InsertMethod="CreateInst" OnInserting="ODS_Inst_Inserting" OnUpdating="ODS_Inst_Updating" UpdateMethod="UpdateInst" 
             DeleteMethod="DeleteInst" OnDeleting="ODS_Inst_Deleting"  OnFiltering="ODS_Inst_Filtering">
             <DeleteParameters>
                 <asp:Parameter Name="strInstID" Type="String" />
             </DeleteParameters>
             <InsertParameters>
                 <asp:Parameter Name="strInstID" Type="String" />
                 <asp:Parameter Name="strPwd" Type="String" />
                 <asp:Parameter Name="strInstName" Type="String" />
                 <asp:Parameter Name="strRole" Type="String" />
                 <asp:Parameter Name="strDept" Type="String" />
                 <asp:Parameter Name="strPhoneNum" Type="String" />
                 <asp:Parameter Name="strEmail" Type="String" />
                 <asp:Parameter Name="strSex" Type="String" />
             </InsertParameters>
             <UpdateParameters>
                 <asp:Parameter Name="strInstID" Type="String" />
                 <asp:Parameter Name="strInstName" Type="String" />
                 <asp:Parameter Name="strDept" Type="String" />
                 <asp:Parameter Name="strPhoneNum" Type="String" />
                 <asp:Parameter Name="strEmail" Type="String" />
             </UpdateParameters>
            <FilterParameters>
                <asp:FormParameter name="User ID" formfield="txtUserID"/>

            </FilterParameters>
         </asp:ObjectDataSource> 
       
    </div>
</asp:Content>