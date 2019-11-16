<%@ Page Title="Item Borrowing XMUM" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ItemBorrowingForm.aspx.cs" Inherits="AssetManagementSystem.ItemBorrowingForm"%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="classroom h1" style="text-align: center;">
        Item Borrowing Details
    </div>
    <hr style="margin-bottom: 50px;" />

    <ul style="margin-left: -35px;">
        <li style="font-size: 1.1em; font-weight: bold; margin: 10px 0 10px 0;">Item: </li>
        <li style="font-size: 1.1em; font-weight: bold; margin: 10px 0 10px 0;">Description </li>
        <li style="font-size: 1.1em; font-weight: bold; margin: 10px 0 10px 0;">Caution </li>
        <li style="font-size: 1.1em; font-weight: bold; margin: 10px 0 10px 0;">Amount Available for Borrowing Purpose: </li>
        <li style="font-size: 1.1em; font-weight: bold; margin: 10px 0 10px 0;">Date(Start): </li>
        <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
        <li style="font-size: 1.1em; font-weight: bold; margin: 10px 0 10px 0;">Date(End): </li>
        <asp:Calendar ID="Calendar2" runat="server"></asp:Calendar>
        <li style="font-size: 1.1em; font-weight: bold; margin: 10px 0 10px 0;">Tel </li>
        <asp:TextBox ID="TextBox3" runat="server" Width="310px"></asp:TextBox>
        <li style="font-size: 1.1em; font-weight: bold; margin: 10px 0 10px 0;">Amount: </li>
        <asp:TextBox ID="TextBox4" runat="server" Width="310px"></asp:TextBox>
        <li  style="font-size: 1.1em; font-weight: bold; margin: 10px 0 10px 0;">Usage: </li>
        <li><textarea id="TextArea1" cols="50" rows="8"></textarea></li>
        <li><asp:Button ID="Button1" runat="server" Text="Save" style="margin-top: 20px;" /></li>
    </ul>
</asp:Content>

