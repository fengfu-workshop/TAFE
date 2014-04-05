<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ListViewPaging.aspx.cs" Inherits="ListViewPaging" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Style.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [LastName], [FirstName], [Title], [TitleOfCourtesy], [PhotoPath], [BirthDate], [HireDate], [Address], [City], [EmployeeID], [Region], [PostalCode], [Country], [HomePhone], [Extension], [Notes] FROM [Employees]"></asp:SqlDataSource>
            <br />
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="EmployeeID" DataSourceID="SqlDataSource1">

                <ItemTemplate>
                    <div class="Details">
                    <asp:Image ID="IdOfImageControl" runat="server" AlternateText="Photo of employee" ImageUrl='<%# Eval("photoPath", "~/images/{0}") %>' />
                   <p><%# Eval("TitleOfCourtesy") %> <%# Eval("FirstName") %>  <%# Eval("LastName") %></p>

<%--                        <br />
                        TitleOfCourtesy:
                    <asp:Label ID="TitleOfCourtesyLabel" runat="server" Text='<%# Eval("TitleOfCourtesy") %>' />
                        <br />
                        PhotoPath:
                    <asp:Label ID="PhotoPathLabel" runat="server" Text='<%# Eval("PhotoPath") %>' />
                        <br />
                        BirthDate:
                    <asp:Label ID="BirthDateLabel" runat="server" Text='<%# Eval("BirthDate") %>' />
                        <br />
                        HireDate:
                    <asp:Label ID="HireDateLabel" runat="server" Text='<%# Eval("HireDate") %>' />
                        <br />
                        Address:
                    <asp:Label ID="AddressLabel" runat="server" Text='<%# Eval("Address") %>' />
                        <br />
                        City:
                    <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' />
                        <br />
                        EmployeeID:
                    <asp:Label ID="EmployeeIDLabel" runat="server" Text='<%# Eval("EmployeeID") %>' />
                        <br />
                        Region:
                    <asp:Label ID="RegionLabel" runat="server" Text='<%# Eval("Region") %>' />
                        <br />
                        PostalCode:
                    <asp:Label ID="PostalCodeLabel" runat="server" Text='<%# Eval("PostalCode") %>' />
                        <br />
                        Country:
                    <asp:Label ID="CountryLabel" runat="server" Text='<%# Eval("Country") %>' />
                        <br />
                        HomePhone:
                    <asp:Label ID="HomePhoneLabel" runat="server" Text='<%# Eval("HomePhone") %>' />
                        <br />
                        Extension:
                    <asp:Label ID="ExtensionLabel" runat="server" Text='<%# Eval("Extension") %>' />
                        <br />
                        Notes:
                    <asp:Label ID="NotesLabel" runat="server" Text='<%# Eval("Notes") %>' />
                        <br />--%>
                    </div>
                </ItemTemplate>
                <LayoutTemplate>
                    <div style="">
                        <asp:DataPager ID="DataPager2" runat="server" PageSize="3">
                            <Fields>
                                  <asp:NextPreviousPagerField ButtonType="Button"
                                    ShowFirstPageButton="true" ShowPreviousPageButton="true"
                                    ShowNextPageButton="false" ShowLastPageButton="false" NextPageText=">" PreviousPageText="<" LastPageText=">>" FirstPageText="<<" />
                                <asp:NumericPagerField />
                                <asp:NextPreviousPagerField ButtonType="Button"
                                    ShowLastPageButton="true" ShowNextPageButton="true"
                                    ShowFirstPageButton="false" ShowPreviousPageButton="false" />
                            </Fields>
                        </asp:DataPager>
                    </div>
                    <span id="itemPlaceholderContainer" runat="server" style="">
                        <span runat="server" id="itemPlaceholder" />
                    </span>
                    <div style="">
                        <asp:DataPager ID="DataPager1" runat="server" PageSize="3">
                            <Fields>
                                  <asp:NextPreviousPagerField ButtonType="Button"
                                    ShowFirstPageButton="true" ShowPreviousPageButton="true"
                                    ShowNextPageButton="false" ShowLastPageButton="false" />
                                <asp:NumericPagerField />
                                <asp:NextPreviousPagerField ButtonType="Button"
                                    ShowLastPageButton="true" ShowNextPageButton="true"
                                    ShowFirstPageButton="false" ShowPreviousPageButton="false" />
                            </Fields>
                        </asp:DataPager>
                    </div>
                </LayoutTemplate>

            </asp:ListView>

        </div>
    </form>
</body>
</html>
