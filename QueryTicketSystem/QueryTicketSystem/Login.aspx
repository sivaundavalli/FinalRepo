<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="QueryTicketSystem.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Query Ticketing System</title>
    <link href="Styles/css.css" rel="stylesheet" />
    
   
    
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
        
        
        <%--<img src="Images/qts123.gif" />--%>

        <%--<table style="width:100%;height:100%">
            <tr>
                <td align="left" style="padding-left:40px" >
<img src="Images/qts.PNG" />
                </td>
                <td align="right" style="padding-right:5px" >
                    <img style="width:500px;height:100%;opacity:0.5;" src="Images/tic_sup.png" />
                </td>
            </tr>
        </table>--%>
     
       
        <%--<asp:Label ID="lblTitle" runat="server" Text="Query Ticketing System"></asp:Label>--%> 
       <%-- <table style="border:none;width:500px;height:100%" align="center">
            <tr>
                <td>
                    <asp:Label ID="lblTitle" runat="server" Text="Query Ticketing System"></asp:Label>  
                </td>
                
            </tr>
            <tr>
                <td> 
                      
                </td>
            </tr>
        </table>--%>
       
       
    </div>
    </div>
    <div class="clsDivContent">
        
       
        <div id="DivLogin" class="clsDivTblContent" style="height: 230px;width:450px;">
             <div class="clsDivPageHeading"> <asp:Label ID="Label9" runat="server" Text="Log In"></asp:Label></div>
        <table id="tblLogin" align="center" style="padding-top:30px;" class="clsTable">
            <tr class="clsTr">
                <td class="clsTd">
                    <asp:Label ID="Label1" runat="server" Text="User ID"></asp:Label>
                </td>
                <td class="clsTd">
                    <asp:TextBox ID="txtUsername" runat="server" CssClass="clsTxt"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RFV_Username" runat="server" ErrorMessage="User name is Required" ControlToValidate="txtUsername" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr class="clsTr">
                <td class="clsTd">
                    <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
                </td>
                <td class="clsTd">
                    <asp:TextBox ID="txtPwd" runat="server" TextMode="Password" CssClass="clsTxt"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RFV_Pwd" runat="server" ErrorMessage="Password is Required" ControlToValidate="txtPwd" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td colspan="3">

                </td>
            </tr>
            <tr class="clsTr">
                <td colspan="3">
                    <asp:Button ID="btnLogin" CssClass="clsBtns" runat="server" Text="Login" OnClick="btnLogin_Click"/>
                    <asp:Button ID="btnSignUp" CssClass="clsBtns" runat="server" Text="Sign Up?" OnClick="btnSignUp_Click" CausesValidation="false" />
                </td>
            </tr>
            <tr class="clsTr">
                <td colspan="3" style="text-align:left">
                    <asp:LinkButton ID="lnkForgotPwd" runat="server" Font-Underline="True" ForeColor="#3333FF" CausesValidation="False" OnClick="lnkForgotPwd_Click">Forgot Password?</asp:LinkButton>
                </td>
            </tr>
        </table>
             
       </div>
        <br />
            <div id="DivLogInErrors">
             <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="BulletList" HeaderText="Following are the errors..." ShowSummary="true" ForeColor="#cc0000"/>
     <asp:CustomValidator ID="CV_UserChk" runat="server" Display="None" ForeColor="Red" OnServerValidate="CV_UserChk_ServerValidate"></asp:CustomValidator>    
            </div>
            </div>
        <div class="clsDivFoot">
         <span>Copyright © </span>
        </div>
    </form>
</body>
</html>
