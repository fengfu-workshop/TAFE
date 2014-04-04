<%@ Page Language="C#" AutoEventWireup="true" CodeFile="dataPagerExample.aspx.cs" Inherits="dataPagerExample" %>

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
            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                <LayoutTemplate>
                    <asp:PlaceHolder ID="ItemPlaceHolder" runat="server"></asp:PlaceHolder>
                    <hr />
                    <asp:DataPager ID="DataPager1" runat="server">
                        <Fields>
                            <asp:NumericPagerField />
                        </Fields>
                    </asp:DataPager>
                </LayoutTemplate>

                <ItemTemplate>
                    <div>
                        <%# Eval("ProductName") %>: 
                        <%# Eval("UnitPrice", "{0:C}") %>
                    </div>
                </ItemTemplate>
            </asp:ListView>

        </div>
    </form>
</body>
</html>
