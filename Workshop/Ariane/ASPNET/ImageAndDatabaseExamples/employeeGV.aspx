<%@ Page Language="C#" AutoEventWireup="true" CodeFile="employeeGV.aspx.cs" Inherits="employeeGV" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [EmployeeID], [LastName], [FirstName], [TitleOfCourtesy], [BirthDate], [PhotoPath] FROM [Employees]"></asp:SqlDataSource>
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="EmployeeID" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" InsertVisible="False" ReadOnly="True" SortExpression="EmployeeID" />
                <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                <asp:BoundField DataField="TitleOfCourtesy" HeaderText="TitleOfCourtesy" SortExpression="TitleOfCourtesy" />
                <asp:BoundField DataField="BirthDate" HeaderText="BirthDate" SortExpression="BirthDate" />
                <asp:ImageField DataAlternateTextField="PhotoPath" DataAlternateTextFormatString="Image not found" DataImageUrlField="PhotoPath" DataImageUrlFormatString="~/images/{0}" HeaderText="Photo" NullImageUrl="~/images/unavailable.gif">
                </asp:ImageField>
            </Columns>
        </asp:GridView>
    
    </div>
    </form>
</body>
</html>
