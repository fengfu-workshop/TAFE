<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Management.master" AutoEventWireup="true" CodeFile="ItemManagement.aspx.cs" Inherits="Management_ItemManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <%--    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>--%>
    <div class="item_box title_box">
        <div class="sub_header">
            <asp:LinkButton ID="btnInsert" runat="server" Text="Insert Item" OnClick="btnInsert_Click" CausesValidation="False" />
            Category:
                    <asp:DropDownList ID="ddlCategory" runat="server" DataSourceID="CategorySource" DataTextField="CategoryName" DataValueField="CategoryId" Height="20px" Width="139px" OnDataBound="ddlCategory_DataBound" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged"></asp:DropDownList>
            Product Name:<asp:TextBox ID="txtProduct" runat="server" Width="190px" Height="22px" OnTextChanged="txtProduct_TextChanged"></asp:TextBox>
            <%--<asp:Label ID="lblDebug" runat="server" Text="Label"></asp:Label>--%>
            <asp:LinkButton ID="btnFindProduct" runat="server" Text="Find Products" OnClick="btnFindProduct_Click" CausesValidation="False" />

        </div>

        <asp:ListView ID="ListView1" runat="server" OnItemCommand="ListView1_ItemCommand" DataKeyNames="ItemId" DataSourceID="ItemSource" InsertItemPosition="LastItem" OnItemDeleted="ListView1_ItemDeleted" OnItemDeleting="ListView1_ItemDeleting">

            <EditItemTemplate>
                <fieldset>
                    <legend>Update Item</legend>
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("PhotoGuid", "~/Images/Thumbs/{0}") %>' AlternateText="Photo coming soon" CssClass="right_thumb" />
                    <label>ItemId:</label>
                    <%# Eval("ItemId") %>
                    <br />
                    <label>Item Name:</label>
                    <asp:TextBox ID="ItemNameTextBox" runat="server" Text='<%# Bind("ItemName") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ItemNameTextBox" ErrorMessage="Please enter the item name" CssClass="error">*</asp:RequiredFieldValidator>
                    <br />
                    <label>Price:</label>
                    <asp:TextBox ID="PriceTextBox" runat="server" Text='<%# Bind("Price") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="PriceTextBox" ErrorMessage="Please enter the product price" CssClass="error">*</asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator2" runat="server"  ControlToValidate="PriceTextBox" ErrorMessage="Price must be a positive number!" Type="Double" MinimumValue="0" MaximumValue="999999" CssClass="error">*</asp:RangeValidator>
                    <br />
                    <label>Photo:</label>
                    <asp:TextBox ID="PhotoNameTextBox" runat="server" Text='<%# Bind("PhotoName") %>' Visible="False" />
                    <asp:FileUpload ID="FileUpload1" runat="server" FileName='<%# Bind("PhotoName") %>' />
                    <br />

                    <asp:TextBox ID="PhotoGuidTextBox" runat="server" Text='<%# Bind("PhotoGuid") %>' Visible="False" />

                    <label>Quantity:</label>
                    <asp:TextBox ID="QuantityTextBox" runat="server" Text='<%# Bind("Quantity") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="QuantityTextBox" ErrorMessage="Please enter the quantity" CssClass="error">*</asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator1" runat="server"  ControlToValidate="QuantityTextBox" ErrorMessage="Quantity must be a positive integer!" Type="Integer" MinimumValue="0" MaximumValue="99999" CssClass="error">*</asp:RangeValidator>
                    <br />
                    <label>Description:</label>
                    <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' TextMode="MultiLine" />
                    <br />
                    <label>Category:</label>
                    <%--<asp:TextBox ID="CategoryIdTextBox" runat="server" Text='<%# Bind("CategoryId") %>' />--%>
                    <asp:DropDownList ID="ddlCategoryEdit" runat="server" DataSourceID="CategorySource" DataTextField="CategoryName" DataValueField="CategoryId" Height="22px" Width="190px" SelectedValue='<%# Bind("CategoryId") %>'></asp:DropDownList>
                    <br />
                    <label>Active:</label>
                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Active") %>' />
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowModelStateErrors="False" ShowSummary="False" CssClass="error" />
                    <div class="list_button">
                        <asp:LinkButton ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                        <asp:LinkButton ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" CausesValidation="False" />
                    </div>
                    <br />
                </fieldset>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <p>No product found.</p>
                <p>Select Category, type in part of product name and press &lt;Find Products&gt; to begin your search</p>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <fieldset>
                    <legend>Insert Item</legend>

                    <label>Item Name:</label>
                    <asp:TextBox ID="ItemNameTextBox" runat="server" Text='<%# Bind("ItemName") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ItemNameTextBox" ErrorMessage="Please enter the item name" CssClass="error">*</asp:RequiredFieldValidator>
                    <br />
                    <label>Price:</label>
                    <asp:TextBox ID="PriceTextBox" runat="server" Text='<%# Bind("Price") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="PriceTextBox" ErrorMessage="Please enter the product price" CssClass="error">*</asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator2" runat="server"  ControlToValidate="PriceTextBox" ErrorMessage="Price must be a positive number!" Type="Double" MinimumValue="0" MaximumValue="999999" CssClass="error">*</asp:RangeValidator>
                    <br />
                    <label>Photo:</label>
                    <asp:TextBox ID="PhotoNameTextBox" runat="server" Text='<%# Bind("PhotoName") %>' Visible="False" />
                    <asp:FileUpload ID="FileUpload1" runat="server" FileName='<%# Bind("PhotoName") %>' />
                    <br />

                    <asp:TextBox ID="PhotoGuidTextBox" runat="server" Text='<%# Bind("PhotoGuid") %>' Visible="False" />

                    <label>Quantity:</label>
                    <asp:TextBox ID="QuantityTextBox" runat="server" Text='<%# Bind("Quantity") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="QuantityTextBox" ErrorMessage="Please enter the quantity" CssClass="error">*</asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator1" runat="server"  ControlToValidate="QuantityTextBox" ErrorMessage="Quantity must be a positive integer!" Type="Integer" MinimumValue="0" MaximumValue="99999" CssClass="error">*</asp:RangeValidator>
                    <br />
                    <label>Description:</label>
                    <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' TextMode="MultiLine" />
                    <br />
                    <label>Category:</label>
                    <%--<asp:TextBox ID="CategoryIdTextBox" runat="server" Text='<%# Bind("CategoryId") %>' />--%>
                    <asp:DropDownList ID="ddlCategoryEdit" runat="server" DataSourceID="CategorySource" DataTextField="CategoryName" DataValueField="CategoryId" Height="22px" Width="190px" SelectedValue='<%# Bind("CategoryId") %>' OnDataBound="ddlCategoryEdit_DataBound"></asp:DropDownList>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowModelStateErrors="False" ShowSummary="False" CssClass="error" />
                    <div class="list_button">
                        <asp:LinkButton ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                        <asp:LinkButton ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" CausesValidation="False" />
                    </div>
                    <br />
                </fieldset>

            </InsertItemTemplate>
            <ItemTemplate>
