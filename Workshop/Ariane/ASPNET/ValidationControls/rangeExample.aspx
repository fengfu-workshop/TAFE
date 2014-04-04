<%@ Page Language="C#" AutoEventWireup="true" CodeFile="rangeExample.aspx.cs" Inherits="rangeExample" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <p>
            Enter a number between 1 and 10:
            <asp:TextBox ID="TextBox1" runat="server" Width="260px"></asp:TextBox>
            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TextBox1" CssClass="error" ErrorMessage="Value is out of range!" MaximumValue="10" MinimumValue="1" Type="Integer"></asp:RangeValidator>
        </p>
        <p>
            Postcode: 
            <asp:TextBox ID="tbPostcode" runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tbPostcode" ErrorMessage="Must be 4 digits" ValidationExpression="[0-9]{4}"></asp:RegularExpressionValidator>
        </p>
    
    </div>
    </form>
</body>
</html>
