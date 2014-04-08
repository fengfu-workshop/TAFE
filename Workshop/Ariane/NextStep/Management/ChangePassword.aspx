<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Management.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="Management_ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="change_password title_box width400 shadow_box centre_box">
        <h3>Change Your Password</h3>
        <asp:ChangePassword ID="ChangePassword1" runat="server" CancelDestinationPageUrl="~/Management/Management.aspx" ContinueDestinationPageUrl="~/Management/Management.aspx" ChangePasswordTitleText=""></asp:ChangePassword>
    </div>
</asp:Content>

