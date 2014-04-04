<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CombinedControls.aspx.cs" Inherits="CombinedControls" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class ="wrap">
        <h3>PUBS DB Website</h3>
        <div class="latest">
            <asp:SqlDataSource ID="latestlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:PubConnectionString %>" SelectCommand="SELECT TOP (3) title, pubdate FROM titles ORDER BY pubdate DESC"></asp:SqlDataSource>
            <asp:ListView ID="ListView1" runat="server" DataSourceID="latestlDataSource">
                <LayoutTemplate>
                    Latest Titles:
                    <asp:PlaceHolder ID="ItemPlaceHolder" runat="server"></asp:PlaceHolder>
                </LayoutTemplate>
                <ItemTemplate>
                    <%# Eval("title") %>
                </ItemTemplate>

                <ItemSeparatorTemplate>
                    |
                </ItemSeparatorTemplate>
            </asp:ListView>
        </div>

        <div class="main  clear_fix">

            <div class="left">
                <h4>Sotries</h4>
                <aside>
                    <asp:SqlDataSource ID="storesDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:PubConnectionString %>" 
                        SelectCommand="SELECT [stor_name], [stor_address], [city], [state] FROM [stores]"></asp:SqlDataSource>
                    <asp:ListView ID="ListView2" runat="server" DataSourceID="storesDataSource">
                        <LayoutTemplate>
                            <asp:PlaceHolder ID="ItemPlaceHolder" runat="server"></asp:PlaceHolder>
                        </LayoutTemplate>

                        <ItemTemplate>
                            <b><%# Eval("stor_name") %><br /></b>
                            <%# Eval("stor_address") %><br />
                            <%# Eval("city") %>
                            <%# Eval("state") %><br />
                        </ItemTemplate>
                    </asp:ListView>
                </aside>

                <h4>Publishers</h4>
                <aside>
                    <asp:SqlDataSource ID="publishersDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PubConnectionString %>" SelectCommand="SELECT [pub_name] FROM [publishers]"></asp:SqlDataSource>
                    <asp:ListView ID="ListView3" runat="server" DataSourceID="publishersDataSource1">
                        <LayoutTemplate>
                            <asp:PlaceHolder ID="ItemPlaceHolder" runat="server"></asp:PlaceHolder>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <%# Eval("pub_name") %><br />
                        </ItemTemplate>
                    </asp:ListView>
                </aside>

            </div>
        
            <div class="middle">
                <h3>Our Books</h3>
                <asp:SqlDataSource ID="titlesDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:PubConnectionString %>" SelectCommand="SELECT authors.au_lname,titles.title, titles.pubdate, titles.price FROM authors INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id INNER JOIN titles ON titleauthor.title_id = titles.title_id"></asp:SqlDataSource>
                <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="titlesDataSource">
                    <AlternatingRowStyle CssClass="grid_antenate_row" />
                    <Columns>
                        <asp:BoundField DataField="title" HeaderText="Title" SortExpression="title" HeaderStyle-HorizontalAlign="Left" />
                        <asp:BoundField DataField="pubdate" DataFormatString="{0:d}" HeaderText="Published" SortExpression="pubdate" />
                        <asp:BoundField DataField="price" DataFormatString="{0:c}" HeaderText="Price" SortExpression="price" />
                        <asp:BoundField DataField="au_lname" HeaderText="Author" SortExpression="au_lname" />
                    </Columns>
                </asp:GridView>
            </div>

            <div class="right">
                <h4>View titles by Author</h4>
                <aside>
                    <asp:SqlDataSource ID="authorDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:PubConnectionString %>" SelectCommand="SELECT [au_id], [au_lname], [au_fname] FROM [authors]"></asp:SqlDataSource>
                    <asp:ListView ID="ListView4" runat="server" DataSourceID="authorDataSource">
                        <LayoutTemplate>
                            <asp:PlaceHolder ID="ItemPlaceHolder" runat="server"></asp:PlaceHolder>
                        </LayoutTemplate>

                        <ItemTemplate>
                            <%# Eval("au_fname") %>
                            <%# Eval("au_lname") %>
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("au_id", "BooksByAuthor.aspx?Id={0}") %>'>View Books</asp:HyperLink>
                            <br />
                        </ItemTemplate>
                    </asp:ListView>
                </aside>
            </div>

        </div>
   
        <footer>
            Created by some really tallented Web Diploma Student &copyright; 2014
        </footer>
    </div>
    </form>
</body>
</html>
