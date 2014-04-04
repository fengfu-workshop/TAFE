<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Publishers.aspx.cs" Inherits="Publishers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PubConnectionString %>" SelectCommand="SELECT [pub_name], [pub_id] FROM [publishers]"></asp:SqlDataSource>
        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="pub_id">
            <LayoutTemplate>
                <div class="q6_left">
                    <asp:PlaceHolder ID="ItemPlaceHolder" runat="server"></asp:PlaceHolder>
                </div>
            </LayoutTemplate>

            <ItemTemplate>
                <div class="q6_item">                   
                    <asp:LinkButton ID="LinkButton1" CommandName="Select" runat="server"> <%# Eval("pub_name") %> </asp:LinkButton>
                </div>
            </ItemTemplate>

            <SelectedItemTemplate>
                <div class="q6_item">                   
                    <asp:LinkButton ID="LinkButton1" CommandName="Select" runat="server"> <%# Eval("pub_name") %> >> </asp:LinkButton>
                </div>

            </SelectedItemTemplate>
        </asp:ListView>
   
    
    </div>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PubConnectionString %>" 
            SelectCommand="SELECT [title], [price], [type], [pubdate] FROM [titles] WHERE ([pub_id] = @pub_id)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ListView1" Name="pub_id" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource2">
            <LayoutTemplate>
                <div class="q6_right">
                    <asp:PlaceHolder ID="ItemPlaceHolder" runat="server"></asp:PlaceHolder>
                </div>
            </LayoutTemplate>

            <ItemTemplate>                
                <%# Eval("title") %>
                <%# Eval("price", "{0:c}") %> <br />
                <%# Eval("type") %>
                <%# Eval("pubdate", "{0:d}") %> <br /><br />
            </ItemTemplate>
        </asp:ListView>
    </form>
</body>
</html>
