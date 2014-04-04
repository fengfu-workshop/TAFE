<%@ Page Language="C#" AutoEventWireup="true" CodeFile="buttonExample.aspx.cs" Inherits="buttonExample" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click1" />
        <br />
        <br />
        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" BorderStyle="None">LinkButton</asp:LinkButton>
        <br />
        <br />
        <asp:HyperLink ID="HyperLink1" runat="server" style="float:left;" ImageUrl="~/Images/blue.png" NavigateUrl="~/WizardExample.aspx">Go to a page</asp:HyperLink>
        <br />
        <br />
        <asp:ImageButton ID="ImageButton1" runat="server" style="float:left; margin-left:100px;" ImageUrl="~/Images/TAFEMap400.gif" OnClick="ImageButton1_Click" />
        <br />
        <br />
        <div style="clear:both; margin:10px;"></div>
        <asp:Label ID="Label1" style="padding:10px;" runat="server" Text="Label"></asp:Label>
        <br />
    
    </div>
    </form>
</body>
</html>
