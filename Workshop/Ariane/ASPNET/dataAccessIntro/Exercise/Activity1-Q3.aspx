<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Activity1-Q3.aspx.cs" Inherits="Exercise_Activity1_Q3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PUBSConnectionString1 %>" SelectCommand="SELECT [au_lname], [au_fname], [phone], [address], [city], [state], [zip], [contract] FROM [authors]"></asp:SqlDataSource>
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="True">
            <Columns>
                <asp:BoundField DataField="au_lname" HeaderText="Last Name" SortExpression="au_lname" FooterText="Author Data" />
                <asp:BoundField DataField="au_fname" HeaderText="First Name" SortExpression="au_fname" />
                <asp:BoundField DataField="phone" HeaderText="phone" SortExpression="phone" />
                <asp:BoundField DataField="address" HeaderText="address" SortExpression="address" />
                <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
                <asp:BoundField DataField="state" HeaderText="state" SortExpression="state" />
                <asp:BoundField DataField="zip" HeaderText="zip" SortExpression="zip" />
                <asp:CheckBoxField DataField="contract" HeaderText="contract" SortExpression="contract" />
                <asp:TemplateField HeaderText="Full Name" Visible="False"></asp:TemplateField>
            </Columns>
        </asp:GridView>
    
    </div>
    </form>
</body>
</html>
