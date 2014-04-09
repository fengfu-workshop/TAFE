<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div>
            <p>Page Load: <asp:Label ID="lblPageLoad" runat="server"></asp:Label></p>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    Inside update Panel:
                    <asp:Label ID="lblPartialPostback" runat="server"></asp:Label>
<%--                    <asp:Button ID="btnPartial" runat="server" Text="Display Date and Time" OnClick="btnPartial_Click" />--%>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnPartial" />
                </Triggers>
            </asp:UpdatePanel>
                    <asp:Button ID="btnPartial" runat="server" Text="Display Date and Time" OnClick="btnPartial_Click" />
            <p> Outside Panel: 
                <asp:Label ID="lblFullPostback" runat="server"></asp:Label>
                <asp:Button ID="btnFull" runat="server" Text="Display Date and Time" OnClick="btnFull_Click" />
            </p>

        </div>
    </form>
</body>
</html>
