<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LabelsExample.aspx.cs" Inherits="LabelsExample" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="message1" runat="server"></asp:Label>
    
    </div>
        <asp:Label ID="message2" runat="server"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Text="Which course are you studing ?"></asp:Label>
        <br />
        <asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem>Sydney</asp:ListItem>
            <asp:ListItem>Brisabn</asp:ListItem>
            <asp:ListItem>Melbourne</asp:ListItem>
        </asp:DropDownList>
    </form>
</body>
</html>
