<%@ Page Language="C#" AutoEventWireup="true" CodeFile="categoryHyperlink.aspx.cs" Inherits="categoryHyperlink" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringNW %>" SelectCommand="SELECT [CategoryID], [CategoryName] FROM [Categories]"></asp:SqlDataSource>
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="CategoryID" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:HyperLinkField DataNavigateUrlFields="categoryId" DataNavigateUrlFormatString="~/productsByCategory.aspx?id={0}" DataTextField="CategoryName" HeaderText="Categories" />
            </Columns>
        </asp:GridView>
    
    </div>
    </form>
</body>
</html>
