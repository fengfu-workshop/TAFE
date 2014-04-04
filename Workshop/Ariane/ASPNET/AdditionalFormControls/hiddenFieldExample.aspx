<%@ Page Language="C#" AutoEventWireup="true" CodeFile="hiddenFieldExample.aspx.cs" Inherits="hiddenFieldExample" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label1" runat="server" CssClass="myClass" Text="Label"></asp:Label>
        <br />
        <br />
    
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:HiddenField ID="HiddenField1" Value="fengfu.chen@gmail.com" runat="server" />
        <asp:FileUpload ID="FileUpload1" runat="server" />
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
    
        <br />
        <br />
        <asp:Calendar ID="Calendar1" runat="server" Font-Bold="False" Font-Italic="False" Font-Overline="False" ForeColor="#0033CC">
            <TitleStyle BackColor="#FF6600" />
        </asp:Calendar>
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
