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
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Employees] WHERE ([EmployeeID] = @EmployeeID)">
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="EmployeeID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="EmployeeID" DataSourceID="SqlDataSource1" Height="50px" style="margin-right: 35px" Width="221px">
            <AlternatingRowStyle CssClass="alternatingRowStyle" />
            <FieldHeaderStyle CssClass="fieldHeader" />
            <Fields>
                <asp:BoundField DataField="EmployeeID" HeaderText="Employee ID" InsertVisible="False" ReadOnly="True" SortExpression="EmployeeID" />
                <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" />
                <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
                <asp:BoundField DataField="BirthDate" DataFormatString="{0:d}" HeaderText="Birth Date" SortExpression="BirthDate" />
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                <asp:BoundField DataField="TitleOfCourtesy" HeaderText="Title Of Courtesy" SortExpression="TitleOfCourtesy" />
                <asp:BoundField DataField="HireDate" DataFormatString="{0:d}" HeaderText="Hire Date" SortExpression="HireDate" />
                <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                <asp:BoundField DataField="Region" HeaderText="Region" SortExpression="Region" />
                <asp:BoundField DataField="PostalCode" HeaderText="Postal Code" SortExpression="PostalCode" />
                <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country" />
                <asp:BoundField DataField="HomePhone" HeaderText="Phone" SortExpression="HomePhone" />
                <asp:BoundField DataField="Extension" HeaderText="Extension" SortExpression="Extension" />
                <asp:BoundField DataField="Notes" HeaderText="Notes" SortExpression="Notes" />
                <asp:BoundField DataField="ReportsTo" HeaderText="Reports To" SortExpression="ReportsTo" />
                <asp:BoundField DataField="PhotoPath" HeaderText="Photo Path" SortExpression="PhotoPath" />
            </Fields>
            <HeaderStyle CssClass="heading" />
            <HeaderTemplate>
                <h2>Employees</h2>
            </HeaderTemplate>
        </asp:DetailsView>
    
    </div>
    </form>
</body>
</html>
