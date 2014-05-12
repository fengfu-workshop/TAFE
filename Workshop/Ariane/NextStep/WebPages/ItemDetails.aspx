<%@ Page Title="Item Details" Language="C#" MasterPageFile="~/MasterPages/NextStep.master" AutoEventWireup="true" CodeFile="ItemDetails.aspx.cs" Inherits="Test_ItemDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container clear_fix">
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="ItemId" DataSourceID="SqlDataSource1" OnItemCommand="ListView1_ItemCommand">

            <EmptyDataTemplate>
                <span>No data was returned.</span>
            </EmptyDataTemplate>
            <ItemTemplate>
                <%--hidden fields--%>
                <asp:Label ID="lblItemId" runat="server" Text='<%# Eval("ItemId") %>' Visible="False"></asp:Label>
                <asp:Label ID="lblPhotoGuid" runat="server" Text='<%# Eval("PhotoGuid") %>' Visible="False"></asp:Label>

                <div class="item_left shadow_box">
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("PhotoGuid", "~/Images/Items/{0}") %>' AlternateText="Photo coming soon" />
                </div>
                <div class="item_right">
                    <h2>
                        <asp:Label ID="ItemNameLabel" runat="server" Text='<%# Eval("ItemName") %>' />
                    </h2>
                    <br />
                    Price:
                    <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price", "{0:C}") %>' />
                    <br />
                    <br />
                    In Stock:
                    <asp:Label ID="QuantityLabel" runat="server" Text='<%# Eval("Quantity") %>' />
                    <br />
                    <br />

                    <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' CssClass="description" />
                    <br />
                    <div class="shopping_cart">
                        Quantity:
                        <asp:TextBox ID="txtQuantity" runat="server" Text="1"></asp:TextBox>
                        <br />
                        <br />
                        <%--<a><asp:ImageButton ID="imgAddToCart" CommandName="AddToCart" CommandArgument='<%# Eval("ItemId") %>' runat="server" ImageUrl="~/Images/AddToCart.png" AlternateText="Photo coming soon" /></a>--%>
                        <asp:ImageButton ID="ImageButton1" CommandName="AddToCart" CommandArgument='<%# Eval("ItemId") %>' runat="server" ImageUrl="~/Images/AddToCart.png" AlternateText="Photo coming soon" CssClass="cart_button"/>
                    </div>

                </div>

            </ItemTemplate>
            <LayoutTemplate>
                <asp:PlaceHolder ID="ItemPlaceHolder" runat="server"></asp:PlaceHolder>
            </LayoutTemplate>

        </asp:ListView>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NextStepConnectionString %>" SelectCommand="SELECT [ItemId], [ItemName], [Price], [PhotoGuid], [Quantity], [Description] FROM [Item] WHERE ([ItemId] = @ItemId)">
        <SelectParameters>
            <asp:QueryStringParameter Name="ItemId" QueryStringField="Id" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <script type="text/javascript">
        $(document).ready(function () {
            $('.item_left').zoom({ url: $('#ContentPlaceHolder1_ListView1_Image1_0').attr('href'), on: 'mouseover' });
        });
    </script>
</asp:Content>

