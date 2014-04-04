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
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [CategoryName] FROM [Categories]"></asp:SqlDataSource>
        <br />
        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
            <LayoutTemplate>
                <asp:PlaceHolder ID="ItemPlaceHolder" runat="server"></asp:PlaceHolder>
            </LayoutTemplate>
            <ItemTemplate>
                <div class="normalStyle">
                    <%# Eval("CategoryName") %>
                </div>
            </ItemTemplate>
            <AlternatingItemTemplate>
                <div class="alternateStyle">
                    <%# Eval("CategoryName") %> 
                <div>
            </AlternatingItemTemplate>
            <ItemSeparatorTemplate>
                <hr />
            </ItemSeparatorTemplate>
        </asp:ListView>
    
    </div>
    </form>
</body>
</html>
