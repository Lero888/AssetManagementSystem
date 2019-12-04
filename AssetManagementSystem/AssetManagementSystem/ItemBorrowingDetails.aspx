<%@ Page Title="Item Reservation Details XMUM" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ItemBorrowingDetails.aspx.cs" Inherits="AssetManagementSystem.ItemBorrowingDetails" %>
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
            <div class="row" style="margin-top: 30px;">
                <asp:Image ID="ImageItem" ImageUrl="~/" runat="server" />
            </div>
                
            <div class="row" style="margin-top: 40px;">
                <div class="col-md-4 text-right">
                    <h4>Item: </h4>
                </div>
                <div class="col-md-8 text-left" style="margin-top: 10px;">
                    <asp:Label ID="LbItem" runat="server" Text="Label"></asp:Label>
                </div>
            </div>
        </div>

        <div class="col-md-8">
            <div class="row">
                <div class="col-md-4 text-right">
                    <h4>Department: </h4>
                </div>
                <div class="col-md-8 text-left" style="margin-top: 10px;">
                    <asp:Label ID="LbDepartment" runat="server" Text="Label"></asp:Label>
                </div>
            </div>  

            <div class="row"">
                <div class="col-md-4 text-right">
                    <h4>Description: </h4>
                </div>
                <div class="col-md-8 text-left" style="margin-top: 10px;">
                    <asp:Label ID="LbDesc" runat="server" Text="Label"></asp:Label>
                </div>
            </div>  
        
            <div class="row">
                <div class="col-md-4 text-right">
                    <h4>Amount Borrowed:</h4>
                </div>
                <div class="col-md-8 text-left" style="margin-top: 10px;">
                    <asp:Label ID="LbAmount" runat="server" Text="Label"></asp:Label>
                </div>
            </div>

            <div class="row">
                <div class="col-md-4 text-right">
                    <h4>Tel No.:</h4>
                </div>
                <div class="col-md-8 text-left" style="margin-top: 10px;">
                    <asp:Label ID="LbTel" runat="server" Text="Label"></asp:Label>
                </div>
            </div>

            <div class="row">
                <div class="col-md-4 text-right">
                    <h4>Borrowing Date:</h4>
                </div>
                <div class="col-md-8 text-left" style="margin-top: 10px;">
                    <asp:Label ID="LbDate" runat="server" Text="Label"></asp:Label>
                </div>
            </div>

            <div class="row">
                <div class="col-md-4 text-right">
                    <h4>Status:</h4>
                </div>
                <div class="col-md-8 text-left" style="margin-top: 10px;">
                    <asp:Label ID="LbStatus" runat="server" Text="Label"></asp:Label>
                </div>
            </div>

        </div>
    </div>    

    <div class="row">
        <div class="col-md-6">
            <div class="row">
                <div class="col-md-6 text-right">
                    <h5 style="font-weight: 600; margin-top: 15px;">PIN (Retrieve Item): </h5>
                </div>
                <div class="col-md-6 text-left" style="margin-top: 10px;">
                    <asp:TextBox ID="TbPINRetrieve" runat="server" autocomplete="off" Width="210px"></asp:TextBox>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12 text-center" style="margin-top: 20px;">
                    <asp:Button ID="BtnConfirm" runat="server" Text="Confirm" OnClick="Button1_Click" />                    
                </div>
            </div>

            <div class="row">
                <div class="col-md-12 text-center" style="margin-top: 20px;">                    
                    <asp:Label ID="LbPINRetrieve" runat="server" Visible="false" ForeColor="Red" Text="Label"></asp:Label>
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="row">
                <div class="col-md-6 text-right">
                    <h5 style="font-weight: 600; margin-top: 15px;">PIN (Return Item): </h5>
                </div>
                <div class="col-md-6 text-left" style="margin-top: 10px;">
                    <asp:TextBox ID="TbPINReturn" runat="server" autocomplete="off" Width="210px"></asp:TextBox>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12 text-center" style="margin-top: 20px;">
                    <asp:Button ID="BtnConfirm2" runat="server" Text="Confirm" OnClick="Button2_Click" />                    
                </div>
            </div>

            <div class="row">
                <div class="col-md-12 text-center" style="margin-top: 20px;">                    
                    <asp:Label ID="LbPINReturn" runat="server" ForeColor="Red" Text="Please make sure the item is returned before entering the PIN."></asp:Label>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
