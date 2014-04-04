<%@ Page Language="C#" AutoEventWireup="true" CodeFile="bulletedListExample.aspx.cs" Inherits="bulletedListExample" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringNW %>" SelectCommand="SELECT [CompanyName] FROM [Shippers]"></asp:SqlDataSource>
        <br />
        <asp:BulletedList ID="BulletedList1" runat="server" BorderStyle="Solid" BorderWidth="1px" DataSourceID="SqlDataSource1" DataTextField="CompanyName" DataValueField="CompanyName">
        </asp:BulletedList>
    
    </div>
    </form>
</body>
</html>
