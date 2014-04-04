<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DropDownListExample.aspx.cs" Inherits="DropDownListExample" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label1" runat="server" Text="Which course are you studying ?"></asp:Label>
        <br />
        <br />
        <asp:DropDownList ID="ddlCourses" runat="server">
            <asp:ListItem Value="10335">Web Development</asp:ListItem>
            <asp:ListItem Value="10315">Web Design</asp:ListItem>
            <asp:ListItem>19002</asp:ListItem>
            <asp:ListItem>19010</asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
    
    </div>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Register" />
        <br />
        <br />
        <asp:Label ID="Label2" runat="server"></asp:Label>
    </form>
</body>
</html>
