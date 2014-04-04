<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Suppliers.aspx.cs" Inherits="Suppliers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NW_ConnectionString %>" SelectCommand="SELECT * FROM [Suppliers]"></asp:SqlDataSource>
        <br />
        <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="SupplierID" DataSourceID="SqlDataSource1" Height="50px" Width="336px">
            <AlternatingRowStyle CssClass="AlternateRowStyle" />
            <Fields>
                <asp:BoundField DataField="SupplierID" HeaderText="Supplier ID" InsertVisible="False" ReadOnly="True" SortExpression="SupplierID" />
                <asp:BoundField DataField="CompanyName" HeaderText="Company Name" SortExpression="CompanyName" />
                <asp:BoundField DataField="ContactName" HeaderText="Contact Name" SortExpression="ContactName" />
                <asp:BoundField DataField="ContactTitle" HeaderText="Contact Title" SortExpression="ContactTitle" />
                <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                <asp:BoundField DataField="Region" HeaderText="Region" SortExpression="Region" />
                <asp:BoundField DataField="PostalCode" HeaderText="Postal Code" SortExpression="PostalCode" />
                <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country" />
                <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                <asp:BoundField DataField="Fax" HeaderText="Fax" SortExpression="Fax" />
                <asp:BoundField DataField="HomePage" HeaderText="Home Page" SortExpression="HomePage" />
            </Fields>
            <HeaderStyle CssClass="headerStyle" />
            <HeaderTemplate>
                Suppliers
            </HeaderTemplate>
            <PagerSettings FirstPageText="First" LastPageText="Last" Mode="NumericFirstLast" />
            <RowStyle CssClass="RowStyle" />
        </asp:DetailsView>
    
    </div>
    </form>
</body>
</html>
