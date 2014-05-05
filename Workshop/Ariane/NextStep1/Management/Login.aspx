<%@ Page Title="Login" Language="C#" MasterPageFile="~/MasterPages/Management.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Management_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="login title_box width300 shadow_box centre_box">
        <h3>Log in to NextStep</h3>
        <asp:Login ID="Login1" runat="server" DestinationPageUrl="~/Management/Management.aspx" OnLoggedIn="Login1_LoggedIn"></asp:Login>
    </div>
</asp:Content>

