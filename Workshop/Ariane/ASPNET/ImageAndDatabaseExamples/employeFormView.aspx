<%@ Page Language="C#" AutoEventWireup="true" CodeFile="employeFormView.aspx.cs" Inherits="employeFormView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [EmployeeID], [FirstName], [LastName], [Title], [TitleOfCourtesy], [BirthDate], [HireDate], [Address], [City], [Region], [PostalCode], [Country], [HomePhone], [Extension], [Notes], [PhotoPath] FROM [Employees]"></asp:SqlDataSource>
            <br />
            <div class="employee_box">
                <asp:FormView ID="FormView1" runat="server" AllowPaging="True" DataKeyNames="EmployeeID" DataSourceID="SqlDataSource1">

                    <ItemTemplate>

                        <h3>Employees</h3>
                        <h4>
                            <asp:Label ID="TitleOfCourtesyLabel" runat="server" Text='<%# Bind("TitleOfCourtesy") %>' />
                            <asp:Label ID="FirstNameLabel" runat="server" Text='<%# Bind("FirstName") %>' />
                            <asp:Label ID="LastNameLabel" runat="server" Text='<%# Bind("LastName") %>' />
                        </h4>
                        <div class="details clearFloat">
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("PhotoPath", "~/images/{0}") %>' />
                            <section>
                                <asp:Label ID="TitleLabel" runat="server" Text='<%# Bind("Title") %>' /><br />
                                Hired:
                                <asp:Label ID="HireDateLabel" runat="server" Text='<%# Bind("HireDate", "{0:d}") %>' />
                                <br />
                                Extension:
                                <asp:Label ID="ExtensionLabel" runat="server" Text='<%# Bind("Extension") %>' />
                            </section>
                            <section>
                                Personal Details
                                <br />
                                Birth Date:
                                <asp:Label ID="BirthDateLabel" runat="server" Text='<%# Bind("BirthDate") %>' />
                                Address:<br />
                                <asp:Label ID="AddressLabel" runat="server" Text='<%# Bind("Address") %>' /><br />
                                <asp:Label ID="CityLabel" runat="server" Text='<%# Bind("City") %>' />
                                <asp:Label ID="RegionLabel" runat="server" Text='<%# Bind("Region") %>' />
                                <br />
                                <asp:Label ID="PostalCodeLabel" runat="server" Text='<%# Bind("PostalCode") %>' />
                                <asp:Label ID="CountryLabel" runat="server" Text='<%# Bind("Country") %>' />
                                <br />
                                Phone:
                                <asp:Label ID="HomePhoneLabel" runat="server" Text='<%# Bind("HomePhone") %>' />

                            </section>
                            <section>
                                <asp:Label ID="NotesLabel" runat="server" Text='<%# Bind("Notes") %>' />
                            </section>
                        </div>


                    </ItemTemplate>
                    <PagerStyle BackColor="#DCD373" />
                </asp:FormView>

            </div>
        </div>
    </form>
</body>
</html>
