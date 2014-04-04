<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CompareExample.aspx.cs" Inherits="CompareExample" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        Select Number:
        <asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem>Please select a number</asp:ListItem>
            <asp:ListItem>12</asp:ListItem>
            <asp:ListItem>45</asp:ListItem>
            <asp:ListItem>56</asp:ListItem>
            <asp:ListItem>78</asp:ListItem>
        </asp:DropDownList>
        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="DropDownList1" CssClass="error" ErrorMessage="Please choose a number" Operator="NotEqual" SetFocusOnError="True" ValueToCompare="Please select a number"></asp:CompareValidator>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Button" />
    
        &nbsp;
        <asp:Button ID="Button2" runat="server" CausesValidation="False" Text="Cancel" />
    
        <br />
        <br />
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
    
    </div>
    </form>
</body>
</html>
