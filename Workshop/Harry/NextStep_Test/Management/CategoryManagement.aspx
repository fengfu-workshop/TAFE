<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Management.master" AutoEventWireup="true" CodeFile="CategoryManagement.aspx.cs" Inherits="Management_CategoryManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <%--<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>--%>

    <div class="centre_box width800">
        <div class="edit_box title_box width400 shadow_box float">
            <h3>Modify Category Data</h3>
<%--            <asp:UpdatePanel ID="UpdatePanel1" runat="server">--
                <ContentTemplate>--%>
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" CssClass="grid_style" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" AutoGenerateColumns="False" DataKeyNames="CategoryId" DataSourceID="SqlDataSource1" GridLines="None" OnRowDataBound="GridView1_RowDataBound" CellSpacing="-1">
                        <AlternatingRowStyle CssClass="alt"></AlternatingRowStyle>
                        <Columns>
                            <asp:TemplateField ShowHeader="False">
                                <EditItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Update" Text="Update"></asp:LinkButton>
                                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure you want to delete this Category?');"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="CategoryId" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="CategoryId" />
                            <asp:BoundField DataField="CategoryName" HeaderText="Name" SortExpression="CategoryName" />
                            <asp:CheckBoxField DataField="Active" HeaderText="Active" SortExpression="Active" />
                        </Columns>
                        <PagerStyle CssClass="pgr"></PagerStyle>
                    </asp:GridView>
<%--                </ContentTemplate>
            </asp:UpdatePanel>--%>
        </div>
        <div class="create_category edit_box title_box width300 shadow_box float">
            <h3>Create Category Data</h3>
            <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" DefaultMode="Insert" AutoGenerateRows="False" DataKeyNames="CategoryId" DataSourceID="SqlDataSource1" GridLines="None" CellSpacing="-1">
                <Fields>
                    <asp:BoundField DataField="CategoryId" HeaderText="CategoryId" InsertVisible="False" ReadOnly="True" SortExpression="CategoryId" />
                    <%--<asp:BoundField DataField="CategoryName" HeaderText="Category: " SortExpression="CategoryName" />--%>
                    <asp:TemplateField HeaderText="Category:  " SortExpression="CategoryName">
                        <InsertItemTemplate>
                            <asp:TextBox ID="txtCategory" runat="server" Text='<%# Bind("CategoryName") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCategory" ErrorMessage="Please enter a category name" CssClass="error">*</asp:RequiredFieldValidator>
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowModelStateErrors="False" ShowSummary="False" CssClass="error" />
                       </InsertItemTemplate>
                   </asp:TemplateField>
                    <asp:CommandField ShowInsertButton="True" />
                </Fields>
            </asp:DetailsView>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" OnDeleted="OnRecordDeleted" ConnectionString="<%$ ConnectionStrings:NextStepConnectionString %>" SelectCommand="SELECT [CategoryId], [CategoryName], [Active] FROM [Category] ORDER BY [CategoryId] DESC" DeleteCommand="DELETE FROM [Category] WHERE [CategoryId] = @CategoryId" InsertCommand="INSERT INTO [Category] ([CategoryName]) VALUES (@CategoryName)" 
            UpdateCommand="UPDATE [Category] SET [CategoryName] = @CategoryName, [Active] = @Active WHERE [CategoryId] = @CategoryId; UPDATE [Item] SET [Active] = @Active WHERE [CategoryId] = @CategoryId">
            <DeleteParameters>
                <asp:Parameter Name="CategoryId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="CategoryName" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:Parameter DefaultValue="true" Name="Active" Type="Boolean" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="CategoryName" Type="String" />
                <asp:Parameter Name="CategoryId" Type="Int32" />
                <asp:Parameter Name="Active" Type="Boolean" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>

</asp:Content>

