<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPwd.aspx.cs" Inherits="QueryTicketSystem.ForgotPwd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Query Ticketing System</title>
     <link href="Styles/css.css" rel="stylesheet" />
     <script src="Scripts/jquery-1.8.0.min.js"></script>
    <script src="Scripts/jquery.alerts.js"></script>
    <link href="Styles/jquery.alerts.css" rel="stylesheet" />
    <script type="text/javascript">
        function AlertBox(strMsg) {
            jAlert(strMsg, '  Ok  ');
        }
        function ReAlertBox() {
            jAlert('Password has been sent to your Email', '  Ok  ', function (r) {
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
        
        
       
       
    </div>
    </div>
    <div class="clsDivContent">
        
       
        <div id="DivLogin" class="clsDivTblContent" style="height: 210px;width:450px;">
             <div class="clsDivPageHeading"> <asp:Label ID="Label9" runat="server" Text="Password Recovery"></asp:Label></div>
        <table id="tblLogin" align="center" style="padding-top:30px;" class="clsTable">
            <tr class="clsTr">
                <td class="clsTd">
                    <asp:Label ID="Label1" runat="server" Text="User ID"></asp:Label>
                </td>
                <td class="clsTd">
                    <asp:TextBox ID="txtUsername" runat="server" CssClass="clsTxt"></asp:TextBox>
                </td>
               
            </tr>
            <tr>
                <td colspan="2">
                     <asp:Label ID="Label3" runat="server" Text="-OR-"></asp:Label>
                </td>
            </tr>
            <tr class="clsTr">
                <td class="clsTd">
                    <asp:Label ID="Label2" runat="server" Text="Email ID"></asp:Label>
                </td>
                <td class="clsTd">
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="clsTxt"></asp:TextBox>
                </td>
               
            </tr>
            <tr>
                <td colspan="2">

                </td>
            </tr>
            <tr class="clsTr">
                <td colspan="2">
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="clsBtns" OnClick="btnSubmit_Click"/>
                </td>
            </tr>
            
        </table>
             
       </div>
       
            </div>
        <div class="clsDivFoot">
         <span>Copyright © </span>
        </div>
    </form>
</body>
</html>
