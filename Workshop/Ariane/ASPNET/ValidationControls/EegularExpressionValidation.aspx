<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EegularExpressionValidation.aspx.cs" Inherits="EegularExpressionValidation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        Email:
        <asp:TextBox ID="TextBox1" runat="server" Width="313px"></asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Please enter a valid email address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" CssClass="error"></asp:RegularExpressionValidator>
        <br />
        <br />
        User name:
        <asp:TextBox ID="tbUserName" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbUserName" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
        <br />
        Password:
        <asp:TextBox ID="tbPassword" runat="server"></asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="tbPassword" ErrorMessage="The password must between 3 and 20 alphanumerical characters " ValidationExpression="[a-zA-Z0-9]{3,20}" CssClass="error"></asp:RegularExpressionValidator>
    
        <br />
        <br />
        Postcode: <asp:TextBox ID="tbPostcode" runat="server"></asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="tbPostcode" CssClass="error" ErrorMessage="Must be 4 digits" ValidationExpression="[0-9]{4}"></asp:RegularExpressionValidator>
    
        <br />
        <br />
        <br />
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
    
    </div>
    </form>
</body>
</html>
