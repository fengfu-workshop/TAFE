<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CustOrders.aspx.cs" Inherits="Exercise_CustOrders" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringNW %>" SelectCommand="SELECT [OrderID], [OrderDate], [CustomerID] FROM [Orders] WHERE ([CustomerID] = @CustomerID)">
            <SelectParameters>
                <asp:QueryStringParameter Name="CustomerID" QueryStringField="ID" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="OrderID" DataSourceID="SqlDataSource1">
            <AlternatingRowStyle CssClass="exEvenRow" />
            <Columns>
                <asp:BoundField DataField="OrderID" HeaderText="OrderID" InsertVisible="False" ReadOnly="True" SortExpression="OrderID" />
                <asp:BoundField DataField="OrderDate" HeaderText="OrderDate" SortExpression="OrderDate" />
                <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" SortExpression="CustomerID" />
                <asp:HyperLinkField DataNavigateUrlFields="orderId" DataNavigateUrlFormatString="~/Exercise/orders.aspx?ID={0}" DataTextField="OrderID" HeaderText="Order Id" />
            </Columns>
            <HeaderStyle CssClass="exHeader" />
        </asp:GridView>
    
    </div>
    </form>
</body>
</html>
