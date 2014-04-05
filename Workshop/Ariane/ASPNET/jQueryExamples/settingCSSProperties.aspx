<%@ Page Language="C#" AutoEventWireup="true" CodeFile="settingCSSProperties.aspx.cs" Inherits="settingCSSProperties" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-2.1.0.min.js"></script>
    <script src="Scripts/jScript.js"></script>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="block">

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [CategoryName] FROM [Categories]"></asp:SqlDataSource>
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="CategoryName" HeaderText="CategoryName" SortExpression="CategoryName" />
                </Columns>
            </asp:GridView>

            <asp:Button ID="Button1" runat="server" Text="Button" />

            <br />
            <input id="Button2" type="button" value="Effect" />
        </div>

        <div class="block">
            <h1>Adding a paragraph</h1>
            <input type="button" value="Add" id="btnAdd" />
            <input type="button" value="Remove" id="btnRemove" />
            <input type="button" value="Modify" id="btnModify" />
            <p>This is the first paragraph</p>
            <p id="second">This is the second paragraph</p>
            <p id="third">This is the third paragraph</p>
        </div>

        <div class="block">
            <input type="button" value="fade in bird" id="btnShowBird" />
            <input type="button" value="fade out bird" id="btnHideBird" />
            <input type="button" value="slide" id="btnSlide" />
            <div id="birdImage">
                <img src="images/bird.jpg" alt="bird" />
            </div>
        </div>

        <div class="block">
            <asp:BulletedList ID="blCategoriesHover" runat="server" DataSourceID="SqlDataSource1" DataTextField="CategoryName" DataValueField="CategoryName"></asp:BulletedList>
        </div>

        <p style="clear: both"></p>
        <div class="block1">
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ProductID], [ProductName], [UnitPrice], [Discontinued] FROM [Products]"></asp:SqlDataSource>
            <asp:GridView ID="gvProducts" runat="server" AutoGenerateColumns="False" DataKeyNames="ProductID" DataSourceID="SqlDataSource2">
                <Columns>
                    <asp:BoundField DataField="ProductID" HeaderText="ProductID" InsertVisible="False" ReadOnly="True" SortExpression="ProductID" />
                    <asp:BoundField DataField="ProductName" HeaderText="ProductName" SortExpression="ProductName" />
                    <asp:BoundField DataField="UnitPrice" HeaderText="UnitPrice" SortExpression="UnitPrice" />
                    <asp:CheckBoxField DataField="Discontinued" HeaderText="Discontinued" SortExpression="Discontinued" />
                </Columns>
            </asp:GridView>
        </div>

        <div class="block1 categories">
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [CategoryID], [Description], [CategoryName] FROM [Categories]"></asp:SqlDataSource>
            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource3">
                <LayoutTemplate>
                    <ul>
                        <asp:PlaceHolder ID="itemPlaceHolder" runat="server"></asp:PlaceHolder>
                    </ul>
                </LayoutTemplate>
                <ItemTemplate>
                    <li>
                        <asp:Label ID="lblCategoryID" runat="server"
                            Text='<%# Eval("categoryID") %>'></asp:Label>
                        <br />
                        <asp:Label ID="lblCategoryName" runat="server"
                            Text='<%# Eval("categoryName") %>'></asp:Label>
                        <br />
                        <asp:Label ID="lblCategoryDescription" runat="server"
                            Text='<%# Eval("Description") %>'></asp:Label>
                        <br />
                        <asp:Button ID="btnConfirm" runat="server" Text="Display Confirmation" />
                        <asp:Button ID="btnHighlight" runat="server" Text="Highlight categories" />
                    </li>
                </ItemTemplate>
            </asp:ListView>
        </div>

    </form>
</body>
</html>
