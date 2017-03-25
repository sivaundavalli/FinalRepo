<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentSignUp.aspx.cs" Inherits="QueryTicketSystem.StudentSignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <title>Query Ticketing System</title>
    <link href="Styles/css.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.8.0.min.js"></script>
    <script src="Scripts/jquery.alerts.js"></script>
    <link href="Styles/jquery.alerts.css" rel="stylesheet" />
    <script type="text/javascript">
      
        function AlertBox() {
            jAlert('Sign up done Successfully!', '  Ok  ', function (r) {
                var strUrl = window.location.protocol + "//" + window.location.hostname + ":" + window.location.port + "/Login.aspx";
                window.location = strUrl;
            });
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="clsDivHead" >    
    <div class="clsDivTitle">
         <table>
            <tr>
                <td>
<img src="Images/Logo.PNG" />
                </td>
                <td>
<asp:Label runat="server" ID="lblTitle" CssClass="clsTitle">Query Ticketing System</asp:Label>
                </td>
            </tr>
        </table>
       <%-- <table style="border:none;width:500px;height:100%" align="center">
            <tr>
                <td>
                    <asp:Label ID="lblTitle" runat="server" Text="Query Ticketing System"></asp:Label>  
                </td>
                
            </tr>
            <tr>
                <td> 
                      <img style="width:500px;height:100px;opacity:0.7" src="Images/tic_sup.png" />
                </td>
            </tr>
        </table>--%>
       
       
    </div>
    </div>
    <div class="clsDivContent">
        <div id="DivSignUp" class="clsDivTblContent" style="height: 260px;width:680px;">
           <div class="clsDivPageHeading"> <asp:Label ID="Label9" runat="server" Text="Sign Up"></asp:Label></div>
        <table id="tblSignup" align="center" class="clsTable" style="padding-top:30px">
            <tr class="clsTr">
                <td class="clsTd">
                    <asp:Label ID="Label1" runat="server" Text="User ID"></asp:Label>
                </td>
                <td class="clsTd">
                    <asp:TextBox ID="txtUserID" runat="server" MaxLength="50" TabIndex="1" CssClass="clsTxt"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RFV_UserID" runat="server" ErrorMessage="User ID is Required" ControlToValidate="txtUserID" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                </td>
               <td class="clsTd">
                     <asp:Label ID="Label4" runat="server" Text="First Name"></asp:Label>
                </td>
                  <td class="clsTd">
                      <asp:TextBox ID="txtFirstName" runat="server" TabIndex="5" CssClass="clsTxt"></asp:TextBox>
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
                      <asp:TextBox ID="txtLastName" runat="server" TabIndex="6" CssClass="clsTxt"></asp:TextBox>
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
                      <asp:TextBox ID="txtPhone" runat="server" MaxLength="15" TabIndex="7" CssClass="clsTxt"></asp:TextBox>
                </td>
                  <td>

                </td>
            </tr>
           
             <tr class="clsTr">
                <td class="clsTd">
                     <asp:Label ID="Label6" runat="server" Text="Email Id"></asp:Label>
                </td>
                  <td class="clsTd">
                      <asp:TextBox ID="txtEmail" runat="server" MaxLength="50" TabIndex="4" CssClass="clsTxt"></asp:TextBox>
                </td>
                  <td>
<asp:RequiredFieldValidator ID="RFV_Email" runat="server" ErrorMessage="Email Id is Required" ForeColor="Red" ControlToValidate="txtEmail" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                </td>
                  <td>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                </td>
                 <td class="clsTd">
                     <asp:Label ID="Label7" runat="server" Text="Sex"></asp:Label>
                </td>
                  <td class="clsTd">
                      <asp:CheckBox ID="chkMale" runat="server" Text="Male" OnCheckedChanged="chkMale_CheckedChanged" TabIndex="8" />
                      <asp:CheckBox ID="chkFemale" runat="server" Text="Female" OnCheckedChanged="chkFemale_CheckedChanged" TabIndex="9" />
                      <asp:CheckBox ID="chkOther" runat="server" Text="Other" OnCheckedChanged="chkOther_CheckedChanged" TabIndex="10"/>
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
                    <asp:Button ID="btnAdd" CssClass="clsBtns" runat="server" Text="Add" OnClick="btnAdd_Click" TabIndex="11"/>
                    <asp:Button ID="btnReset" CssClass="clsBtns" runat="server" Text="Reset" OnClick="btnReset_Click" CausesValidation="false" TabIndex="12" />
                    <asp:Button ID="btnCacel" CssClass="clsBtns" runat="server" Text="Cancel" OnClick="btnCacel_Click" CausesValidation="false" TabIndex="13" />
                </td>
            </tr>
            
        </table>
           
           
            </div>
         <div id="DivSignUpErrors">
             <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="BulletList" HeaderText="Following are the errors..." ShowSummary="true" ForeColor="#cc0000"/>
             <asp:CustomValidator ID="CV_AddUser" runat="server" Display="None" ForeColor="Red" OnServerValidate="CV_AddUser_ServerValidate"></asp:CustomValidator>
          
                <asp:CompareValidator ID="CV_Pwd" runat="server" Display="None" ErrorMessage="Passowrd and Confirm Password does not match" ControlToCompare="txtPwd" ForeColor="Red" SetFocusOnError="True" ControlToValidate="txtConfirmPwd"></asp:CompareValidator>  
          
                <asp:RegularExpressionValidator ID="REV_Phone" Display="None" runat="server" ErrorMessage="Ivalid Phone#" ForeColor="Red" ControlToValidate="txtPhone" SetFocusOnError="true" ValidationExpression="^[0-9-]*$"></asp:RegularExpressionValidator>
         
                <asp:RegularExpressionValidator ID="REV_Email" Display="None" runat="server" ErrorMessage="Invalid Email ID" ForeColor="Red" ControlToValidate="txtEmail" SetFocusOnError="True" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$"></asp:RegularExpressionValidator>
       </div>
    </div>
        <div class="clsDivFoot">
              <span>Copyright © </span>
        </div>
      
    </form>
</body>
</html>
