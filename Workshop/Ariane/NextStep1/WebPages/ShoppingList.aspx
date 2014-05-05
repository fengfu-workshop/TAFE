<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/NextStep.master" AutoEventWireup="true" CodeFile="ShoppingList.aspx.cs" Inherits="WebPages_ShoppingList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="shopping_list custom_button">
        <asp:Panel ID="pnlList" runat="server">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" ShowFooter="True" OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_DataBound">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <a class="no_border" href="/WebPages/ItemDetails.aspx?Id=<%# Eval("ItemId") %>">
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("PhotoGuid", "/Images/Thumbs/{0}") %>' />
                            </a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ItemName" HeaderText="Item Name" />
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity">
                        <ItemStyle CssClass="text_centre" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Unit Price">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Price", "{0:c}") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            Total Price:
                        </FooterTemplate>
                        <ItemStyle CssClass="text_right" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Sub Total">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("SubTotal", "{0:c}") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:Label ID="lblTotalPrice" runat="server" Text="Label"></asp:Label>
                        </FooterTemplate>
                        <FooterStyle CssClass="text_right" />
                        <ItemStyle CssClass="text_right" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="lbDelete" CommandName="MyDelete" CommandArgument='<%# Eval("ItemId") %>' runat="server">Delete</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="lbMinusOne" CommandName="MinusOne" CommandArgument='<%# Eval("ItemId") %>' runat="server">-1</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="lbPlusOne" CommandName="PlusOne" CommandArgument='<%# Eval("ItemId") %>' runat="server">+1</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <div class="check_out clear_fix">
                <asp:HyperLink ID="lbBack" runat="server" CssClass="float_left" NavigateUrl="~/WebPages/ItemsSearch.aspx">continue shopping</asp:HyperLink>
                <asp:LinkButton ID="lbCheckOut" runat="server" CssClass="float_right" OnClick="lbCheckOut_Click">Check out</asp:LinkButton>
            </div>
        </asp:Panel>
        <asp:Panel ID="pnlCheckout" runat="server" Visible="False">
            <fieldset>
                <legend>Personal Information </legend>
                <label for="<%= tbFirstName.ClientID %>">First Name:</label>
                <asp:TextBox ID="tbFirstName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbFirstName" ErrorMessage="Please enter your first name" CssClass="error">*</asp:RequiredFieldValidator>
                <br />
                <label for="<%= tbLastName.ClientID %>">Last Name:</label>
                <asp:TextBox ID="tbLastName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ErrorMessage="Please enter your last name" ControlToValidate="tbLastName" runat="server" CssClass="error">*</asp:RequiredFieldValidator>
                <br />
                <label for="<%= tbAddress.ClientID %>">Delivery Address:</label>
                <asp:TextBox ID="tbAddress" runat="server" Rows="3" TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ErrorMessage="Please enter your address" ControlToValidate="tbAddress" runat="server" CssClass="error">*</asp:RequiredFieldValidator>
                <br />
                <label for="<%= tbContactNumber.ClientID %>">Contact Number:</label>
                <asp:TextBox ID="tbContactNumber" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ErrorMessage="Please enter your contact number" ControlToValidate="tbContactNumber" runat="server" CssClass="error" Display="Dynamic">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tbContactNumber" ErrorMessage="Invalid Australia phone number" ValidationExpression="^\({0,1}((0|\+61)(2|4|3|7|8)){0,1}\){0,1}(\ |-){0,1}[0-9]{2}(\ |-){0,1}[0-9]{2}(\ |-){0,1}[0-9]{1}(\ |-){0,1}[0-9]{3}$" CssClass="error" Display="Dynamic">*</asp:RegularExpressionValidator>
                <br />
                <label for="<%= tbEmailAddress.ClientID %>">Email Address:</label>
                <asp:TextBox ID="tbEmailAddress" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ErrorMessage="Please enter your email address" ControlToValidate="tbEmailAddress" runat="server" CssClass="error" Display="Dynamic">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ErrorMessage="Invalid email address" ControlToValidate="tbEmailAddress" runat="server" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" CssClass="error" Display="Dynamic">*</asp:RegularExpressionValidator>
                <br />
                <label for="<%= ddlPayment.ClientID %>">Payment:</label>
                <asp:DropDownList ID="ddlPayment" runat="server">
                    <asp:ListItem>Credit Card</asp:ListItem>
                </asp:DropDownList>
                <br />
                <label for="<%= tbCreditCard.ClientID %>">Credit Card Number:</label>
                <asp:TextBox ID="tbCreditCard" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ErrorMessage="Please enter your credit card number" ControlToValidate="tbCreditCard" runat="server" CssClass="error">*</asp:RequiredFieldValidator>
                <asp:CustomValidator ID="valCreditCard" runat="server" OnServerValidate="valCreditCard_Validation" ErrorMessage="Credit card number, expiry date and name on card are not match or invalid" CssClass="error" ControlToValidate="tbCreditCard" Display="Dynamic">*</asp:CustomValidator>
                <br />
                <label for="<%= tbExpiry.ClientID %>">Expiry Date:</label>
                <asp:TextBox ID="tbExpiry" runat="server" TextMode="Date"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ErrorMessage="Please enter the expiry date of your credit card" ControlToValidate="tbExpiry" runat="server" CssClass="error">*</asp:RequiredFieldValidator>
                <br />
                <label for="<%= tbNameOnCard.ClientID %>">Name on Credit Card:</label>
                <asp:TextBox ID="tbNameOnCard" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ErrorMessage="Please enter the name on your credit card" ControlToValidate="tbNameOnCard" runat="server" CssClass="error">*</asp:RequiredFieldValidator>
                <br />
                <%--<asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowModelStateErrors="False" ShowSummary="False" CssClass="error" />--%>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="False" ShowModelStateErrors="False" ShowSummary="True" CssClass="error" />
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
            </fieldset>
        </asp:Panel>
        <asp:Panel ID="pnlPurchased" CssClass="purchased clear_fix" runat="server" Visible="false">
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <a class="no_border" href="/WebPages/ItemDetails.aspx?Id=<%# Eval("ItemId") %>">
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("PhotoGuid", "/Images/Thumbs/{0}") %>' />
                            </a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ItemName" HeaderText="Item Name" />
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity">
                        <ItemStyle CssClass="text_centre" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Unit Price">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Price", "{0:c}") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            Total Price:
                        </FooterTemplate>
                        <ItemStyle CssClass="text_right" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Sub Total">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("SubTotal", "{0:c}") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:Label ID="lblTotalPrice" runat="server" Text="Label"></asp:Label>
                        </FooterTemplate>
                        <FooterStyle CssClass="text_right" />
                        <ItemStyle CssClass="text_right" />
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <p>
                Thank you for purchasing at NextStep. Your Order No is
                <asp:Label ID="lblOrderNo" runat="server" Text="NoderNo"></asp:Label>
            </p>
            <p>Your purchased products will be delived in 2 days</p>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque ac fermentum nunc. In id lacinia nibh. In vehicula dictum bibendum. Interdum et malesuada fames ac ante ipsum primis in faucibus. Fusce aliquet nisi venenatis egestas pulvinar. Nullam lectus nulla, dictum vel neque vel, dictum viverra felis. Integer ac felis vitae massa pharetra mattis. Duis iaculis hendrerit leo, eu porta velit sagittis tincidunt. Suspendisse imperdiet id diam in pharetra. Quisque eros tortor, porttitor in volutpat sed, volutpat ac orci. Curabitur in purus posuere justo imperdiet suscipit eu ac elit. Aliquam erat volutpat. Suspendisse at placerat nisi, eget varius sem. Aliquam erat volutpat. Curabitur bibendum nibh vitae tellus imperdiet vestibulum.</p>
            <p><asp:HyperLink ID="lnkBack" runat="server" CssClass="float_left" NavigateUrl="~/WebPages/ItemsSearch.aspx">Back to product</asp:HyperLink></p>
            <br /><br />
        </asp:Panel>
    </div>
</asp:Content>

