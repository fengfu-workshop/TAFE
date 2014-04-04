<%@ Page Language="C#" AutoEventWireup="true" CodeFile="validationGroup.aspx.cs" Inherits="validationGroup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <br />
        First Name:
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" CssClass="error" ErrorMessage="Enter your first name" ValidationGroup="Group1"></asp:RequiredFieldValidator>
        <br />
        <br />Last Name:
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" CssClass="error" ErrorMessage="Enter your last name" ValidationGroup="Group1"></asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" ValidationGroup="Group1" />
        <br />
        <br />
        <br />
        <br />
        First Name: 
        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" CssClass="error" ErrorMessage="Enter your first name" ValidationGroup="Group2">*</asp:RequiredFieldValidator>
        <br />
        <br />
      Last Name:
        <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4" CssClass="error" ErrorMessage="Enter your last name" ValidationGroup="Group2"></asp:RequiredFieldValidator>
        <br />
        <br />
        <br />
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Button" ValidationGroup="Group2" />
        <br />
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="Group1" />
    
    </div>
    </form>
</body>
</html>
