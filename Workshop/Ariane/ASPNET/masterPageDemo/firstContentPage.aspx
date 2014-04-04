<%@ Page Title="First Content" Language="C#" MasterPageFile="~/ArtSupplies.master" AutoEventWireup="true" CodeFile="firstContentPage.aspx.cs" Inherits="firstContentPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainContent" Runat="Server">
    <h1>Welcome to art supplies</h1>
    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed rhoncus elit lectus, ullamcorper aliquet nisi ultrices at. Donec sed enim eu metus ultricies egestas. Interdum et malesuada fames ac ante ipsum primis in faucibus. Aliquam elementum sed leo at fermentum. Suspendisse sapien libero, ultrices vitae ante porttitor, porta fringilla est. Aliquam ut dui adipiscing, congue nibh id, porttitor justo. Proin accumsan ante et metus malesuada, non vehicula nibh malesuada. Fusce malesuada, diam id dignissim iaculis, sapien elit faucibus est, ac malesuada mi tellus nec nisi. Donec et placerat sapien. Interdum et malesuada fames ac ante ipsum primis in faucibus. Proin eu neque at felis mattis congue.</p>
    <asp:Label ID="lblMessage" runat="server" Text="Label"></asp:Label>
<br />
    <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
    <br />
</asp:Content>

