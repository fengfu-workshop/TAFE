<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ordersSort.aspx.cs" Inherits="Exercise_ordersSort" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringNW %>" SelectCommand="SELECT [OrderID], [CustomerID], [OrderDate], [RequiredDate] FROM [Orders]"></asp:SqlDataSource>
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="OrderID" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="OrderID" HeaderText="Order ID" InsertVisible="False" ReadOnly="True" SortExpression="OrderID" />
                <asp:BoundField DataField="CustomerID" HeaderText="Customer ID" SortExpression="CustomerID" />
                <asp:BoundField DataField="OrderDate" HeaderText="Order Date" SortExpression="OrderDate" />
                <asp:BoundField DataField="RequiredDate" HeaderText="Required Date" SortExpression="RequiredDate" />
            </Columns>
        </asp:GridView>
        <br />
    
    </div>
    </form>
</body>
</html>
