<%@ Page Title="Item Reservation - IT equipment XMUM" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ItemIT.aspx.cs" Inherits="AssetManagementSystem.ItemIT" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
         <div class ="row" style="margin-top: 40px;">
            <div class="col-md-12 text-center">
                <h1>Item Reservation - IT Equipment</h1>
            </div>
        </div>
        
        <hr style="margin-bottom: 30px;" />
        <div>
            <h3 >Please choose the items to borrow.</h3><br />
        </div>

        <div class="row">
            <div class="col-md-4 text-center">
                <asp:ImageButton ID="ImageSpeaker" runat="server" ImageUrl="~/Images/speaker.png" Height="255px" Width="408px" CssClass="ImageMargin" OnClick="ImageSpeaker_Click"/>
                <asp:ImageButton ID="ImageSpeakerDisabled" runat="server" ImageUrl="~/Images/speaker.png" Height="255px" Width="428px" Visible="false" Enabled="false" CssClass="ImageMargin" />
                 <h4 ><strong>Speaker</strong></h4>
                <div class="row">
                    <div class="col-md-6 text-right">
                        <h4>Quantity: </h4>
                    </div>
                    <div class="col-md-6 text-left" style="margin-top:5px">
                        <asp:Label ID="SpeakerQuantity" runat="server" Text="Label" Font-Size="20px"></asp:Label>
                    </div>
                </div>
            </div>

            <div class="col-md-4 text-center">
                <asp:ImageButton ID="ImageMic" runat="server" ImageUrl="~/Images/microphone.png" Height="255px" Width="428px" style=""  CssClass="ImageMargin" OnClick="ImageMic_Click" />
                <asp:ImageButton ID="ImageMicDisabled" runat="server" ImageUrl="~/Images/microphone.png" Height="255px" Width="428px" Visible="false" Enabled="false" CssClass="ImageMargin" />
                <h4 ><strong>Microphone</strong></h4>
                <div class="row">
                    <div class="col-md-6 text-right">
                        <h4>Quantity: </h4>
                    </div>
                    <div class="col-md-6 text-left" style="margin-top:5px">
                        <asp:Label ID="MicQuantity" runat="server" Text="Label" Font-Size="20px"></asp:Label>
                    </div>
                </div>
            </div>

            <div class="col-md-4 text-center">
                <asp:ImageButton ID="ImageAdapter" runat="server" ImageUrl="~/Images/Adapter.png" Height="255px" Width="422px" CssClass="ImageMargin" OnClick="ImageAdapter_Click" />
                <asp:ImageButton ID="ImageAdapterDisabled" runat="server" ImageUrl="~/Images/Adapter.png" Height="255px" Width="428px" Visible="false" Enabled="false" CssClass="ImageMargin" />
                <h4><strong>Adapter</strong></h4>
                <div class="row">
                    <div class="col-md-6 text-right">
                        <h4>Quantity: </h4>
                    </div>
                    <div class="col-md-6 text-left" style="margin-top:5px">
                        <asp:Label ID="AdapterQuantity" runat="server" Text="Label" Font-Size="20px"></asp:Label>
                    </div>
                </div>
            </div>
        </div>

    </div>
</asp:Content>
