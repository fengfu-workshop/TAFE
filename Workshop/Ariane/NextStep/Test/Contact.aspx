<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Test_Contact" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            height: 22px;
        }
    </style>
    <link href="../StyleSheets/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="auto-style1">
            <tr>
                <td>First Name:</td>
                <td>
                    <asp:TextBox ID="tbFirstName" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbFirstName" CssClass="error_message" ErrorMessage="Please enter your first name">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Last Name:</td>
                <td class="auto-style2">
                    <asp:TextBox ID="tbLastName" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style2">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbLastName" CssClass="error_message" ErrorMessage="Please enter your last name">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Contact Number:</td>
                <td>
                    <asp:TextBox ID="tbContactNumber" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tbContactNumber" CssClass="error_message" ErrorMessage="Please enter a valid Australia phone number" ValidationExpression="^\({0,1}((0|\+61)(2|4|3|7|8)){0,1}\){0,1}(\ |-){0,1}[0-9]{2}(\ |-){0,1}[0-9]{2}(\ |-){0,1}[0-9]{1}(\ |-){0,1}[0-9]{3}$">*</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>Email Address:</td>
                <td>
                    <asp:TextBox ID="tbEmailAddress" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="tbEmailAddress" ErrorMessage="Please enter a valid email address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                 </td>
            </tr>
            <tr>
                <td class="auto-style2">Question:</td>
                <td class="auto-style2">
                    <asp:TextBox ID="tbQuestion" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style2"></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tbQuestion" CssClass="error_message" ErrorMessage="Please enter your question">*</asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>
    
    </div>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="error_message" ShowMessageBox="True" />
    </form>
</body>
</html>
