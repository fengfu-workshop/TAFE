<%@ Page Title="Login" Language="C#" MasterPageFile="~/MasterPages/Management.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Management_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="login title_box width300 shadow_box centre_box">
        <h3>Log in to NextStep</h3>
        <asp:Login ID="Login1" runat="server" DestinationPageUrl="~/Management/Management.aspx" OnLoggedIn="Login1_LoggedIn" RenderOuterTable="False">
            <LayoutTemplate>
                <p class="two_cols">
                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                    <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                </p>
                <p class="two_cols">
                    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                    <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                </p>

                <p> <asp:CheckBox ID="RememberMe" runat="server" Text="Remember me next time." /></p>
                <p class="error"> <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal></p>

                <p> <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" ValidationGroup="Login1" /></p>

            </LayoutTemplate>
        </asp:Login>
    </div>
</asp:Content>

