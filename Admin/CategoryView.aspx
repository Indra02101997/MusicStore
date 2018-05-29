<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="CategoryView.aspx.cs" Inherits="Admin_CategoryView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="position:relative; top: -11px; left: 418px; height: 1000px; width: 938px; background-image: url('../Textures/textureforclient5.JPG'); text-align: center;">
    <asp:GridView ID="Categories" runat="server" AutoGenerateColumns="false" DataKeyNames="category_id" BackColor="#FFFDB0" CellPadding="15" CellSpacing="2" Font-Bold="True" Font-Names="Bernard MT Condensed" Font-Size="20pt" ForeColor="#009933" Width="500px" AllowPaging="True" OnPageIndexChanging="Categories_PageIndexChanging">
            <Columns>
                <asp:BoundField DataField="category_id" HeaderText="Category Id" SortExpression="category_id" Visible="false" />
                <asp:TemplateField HeaderText="Category Name">
                    <ItemTemplate>
                        <asp:Label ID="pcategory" runat="server" Text='<%# Bind("category_name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                      <asp:HyperLinkField  runat="server" DataNavigateUrlFields="category_id" DataNavigateUrlFormatString="CategoryEdit.aspx?pid={0}" Text="Edit" NavigateUrl="~/Admin/CategoryEdit.aspx" />
                      <asp:HyperLinkField  runat="server" DataNavigateUrlFields="category_id" DataNavigateUrlFormatString="CategoryDelete.aspx?pid={0}" Text="Delete" NavigateUrl="~/Admin/CategoryDelete.aspx"/>
            </Columns>
            <HeaderStyle BackColor="#FFFF99" BorderStyle="None" Font-Bold="True" Font-Names="Algerian" Font-Size="20pt" Font-Underline="True" ForeColor="#0066FF" HorizontalAlign="Center" />
        </asp:GridView>
    </div>
    <div style="position:relative; top: -1012px; left: -11px; height: 998px; width: 427px; background-image: url('../Textures/textureforclient5.JPG');"></div>
</asp:Content>

