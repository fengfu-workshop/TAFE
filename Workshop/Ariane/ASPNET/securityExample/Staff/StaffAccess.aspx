<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StaffAccess.aspx.cs" Inherits="Staff_StaffAccess" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1>Hello this is the staff page you should be logged in</h1>
        <p>
            <asp:LoginStatus ID="LoginStatus1" runat="server" />
        </p>
        <p>
            <asp:LoginName ID="LoginName1" runat="server" />
        </p>
    </div>
    </form>
</body>
</html>
