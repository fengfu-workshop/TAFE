<%@ Page Language="C#" AutoEventWireup="true" CodeFile="gettingValue.aspx.cs" Inherits="gettingValue" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringNW %>" SelectCommand="SELECT [OrderID], [CustomerID], [OrderDate], [EmployeeID] FROM [Orders] WHERE ([EmployeeID] = @EmployeeID)">
            <SelectParameters>
                <asp:QueryStringParameter Name="EmployeeID" QueryStringField="id" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="OrderID" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="OrderID" HeaderText="OrderID" InsertVisible="False" ReadOnly="True" SortExpression="OrderID" />
                <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" SortExpression="CustomerID" />
                <asp:BoundField DataField="OrderDate" DataFormatString="{0:dddd dd MMMM yyyy}" HeaderText="OrderDate" SortExpression="OrderDate" />
                <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" SortExpression="EmployeeID" />
            </Columns>
        </asp:GridView>
    
    </div>
    </form>
</body>
</html>
