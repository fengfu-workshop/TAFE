<%@ Page Language="C#" AutoEventWireup="true" CodeFile="dropdownListExample.aspx.cs" Inherits="dropdownListExample" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:SqlDataSource ID="sdsCategories" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringNW %>" SelectCommand="SELECT [CategoryID], [CategoryName] FROM [Categories]"></asp:SqlDataSource>
        <br />
        <asp:DropDownList ID="ddCategories" runat="server" AutoPostBack="True" DataSourceID="sdsCategories" DataTextField="CategoryName" DataValueField="CategoryID" OnSelectedIndexChanged="ddCategories_SelectedIndexChanged">
        </asp:DropDownList>
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" Visible="False" />
        <br />
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <br />
        <asp:SqlDataSource ID="sdsProducts" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringNW %>" SelectCommand="SELECT [ProductName], [UnitPrice] FROM [Products] WHERE ([CategoryID] = @CategoryID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddCategories" Name="CategoryID" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="sdsProducts">
            <AlternatingRowStyle BackColor="#CCCCFF" />
            <Columns>
                <asp:BoundField DataField="ProductName" HeaderText="ProductName" SortExpression="ProductName" />
                <asp:BoundField DataField="UnitPrice" HeaderText="UnitPrice" SortExpression="UnitPrice" />
            </Columns>
        </asp:GridView>
    
    </div>
    </form>
</body>
</html>
