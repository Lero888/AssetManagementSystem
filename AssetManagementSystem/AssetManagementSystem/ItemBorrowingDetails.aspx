<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ItemBorrowingDetails.aspx.cs" Inherits="AssetManagementSystem.ItemBorrowingDetails" %>
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
                <img src="Images/Adapter.png" alt="Item" />
            </div>
                
            <div class="row" style="margin-top: 40px;">
                <div class="col-md-5 text-right">
                    <h4>Item: </h4>
                </div>
                <div class="col-md-7 text-left" style="margin-top: 10px;">
                    
                </div>
            </div>

            <div class="row" style="margin-top: 50px;">
                <div class="col-md-5 text-right">
                    <h4 style="font-weight: 600; margin-top: 15px;">PIN: </h4>
                </div>
                <div class="col-md-7 text-left" style="margin-top: 10px;">
                    <asp:TextBox ID="TbPIN" runat="server" Width="210px"></asp:TextBox>
                </div>
            </div>
        </div>

        <div class="col-md-8">
            <div class="row" style="padding-top: 20px;">
                <div class="col-md-4 text-right">
                    <h4>Department: </h4>
                </div>
                <div class="col-md-8 text-left" style="margin-top: 10px;">

                </div>
            </div>  

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
                    <h4>Amount Borrowed:</h4>
                </div>
                <div class="col-md-8 text-left" style="margin-top: 10px;">
                
                </div>
            </div>

            <div class="row">
                <div class="col-md-4 text-right">
                    <h4>Tel No.:</h4>
                </div>
                <div class="col-md-8 text-left" style="margin-top: 10px;">
                
                </div>
            </div>

            <div class="row">
                <div class="col-md-4 text-right">
                    <h4>Date(Start):</h4>
                </div>
                <div class="col-md-8 text-left" style="margin-top: 10px;">
                
                </div>
            </div>

            <div class="row">
                <div class="col-md-4 text-right">
                    <h4>Date(End):</h4>
                </div>
                <div class="col-md-8 text-left" style="margin-top: 10px;">
                
                </div>
            </div>

            <div class="row">
                <div class="col-md-4 text-right">
                    <h4>Date(End):</h4>
                </div>
                <div class="col-md-8 text-left" style="margin-top: 10px;">
                
                </div>
            </div>
        </div>
    </div>    
</asp:Content>
