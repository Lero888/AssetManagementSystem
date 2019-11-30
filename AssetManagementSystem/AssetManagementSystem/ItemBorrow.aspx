<%@ Page Title="Item Reservation XMUM" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ItemBorrow.aspx.cs" Inherits="AssetManagementSystem.ItemBorrow" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
         <div class ="row" style="margin-top: 40px;">
            <div class="col-md-12 text-center">
                <h1>Item Reservation</h1>
            </div>
        </div>
        
        <hr style="margin-bottom: 30px;" />
        <div>
            <h3 >Please choose the items to borrow.</h3><br />
        </div>
        <div class="row">
            <div class="col-md-4 text-center">
                <asp:ImageButton ID="ImageTable" runat="server" ImageUrl="~/Images/table.png" Height="255px" Width="428px"  CssClass="ImageMargin" OnClick="ImageTable_Click" />
                <asp:ImageButton ID="ImageTableDisabled" runat="server" ImageUrl="~/Images/table.png" Height="255px" Width="428px" Visible="false" Enabled="false" CssClass="ImageMargin" />
                <h4><strong>Table</strong></h4>
                <div class="row">
                    <div class="col-md-6 text-right">
                        <h4>Quantity: </h4>
                    </div>
                    <div class="col-md-6 text-left" style="margin-top:5px">
                        <asp:Label ID="TableQuantity" runat="server" Text="Label" Font-Size="20px"></asp:Label>
                    </div>
                </div>
                
            </div>

            <div class="col-md-4 text-center">
                <asp:ImageButton ID="ImageChair" runat="server" ImageUrl="~/Images/chair.png" Height="255px" Width="408px" CssClass="ImageMargin" OnClick="ImageChair_Click"/>
                <asp:ImageButton ID="ImageChairDisabled" runat="server" ImageUrl="~/Images/chair.png" Height="255px" Width="428px" Visible="false" Enabled="false" CssClass="ImageMargin" />
                 <h4><strong>Chair</strong></h4>
                 <div class="row">
                    <div class="col-md-6 text-right">
                        <h4>Quantity: </h4>
                    </div>
                    <div class="col-md-6 text-left" style="margin-top:5px">
                        <asp:Label ID="ChairQuantity" runat="server" Text="Label" Font-Size="20px"></asp:Label>
                    </div>
                </div>
            </div>

            <div class="col-md-4 text-center">
                <asp:ImageButton ID="ImageITFacilities" runat="server" ImageUrl="~/Images/ITfacilities.png" Height="255px" Width="422px" CssClass="ImageMargin" PostBackUrl="~/ItemIT.aspx"/>
                <h4><strong>IT Equipments</strong></h4>
            </div>
        </div>
    </div>
    
</asp:Content>
