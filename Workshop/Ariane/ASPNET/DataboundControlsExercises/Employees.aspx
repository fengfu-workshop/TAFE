<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Employees.aspx.cs" Inherits="Employees" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NW_ConnectionString %>" SelectCommand="SELECT Employees.EmployeeID, Employees.LastName, Employees.FirstName, Employees.Title, 
Employees.TitleOfCourtesy, Employees.BirthDate, Employees.HireDate, Employees.Address, 
Employees.City, Employees.Region, Employees.PostalCode, Employees.Country, Employees.HomePhone, 
Employees.Extension, Employees.Notes, Employees.ReportsTo, Employees.PhotoPath, 
Manager.LastName AS managerLastName, Manager.FirstName AS managerFirstName FROM Employees INNER 
JOIN Employees AS Manager ON Employees.ReportsTo = Manager.EmployeeID"></asp:SqlDataSource>
            <h2 class="q2_h2">Employees</h2>
            <asp:FormView ID="FormView1" runat="server" AllowPaging="True" DataSourceID="SqlDataSource1">
                <EditItemTemplate>
                    EmployeeID:
                <asp:Label ID="EmployeeIDLabel1" runat="server" Text='<%# Eval("EmployeeID") %>' />
                    <br />
                    LastName:
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
                    ReportsTo:
                <asp:TextBox ID="ReportsToTextBox" runat="server" Text='<%# Bind("ReportsTo") %>' />
                    <br />
                    PhotoPath:
                <asp:TextBox ID="PhotoPathTextBox" runat="server" Text='<%# Bind("PhotoPath") %>' />
                    <br />
                    managerLastName:
                <asp:TextBox ID="managerLastNameTextBox" runat="server" Text='<%# Bind("managerLastName") %>' />
                    <br />
                    managerFirstName:
                <asp:TextBox ID="managerFirstNameTextBox" runat="server" Text='<%# Bind("managerFirstName") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    LastName:
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
                    ReportsTo:
                <asp:TextBox ID="ReportsToTextBox" runat="server" Text='<%# Bind("ReportsTo") %>' />
                    <br />
                    PhotoPath:
                <asp:TextBox ID="PhotoPathTextBox" runat="server" Text='<%# Bind("PhotoPath") %>' />
                    <br />
                    managerLastName:
                <asp:TextBox ID="managerLastNameTextBox" runat="server" Text='<%# Bind("managerLastName") %>' />
                    <br />
                    managerFirstName:
                <asp:TextBox ID="managerFirstNameTextBox" runat="server" Text='<%# Bind("managerFirstName") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    <div class="q2_box">
                        <div class="q2_header">
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("TitleOfCourtesy") %>' />
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("FirstName") %>' />
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("LastName") %>' />
                        </div>
                        <div class="q2_section">
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("Title") %>' CssClass="q2_title" />
                            <br />
                            Reports To: 
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("managerFirstName") %>' />
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("managerLastName") %>' />
                            <br />
                            Hired: 
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("HireDate", "{0:d}") %>' />
                            <br />
                            Extension:
                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("Extension") %>' />
                            <br />
                        </div>

                        <div class="q2_section">
                            <span class="q2_title">Personal details</span>
                            <br />
                            BirthDate:
                        <asp:Label ID="BirthDateLabel" runat="server" Text='<%# Bind("BirthDate") %>' />
                            <br />
                            Address:
                        <asp:Label ID="AddressLabel" runat="server" Text='<%# Bind("Address") %>' />
                            <br />
                            <asp:Label ID="CityLabel" runat="server" Text='<%# Bind("City") %>' />
                            <asp:Label ID="RegionLabel" runat="server" Text='<%# Bind("Region") %>' />
                            <br />
                            <asp:Label ID="PostalCodeLabel" runat="server" Text='<%# Bind("PostalCode") %>' />
                            <asp:Label ID="CountryLabel" runat="server" Text='<%# Bind("Country") %>' />
                            <br />
                            <br />
                            Phone:
                        <asp:Label ID="HomePhoneLabel" runat="server" Text='<%# Bind("HomePhone") %>' />
                            <br />
                        </div>
                        <div class="q2_section">
                            <asp:Label ID="Label9" runat="server" Text='<%# Bind("Notes") %>' />
                            <br />
                        </div>
                    </div>
                </ItemTemplate>
                <PagerSettings NextPageText="Next Page" PreviousPageText="Previous Page" />
                <PagerTemplate>
                    <div class="pageLeft">
                        Page
                        <asp:Label ID="lblPage" runat="server" Text="<%# FormView1.PageIndex + 1 %>"></asp:Label>
                        of
                        <asp:Label ID="Label10" runat="server" Text="<%# FormView1.PageCount %>"></asp:Label>
                    </div>
                    <div class="pageRight">
                        <asp:LinkButton ID="lnkPrevious" runat="server" CommandArgument="Prev" CommandName="Page">Previous Page</asp:LinkButton>
                        |
                        <asp:LinkButton ID="lnkNext" runat="server" CommandArgument="Next" CommandName="Page">Next Page</asp:LinkButton>
                    </div>
                </PagerTemplate>
            </asp:FormView>

        </div>
    </form>
</body>
</html>
