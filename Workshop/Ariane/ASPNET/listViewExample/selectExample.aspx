<%@ Page Language="C#" AutoEventWireup="true" CodeFile="selectExample.aspx.cs" Inherits="selectExample" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [CategoryID], [CategoryName] FROM [Categories]"></asp:SqlDataSource>
            <br />
            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="CategoryID">
                <LayoutTemplate>
                    <div id="categoryList">
                        <asp:PlaceHolder ID="ItemPlaceHolder" runat="server"></asp:PlaceHolder>
                    </div>
                </LayoutTemplate>

                <ItemTemplate>
                    <div>
                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Select"><%# Eval("categoryName") %></asp:LinkButton>
                    </div>
                </ItemTemplate>

                <SelectedItemTemplate>
                    <div id="selected">
                        <%# Eval("categoryName") %>
                    </div>
                </SelectedItemTemplate>
            </asp:ListView>

        </div>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ProductName], [UnitPrice] FROM [Products] WHERE ([CategoryID] = @CategoryID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ListView1" Name="CategoryID" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource2">
            <LayoutTemplate>
                <div id="productList">
                    <asp:PlaceHolder ID="ItemPlaceHolder" runat="server"></asp:PlaceHolder>
                </div>
            </LayoutTemplate>
            <ItemTemplate>
                <div>
                    <%# Eval("ProductName") %>: 
                    <%# Eval("UnitPrice", "{0:C}") %>
                </div>
            </ItemTemplate>
        </asp:ListView>
    </form>
</body>
</html>
