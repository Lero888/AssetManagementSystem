<%@ Page Title="Reservation Classroom XMUM" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ClassroomBookingForm.aspx.cs" Inherits="AssetManagementSystem.ClassroomBookingForm"%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="classroom h1" style="text-align: center;">
        Room Reservation Details
    </div>
    <hr style="margin-bottom: 50px;" />

    <ul style="margin-left: -35px;">
        <li style="font-size: 1.1em; font-weight: bold; margin: 10px 0 10px 0;">Room: </li>
        <li style="font-size: 1.1em; font-weight: bold; margin: 10px 0 10px 0;">Date: </li>
        <li style="font-size: 1.1em; font-weight: bold; margin: 10px 0 10px 0;">Time: </li>
        <li style="font-size: 1.1em; font-weight: bold; margin: 10px 0 10px 0;">Tel: </li>
        <asp:TextBox ID="TextBox2" runat="server" Width="310px"></asp:TextBox>
        <li style="font-size: 1.1em; font-weight: bold; margin: 10px 0 10px 0;">Duration: </li>
        <asp:TextBox ID="TextBox1" runat="server" Width="310px"></asp:TextBox>
        <li  style="font-size: 1.1em; font-weight: bold; margin: 10px 0 10px 0;">Usage: </li>
        <li><textarea id="TextArea1" cols="50" rows="8"></textarea></li>
        <li><asp:Button ID="Button1" runat="server" Text="Save" style="margin-top: 20px;" /></li>
    </ul>



</asp:Content>
