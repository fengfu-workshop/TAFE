<%@ Page Language="C#" AutoEventWireup="true" CodeFile="checkBoxExample.aspx.cs" Inherits="checkBoxExample" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringNW %>" SelectCommand="SELECT [SupplierID], [CompanyName] FROM [Suppliers]"></asp:SqlDataSource>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
        <asp:CheckBoxList ID="CheckBoxList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="CompanyName" DataValueField="SupplierID">
        </asp:CheckBoxList>
        <br />
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
