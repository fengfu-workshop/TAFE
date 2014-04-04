<%@ Page Language="C#" AutoEventWireup="true" CodeFile="radioButtonExample.aspx.cs" Inherits="radioButtonExample" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatLayout="Flow">
            <asp:ListItem>19002</asp:ListItem>
            <asp:ListItem>19007</asp:ListItem>
            <asp:ListItem>19019</asp:ListItem>
            <asp:ListItem>19006</asp:ListItem>
        </asp:RadioButtonList>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
