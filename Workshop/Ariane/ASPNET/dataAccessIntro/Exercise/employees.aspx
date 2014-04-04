<%@ Page Language="C#" AutoEventWireup="true" CodeFile="employees.aspx.cs" Inherits="Exercise_employees" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="EmployeeID" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display.">
            <AlternatingRowStyle CssClass="exEvenRow" />
            <Columns>
                <asp:BoundField DataField="EmployeeID" HeaderText="Employee ID" InsertVisible="False" ReadOnly="True" SortExpression="EmployeeID" />
                <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" />
                <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            </Columns>
            <HeaderStyle CssClass="exHeader" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringNW %>" SelectCommand="SELECT [EmployeeID], [LastName], [FirstName], [Title] FROM [Employees]"></asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
