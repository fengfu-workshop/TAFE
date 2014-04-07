<%@ Page Title="Search Products" Language="C#" MasterPageFile="~/MasterPages/NextStep.master" AutoEventWireup="true" CodeFile="ItemsSearch.aspx.cs" Inherits="Test_ItemsSearch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container clear_fix">
        <div class="search_left">
            Category:<br />
            <asp:DropDownList ID="ddlCategory" runat="server" DataSourceID="CategorySource" DataTextField="CategoryName" DataValueField="CategoryId" Height="22px" Width="190px"></asp:DropDownList>
            <br />
            <br />
            Product Name:<br />
            <asp:TextBox ID="txtProduct" runat="server" Width="190px" Height="22px"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Find Products" OnClick="Button1_Click" Width="190px" Height="28px" />
        </div>
        <div class="search_right clear_fix">
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="ItemId" DataSourceID="ItemSource">
                <EmptyDataTemplate>
                    <span>No product found.</span>
                </EmptyDataTemplate>

                <ItemTemplate>
                    <div class="item_thumb shadow_box">
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("ItemId", "~/Test/ItemDetails.aspx?Id={0}") %>'>
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("PhotoGuid", "~/Images/Thumbs/{0}") %>' AlternateText="Photo coming soon" />
                        </asp:HyperLink>
                        <asp:Label ID="ItemNameLabel" runat="server" Text='<%# Eval("ItemName") %>' />
                        <br /> <br />
                        <div class="price">
                            <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price", "{0:C}") %>' />
                            <%--<asp:Image ID="Image2" runat="server" ImageUrl="~/Images/AddToCart.gif" />--%>
                        </div>
                    </div>
                </ItemTemplate>
                <LayoutTemplate>
                    <asp:PlaceHolder ID="ItemPlaceHolder" runat="server"></asp:PlaceHolder>
                </LayoutTemplate>


            </asp:ListView>
        </div>
    </div>
    <asp:SqlDataSource ID="CategorySource" runat="server" ConnectionString="<%$ ConnectionStrings:NextStepConnectionString %>" SelectCommand="SELECT [CategoryId], [CategoryName] FROM [Category]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="ItemSource" runat="server" ConnectionString="<%$ ConnectionStrings:NextStepConnectionString %>" SelectCommand="SELECT * FROM [Item] WHERE (([CategoryId] = @CategoryId) AND ([ItemName] LIKE '%' + @ItemName + '%'))">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlCategory" Name="CategoryId" PropertyName="SelectedValue" Type="Int32" DefaultValue="1" />
            <asp:ControlParameter ControlID="txtProduct" Name="ItemName" PropertyName="Text" Type="String" DefaultValue=" " />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

