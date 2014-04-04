<%@ Page Language="C#" AutoEventWireup="true" CodeFile="sortingExample.aspx.cs" Inherits="sortingExample" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [LastName], [FirstName], [Title], [TitleOfCourtesy], [HireDate], [BirthDate], [Extension] FROM [Employees]"></asp:SqlDataSource>
            <br />
            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
                <LayoutTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CommandName="sort" CommandArgument="FirstName">First Name</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton2" runat="server" CommandName="sort" CommandArgument="LastName">Last Name</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton3" runat="server" CommandName="sort" CommandArgument="Title">Title</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton4" runat="server" CommandName="sort" CommandArgument="HireDate">Hire Date</asp:LinkButton>
                    <asp:PlaceHolder ID="ItemPlaceHolder" runat="server"></asp:PlaceHolder>
                </LayoutTemplate>
                <ItemTemplate>
                    <div>
                        <%# Eval("TitleOfCourtesy")%>
                        <%# Eval("firstName")%>
                        <%# Eval("lastName")%>
                        <br />
                        DOB: <%# Eval("birthdate", "{0:d}")%>
                        <br />
                        <br />
                        <%# Eval("title")%>
                        <br />
                        Date Hired: <%# Eval("hireDate", "{0:d}")%>
                        <br />
                        Ext: <%# Eval("extension")%>
                    </div>
                </ItemTemplate>
                <ItemSeparatorTemplate>
                    <hr />
                </ItemSeparatorTemplate>
            </asp:ListView>

        </div>
    </form>
</body>
</html>
