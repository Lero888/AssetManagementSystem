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
    <script type="text/javascript">
        function validateDate() {
            if ('<%= CalendarDate.SelectedDate.Date ==DateTime.MinValue.Date  %>' == "True")
                alert('Select a date');
        }
    </script>

    <div class ="row" style="margin-top: 40px;">
            <div class="col-md-12 text-center">
                <h1>Item Borrowing Details</h1>
            </div>
    </div>

    <hr style="margin-bottom: 50px;" />

    <div class="row">
        <div class="col-md-4 text-center">
            <div class="row">
                <asp:Image ID="ImageItem" ImageUrl="~/" runat="server" />
            </div>
                
            <div class="row" style="margin-top: 30px;">
                <div class="col-md-5 text-right">
                    <h4><b>Item: </b></h4>
                </div>
                <div class="col-md-7 text-left">
                    <h4><asp:Label ID="LbItem" runat="server" Text="Label"></asp:Label></h4>
                </div>
            </div>

            <div class="row">
                <div class="col-md-5 text-right">
                    <h4><b>Department: </b></h4>
                </div>
                <div class="col-md-7 text-left">
                    <h4><asp:Label ID="LbDepartment" runat="server" Text="Label"></asp:Label></h4>
                </div>
            </div>
        </div>

        <div class="col-md-8">
            <div class="row" style="padding-top: 20px;">
                <div class="col-md-4 text-right">
                    <h4><b>Description: </b></h4>
                </div>
                <div class="col-md-8 text-left" style="margin-top: 10px;">
                    <asp:Label ID="LbDesc" runat="server" Text="Label"></asp:Label>
                </div>
            </div>  
        
            <div class="row">
                <div class="col-md-4 text-right">
                    <h4><b>Date: </b></h4>
                </div>
                <div class="col-md-4 text-left" style="margin-top: 10px;">

                    <asp:Calendar ID="CalendarDate" OnSelectionChanged="Date_Selection_Changed" runat="server">
                        <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />  
                        <SelectorStyle BackColor="#FFCC66" />  
                        <OtherMonthDayStyle ForeColor="#CC9966" />  
                        <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />  
                    </asp:Calendar>
                    <asp:Label ID="LbCalander" runat="server" Visible="false" ForeColor="Red" Text=""></asp:Label>           
                </div>
                <div class="col-md-4">
                    <div class="row" style="margin-top: 50px; margin-bottom: 30px;">
                        <div class="col-md-12">
                            <asp:Label ID="LbDate" runat="server" Text="Selected Date: " Font-Bold="True"></asp:Label>
                            <asp:Label ID="LbDateResult" runat="server" Text=""></asp:Label>
                        </div>
                    </div>
                   
                </div>
            </div> 

            <div class="row">
                <div class="col-md-4 text-right">
                    <h4><b>Amount Available: </b></h4>
                </div>
                <div class="col-md-8 text-left" style="margin-top: 10px;">
                    <asp:Label ID="LbAmount" runat="server" Text="Please select date to display."></asp:Label>
                </div>
            </div>
        </div>
    </div>  

    <h4 style="font-weight: 800; padding-top: 40px;">Please fill in the following details.</h4>
    <hr style="padding-bottom: 30px" />

      
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
            <asp:Label ID="LbAmount1" runat="server" Visible="false" ForeColor="Red" Text=""></asp:Label>
            <asp:RequiredFieldValidator ID="AmtValid" runat="server" ErrorMessage="Amount is required" ControlToValidate="TbAmount"  ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:CustomValidator ID="CustomAmt" runat="server" ErrorMessage="" ForeColor="Red" OnServerValidate="Amount_Validate" ControlToValidate="TbAmount"></asp:CustomValidator>
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
            <asp:Button ID="BtnSave" runat="server" Text="Save" CssClass="login-btn" OnClientClick="validateDate()" style="margin-top: 20px;" OnClick="BtnSave_Click" />
            <asp:Label ID="LbSave" runat="server" Visible="false" ForeColor="Red" Text="Label"></asp:Label>
        </div>
    </div>  

    <div class="row">
        <div class="col-md-12 text-left" style="padding-bottom: 30px;">
            
        </div>
    </div> 
</asp:Content>

