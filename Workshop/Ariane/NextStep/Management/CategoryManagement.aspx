<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Management.master" AutoEventWireup="true" CodeFile="CategoryManagement.aspx.cs" Inherits="Management_CategoryManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <div class="centre_box width800">
        <div class="edit_box title_box width400 shadow_box float">
            <h3>Modify Category Data</h3>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" CssClass="grid_style" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" AutoGenerateColumns="False" DataKeyNames="CategoryId" DataSourceID="SqlDataSource1" GridLines="None">
                        <AlternatingRowStyle CssClass="alt"></AlternatingRowStyle>
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            <asp:BoundField DataField="CategoryId" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="CategoryId" />
                            <asp:BoundField DataField="CategoryName" HeaderText="Name" SortExpression="CategoryName" />
                        </Columns>

                        <PagerStyle CssClass="pgr"></PagerStyle>
                    </asp:GridView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div class="create_category edit_box title_box width300 shadow_box float">
            <h3>Create Category Data</h3>
            <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" DefaultMode="Insert" AutoGenerateRows="False" DataKeyNames="CategoryId" DataSourceID="SqlDataSource1" GridLines="None">
                <Fields>
                    <asp:BoundField DataField="CategoryId" HeaderText="CategoryId" InsertVisible="False" ReadOnly="True" SortExpression="CategoryId" />
                    <asp:BoundField DataField="CategoryName" HeaderText="Category:  " SortExpression="CategoryName" />
                    <asp:CommandField ShowInsertButton="True" />
                </Fields>
            </asp:DetailsView>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NextStepConnectionString %>" SelectCommand="SELECT [CategoryId], [CategoryName] FROM [Category]" DeleteCommand="DELETE FROM [Category] WHERE [CategoryId] = @CategoryId" InsertCommand="INSERT INTO [Category] ([CategoryName]) VALUES (@CategoryName)" UpdateCommand="UPDATE [Category] SET [CategoryName] = @CategoryName WHERE [CategoryId] = @CategoryId">
            <DeleteParameters>
                <asp:Parameter Name="CategoryId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="CategoryName" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="CategoryName" Type="String" />
                <asp:Parameter Name="CategoryId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>

</asp:Content>

