<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Login.ascx.cs" Inherits="Login" %>
<asp:Label ID="lblUserName" runat="server" AssociatedControlID="txtUserName" Text="User name"></asp:Label>
:
<asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
<p>
    <asp:Label ID="lblPassword" runat="server" AssociatedControlID="txtPassword" Text="Password: "></asp:Label>
    <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
</p>
<p>
    <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="Login" />
</p>
<p>
    <asp:Label ID="lblMessage" runat="server"></asp:Label>
</p>

