<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/NextStep.master" AutoEventWireup="true" CodeFile="ShoppingList.aspx.cs" Inherits="WebPages_ShoppingList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            border-collapse: collapse;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="shopping_list">
        <table>
            <tr>
                <th></th>
                <th>Product</th>
                <th>Quantity</th>
                <th>Unit Price</th>
                <th>Sub Total</th>
                <th></th>
            </tr>

            <%    
                ShoppingCart Cart = (ShoppingCart)Session["Cart"];
                string url;

                foreach (KeyValuePair<string, Product> item in Cart.Products)
                {
                    url = String.Format("/Images/Thumbs/{0}", item.Value.PhotoGuid);
                    lbDelete.CommandArgument = item.Value.ItemId;
                
            %>

            <tr>
                <td><a href="/WebPages/ItemDetails.aspx?Id=<%= item.Value.ItemId %>"><img src="<%=url %>" alt="Product"/></a></td>
                <td><%= item.Value.ItemName %></td>
                <td><%= item.Value.Quantity %></td>
                <td>$<%= item.Value.Price %></td>
                <td>$<%= item.Value.Quantity*item.Value.Price %></td>
                <td>
                    <%--<a href="/WebPages/ItemDetails.aspx?Id=<%= item.Value.ItemId %>"><%= item.Value.ItemId %></a>--%>
                    <asp:LinkButton ID="lbDelete" OnClick="lbDelete_Click"  runat="server">Delete</asp:LinkButton>  
                    <% lbDelete.CommandArgument = item.Value.ItemId; %>        
                </td>
            </tr>

            <%
                    
                }
            %>
            <tr>
                <td></td><td></td><td></td><td>Total:</td><td><%= Cart.TotalPrice() %></td><td></td>
            </tr>
        </table>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    </div>
</asp:Content>

