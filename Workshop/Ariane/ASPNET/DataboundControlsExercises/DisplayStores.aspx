<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DisplayStores.aspx.cs" Inherits="DisplayStores" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PubConnectionString %>"
                SelectCommand="SELECT [stor_name], [stor_address], [city], [state], [zip] FROM [stores]"></asp:SqlDataSource>
            <br />
            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                <LayoutTemplate>
                    <div class="q4_box">
                        <asp:PlaceHolder ID="ItemPlaceHolder" runat="server"></asp:PlaceHolder>
                    </div>
                </LayoutTemplate>

                <ItemTemplate>
                    <div class="q4_item">
                        <span class="q4_item_title"><%# Eval("stor_name") %> <br /></span>
                        <%# Eval("stor_address") %> <br />
                        <%# Eval("city") %>
                        <%# Eval("state") %>
                        <%# Eval("zip") %> <br />
                    </div>
                </ItemTemplate>

                <%--<ItemSeparatorTemplate>
                    <hr />
                </ItemSeparatorTemplate>--%>

                <AlternatingItemTemplate>
                   <div class="q4_alternate_item">
                        <span class="q4_item_title"><%# Eval("stor_name") %> <br /></span>
                        <%# Eval("stor_address") %> <br />
                        <%# Eval("city") %>
                        <%# Eval("state") %>
                        <%# Eval("zip") %> <br />
                    </div>
  
                </AlternatingItemTemplate>
            </asp:ListView>

        </div>
    </form>
</body>
</html>
