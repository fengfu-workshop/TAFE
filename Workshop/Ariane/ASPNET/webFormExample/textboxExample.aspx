<%@ Page Language="C#" AutoEventWireup="true" CodeFile="textboxExample.aspx.cs" Inherits="textboxExample" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        Single Line:<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>

    
        <br />
        Password:<asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
        <br />
        Multiline:<asp:TextBox ID="TextBox3" runat="server" TextMode="MultiLine"></asp:TextBox>
        <br />
        color:<asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
        <br />
        Date:<asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
        <br />
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <br />
        <br />
        <br />
        <br />
        <asp:Panel ID="Panel1" runat="server" BackColor="#99FF99" Width="200px">
            Please Enter Your Name:<br />
            <asp:TextBox ID="TextBox6" runat="server" BackColor="#33CCFF"></asp:TextBox>
            <br />
            Address:<br />
            <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
            <br />
            Password:<br />
            <asp:TextBox ID="TextBox8" runat="server" TextMode="Password" BackColor="#CCCCCC"></asp:TextBox>
            <br />
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Button" />
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
        </asp:Panel>

    
    </div>
    </form>
</body>
</html>
