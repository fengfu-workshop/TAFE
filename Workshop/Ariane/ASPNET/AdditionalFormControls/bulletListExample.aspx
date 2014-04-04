<%@ Page Language="C#" AutoEventWireup="true" CodeFile="bulletListExample.aspx.cs" Inherits="bulletListExample" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:BulletedList ID="BulletedList1" runat="server" BulletStyle="Numbered" DisplayMode="HyperLink">
            <asp:ListItem Value="http://google.com">Item1</asp:ListItem>
            <asp:ListItem Value="WizardExample.aspx">Item2</asp:ListItem>
            <asp:ListItem>Item3</asp:ListItem>
            <asp:ListItem>Item4</asp:ListItem>
        </asp:BulletedList>
    
    </div>
    </form>
</body>
</html>
