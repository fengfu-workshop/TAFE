<%@ Page Language="C#" AutoEventWireup="true" CodeFile="panelExample.aspx.cs" Inherits="panelExample" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Panel ID="Panel1" runat="server" BackColor="Navy" BorderColor="Purple" BorderStyle="Dotted" ForeColor="Silver" Font-Names="Arial" Height="50px" Width="300px">
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>    
            <br />
            <asp:Literal ID="Literal1" runat="server"></asp:Literal>
            <asp:Literal ID="Literal2" runat="server"></asp:Literal>        
        </asp:Panel>

        <asp:Button ID="Button1" runat="server" Text="Hide/Show" OnClick="Button1_Click" /> 

    </div>
    </form>
</body>
</html>
