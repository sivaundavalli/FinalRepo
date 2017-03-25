<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateTicket.aspx.cs" Inherits="QueryTicketSystem.CreateTicket" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Create Ticket</title>
    <link href="Styles/css.css" rel="stylesheet" />
      <script src="Scripts/jquery-1.8.0.min.js"></script>
    <script src="Scripts/jquery.alerts.js"></script>
    <link href="Styles/jquery.alerts.css" rel="stylesheet" />
    <script type="text/javascript">
        function AlertBox(strMsg) {
            jAlert(strMsg, '  Ok  ', function (r) {
                window.close();
            });
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        
    <div class="clsDivStudTic" style="width:700px;height:280px;padding-left:10px">
        <br />
        <table>
            <tr>
                <td class="clsTd" >
                    <asp:Label ID="Label1" runat="server" Text="Ticket Title"></asp:Label>
                </td>
                <td class="clsTd">
                    <asp:TextBox ID="txtTitle" runat="server" CssClass="clsTxt"></asp:TextBox>&nbsp;&nbsp;&nbsp; <asp:RequiredFieldValidator ID="RFV_Title" ControlToValidate="txtTitle" runat="server" ErrorMessage="Ticket Title is Required" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                </td>
                <td>
                    
                </td>
            </tr>
             <tr>
                <td class="clsTd" valign="top">
                    <asp:Label ID="Label2" runat="server" Text="Description"></asp:Label>
                </td>
                <td class="clsTd" valign="top">
                    <asp:TextBox ID="txtDesc" runat="server" TextMode="MultiLine" Height="121px" Width="485px" CssClass="clsMulTxt"></asp:TextBox>
           
                    
                </td>
                 <td valign="top">
                     <asp:RequiredFieldValidator ID="RFV_Desc" ControlToValidate="txtDesc" runat="server" ErrorMessage="Description is Required" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td class="clsTd">
                    <asp:Label ID="Label3" runat="server" Text="Department"></asp:Label>
                </td>
                <td class="clsTd">
                    <asp:DropDownList ID="ddlDept" runat="server" Width="208px" AutoPostBack="True" OnSelectedIndexChanged="ddlDept_SelectedIndexChanged" CssClass="clsddl">
                         <asp:ListItem Selected="True">Select</asp:ListItem>
                          <asp:ListItem>CS(Computer Science)</asp:ListItem>
                          <asp:ListItem>CIS(Computer Information Systems)</asp:ListItem>
                    </asp:DropDownList>
                &nbsp;&nbsp;
                     <asp:RequiredFieldValidator ID="RFV_ddlDept" runat="server" ErrorMessage="Department is Required" ForeColor="Red" ControlToValidate="ddlDept" InitialValue="Select">*</asp:RequiredFieldValidator>
                </td>
                <td>
                     </td>
            </tr>
            <tr>
                <td class="clsTd">
                    <asp:Label ID="Label4" runat="server" Text="Instructor"></asp:Label> 
                </td>
                <td class="clsTd">
                    <asp:DropDownList ID="ddlInst" runat="server" Width="208px" CssClass="clsddl">
                         <asp:ListItem Selected="True">Select</asp:ListItem>
                    </asp:DropDownList>
                &nbsp;&nbsp;
                     <asp:RequiredFieldValidator ID="RFV_ddlInst" runat="server" ErrorMessage="Instructor is Required" ForeColor="Red" ControlToValidate="ddlInst" InitialValue="Select">*</asp:RequiredFieldValidator>
                </td>
                <td>
                    </td>
            </tr>
            <tr>
                <td colspan="3">

                </td>
            </tr>
            <tr>
                <td colspan="3" class="clsTd">
                    <asp:Button ID="btnPost" runat="server" Text="Post" CssClass="clsBtns" OnClick="btnPost_Click"/>
                </td>
            </tr>
        </table>
        <br />
    </div>
    </div>
    </form>
</body>
</html>
