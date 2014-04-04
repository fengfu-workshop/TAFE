<%@ Page Language="C#" AutoEventWireup="true" CodeFile="WizardExample.aspx.cs" Inherits="WizardExample" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Wizard ID="Wizard1" runat="server" OnFinishButtonClick="Wizard1_FinishButtonClick">
            <WizardSteps>
                <asp:WizardStep runat="server" title="Name">
                    First Name:<asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                    <br />
                    Last Name:<asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
                </asp:WizardStep>
                <asp:WizardStep ID="WizardStep1" runat="server" title="Address">
                    Address:<asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
                </asp:WizardStep>
                <asp:WizardStep ID="WizardStep2" runat="server" title="Phone">
                    Home:<asp:TextBox ID="txtHome" runat="server"></asp:TextBox>
                    <br />
                    Mobile:<asp:TextBox ID="txtMobile" runat="server"></asp:TextBox>
                </asp:WizardStep>
            </WizardSteps>
        </asp:Wizard>
    
    </div>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    </form>
</body>
</html>
