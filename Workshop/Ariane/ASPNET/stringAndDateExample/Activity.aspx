<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Activity.aspx.cs" Inherits="Activity" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
        <br />
        <br />
        Email:
        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
        <asp:Button ID="btnCheckEmail" runat="server" OnClick="btnCheckEmail_Click" Text="Check Mail" />
        <asp:Label ID="lblCheckResult" runat="server" Text="Label"></asp:Label>
        <br />
        <br />
        <asp:TextBox ID="txtSubstring" runat="server"></asp:TextBox>
        <asp:Button ID="btnSubstring" runat="server" OnClick="btnSubstring_Click" Text="First 5 characters" />
        <asp:Label ID="lblSubstring" runat="server" Text="Label"></asp:Label>
    
    </div>
    </form>
</body>
</html>
