<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RegistrationForm.aspx.cs" Inherits="RegistrationForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="wrapper" id="rbFavourit">
        <h1>Registration Form</h1>
        <fieldset>
            <legend>Details</legend>
            First Name:<asp:TextBox ID="tbFirstName" runat="server"></asp:TextBox>
            <br />
            Last Name:<asp:TextBox ID="tblastName" runat="server"></asp:TextBox>
            <br />
            <br />
            Address<br />
            <asp:TextBox ID="tbAddress" runat="server" TextMode="MultiLine"></asp:TextBox>
        </fieldset>

        <div class="clear_fix">
            <fieldset class="left">
                <legend>Favourite colour</legend>
                <asp:RadioButtonList ID="rbFavourite" runat="server">
                    <asp:ListItem>Red</asp:ListItem>
                    <asp:ListItem>Blue</asp:ListItem>
                    <asp:ListItem>Green</asp:ListItem>
                    <asp:ListItem>Pink</asp:ListItem>
                    <asp:ListItem>Purple</asp:ListItem>
                    <asp:ListItem>Orange</asp:ListItem>
                </asp:RadioButtonList>
            </fieldset>
         
            <fieldset class="right">
                <legend>Food you enjoy</legend>
                <asp:CheckBoxList ID="cbEnjoy" runat="server">
                    <asp:ListItem>Italian</asp:ListItem>
                    <asp:ListItem>Japanese</asp:ListItem>
                    <asp:ListItem>Thai</asp:ListItem>
                    <asp:ListItem>Burgers</asp:ListItem>
                </asp:CheckBoxList>
            </fieldset>
        </div>

        <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
        <br />
        <br />
       <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    
    </div>
    </form>
</body>
</html>
