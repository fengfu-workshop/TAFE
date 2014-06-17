<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Test2.aspx.cs" Inherits="Test_Test2" %>

<script runat="server">
    protected void submit_OnClick(object sender,  EventArgs e)
    {

        //if (FormsAuthentication.Authenticate(username.Text, password.Text))
        //    FormsAuthentication.RedirectFromLoginPage(username.Text, true);
        //else
        //    loginInvalid.Visible = true;
    }
</script>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <p>User Name  <% = User.Identity.Name %>  </p>
            <p>Is Authenticated  <% = User.Identity.IsAuthenticated %>  </p>
            <p>Authentication Type  <% = User.Identity.AuthenticationType %>  </p>
        </div>

        <div>
            <asp:Literal runat="server" ID="loginInvalid" Visible="false">
            Login invalid. Try again.
            </asp:Literal>
        </div>

        <div>
            Username:
            <asp:TextBox runat="server" ID="username" />
            <br />
            Password:
            <asp:TextBox runat="server" ID="password" TextMode="Password" />
            <br />
            <asp:Button runat="server" ID="submit" Text="Login" OnClick="submit_OnClick" />
        </div>
    </form>
</body>
</html>
