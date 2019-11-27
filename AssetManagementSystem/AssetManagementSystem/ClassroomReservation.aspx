<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ClassroomReservation.aspx.cs" Inherits="AssetManagementSystem.ClassroomReservation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <h1 class="text-center">Room Reservation</h1>
        <p class="text-center">&nbsp;</p>
        <div>
            <div id="info" style="text-align:center">
                <div>
                    <span id="start" style="margin:5px 5px;">
                    <span class="white_slot">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>Available&nbsp;&nbsp;&nbsp; <span class="green_slot">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>Reserved&nbsp;&nbsp;&nbsp;&nbsp; <span class="blue_slot">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>Need approval?&nbsp;&nbsp;&nbsp;&nbsp;
                    <span class="grey_slot">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>Closed
                    </span>
                </div>
                <div>
                      <h4>Reservation Date:  <asp:TextBox ID="BookDate" runat="server" TextMode="Date"></asp:TextBox></h4>
                 
                </div>

            </div>
        </div>
    </div>
    
</asp:Content>
