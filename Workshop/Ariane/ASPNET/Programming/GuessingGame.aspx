<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GuessingGame.aspx.cs" Inherits="GuessingGame" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        What number am I thinking of ?<br />
        <br />
        <asp:DropDownList ID="ddlNumber" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlNumber_SelectedIndexChanged">
            <asp:ListItem>1</asp:ListItem>
            <asp:ListItem>2</asp:ListItem>
            <asp:ListItem>3</asp:ListItem>
            <asp:ListItem>4</asp:ListItem>
            <asp:ListItem>5</asp:ListItem>
            <asp:ListItem>6</asp:ListItem>
            <asp:ListItem>7</asp:ListItem>
            <asp:ListItem>8</asp:ListItem>
            <asp:ListItem>9</asp:ListItem>
            <asp:ListItem>10</asp:ListItem>
            <asp:ListItem></asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
        <asp:Button ID="btnGo" runat="server" OnClick="btnGo_Click" Text="Go" />
        <br />
        <br />
        <asp:Label ID="lblMessage" runat="server"></asp:Label>
    
    </div>
    </form>
</body>
</html>
