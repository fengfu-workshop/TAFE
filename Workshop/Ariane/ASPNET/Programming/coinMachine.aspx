<%@ Page Language="C#" AutoEventWireup="true" CodeFile="coinMachine.aspx.cs" Inherits="coinMachine" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        Enter Amount in cents:<br />
        <asp:TextBox ID="txtCents" runat="server"></asp:TextBox>
        <asp:Label ID="lblError" runat="server"></asp:Label>
        <br />
        <asp:Button ID="btnCalculate" runat="server" OnClick="Button1_Click" Text="Calculate" />
        <asp:Button ID="btnReset" runat="server" Text="Reset" OnClick="btnReset_Click" />
        <hr />

        <p>
        $100:<asp:Label ID="lbl100D" runat="server"></asp:Label>
        </p>

        <p>
        $50:<asp:Label ID="lbl50D" runat="server"></asp:Label>
        </p>

       <p>
        $20:<asp:Label ID="lbl20D" runat="server"></asp:Label>
        </p>

       <p>
        $10:<asp:Label ID="lbl10D" runat="server"></asp:Label>
        </p>

        <p>
        $5:<asp:Label ID="lbl5D" runat="server"></asp:Label>
        </p>

       <p>
        $2:<asp:Label ID="lbl2D" runat="server"></asp:Label>
        </p>

       <p>
        $1:<asp:Label ID="lbl1D" runat="server"></asp:Label>
        </p>

       <p>
        50c:<asp:Label ID="lbl50c" runat="server"></asp:Label>
        </p>

       <p>
        20c:<asp:Label ID="lbl20c" runat="server"></asp:Label>
        </p>

       <p>
        10c:<asp:Label ID="lbl10c" runat="server"></asp:Label>
        </p>

       <p>
        5c:<asp:Label ID="lbl5c" runat="server"></asp:Label>
        </p>

        <p>
        1c:<asp:Label ID="lbl1c" runat="server"></asp:Label>
        </p>
      
    </div>
    </form>
</body>
</html>
