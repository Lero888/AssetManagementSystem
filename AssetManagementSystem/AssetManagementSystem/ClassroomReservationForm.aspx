<%@ Page Title="Reservation Classroom Booking Form XMUM" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ClassroomReservationForm.aspx.cs" Inherits="AssetManagementSystem.ClassroomBookingForm"%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

        <style>
            .col-md-4, .col-md-8 {
                padding-top: 10px;
                padding-bottom: 10px;
            }

            @media screen and (max-width:992px) {
                .text-right {
                    text-align: left;
                    margin-left: 30px;
                }
            }
        </style>

        <div class ="row" style="margin-top: 40px;">
            <div class="col-md-12 text-center">
                <h1>Room Reservation Details</h1>
            </div>
        </div>

        <hr style="margin-bottom: 30px;" />

        <div class="row">
            <div class="col-md-4 text-right">
                <h4>Room: </h4>
                
            </div>
            <div class="col-md-8 text-left" style="margin-top: 10px;">
                <asp:TextBox ID="RoomName" runat="server" ReadOnly="True" CssClass="form-control"></asp:TextBox>
            </div>
        </div>  

        <div class="row row-centered">
            <div class="col-md-4 text-right">
                <h4>Date: </h4>
                
            </div>
            <div class="col-md-8 text-left" style="margin-top: 10px;">
                <asp:TextBox ID="RoomDate" runat="server" ReadOnly="True" CssClass="form-control"></asp:TextBox>
            </div>
        </div>  
        
        <div class="row justify-content-center">
            <div class="col-md-4 text-right">
                <h4>Time: </h4>
                
            </div>
            <div class="col-md-8 text-left" style="margin-top: 10px;">
                <asp:TextBox ID="RoomTime" runat="server" ReadOnly="True" CssClass="form-control"></asp:TextBox>
            </div>
        </div>  

        <div class="row justify-content-center">
            <div class="col-md-4 text-right">
                <h4>Tel: </h4>
            </div>
            <div class="col-md-8 text-left" style="margin-top: 10px;">
                <asp:TextBox ID="Tel" runat="server" Width="310px" CssClass="form-group-default required"></asp:TextBox>
                <asp:RequiredFieldValidator ID="TelValid" runat="server" ErrorMessage="Tel No. is required" ForeColor="Red" ControlToValidate="Tel"></asp:RequiredFieldValidator>
            </div>
        </div>  

        <div class="row">
            <div class="col-md-4 text-right">
                <h4>Usage: </h4>
            </div>
            <div class="col-md-8 text-left" style="margin-top: 10px;">
                <asp:TextBox ID="UsageTxt" runat="server" TextMode="MultiLine" Height="55px" Width="589px" style="max-height:55px"></asp:TextBox>
            </div>
        </div>
        
        <div class="row justify-content-center">
            <div class="col-md-11 text-center" style="padding-bottom: 30px;">
                <asp:Button ID="SaveBtn" runat="server" Text="Save" CssClass="login-btn" style="margin-top: 20px;"  OnClick="SaveBtn_Click"/>
            </div>
        </div>  

</asp:Content>
