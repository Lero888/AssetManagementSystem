<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="AssetManagementSystem.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container" >
        &nbsp;
        <div class="login" style="opacity:0.9; right: 10%; top: 24%; width: 346px; height: 291px;">
            <h4 class="text-center"><strong>Login</strong></h4>
            <div class="form-group form-group-default required">
                <asp:Label AssociatedControlID="Username" runat="server" Text="Username"></asp:Label><br />
                <asp:TextBox ID="Username" runat="server" Width="330px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="UNValid" runat="server" ErrorMessage="Username is required" ControlToValidate="Username" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group form-group-default required">
                <asp:Label AssociatedControlID="Password" runat="server" Text="Password"></asp:Label><br />
                <asp:TextBox ID="Password" runat="server" TextMode="Password" Width="330px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="PWValid" runat="server" ErrorMessage="Password is required" ControlToValidate="Password" ForeColor="Red"></asp:RequiredFieldValidator>

            </div>

            <div class="col-12 d-flex justify-content-end" style="margin-left: 250px">
                <asp:Button ID="LoginBtn" runat="server" Text="Login" CssClass="login-btn"/>
            </div>
        </div>
     
        <div>
            
        &nbsp;<img src="Images/XMUM.png" style="width: 1205px; height: 405px; margin-left: 0px; margin:0 auto 0 auto;"/></div>

    </div>
</asp:Content>
