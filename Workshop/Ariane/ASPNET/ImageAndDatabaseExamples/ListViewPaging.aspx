<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ListViewPaging.aspx.cs" Inherits="ListViewPaging" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [LastName], [FirstName], [Title], [TitleOfCourtesy], [PhotoPath], [BirthDate], [HireDate], [Address], [City], [EmployeeID], [Region], [PostalCode], [Country], [HomePhone], [Extension], [Notes] FROM [Employees]"></asp:SqlDataSource>
            <br />
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="EmployeeID" DataSourceID="SqlDataSource1">
                <AlternatingItemTemplate>
                    <li style="">LastName:
                    <asp:Label ID="LastNameLabel" runat="server" Text='<%# Eval("LastName") %>' />
                        <br />
                        FirstName:
                    <asp:Label ID="FirstNameLabel" runat="server" Text='<%# Eval("FirstName") %>' />
                        <br />
                        Title:
                    <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                        <br />
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
                        <br />
                    </li>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <li style="">LastName:
                    <asp:TextBox ID="LastNameTextBox" runat="server" Text='<%# Bind("LastName") %>' />
                        <br />
                        FirstName:
                    <asp:TextBox ID="FirstNameTextBox" runat="server" Text='<%# Bind("FirstName") %>' />
                        <br />
                        Title:
                    <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
                        <br />
                        TitleOfCourtesy:
                    <asp:TextBox ID="TitleOfCourtesyTextBox" runat="server" Text='<%# Bind("TitleOfCourtesy") %>' />
                        <br />
                        PhotoPath:
                    <asp:TextBox ID="PhotoPathTextBox" runat="server" Text='<%# Bind("PhotoPath") %>' />
                        <br />
                        BirthDate:
                    <asp:TextBox ID="BirthDateTextBox" runat="server" Text='<%# Bind("BirthDate") %>' />
                        <br />
                        HireDate:
                    <asp:TextBox ID="HireDateTextBox" runat="server" Text='<%# Bind("HireDate") %>' />
                        <br />
                        Address:
                    <asp:TextBox ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' />
                        <br />
                        City:
                    <asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>' />
                        <br />
                        EmployeeID:
                    <asp:Label ID="EmployeeIDLabel1" runat="server" Text='<%# Eval("EmployeeID") %>' />
                        <br />
                        Region:
                    <asp:TextBox ID="RegionTextBox" runat="server" Text='<%# Bind("Region") %>' />
                        <br />
                        PostalCode:
                    <asp:TextBox ID="PostalCodeTextBox" runat="server" Text='<%# Bind("PostalCode") %>' />
                        <br />
                        Country:
                    <asp:TextBox ID="CountryTextBox" runat="server" Text='<%# Bind("Country") %>' />
                        <br />
                        HomePhone:
                    <asp:TextBox ID="HomePhoneTextBox" runat="server" Text='<%# Bind("HomePhone") %>' />
                        <br />
                        Extension:
                    <asp:TextBox ID="ExtensionTextBox" runat="server" Text='<%# Bind("Extension") %>' />
                        <br />
                        Notes:
                    <asp:TextBox ID="NotesTextBox" runat="server" Text='<%# Bind("Notes") %>' />
                        <br />
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    </li>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    No data was returned.
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <li style="">LastName:
                    <asp:TextBox ID="LastNameTextBox" runat="server" Text='<%# Bind("LastName") %>' />
                        <br />
                        FirstName:
                    <asp:TextBox ID="FirstNameTextBox" runat="server" Text='<%# Bind("FirstName") %>' />
                        <br />
                        Title:
                    <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
                        <br />
                        TitleOfCourtesy:
                    <asp:TextBox ID="TitleOfCourtesyTextBox" runat="server" Text='<%# Bind("TitleOfCourtesy") %>' />
                        <br />
                        PhotoPath:
                    <asp:TextBox ID="PhotoPathTextBox" runat="server" Text='<%# Bind("PhotoPath") %>' />
                        <br />
                        BirthDate:
                    <asp:TextBox ID="BirthDateTextBox" runat="server" Text='<%# Bind("BirthDate") %>' />
                        <br />
                        HireDate:
                    <asp:TextBox ID="HireDateTextBox" runat="server" Text='<%# Bind("HireDate") %>' />
                        <br />
                        Address:
                    <asp:TextBox ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' />
                        <br />
                        City:
                    <asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>' />
                        <br />
                        Region:
                    <asp:TextBox ID="RegionTextBox" runat="server" Text='<%# Bind("Region") %>' />
                        <br />
                        PostalCode:
                    <asp:TextBox ID="PostalCodeTextBox" runat="server" Text='<%# Bind("PostalCode") %>' />
                        <br />
                        Country:
                    <asp:TextBox ID="CountryTextBox" runat="server" Text='<%# Bind("Country") %>' />
                        <br />
                        HomePhone:
                    <asp:TextBox ID="HomePhoneTextBox" runat="server" Text='<%# Bind("HomePhone") %>' />
                        <br />
                        Extension:
                    <asp:TextBox ID="ExtensionTextBox" runat="server" Text='<%# Bind("Extension") %>' />
                        <br />
                        Notes:
                    <asp:TextBox ID="NotesTextBox" runat="server" Text='<%# Bind("Notes") %>' />
                        <br />
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    </li>
                </InsertItemTemplate>
                <ItemSeparatorTemplate>
                    <br />
                </ItemSeparatorTemplate>
                <ItemTemplate>
                    <li style="">LastName:
                    <asp:Label ID="LastNameLabel" runat="server" Text='<%# Eval("LastName") %>' />
                        <br />
                        FirstName:
                    <asp:Label ID="FirstNameLabel" runat="server" Text='<%# Eval("FirstName") %>' />
                        <br />
                        Title:
                    <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                        <br />
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
                        <br />
                    </li>
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
                    <ul id="itemPlaceholderContainer" runat="server" style="">
                        <li runat="server" id="itemPlaceholder" />
                    </ul>
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
                <SelectedItemTemplate>
                    <li style="">LastName:
                    <asp:Label ID="LastNameLabel" runat="server" Text='<%# Eval("LastName") %>' />
                        <br />
                        FirstName:
                    <asp:Label ID="FirstNameLabel" runat="server" Text='<%# Eval("FirstName") %>' />
                        <br />
                        Title:
                    <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                        <br />
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
                        <br />
                    </li>
                </SelectedItemTemplate>
            </asp:ListView>

        </div>
    </form>
</body>
</html>
