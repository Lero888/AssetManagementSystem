<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ItemIT.aspx.cs" Inherits="AssetManagementSystem.ItemIT" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
         <h1 class="text-center">Item to Borrow</h1>
        <div>
            <h3 >Please choose the items to borrow.</h3><br />
        </div>

        <div class="row">
            <div class="col-md-4 text-center">
                <asp:ImageButton ID="ImageMic" runat="server" ImageUrl="~/Images/microphone.png" Height="255px" Width="428px" style=""  CssClass="ImageMargin" />
                <h4 ><strong>Microphone</strong></h4>
                <div ><h4>Quantity: </h4></div>
            </div>

            <div class="col-md-4 text-center">
                <asp:ImageButton ID="ImageSpeaker" runat="server" ImageUrl="~/Images/speaker.png" Height="255px" Width="408px" CssClass="ImageMargin"/>
                 <h4 ><strong>Speaker</strong></h4>
                <div><h4>Quantity: </h4></div>

            </div>

            <div class="col-md-4 text-center">
                <asp:ImageButton ID="ImageAdapter" runat="server" ImageUrl="~/Images/Adapter.png" Height="255px" Width="422px" CssClass="ImageMargin" />
                <h4><strong>Adapter</strong></h4>
                <div><h4>Quantity: </h4></div>
            </div>
        </div>

    </div>
</asp:Content>
