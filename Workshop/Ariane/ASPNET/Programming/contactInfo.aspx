<%@ Page Language="C#" AutoEventWireup="true" CodeFile="contactInfo.aspx.cs" Inherits="contactInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        How would you like to contact ?<asp:DropDownList ID="ddlContact" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlContact_SelectedIndexChanged">
            <asp:ListItem>Fax</asp:ListItem>
            <asp:ListItem>Email</asp:ListItem>
            <asp:ListItem>Phone</asp:ListItem>
            <asp:ListItem>Other</asp:ListItem>
        </asp:DropDownList>
        <br />
        <asp:ListBox ID="lbContact" runat="server" AutoPostBack="True" OnSelectedIndexChanged="lbContact_SelectedIndexChanged" SelectionMode="Multiple">
            <asp:ListItem>FAx</asp:ListItem>
            <asp:ListItem>pHone</asp:ListItem>
            <asp:ListItem>EMAIL</asp:ListItem>
            <asp:ListItem>Others</asp:ListItem>
        </asp:ListBox>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Submit" />
        <br />
        <br />
        <asp:Label ID="lblContact" runat="server"></asp:Label>
        <br />
        <br />
        <asp:Label ID="lblMultiContact" runat="server" Text="Label"></asp:Label>
    
    </div>
    </form>
</body>
</html>
