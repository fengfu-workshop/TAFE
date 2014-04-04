<%@ Page Language="C#" AutoEventWireup="true" CodeFile="summaryExample.aspx.cs" Inherits="summaryExample" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        Postcode:
        <asp:TextBox ID="tbPostcode" runat="server"></asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tbPostcode" Display="Dynamic" ErrorMessage="Must be 4 digits" ValidationExpression="[0-9]{4}"></asp:RegularExpressionValidator>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
    
    </div>
    </form>
</body>
</html>
