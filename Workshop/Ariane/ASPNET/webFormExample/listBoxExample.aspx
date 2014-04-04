<%@ Page Language="C#" AutoEventWireup="true" CodeFile="listBoxExample.aspx.cs" Inherits="listBoxExample" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:ListBox ID="ListBox1" runat="server" SelectionMode="Multiple">
            <asp:ListItem>Website Development</asp:ListItem>
            <asp:ListItem>19007</asp:ListItem>
            <asp:ListItem>19006</asp:ListItem>
            <asp:ListItem>19002</asp:ListItem>
        </asp:ListBox>
    
    </div>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
        <br />
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    </form>
</body>
</html>
