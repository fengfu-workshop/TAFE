<%@ Page Language="C#" AutoEventWireup="true" CodeFile="checkboxExample.aspx.cs" Inherits="checkboxExample" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        Which day you come to TAFE?<br />
        <asp:CheckBox ID="cbMon" Text="Monday" runat="server" />
        <br />
        <asp:CheckBox ID="cbTue" Text="Tuesday" runat="server" />
        <br />
       <asp:CheckBox ID="cbWed" Text="Wednesday" runat="server" AutoPostBack="True" OnCheckedChanged="cbWed_CheckedChanged" />
        <br />
        <asp:CheckBox ID="cbThu" Text="Thursday" runat="server" />
        <br />
       <asp:CheckBox ID="cbFri" Text="Friday" runat="server" />
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <br />    
    
    </div>
    </form>
</body>
</html>
