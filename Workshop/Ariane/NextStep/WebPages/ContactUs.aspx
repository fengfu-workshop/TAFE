<%@ Page Title="Contact Us" Language="C#" MasterPageFile="~/MasterPages/NextStep.master" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="Test_ContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="sub_header clear_fix">
        <img src="/images/contact.png" alt="Contact" />
        <h2>Contact NextStep</h2>
    </div>
    <asp:Panel ID="palContactForm" CssClass="contact_form shadow_box w500" runat="server">
        <section>
            <label for="<%= tbFirstName.ClientID %>">First Name:</label>
            <asp:TextBox ID="tbFirstName" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbFirstName" ErrorMessage="Please enter your first name" CssClass="error">*</asp:RequiredFieldValidator>
        </section>
        <section>
            <label for="<%= tbLastName.ClientID %>">Last Name:</label>
            <asp:TextBox ID="tbLastName" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ErrorMessage="Please enter your last name" ControlToValidate="tbLastName" runat="server" CssClass="error">*</asp:RequiredFieldValidator>
        </section>
        <section>
            <label for="<%= tbContactNumber.ClientID %>">Contact Number:</label>
            <asp:TextBox ID="tbContactNumber" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ErrorMessage="Please enter your contact number" ControlToValidate="tbContactNumber" runat="server" CssClass="error" Display="Dynamic">*</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tbContactNumber" ErrorMessage="Invalid Australia phone number" ValidationExpression="^\({0,1}((0|\+61)(2|4|3|7|8)){0,1}\){0,1}(\ |-){0,1}[0-9]{2}(\ |-){0,1}[0-9]{2}(\ |-){0,1}[0-9]{1}(\ |-){0,1}[0-9]{3}$" CssClass="error" Display="Dynamic">*</asp:RegularExpressionValidator>
        </section>
        <section>
            <label for="<%= tbEmailAddress.ClientID %>">Email Address:</label>
            <asp:TextBox ID="tbEmailAddress" runat="server" TextMode="Email"></asp:TextBox>
            <asp:RequiredFieldValidator ErrorMessage="Please enter your email address" ControlToValidate="tbEmailAddress" runat="server" CssClass="error" Display="Dynamic">*</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ErrorMessage="Invalid email address" ControlToValidate="tbEmailAddress" runat="server" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" CssClass="error" Display="Dynamic">*</asp:RegularExpressionValidator>
        </section>
        <section>
            <label for="<%= tbQuestion.ClientID %>">Question:</label>
            <asp:TextBox ID="tbQuestion" runat="server" TextMode="MultiLine" Rows="5"></asp:TextBox>
            <asp:RequiredFieldValidator ErrorMessage="Please enter your question" ControlToValidate="tbQuestion" runat="server" CssClass="error">*</asp:RequiredFieldValidator>
        </section>
        <br />
        <asp:Button ID="btnSubmit" runat="server" Text="Send" OnClick="btnSubmit_Click" />
        <br />
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowModelStateErrors="False" ShowSummary="False" CssClass="error" />
    </asp:Panel>
    <asp:Panel ID="pnlMailSent" CssClass="shadow_box w500 h500" runat="server" Visible="false">
        <br /><br />
        <asp:Label ID="Label1" runat="server" Text="Thank you for your question. We will back to you soon."></asp:Label>
        <br /><br />
        <a href="/">[Back to home]</a>  <a href="/WebPages/ItemsSearch.aspx">[Go shopping]</a>

    </asp:Panel>
</asp:Content>

