<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BooksByAuthor.aspx.cs" Inherits="BooksByAuthor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="books">
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PubConnectionString %>" SelectCommand="SELECT titles.title, titles.price, titleauthor.au_id FROM titleauthor INNER JOIN titles ON titleauthor.title_id = titles.title_id WHERE (titleauthor.au_id = @au_id)">
            <SelectParameters>
                <asp:QueryStringParameter Name="au_id" QueryStringField="Id" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <h4>Books</h4>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
            <AlternatingRowStyle CssClass="AlternateRowStyle" />
            <Columns>
                <asp:BoundField DataField="title" HeaderText="Title" SortExpression="title" HeaderStyle-CssClass="header_style" />
                <asp:BoundField DataField="price" HeaderText="Price" SortExpression="price" />
                <asp:BoundField DataField="au_id" HeaderText="au_id" SortExpression="au_id" Visible="False" />
            </Columns>
        </asp:GridView>
    
    </div>
    </form>
</body>
</html>
