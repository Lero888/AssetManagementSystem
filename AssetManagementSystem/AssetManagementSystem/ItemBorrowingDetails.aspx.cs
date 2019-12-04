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
    public partial class ItemBorrowingDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("Login.aspx?postbackURL=ItemBorrowingDetails");
            }

            item_data();

            item_borrow();
        }

        protected void item_data()
        {
            String ItemName = Request.QueryString["ItemName"];

            SqlConnection conn = new SqlConnection(
                            "server=" + Credential.SERVER + "; " +
                            "database=" + Credential.DATABASE + "; " +
                            "uid=" + Credential.UID + "; " +
                            "password=" + Credential.PASSWORD + ";");

            SqlCommand cmd = new SqlCommand(
                "select ItemID, Department, Description, Image from Items where ItemName = @ItemName", conn);

            cmd.Parameters.Add("@ItemName", SqlDbType.VarChar, 100).Value = ItemName;

            SqlDataAdapter ada = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            ada.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                LbItem.Text = ItemName;
                String Department = (String)ds.Tables[0].Rows[0][1];
                LbDepartment.Text = Department;
                String Description = (String)ds.Tables[0].Rows[0][2];
                LbDesc.Text = Description;
                String Image = (String)ds.Tables[0].Rows[0][3];
                ImageItem.ImageUrl = Image;

            }
        }

        protected void item_borrow()
        {
            String ItemBorrowID = Request.QueryString["ItemBorrowID"];

            SqlConnection conn = new SqlConnection(
                                        "server=" + Credential.SERVER + "; " +
                                        "database=" + Credential.DATABASE + "; " +
                                        "uid=" + Credential.UID + "; " +
                                        "password=" + Credential.PASSWORD + ";");

            SqlCommand cmd = new SqlCommand(
                "select Quantity, TelNo, BorrowDateTime, Status from ItemBorrow where ItemBorrowID = @IBID", conn);

            cmd.Parameters.Add("@IBID", SqlDbType.Int, 100).Value = Convert.ToInt32(ItemBorrowID);

            SqlDataAdapter ada = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            ada.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                int Amount = (int)ds.Tables[0].Rows[0][0];
                LbAmount.Text = Convert.ToString(Amount);
                
                LbTel.Text = (String)ds.Tables[0].Rows[0][1];

                DateTime date = (DateTime)ds.Tables[0].Rows[0][2];
                String date_borrow = date.ToString("yyyy-MM-dd");
                LbDate.Text = Convert.ToString(date_borrow);

                LbStatus.Text = (String)ds.Tables[0].Rows[0][3];
            }
        }

        protected String getDepartment()
        {
            String ItemName = Request.QueryString["ItemName"];

            SqlConnection conn = new SqlConnection(
                                                  "server=" + Credential.SERVER + "; " +
                                                  "database=" + Credential.DATABASE + "; " +
                                                  "uid=" + Credential.UID + "; " +
                                                  "password=" + Credential.PASSWORD + ";");

            SqlCommand cmd = new SqlCommand(
                "select Department from Items where ItemName = @ItemName", conn);

            cmd.Parameters.Add("@ItemName", SqlDbType.VarChar, 100).Value = ItemName;

            SqlDataAdapter ada = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            ada.Fill(ds);

            String Department = "";

            if (ds.Tables[0].Rows.Count > 0)
            {
                Department = (String)ds.Tables[0].Rows[0][0];
            }

            return Department;
        }

        protected String getPIN()
        {
            SqlConnection conn = new SqlConnection(
                                                    "server=" + Credential.SERVER + "; " +
                                                    "database=" + Credential.DATABASE + "; " +
                                                    "uid=" + Credential.UID + "; " +
                                                    "password=" + Credential.PASSWORD + ";");

            SqlCommand cmd = new SqlCommand(
                "select PinNumber from PIN where Department = @Dep", conn);

            String Dep = getDepartment();
            cmd.Parameters.Add("@Dep", SqlDbType.VarChar, 100).Value = Dep;

            SqlDataAdapter ada = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            ada.Fill(ds);

            String PIN = "";
            if (ds.Tables[0].Rows.Count > 0)
            {
                PIN = Convert.ToString((int)ds.Tables[0].Rows[0][0]);
            }

            return PIN;
        }

        protected String getStatus()
        {
            String ItemBorrowID = Request.QueryString["ItemBorrowID"];

            SqlConnection conn = new SqlConnection(
                          "server=" + Credential.SERVER + "; " +
                          "database=" + Credential.DATABASE + "; " +
                          "uid=" + Credential.UID + "; " +
                          "password=" + Credential.PASSWORD + ";");
            SqlCommand cmd = new SqlCommand(
                "select Status from ItemBorrow where ItemBorrowID = @IBID", conn);
            conn.Open();
            cmd.Parameters.Add("@IBID", SqlDbType.Int, 100).Value = Convert.ToInt32(ItemBorrowID);

            SqlDataAdapter ada = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            ada.Fill(ds);

            String status= "";
            if (ds.Tables[0].Rows.Count > 0)
            {
                status = (String)ds.Tables[0].Rows[0][0];
            }

            return status;
        }

        protected void UpdateToRetrieved()
        {
            String ItemBorrowID = Request.QueryString["ItemBorrowID"];

            SqlConnection conn = new SqlConnection(
                          "server=" + Credential.SERVER + "; " +
                          "database=" + Credential.DATABASE + "; " +
                          "uid=" + Credential.UID + "; " +
                          "password=" + Credential.PASSWORD + ";");
            SqlCommand cmd = new SqlCommand(
                "update ItemBorrow set Status=@ST where ItemBorrowID = @IBID", conn);
            conn.Open();
            cmd.Parameters.Add("@IBID", SqlDbType.Int, 100).Value = Convert.ToInt32(ItemBorrowID);
            cmd.Parameters.Add("@ST", SqlDbType.VarChar, 100).Value = "Retrieved";

            cmd.ExecuteNonQuery();
            cmd.Dispose();

        }

        //Confirm Button
        protected void Button1_Click(object sender, EventArgs e)
        {
            String PIN_correct = getPIN();
            String status = getStatus();

            if (TbPINRetrieve.Text == PIN_correct)
            {
                if(status == "Borrowed")
                {
                    LbPINRetrieve.Visible = true;
                    LbPINRetrieve.Text = "PIN Correct. Please retrieve the item.";
                    //UpdateToRetrieved();
                }
                else if(status == "Retrieved")
                {
                    LbPINRetrieve.Visible = true;
                    LbPINRetrieve.Text = "The item is retrieved.";
                }
                else if (status == "Returned")
                {
                    LbPINRetrieve.Visible = true;
                    LbPINRetrieve.Text = "The item is returned";
                }
                else
                {
                    LbPINRetrieve.Visible = true;
                    LbPINRetrieve.Text = "The item is expired. Please return the item ASAP.";
                }

            }
            else
            {
                LbPINRetrieve.Visible = true;
                LbPINRetrieve.Text = "PIN Incorrect. Please fill in again";
            }
        }

        protected void UpdateToReturned()
        {
            String ItemBorrowID = Request.QueryString["ItemBorrowID"];

            SqlConnection conn = new SqlConnection(
                          "server=" + Credential.SERVER + "; " +
                          "database=" + Credential.DATABASE + "; " +
                          "uid=" + Credential.UID + "; " +
                          "password=" + Credential.PASSWORD + ";");
            SqlCommand cmd = new SqlCommand(
                "update ItemBorrow set Status=@ST where ItemBorrowID = @IBID", conn);
            conn.Open();
            cmd.Parameters.Add("@IBID", SqlDbType.Int, 100).Value = Convert.ToInt32(ItemBorrowID);
            cmd.Parameters.Add("@ST", SqlDbType.VarChar, 100).Value = "Returned";

            cmd.ExecuteNonQuery();
            cmd.Dispose();

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            String PIN_correct = getPIN();
            String status = getStatus();

            if (TbPINRetrieve.Text == PIN_correct)
            {
                if (status == "Retrieved")
                {
                    LbPINReturn.Text = "PIN Correct. Please make sure the item is returned.";
                    //UpdateToReturned();
                }
                else if (status == "Borrowed")
                {
                    LbPINReturn.Text = "The item is not retrieved.";
                }
                else if (status == "Returned")
                {
                    LbPINReturn.Text = "The item is returned";
                }
                else
                {
                    LbPINReturn.Text = "PIN Correct. Please make sure the item is returned.";
                    //UpdateToReturned();
                }

            }
            else
            {
                LbPINReturn.Text = "PIN Incorrect. Please fill in again";
            }
        }
    }
}