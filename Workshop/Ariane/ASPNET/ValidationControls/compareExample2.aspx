<%@ Page Language="C#" AutoEventWireup="true" CodeFile="compareExample2.aspx.cs" Inherits="compareExample2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        min: <asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem>-10</asp:ListItem>
            <asp:ListItem>0</asp:ListItem>
            <asp:ListItem>50</asp:ListItem>
            <asp:ListItem></asp:ListItem>
        </asp:DropDownList>
&nbsp;max:<asp:DropDownList ID="DropDownList2" runat="server">
            <asp:ListItem>0</asp:ListItem>
            <asp:ListItem>20</asp:ListItem>
            <asp:ListItem>70</asp:ListItem>
            <asp:ListItem></asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
        DOB:
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="TextBox1" ErrorMessage="Please enter a valid date" Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Button" />
        <br />
        <br />
        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="DropDownList2" ControlToValidate="DropDownList1" ErrorMessage="min must be less than max" Operator="LessThan" Type="Integer"></asp:CompareValidator>
        <br />
        <br />
        Min:<asp:DropDownList ID="ddlMin" runat="server">
            <asp:ListItem>-10</asp:ListItem>
            <asp:ListItem>10</asp:ListItem>
            <asp:ListItem>20</asp:ListItem>
            <asp:ListItem></asp:ListItem>
        </asp:DropDownList>
&nbsp; Max:
        <asp:DropDownList ID="ddlMax" runat="server">
            <asp:ListItem>10</asp:ListItem>
            <asp:ListItem>20</asp:ListItem>
            <asp:ListItem>30</asp:ListItem>
            <asp:ListItem></asp:ListItem>
        </asp:DropDownList>
        <asp:CompareValidator ID="CompareValidator3" runat="server" ControlToCompare="ddlMax" ControlToValidate="ddlMin" CssClass="error" ErrorMessage="CompareValidator" Operator="LessThan" SetFocusOnError="True" Type="Integer"></asp:CompareValidator>
        <br />
        <br />
        DOB:
        <asp:TextBox ID="tbBrith" runat="server"></asp:TextBox>
        <asp:CompareValidator ID="CompareValidator4" runat="server" ControlToValidate="tbBrith" CssClass="error" Display="Dynamic" ErrorMessage="CompareValidator" Operator="DataTypeCheck" Type="Date">*</asp:CompareValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbBrith" CssClass="error" Display="Dynamic" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Button ID="Button2" runat="server" Text="Button" />
    
        <br />
        <br />
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" />
    
    </div>
    </form>
</body>
</html>
