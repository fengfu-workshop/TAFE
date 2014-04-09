<%@ Page Language="C#" AutoEventWireup="true" CodeFile="testWeather.aspx.cs" Inherits="testWeather" %>

<%@ Register src="Weather.ascx" tagname="Weather" tagprefix="uc1" %>
<%@ Register Src="~/header.ascx" TagPrefix="uc1" TagName="header" %>
<%@ Register Src="~/Footer.ascx" TagPrefix="uc1" TagName="Footer" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <uc1:header runat="server" ID="header" />
        <uc1:Weather ID="Weather1" runat="server" />
        <br />
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" style="height: 22px">
            <asp:ListItem>1</asp:ListItem>
            <asp:ListItem>2</asp:ListItem>
            <asp:ListItem>3</asp:ListItem>
        </asp:DropDownList>
        <uc1:Footer runat="server" ID="Footer" />
    </div>
    </form>
</body>
</html>
