<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Test.aspx.cs" Inherits="Test_Test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .cart {
            -webkit-border-radius: 10px 10px 10px 10px;
            border-radius: 10px 10px 10px 10px;
            display: block;
            width: 20px;
            height: 15px;
            background-color: red;
            color: white;
            text-align: center;
            line-height: 15px;
            font-size: 80%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <asp:FileUpload ID="FileUpload1" runat="server" />
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Button" />
            <br />
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>

            <hr />
            <asp:Label ID="lblCart" runat="server" CssClass="cart" Text="98"></asp:Label>
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" ShowFooter="true" OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_DataBound">
                <Columns>
                    <asp:ImageField DataImageUrlField="PhotoGuid" DataImageUrlFormatString="/Images/Thumbs/{0}">
                        <ControlStyle Height="100px" Width="100px" />
                    </asp:ImageField>
                    <asp:BoundField DataField="ItemId" HeaderText="Item Id" />
                    <asp:BoundField DataField="ItemName" HeaderText="Item Name" />
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                    <asp:BoundField DataField="Price" HeaderText="Unit Price" DataFormatString="{0:c}" />
                    <asp:TemplateField HeaderText="Sub Total">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("SubTotal") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:Label ID="lblTotalPrice" runat="server" Text="Label"></asp:Label>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:ButtonField ButtonType="Button" CommandName="MyDelete" Text="Delete" DataTextField="ItemId" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" CommandName="MyDelete" CommandArgument='<%# Eval("ItemId") %>' runat="server">LinkButton</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <hr />
        <asp:Button ID="btnInsertData" runat="server" Text="Button" OnClick="btnInsertData_Click"/>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NextStepConnectionString %>" InsertCommand="INSERT INTO [Order] ([FirstName], [LastName], [Address], [ContactNumber], [Email], [Payment], [CreditCardNo], [ExpiryDate], [NameOnCard]) VALUES (@FirstName, @LastName, @Address, @ContactNumber, @Email, @Payment, @CreditCardNo, @ExpiryDate, @NameOnCard)" SelectCommand="SELECT * FROM [Order]" >

        </asp:SqlDataSource>
    </form>
</body>

</html>
