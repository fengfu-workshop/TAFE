<%@ Page Language="C#" AutoEventWireup="true" CodeFile="groupExample.aspx.cs" Inherits="groupExample" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ProductName], [UnitPrice] FROM [Products]"></asp:SqlDataSource>
        <br />
        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" GroupItemCount="4">
            <LayoutTemplate>
                <asp:PlaceHolder ID="GroupPlaceHolder" runat="server"></asp:PlaceHolder>
            </LayoutTemplate>

            <GroupTemplate>
                <div>
                    <asp:PlaceHolder ID="ItemPlaceHolder" runat="server"></asp:PlaceHolder>
                </div>
            </GroupTemplate>

            <GroupSeparatorTemplate>
                <hr />
            </GroupSeparatorTemplate>

            <ItemTemplate>
                <span>
                    <%# Eval("ProductName") %>:
                    <%# Eval("UnitPrice", "{0:c}") %>
                </span>
            </ItemTemplate>

            <ItemSeparatorTemplate>
                ,
            </ItemSeparatorTemplate>
        </asp:ListView>
    
    </div>
    </form>
</body>
</html>
