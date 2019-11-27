<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ItemBorrow.aspx.cs" Inherits="AssetManagementSystem.ItemBorrow" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <h1 class="text-center">Item to Borrow</h1>
        <div>
            <h3 >Please choose the items to borrow.</h3><br />
        </div>
        <div class="row">
            <div class="col-md-4 text-center">
                <asp:ImageButton ID="ImageTable" runat="server" ImageUrl="~/Images/table.png" Height="255px" Width="428px"  CssClass="ImageMargin" />
                <h4><strong>Table</strong></h4>
                <div><h4>Quantity: </h4></div>
            </div>

            <div class="col-md-4 text-center">
                <asp:ImageButton ID="ImageChair" runat="server" ImageUrl="~/Images/chair.png" Height="255px" Width="408px" CssClass="ImageMargin"/>
                 <h4><strong>Chair</strong></h4>
                <div><h4 >Quantity: </h4></div>
            </div>

            <div class="col-md-4 text-center">
                <asp:ImageButton ID="ImageITFacilities" runat="server" ImageUrl="~/Images/ITfacilities.png" Height="255px" Width="422px" CssClass="ImageMargin" PostBackUrl="~/ItemIT.aspx"/>
                <h4><strong>IT Equipments</strong></h4>
            </div>
        </div>
    </div>
    
</asp:Content>
