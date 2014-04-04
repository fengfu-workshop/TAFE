<%@ Page Language="C#" AutoEventWireup="true" CodeFile="foreachExample2.aspx.cs" Inherits="foreachExample2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem>Pop</asp:ListItem>
            <asp:ListItem>Latin</asp:ListItem>
            <asp:ListItem>Dance</asp:ListItem>
            <asp:ListItem>Rock</asp:ListItem>
            <asp:ListItem>Metal</asp:ListItem>
            <asp:ListItem>Classical</asp:ListItem>
        </asp:DropDownList>
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
        <br />
        <br />
        <asp:CheckBoxList ID="CheckBoxList1" runat="server">
            <asp:ListItem>Pop</asp:ListItem>
            <asp:ListItem>Latin</asp:ListItem>
            <asp:ListItem>Dance</asp:ListItem>
            <asp:ListItem>Rock</asp:ListItem>
            <asp:ListItem>Metal</asp:ListItem>
            <asp:ListItem>Classical</asp:ListItem>
        </asp:CheckBoxList>
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Button" />
        <br />
        <br />
        You did not select:<br />
        <asp:Label ID="lblDidnot" runat="server"></asp:Label>
        <br />
        <br />
        You did Select:<br />
        <asp:Label ID="lblDid" runat="server"></asp:Label>
    
    </div>
    </form>
</body>
</html>
