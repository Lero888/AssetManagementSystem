<%@ Page Title="Item Borrowing XMUM" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ItemBorrowingForm.aspx.cs" Inherits="AssetManagementSystem.ItemBorrowingForm"%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <style>
        .col-md-2, .col-md-4, .col-md-8, .col-md-10 {
            padding-top: 10px;
            padding-bottom: 10px;
        }

        img {
            width: 428px;
            height: 255px;
        }

        @media screen and (max-width:1200px) {
            .text-right {
                margin-left: 30px;
            }
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
                <h1>Item Borrowing Details</h1>
            </div>
    </div>

    <hr style="margin-bottom: 50px;" />

    <div class="row">
        <div class="col-md-4 text-center">
            <div class="row">
                <img src="Images/Adapter.png" alt="Item" />
            </div>
                
            <div class="row" style="margin-top: 30px;">
                <div class="col-md-5 text-right">
                    <h4>Item: </h4>
                </div>
                <div class="col-md-7 text-left" style="margin-top: 10px;">

                </div>
            </div>
        </div>

        <div class="col-md-8">
            <div class="row" style="padding-top: 20px;">
                <div class="col-md-4 text-right">
                    <h4>Description: </h4>
                </div>
                <div class="col-md-8 text-left" style="margin-top: 10px;">

                </div>
            </div>  
        
            <div class="row">
                <div class="col-md-4 text-right">
                    <h4>Caution: </h4>
                </div>
                <div class="col-md-8 text-left" style="margin-top: 10px;">
                
                </div>
            </div>  

            <div class="row">
                <div class="col-md-4 text-right">
                    <h4>Amount Available:</h4>
                </div>
                <div class="col-md-8 text-left" style="margin-top: 10px;">
                
                </div>
            </div>
        </div>
    </div>  

    <h4 style="font-weight: 800; padding-top: 40px;">Please fill in the following details.</h4>
    <hr style="padding-bottom: 30px" />

    <div class="row">
        <div class="col-md-2 text-left">
            <h4>Date(Start): </h4>
        </div>
        <div class="col-md-10 text-left" style="margin-top: 10px;">
            <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
            <%--<asp:CustomValidator ID="DateStartValidator" runat="server" ErrorMessage="Please select a valid start date." ControlToValidate="Calendar1" OnServerValidate="DateStartValidator_ServerValidate"></asp:CustomValidator>--%>           
            <%--<asp:RangeValidator ID="DateStartValidator1" runat="server" controltovalidate="Calendar1" type="Date" minimumvalue="DateTime.Now.Date" maximumvalue="DateTime.Now.AddDays(30)" ErrorMessage="Please select a valid start date."></asp:RangeValidator>--%>
        </div>
    </div>
        
    <div class="row">
        <div class="col-md-2 text-left">
            <h4>Date(End): </h4>
        </div>
        <div class="col-md-10 text-left" style="margin-top: 10px;">
            <asp:Calendar ID="Calendar2" runat="server"></asp:Calendar>
            <%--<asp:CustomValidator ID="DateEndValidator" runat="server" ErrorMessage="Please select a valid end date." ControlToValidate="Calender2" OnServerValidate="DateEndValidator_ServerValidate"></asp:CustomValidator>--%>
            <%--<asp:RangeValidator ID="DateEndValidator1" runat="server" controltovalidate="Calendar2" type="Date" minimumvalue="DateTime.Now.Date" maximumvalue="DateTime.Now.AddDays(5)" ErrorMessage="Please select a valid start date."></asp:RangeValidator>--%>

        </div>
    </div>

    <div class="row">
        <div class="col-md-2 text-left">
            <h4>Tel No.: </h4>
        </div>
        <div class="col-md-10 text-left" style="margin-top: 10px;">
            <asp:TextBox ID="TbTel" runat="server" Width="310px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="TelValid" runat="server" ErrorMessage="Tel no. is required" ControlToValidate="TbTel"  ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
    </div>

    <div class="row">
        <div class="col-md-2 text-left">
            <h4>Amount: </h4>
        </div>
        <div class="col-md-10 text-left" style="margin-top: 10px;">
            <asp:TextBox ID="TbAmount" runat="server" Width="310px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="AmtValid" runat="server" ErrorMessage="Amount is required" ControlToValidate="TbAmount"  ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
    </div>

    <div class="row">
        <div class="col-md-2 text-left">
            <h4>Usage: </h4>
        </div>
        <div class="col-md-10 text-left" style="margin-top: 10px;">
            <asp:TextBox ID="TbUsage" runat="server" Width="310px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="UsageValid" runat="server" ErrorMessage="Usage is required" ControlToValidate="TbUsage"  ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12 text-left" style="padding-bottom: 30px;">
            <asp:Button ID="BtnSave" runat="server" Text="Save" CssClass="login-btn" style="margin-top: 20px;" OnClick="BtnSave_Click" />
        </div>
    </div>  
</asp:Content>

