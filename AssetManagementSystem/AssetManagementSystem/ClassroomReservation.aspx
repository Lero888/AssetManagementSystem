<%@ Page Title="Reservation Classroom XMUM" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ClassroomReservation.aspx.cs" Inherits="AssetManagementSystem.ClassroomReservation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
         <div class ="row" style="margin-top: 40px;">
            <div class="col-md-12 text-center">
                <h1>Room Reservation</h1>
            </div>
        </div>
        
        <hr style="margin-bottom: 30px;" />
        <div>
            <div id="info" class= "text-center row">
                <div class="row">
                    <div class="col-md-5 text-right">
                         <h4>Reservation Date:  </h4>
                    </div>
                    <div class="col-md-7  text-left">
                          <asp:DropDownList ID="DropDownList1"  runat="server" OnSelectedIndexChanged="Page_Load" CssClass="form-control">                          
                          </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="DateValid" runat="server" ErrorMessage="Reservation date is required" ControlToValidate="DropDownList1"  ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                 <div class="row">
                     <div class="col-md-5 text-right">
                            <h4>Reservation Time:  </h4>
                     </div>
                    <div class="col-md-7  text-left">
                          <asp:DropDownList ID="DropDownList2"  runat="server" CssClass="form-control" >      
                              <asp:ListItem Value="9.00am-10.00am"></asp:ListItem>
                              <asp:ListItem Value="10.00am-11.00am"></asp:ListItem>
                              <asp:ListItem Value="11.00am-12.00pm"></asp:ListItem>
                              <asp:ListItem Value="12.00pm-1.00pm"></asp:ListItem>
                              <asp:ListItem Value="1.00am-2.00pm"></asp:ListItem>
                              <asp:ListItem Value="2.00am-3.00pm"></asp:ListItem>
                              <asp:ListItem Value="3.00pm-4.00pm"></asp:ListItem>
                              <asp:ListItem Value="4.00pm-5.00pm"></asp:ListItem>
                              <asp:ListItem Value="5.00pm-6.00pm"></asp:ListItem>
                              <asp:ListItem Value="6.00pm-7.00pm"></asp:ListItem>
                              <asp:ListItem Value="7.00pm-8.00pm"></asp:ListItem>
                              <asp:ListItem Value="8.00pm-9.00pm"></asp:ListItem>
                          </asp:DropDownList>   
                        <asp:RequiredFieldValidator ID="TimeValid" runat="server" ErrorMessage="Reservation time is required." ControlToValidate="DropDownList2"  ForeColor="Red"></asp:RequiredFieldValidator>
                     </div>
                </div>

                  <div class="row">
                      <div class="col-md-5 text-right">
                            <h4>Classroom Type:  </h4>
                     </div>
                      <div class="col-md-7  text-left">
                          <asp:DropDownList ID="DropDownList3"  runat="server" CssClass="form-control" autopostback="True" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged" >      
                              <asp:ListItem Selected="True">Please choose one</asp:ListItem>
                              <asp:ListItem Value="Seminar Rooms (20 Capacity)"></asp:ListItem>
                             <%-- <asp:ListItem Value="Staff Meeting Rooms (30 Capacity)"></asp:ListItem>--%>
                              <asp:ListItem Value="Classrooms (50-100 Capacity)"></asp:ListItem>
                             <%--  <asp:ListItem Value="Conference Rooms (50 Capacity)"></asp:ListItem>--%>
                          </asp:DropDownList>  
                          <asp:RequiredFieldValidator ID="TypeValid" runat="server" ErrorMessage="Classroom type is required" ControlToValidate="DropDownList3"  ForeColor="Red"></asp:RequiredFieldValidator>
                      </div>
                </div>

                <div class="row">
                    <div class="col-md-5 text-right">
                        <h4>Classroom No.:</h4>
                    </div>
                    <div class="col-md-7  text-left">
                        <asp:DropDownList ID="DropDownList4"  runat="server" CssClass="form-control" >  
                        </asp:DropDownList> 
                        <asp:RequiredFieldValidator ID="ClassroomValid" runat="server" ErrorMessage="Classroom no. is required" ControlToValidate="DropDownList4" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="col-md-12" style="margin-bottom:25px;">
                    <asp:Button ID="ConfirmBtn" runat="server" Text="Book" CssClass="login-btn" OnClick="ConfirmBtn_Click" />
                    <br />
                    <asp:Label ID="Label1" runat="server" Text="Label" ForeColor="Red" Visible="False"></asp:Label>
                </div>
            </div>
        </div>
    </div>
    
</asp:Content>
