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
    public partial class ClassroomBookingForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("Login.aspx?postbackURL=ClassroomReservation");
            }

            string RName = Request.QueryString["Name"];
            string RDate = Request.QueryString["DT"];
            string RTime = Request.QueryString["TM"];
             RoomName.Text= RName;
             RoomDate.Text = RDate;
            RoomTime.Text = RTime;

        }

        protected int getTimeID()
        {
            SqlConnection conn = new SqlConnection(
                "server=" + Credential.SERVER + "; " +
                "database=" + Credential.DATABASE + "; " +
                "uid=" + Credential.UID + "; " +
                "password=" + Credential.PASSWORD + ";");
            SqlCommand cmd = new SqlCommand(
                "select Time.TimeID from Time,Classrooms " +
                "where Time.ClassroomDate=@DT and Time.ClassroomTime=@TM and Classrooms.ClassName=@CN and Classrooms.ClassroomID=Time.ClassroomID", conn);

            cmd.Parameters.Add("@DT", SqlDbType.Date, 100).Value = RoomDate.Text;
            cmd.Parameters.Add("@TM", SqlDbType.VarChar, 100).Value = RoomTime.Text;
            cmd.Parameters.Add("@CN", SqlDbType.VarChar, 100).Value = RoomName.Text;
            SqlDataAdapter ada = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            ada.Fill(ds);
            int cid = 0;
            if (ds.Tables[0].Rows.Count != 0)
            {
                cid = (int)ds.Tables[0].Rows[0][0];
            }
            return cid;
        }

       
        protected int getUserID()
        {
            SqlConnection conn = new SqlConnection(
               "server=" + Credential.SERVER + "; " +
               "database=" + Credential.DATABASE + "; " +
               "uid=" + Credential.UID + "; " +
               "password=" + Credential.PASSWORD + ";");
            SqlCommand cmd = new SqlCommand(
                "select UID from Users where Username=@UN", conn);
            cmd.Parameters.Add("@UN", SqlDbType.VarChar, 100).Value = Session["username"];
            SqlDataAdapter ada = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            ada.Fill(ds);
            int uid=0;
            if (ds.Tables[0].Rows.Count != 0)
            {
                uid = (int)ds.Tables[0].Rows[0][0];
            }
            return uid;

        }

        protected Boolean updateBookingStatus()
        {
            int timeid = getTimeID();
            SqlConnection conn = new SqlConnection(
               "server=" + Credential.SERVER + "; " +
               "database=" + Credential.DATABASE + "; " +
               "uid=" + Credential.UID + "; " +
               "password=" + Credential.PASSWORD + ";");
            SqlCommand cmd = new SqlCommand(
                "update Time set Status=@ST where TimeID=@TID", conn);
            conn.Open();
            cmd.Parameters.Add("@TID", SqlDbType.Int, 100).Value = timeid;
            cmd.Parameters.Add("@ST", SqlDbType.VarChar, 100).Value = "unavailable";

            cmd.ExecuteNonQuery();
            cmd.Dispose();

            return true;
        }

        protected void SaveBtn_Click(object sender, EventArgs e)
        {
            int timeid = getTimeID();
            int userid = getUserID();
            SqlConnection conn = new SqlConnection(
               "server=" + Credential.SERVER + "; " +
               "database=" + Credential.DATABASE + "; " +
               "uid=" + Credential.UID + "; " +
               "password=" + Credential.PASSWORD + ";");
            SqlCommand cmd = new SqlCommand(
                "insert into ClassroomBorrow(TimeID,UserID,TelNo,Usage)Values(@TID,@UID,@Tel,@USG); ", conn);
            conn.Open();
            cmd.Parameters.Add("@TID", SqlDbType.Int, 100).Value = timeid;
            cmd.Parameters.Add("@UID", SqlDbType.Int, 100).Value = userid;
            cmd.Parameters.Add("@Tel", SqlDbType.VarChar, 100).Value = Tel.Text;
            cmd.Parameters.Add("@USG", SqlDbType.VarChar, 100).Value = UsageTxt.Text;

            cmd.ExecuteNonQuery();
            cmd.Dispose();

            if (updateBookingStatus())
                Response.Redirect("BookingStatus.aspx");

        }

    }

    
}