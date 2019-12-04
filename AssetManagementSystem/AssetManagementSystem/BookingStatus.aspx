<%@ Page Title="Booking Status XMUM" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BookingStatus.aspx.cs" Inherits="AssetManagementSystem.BookingStatus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>

        hr {
            margin-bottom: 40px;
        }

    </style>

    <div class="container">
        <div class="row" style="margin-top: 40px;">
            <div class="col-md-12 text-center">
                <h1>Reservation Status</h1>
            </div>
        </div>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:campusassetConnectionString %>" SelectCommand="SELECT Items.ItemName AS Item, ItemBorrow.Quantity, ItemBorrow.BorrowDateTime AS Date, ItemBorrow.Status FROM ItemBorrow INNER JOIN Items ON ItemBorrow.ItemID = Items.ItemID INNER JOIN Session ON ItemBorrow.UserID = Session.UID ORDER BY Date"></asp:SqlDataSource>
    
        <hr />
    
        <div class="row">
            <div class="col-md-12">
                <h3><b>Item Reservation History</b></h3>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12 text center">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Height="72px" Width="1007px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateSelectButton="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                    <Columns>
                        <asp:TemplateField HeaderText="ItemBorrowID">
                            <ItemTemplate>
                                <asp:Label ID="LbItemBorroWID" Text='<%# Bind("ItemBorrowID") %>' runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Item">
                            <ItemTemplate>
                                <asp:Label ID="LbItem" Text='<%# Bind("Item") %>' runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Quantity">
                            <ItemTemplate>
                                <asp:Label ID="LbQuantity" Text='<%# Bind("Quantity") %>' runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Date">
                            <ItemTemplate>
                                <asp:Label ID="LbDate" runat="server" Text='<%#Eval("Date", "{0:yyyy-MM-dd}") %>'/>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Status">
                            <ItemTemplate>
                                <asp:Label ID="LbStatus" Text='<%# Bind("Status") %>' runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <RowStyle ForeColor="#000066" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#007DBB" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#00547E" />
                </asp:GridView>
            </div>
        </div>

           
        <div class="row" style="margin-top: 50px;">
            <div class="col-md-12">
                <h3><b>Classroom Reservation History</b></h3>
            </div>
        </div>
        
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:campusassetConnectionString %>" SelectCommand="SELECT Time.ClassroomDate AS Date, Time.ClassroomTime AS Time, Classrooms.ClassName AS Classroom FROM Session INNER JOIN ClassroomBorrow ON ClassroomBorrow.UserID = Session.UID INNER JOIN Time ON Time.TimeID = ClassroomBorrow.TimeID INNER JOIN Classrooms ON Classrooms.ClassroomID = Time.ClassroomID"></asp:SqlDataSource>

        <div class="row">
            <div class="col-md-12 text-center">
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" Height="75px" Width="995px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
                    <Columns>
                        <asp:TemplateField HeaderText="Date">
                            <ItemTemplate>
                                <asp:Label ID="LbDate2" Text='<%#Eval("Date", "{0:yyyy-MM-dd}") %>' runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Time">
                            <ItemTemplate>
                                <asp:Label ID="LbTime2" Text='<%# Bind("Time") %>' runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Classroom">
                            <ItemTemplate>
                                <asp:Label ID="LbClassroom" Text='<%# Bind("Classroom") %>' runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <RowStyle ForeColor="#000066" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#007DBB" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#00547E" />
                </asp:GridView>

            </div>
        </div>
    </div>

</asp:Content>
