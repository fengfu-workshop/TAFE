<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="ContactUs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <h1>Contact Us</h1>

        <br />
        <asp:Label ID="lblName" runat="server" Text="Name:" AssociatedControlID="txtName"></asp:Label><asp:TextBox ID="txtName" runat="server"></asp:TextBox>

        <br />
        <br />
        <asp:Label ID="lblEmail" runat="server" AssociatedControlID="txtEmail" Text="Email"></asp:Label>
        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="lblPhone" runat="server" AssociatedControlID="txtPhone" Text="Phone:"></asp:Label>
        <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="lblComment" runat="server" AssociatedControlID="txtComment" Text="Comment:"></asp:Label>
        <asp:TextBox ID="txtComment" runat="server" TextMode="MultiLine"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="btnSend" runat="server" OnClick="btnSend_Click" Text="Send" />

    </div>
    </form>
</body>
</html>
