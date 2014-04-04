<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringNW %>" SelectCommand="SELECT [ProductName], [UnitPrice] FROM [Products]"></asp:SqlDataSource>
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
            <AlternatingRowStyle CssClass="alternateStyle" />
            <Columns>
                <asp:BoundField DataField="UnitPrice" HeaderText="Price" SortExpression="UnitPrice" DataFormatString="{0:c}" />
                <asp:BoundField DataField="ProductName" HeaderText="Product Name" SortExpression="ProductName" />
            </Columns>
            <HeaderStyle CssClass="headerStyle" />
            <RowStyle CssClass="rowStyle" />
        </asp:GridView>
    
    </div>
    </form>
</body>
</html>
