<%@ Page Title="About" Language="C#" MasterPageFile="~/MasterPages/NextStep.master" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="Test_About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="sub_header clear_fix">
        <img src="/images/Information.png" alt="Information" />
        <h2>About NextStep</h2>
    </div>
    <script>
        $(function () {
            $(".hnav a:contains('About')").addClass("active");
        });
    </script>
</asp:Content>

