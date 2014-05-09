<%@ Page Title="Search Products" Language="C#" MasterPageFile="~/MasterPages/NextStep.master" AutoEventWireup="true" CodeFile="ItemsSearch.aspx.cs" Inherits="Test_ItemsSearch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="container clear_fix">
        <div class="search_left">
            Category:<br />
            <asp:DropDownList ID="ddlCategory" runat="server" DataSourceID="CategorySource" DataTextField="CategoryName" DataValueField="CategoryId" Height="22px" Width="190px" OnDataBound="ddlCategory_DataBound" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged"></asp:DropDownList>
            <br />
            <br />
            Product Name:<br />
            <asp:TextBox ID="txtProduct" runat="server" Width="190px" Height="22px" OnTextChanged="txtProduct_TextChanged"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="btnFindProduct" runat="server" Text="Find Products" OnClick="btnFindProduct_Click" Width="190px" Height="28px" />
        </div>
        <div class="search_right clear_fix">
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="ItemId" DataSourceID="ItemSource" OnItemCommand="ListView1_ItemCommand">
                <EmptyDataTemplate>
                    <p>No product found.</p>
                    <p>Select Category, type in part of product name and press &lt;Find Products&gt; to begin your search</p>
                </EmptyDataTemplate>

                <ItemTemplate>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <div class="item_thumb shadow_box">
                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("ItemId", "~/WebPages/ItemDetails.aspx?Id={0}") %>'>
                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("PhotoGuid", "~/Images/Thumbs/{0}") %>' AlternateText="Photo coming soon" />
                                </asp:HyperLink>
                                <asp:Label ID="lblItemId" runat="server" Text='<%# Eval("ItemId") %>' Visible="False"></asp:Label>
                                <asp:Label ID="lblPhotoGuid" runat="server" Text='<%# Eval("PhotoGuid") %>' Visible="False"></asp:Label>
                                <div><asp:Label ID="ItemNameLabel" runat="server" Text='<%# Eval("ItemName") %>' /></div>

                                <div class="price">
                                    <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price", "{0:C}") %>' />
                                    <%--<asp:Button ID="Button1" runat="server"  CommandName="find" Text="Add To Cart" />--%>
                                    <asp:ImageButton ID="imgAddToCart" CommandName="AddToCart" runat="server" ImageUrl="~/Images/cart_add.png" AlternateText="Shopping Cart" />
                                </div>
                            </div>

                        </ContentTemplate>
                    </asp:UpdatePanel>
                </ItemTemplate>
                <LayoutTemplate>
                    <div class="pager custom_button">
                        <asp:DataPager ID="DataPager1" runat="server" PageSize="9">
                            <Fields>
                                <asp:NextPreviousPagerField ShowFirstPageButton="True" ShowNextPageButton="False" ButtonCssClass="left_rounded" />
                                <asp:NumericPagerField />
                                <asp:NextPreviousPagerField ShowLastPageButton="True" ShowPreviousPageButton="False" ButtonCssClass="right_rounded" />
                            </Fields>
                        </asp:DataPager>
                    </div>
                    <div class="clear_fix">
                        <asp:PlaceHolder ID="ItemPlaceHolder" runat="server"></asp:PlaceHolder>
                    </div>
                    <div class="pager custom_button">
                        <asp:DataPager ID="DataPager2" runat="server" PageSize="9">
                            <Fields>
                                <asp:NextPreviousPagerField ShowFirstPageButton="True" ShowNextPageButton="False" ButtonCssClass="left_rounded" />
                                <asp:NumericPagerField />
                                <asp:NextPreviousPagerField ShowLastPageButton="True" ShowPreviousPageButton="False" ButtonCssClass="right_rounded" />
                            </Fields>
                        </asp:DataPager>
                    </div>
                </LayoutTemplate>


            </asp:ListView>
        </div>
    </div>
    <asp:SqlDataSource ID="CategorySource" runat="server" ConnectionString="<%$ ConnectionStrings:NextStepConnectionString %>" SelectCommand="SELECT [CategoryId], [CategoryName] FROM [Category]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="ItemSource" runat="server" ConnectionString="<%$ ConnectionStrings:NextStepConnectionString %>" SelectCommand="SELECT * FROM [Item] WHERE (([CategoryId] = @CategoryId OR 0 = @CategoryId) AND ([ItemName] LIKE '%' + @ItemName + '%') AND [Active] = 'true')">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlCategory" Name="CategoryId" PropertyName="SelectedValue" Type="Int32" DefaultValue="0" />
            <asp:ControlParameter ControlID="txtProduct" Name="ItemName" PropertyName="Text" Type="String" DefaultValue=" " />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

