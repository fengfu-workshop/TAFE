<%@ Page Language="C#" AutoEventWireup="true" CodeFile="testAddress.aspx.cs" Inherits="testAddress" %>

<%@ Register Src="~/Address.ascx" TagPrefix="uc1" TagName="Address" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Address</h1>
            <uc1:Address runat="server" ID="Address1" />
            <br />
            <asp:Button ID="btnSend" runat="server" Text="Send" OnClick="btnSend_Click" /><br />
            <br />
            <asp:Label ID="lblAddress" runat="server"></asp:Label>
        </div>
    </form>
</body>
</html>
