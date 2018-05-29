<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="ProductInfo.aspx.cs" Inherits="Admin_ProductInfo" %>
<%@ MasterType VirtualPath="~/Admin.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="position:relative; top: -11px; left: -7px; height: 1000px; width: 1368px; text-align: center; background-image: url('../Textures/textureforclient5.JPG');">
        <asp:GridView ID="Products" runat="server" AutoGenerateColumns="false" DataKeyNames="product_id" BackColor="#FFFDB0" CellPadding="15" CellSpacing="2" Font-Bold="True" Font-Names="Bernard MT Condensed" Font-Size="20pt" ForeColor="#009933" Width="1366px" AllowPaging="True" OnPageIndexChanging="Products_PageIndexChanging" EmptyDataText="No Products Available">
            <Columns>
                <asp:BoundField DataField="product_id" HeaderText="Product Id" SortExpression="product_id" Visible="false" />
                <asp:TemplateField HeaderText="Product Name">
                    <ItemTemplate>
                        <asp:Label ID="pname" runat="server" Text='<%# Bind("product_name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Posting Time">
                    <ItemTemplate>
                        <asp:Label ID="ptime" runat="server" Text='<%# Bind("product_cdate") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Product Category">
                    <ItemTemplate>
                        <asp:Label ID="pcategory" runat="server" Text='<%# Bind("category_name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                      <asp:HyperLinkField  runat="server" DataNavigateUrlFields="product_id" DataNavigateUrlFormatString="ProductEdit.aspx?pid={0}" Text="Edit" NavigateUrl="~/Admin/ProductEdit.aspx" />
                      <asp:HyperLinkField  runat="server" DataNavigateUrlFields="product_id" DataNavigateUrlFormatString="ProductDelete.aspx?pid={0}" Text="Delete" NavigateUrl="~/Admin/ProductDelete.aspx"/>
            </Columns>
            <HeaderStyle BackColor="#FFFF99" BorderStyle="None" Font-Bold="True" Font-Names="Algerian" Font-Size="20pt" Font-Underline="True" ForeColor="#0066FF" HorizontalAlign="Center" />
        </asp:GridView>
    </div>
</asp:Content>