<%--                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>--%>
                <div class="item_list item_list1 item_list2 clear_fix">

                    <asp:Image ID="imgPhoto" runat="server" ImageUrl='<%# Eval("PhotoGuid", "~/Images/Thumbs/{0}") %>' AlternateText="Photo coming soon" />
                    <%--<asp:TextBox ID="PhotoGuidTextBox" runat="server" Text='<%# Bind("PhotoGuid") %>' Visible="False" />--%>

                    <div class="item_list_data">
                        <h4><%# Eval("ItemName") %></h4>
                        <br />
                        Price:
                        <h5><%# Eval("Price", "{0:C}") %></h5>

                        Quantity:
                        <h5><%# Eval("Quantity") %></h5>

                        Active:
                        <h5><%# Eval("Active") %></h5>

                        <br /><br />
                        <asp:LinkButton ID="EditButton" runat="server" CommandName="Edit" Text="Edit" CausesValidation="False" />
                        <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure you want to delete this product?');" CausesValidation="False" />
                        <br />
                    </div>
                    <p runat="server"><%# Eval("Description") %></p>

                </div>
<%--                                    </ContentTemplate>
                </asp:UpdatePanel>--%>
            </ItemTemplate>
            <LayoutTemplate>
                <div class="pager">
                    <asp:DataPager ID="DataPager1" runat="server" PageSize="5">
                        <Fields>
                            <asp:NextPreviousPagerField ShowFirstPageButton="True" ShowNextPageButton="False" />
                            <asp:NumericPagerField />
                            <asp:NextPreviousPagerField ShowLastPageButton="True" ShowPreviousPageButton="False" />
                        </Fields>
                    </asp:DataPager>

                </div>
                <div id="itemPlaceholderContainer" runat="server" style="">
                    <span runat="server" id="itemPlaceholder" />
                </div>
                <div class="pager">
                    <asp:DataPager ID="DataPager2" runat="server" PageSize="5">
                        <Fields>
                            <asp:NextPreviousPagerField ShowFirstPageButton="True" ShowNextPageButton="False" />
                            <asp:NumericPagerField />
                            <asp:NextPreviousPagerField ShowLastPageButton="True" ShowPreviousPageButton="False" />
                        </Fields>
                    </asp:DataPager>
                </div>
            </LayoutTemplate>
        </asp:ListView>

    </div>
    <%--        </ContentTemplate>
    </asp:UpdatePanel>--%>
    <asp:SqlDataSource ID="ItemSource" runat="server" ConnectionString="<%$ ConnectionStrings:NextStepConnectionString %>" DeleteCommand="DELETE FROM [Item] WHERE [ItemId] = @ItemId" InsertCommand="INSERT INTO [Item] ([ItemName], [Price], [PhotoName], [PhotoGuid], [Quantity], [Description], [CategoryId], [Active]) VALUES (@ItemName, @Price, @PhotoName, @PhotoGuid, @Quantity, @Description, @CategoryId, 1)" SelectCommand="SELECT * FROM [Item] WHERE ( ([CategoryId] = @CategoryId OR 0 = @CategoryId) AND ([ItemName] LIKE '%' + @ItemName + '%'))" UpdateCommand="UPDATE [Item] SET [ItemName] = @ItemName, [Price] = @Price, [PhotoName] = @PhotoName, [PhotoGuid] = @PhotoGuid, [Quantity] = @Quantity, [Description] = @Description, [CategoryId] = @CategoryId, [Active] = @Active WHERE [ItemId] = @ItemId">
        <DeleteParameters>
            <asp:Parameter Name="ItemId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ItemName" Type="String" />
            <asp:Parameter Name="Price" Type="Decimal" />
            <asp:Parameter Name="PhotoName" Type="String" />
            <asp:Parameter Name="PhotoGuid" Type="String" />
            <asp:Parameter Name="Quantity" Type="Int32" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="CategoryId" Type="Int32" />
            <asp:Parameter Name="Active" Type="Boolean" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlCategory" Name="CategoryId" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="txtProduct" DefaultValue=" " Name="ItemName" PropertyName="Text" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="ItemName" Type="String" />
            <asp:Parameter Name="Price" Type="Decimal" />
            <asp:Parameter Name="PhotoName" Type="String" />
            <asp:Parameter Name="PhotoGuid" Type="String" />
            <asp:Parameter Name="Quantity" Type="Int32" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="CategoryId" Type="Int32" />
            <asp:Parameter Name="ItemId" Type="Int32" />
            <asp:Parameter Name="Active" Type="Boolean" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="CategorySource" runat="server" ConnectionString="<%$ ConnectionStrings:NextStepConnectionString %>" SelectCommand="SELECT * FROM [Category]"></asp:SqlDataSource>
</asp:Content>


