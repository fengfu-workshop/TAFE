<%@ Page Language="C#" AutoEventWireup="true" CodeFile="searchResults.aspx.cs" Inherits="searchResults" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ProductName], [UnitPrice] FROM [Products] WHERE ([ProductName] LIKE '%' + @ProductName + '%')">
                <SelectParameters>
                    <asp:QueryStringParameter Name="ProductName" QueryStringField="search" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            Your search for
        <asp:Label ID="lblSearch" runat="server"></asp:Label>
            &nbsp;matches the following products:<br />
            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                <LayoutTemplate>
                    <ul>
                        <asp:PlaceHolder ID="itemPlaceHolder" runat="server"></asp:PlaceHolder>
                    </ul>
                </LayoutTemplate>
                <ItemTemplate>
                    <li>
                        <asp:Label ID="lblProductName" runat="server" Text='<%# Eval("ProductName") %>'></asp:Label>
                        Price: <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("UnitPrice", "{0:C}") %>'></asp:Label>
                    </li>

                </ItemTemplate>
            </asp:ListView>

        </div>
    </form>
</body>
</html>
