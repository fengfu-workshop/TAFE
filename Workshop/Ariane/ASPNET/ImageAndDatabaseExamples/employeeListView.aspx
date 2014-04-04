<%@ Page Language="C#" AutoEventWireup="true" CodeFile="employeeListView.aspx.cs" Inherits="employeeListView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [LastName], [FirstName], [BirthDate], [TitleOfCourtesy], [PhotoPath], [Address], [Region], [City], [PostalCode], [Country] FROM [Employees]"></asp:SqlDataSource>
        <br />
        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" OnItemDataBound="ListView1_ItemDataBound">
            <LayoutTemplate>
                <asp:PlaceHolder ID="ItemPlaceHolder" runat="server"></asp:PlaceHolder>
                <div style="">
                    <asp:DataPager ID="DataPager1" runat="server" PageSize="3">
                        <Fields>
                            <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                        </Fields>
                    </asp:DataPager>
                </div>
            </LayoutTemplate>

            <ItemTemplate>
                <div class="employeeDetails">
                    <p><%# Eval("TitleOfCourtesy") %> <%# Eval("FirstName") %>  <%# Eval("LastName") %></p>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("BirthDate", "{0:d}") %>'></asp:Label>

                    <p><%# Eval("Address") %><br />   <%# Eval("City") %> <%# Eval("PostalCode") %> <%# Eval("Country") %> </p>
                </div>
                <asp:Image ID="IdOfImageControl" runat="server" AlternateText="Photo of employee" ImageUrl='<%# Eval("photoPath", "~/images/{0}") %>' />
                <br class="clearFloat"/>
            </ItemTemplate>
        </asp:ListView>
    
    </div>
    </form>
</body>
</html>
