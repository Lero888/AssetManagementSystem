<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BookingStatus.aspx.cs" Inherits="AssetManagementSystem.BookingStatus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>

        hr {
            margin-bottom: 40px;
        }

    </style>
    <div class="row" style="margin-top: 40px;">
        <div class="col-md-12 text-center">
            <h1>Item Borrowing Status</h1>
        </div>
    </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:campusassetConnectionString %>" SelectCommand="SELECT Items.ItemName, ItemBorrow.Quantity, ItemBorrow.BorrowDateTime, ItemBorrow.ReturnDateTime, ItemBorrow.Status FROM ItemBorrow INNER JOIN Items ON ItemBorrow.ItemID = Items.ItemID ORDER BY ItemBorrow.BorrowDateTime"></asp:SqlDataSource>
    
    <hr />
    
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Height="121px" Width="1027px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
        <Columns>
            <asp:BoundField DataField="ItemName" HeaderText="ItemName" SortExpression="ItemName" />
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
            <asp:BoundField DataField="BorrowDateTime" HeaderText="BorrowDateTime" SortExpression="BorrowDateTime" />
            <asp:BoundField DataField="ReturnDateTime" HeaderText="ReturnDateTime" SortExpression="ReturnDateTime" />
            <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
        </Columns>
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <RowStyle ForeColor="#000066" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#007DBB" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#00547E" />
    </asp:GridView>
</asp:Content>
