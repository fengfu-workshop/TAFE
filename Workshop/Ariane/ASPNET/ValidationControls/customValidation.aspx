<%@ Page Language="C#" AutoEventWireup="true" CodeFile="customValidation.aspx.cs" Inherits="customValidation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script>
        function clientSideTest(source, arguments) {
            if ((arguments.Value % 2) == 0) {
                arguments.IsValid = true;
            }
            else {
                arguments.IsValid = false;           
            }
            return arguments.IsValid;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:CustomValidator ID="CustomValidator1" runat="server" ClientValidationFunction="clientSideTest" ControlToValidate="TextBox1" ErrorMessage="Please enter a even number"></asp:CustomValidator>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Button" />
    
    </div>
    </form>
</body>
</html>
