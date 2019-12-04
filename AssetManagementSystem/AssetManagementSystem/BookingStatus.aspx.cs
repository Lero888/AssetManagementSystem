using AssetManagementSystem.Credentials;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssetManagementSystem
{
    public partial class BookingStatus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["username"] == null)
            {
                Response.Redirect("Login.aspx?postbackURL=BookingStatus");
            }
            else
            {
                //Clear the data before running the table again to prevent append
                GridView1.DataSource = null;
                GridView2.DataSource = null;
                GridViewDataBind();
            }

        }

        protected void GridViewDataBind()
        {
            //Item Reservation Table
            SqlConnection conn = new SqlConnection(
               "server=" + Credential.SERVER + "; " +
               "database=" + Credential.DATABASE + "; " +
               "uid=" + Credential.UID + "; " +
               "password=" + Credential.PASSWORD + ";");

            SqlCommand cmd = new SqlCommand("SELECT ItemBorrow.ItemBorrowID AS ItemBorrowID, ItemBorrow.BorrowDateTime AS Date, Items.ItemName AS Item, ItemBorrow.Quantity, ItemBorrow.Status " +
                "FROM ItemBorrow INNER JOIN Items ON ItemBorrow.ItemID = Items.ItemID INNER JOIN Session ON ItemBorrow.UserID = Session.UID ORDER BY Date", conn);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();

            adapter.Fill(ds);

            GridView1.DataSource = ds.Tables[0].DefaultView;
            GridView1.DataBind();

            GridView1.Columns[0].Visible = false;

            ///Classroom Reservation Table
            SqlCommand cmd_classroom = new SqlCommand(
                "SELECT Time.ClassroomDate AS Date, Time.ClassroomTime AS Time, " +
                "Classrooms.ClassName AS Classroom FROM Session " +
                "INNER JOIN ClassroomBorrow ON ClassroomBorrow.UserID = Session.UID " +
                "INNER JOIN Time ON Time.TimeID = ClassroomBorrow.TimeID " +
                "INNER JOIN Classrooms ON Classrooms.ClassroomID = Time.ClassroomID", conn);

            adapter = new SqlDataAdapter(cmd_classroom);
            DataSet ds2 = new DataSet();

            adapter.Fill(ds2);

            GridView2.DataSource = ds2.Tables[0].DefaultView;
            GridView2.DataBind();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            GridView gv = (GridView)sender;
           
            String IID = ((Label)gv.SelectedRow.FindControl("LbItemBorrowID")).Text;
            String ItemName = ((Label)gv.SelectedRow.FindControl("LbItem")).Text;

            Response.Redirect("ItemBorrowingDetails.aspx?ItemName="+ItemName+"&&ItemBorrowID="+IID);            

        }
    }
}