using AssetManagementSystem.Credentials;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssetManagementSystem
{
    public partial class ItemBorrowingForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("Login.aspx?postbackURL=ItemBorrow");
            }
                        
            item_data();
        }

        protected void item_data()
        {
            String ItemID = Request.QueryString["ItemID"];

            SqlConnection conn = new SqlConnection(
                            "server=" + Credential.SERVER + "; " +
                            "database=" + Credential.DATABASE + "; " +
                            "uid=" + Credential.UID + "; " +
                            "password=" + Credential.PASSWORD + ";");

            SqlCommand cmd = new SqlCommand(
                "select ItemID, ItemName, Department, Description, Image from Items where ItemID = @IID", conn);
            
            cmd.Parameters.Add("@IID", SqlDbType.Int, 100).Value = Convert.ToInt32(ItemID);

            SqlDataAdapter ada = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            ada.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                String ItemName = (String)ds.Tables[0].Rows[0][1];
                LbItem.Text = ItemName;
                String Department = (String)ds.Tables[0].Rows[0][2];
                LbDepartment.Text = Department;
                String Description = (String)ds.Tables[0].Rows[0][3];
                LbDesc.Text = Description;
                String Image = (String)ds.Tables[0].Rows[0][4];
                ImageItem.ImageUrl = Image;
            }
        }

        //Calendar Click Action and Result
        protected void Date_Selection_Changed(object sender, EventArgs e)
        {
            //Output Selected Date
            LbDateResult.Text = CalendarDate.SelectedDate.ToString("yyyy-MM-dd");

            String ItemID = Request.QueryString["ItemID"];

            DateTime date = CalendarDate.SelectedDate.Date;
            
            SqlConnection conn = new SqlConnection(
                              "server=" + Credential.SERVER + "; " +
                              "database=" + Credential.DATABASE + "; " +
                              "uid=" + Credential.UID + "; " +
                              "password=" + Credential.PASSWORD + ";");
            SqlCommand cmd = new SqlCommand(
                "select ItemQuantity.QuantityLeft from ItemQuantity where ItemID = @ItemID AND Date = @date", conn);
            conn.Open();

            cmd.Parameters.Add("@ItemID", SqlDbType.Int, 100).Value = ItemID;
            cmd.Parameters.Add("@date", SqlDbType.Date, 100).Value = date;
            SqlDataAdapter ada = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            ada.Fill(ds);

            if (ds.Tables[0].Rows.Count != 0)
            {
                LbAmount.Text = Convert.ToString((int)ds.Tables[0].Rows[0][0]);
            }
            else
            {
                LbAmount.Text = "Not available. Please select again.";
            }

            calendarCheck();
        }

        protected Boolean insertBorrowData()
        {
            String ItemID = Request.QueryString["ItemID"];

            SqlConnection conn = new SqlConnection(
               "server=" + Credential.SERVER + "; " +
               "database=" + Credential.DATABASE + "; " +
               "uid=" + Credential.UID + "; " +
               "password=" + Credential.PASSWORD + ";");
            SqlCommand cmd = new SqlCommand(
                "insert into ItemBorrow(ItemID, UserID, BorrowDateTime, Quantity, Status, TelNo, Usage)" +
                "Values(@IID,@UID,@BorrowDT,@Quantity, @Status, @Tel, @Usage); ", conn);
            conn.Open();

            cmd.Parameters.Add("@IID", SqlDbType.Int, 100).Value = ItemID;
            cmd.Parameters.Add("@UID", SqlDbType.Int, 100).Value = Session["uid"];
            cmd.Parameters.Add("@BorrowDT", SqlDbType.Date, 100).Value = CalendarDate.SelectedDate.Date;
            cmd.Parameters.Add("@Quantity", SqlDbType.Int, 100).Value = Convert.ToInt32(TbAmount.Text);
            cmd.Parameters.Add("@Status", SqlDbType.VarChar, 100).Value = "Borrowed";
            cmd.Parameters.Add("@Tel", SqlDbType.VarChar, 100).Value = TbTel.Text;
            cmd.Parameters.Add("@Usage", SqlDbType.VarChar, 100).Value = TbUsage.Text;

            cmd.ExecuteNonQuery();
            cmd.Dispose();

            return true;
        }

        protected int getAmount()
        {
            String ItemID = Request.QueryString["ItemID"];

            DateTime date = CalendarDate.SelectedDate.Date;

            SqlConnection conn = new SqlConnection(
                              "server=" + Credential.SERVER + "; " +
                              "database=" + Credential.DATABASE + "; " +
                              "uid=" + Credential.UID + "; " +
                              "password=" + Credential.PASSWORD + ";");
            SqlCommand cmd = new SqlCommand(
                "select QuantityLeft from ItemQuantity where ItemID = @ItemID AND Date = @date", conn);
            conn.Open();

            cmd.Parameters.Add("@ItemID", SqlDbType.Int, 100).Value = ItemID;
            cmd.Parameters.Add("@date", SqlDbType.Date, 100).Value = date;
            SqlDataAdapter ada = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            ada.Fill(ds);

            int Amount = 0; 

            if (ds.Tables[0].Rows.Count != 0)
            {
                Amount = (int)ds.Tables[0].Rows[0][0];
            }

            return Amount;
        }

                
        protected Boolean updateItemQuantity(String ItemID)
        {
            SqlConnection conn = new SqlConnection(
               "server=" + Credential.SERVER + "; " +
               "database=" + Credential.DATABASE + "; " +
               "uid=" + Credential.UID + "; " +
               "password=" + Credential.PASSWORD + ";");
            SqlCommand cmd = new SqlCommand(
                "update ItemQuantity set QuantityLeft=@QLeft where ItemID=@ItemID and Date=@Date", conn);
            conn.Open();

            int total = getAmount();
            int borrow = Convert.ToInt32(TbAmount.Text);
            int left = total - borrow;

            cmd.Parameters.Add("@QLeft", SqlDbType.Int, 100).Value = left;
            cmd.Parameters.Add("@ItemID", SqlDbType.Int, 100).Value = ItemID;
            cmd.Parameters.Add("@Date", SqlDbType.Date, 100).Value = CalendarDate.SelectedDate.Date;

            cmd.ExecuteNonQuery();
            cmd.Dispose();

            return true;
        }

        //Save button: Save Borrowed Item Details
        protected void BtnSave_Click(object sender, EventArgs e)
        {
            String ItemID = Request.QueryString["ItemID"];

            //Check if the page is valid (not valid cause by validator)
            calendarCheck();

            Page.Validate();

            if (Page.IsValid && calendarCheck())
            {
                LbSave.Visible = true;
                LbSave.Text = "Reservation Successful.";

                Boolean insert = insertBorrowData();

                if (insert == true)
                {
                    Boolean update = updateItemQuantity(ItemID);

                    if (update == true)
                    {
                        Response.Redirect("BookingStatus.aspx");
                    }

                }
                else
                {
                    LbSave.Text = "Input Error. Please refresh to continue.";
                }

            }
            else
            {
                LbSave.Visible = true;
                LbSave.Text = "Input invalid.";
            }
        }

        //Validator
        //protected void DateCustVal_Validate(object source, ServerValidateEventArgs args)
        //{
        //    if (args.Value != null)
        //    {
        //        DateTime minDate = DateTime.Now.Date;
        //        DateTime maxDate = DateTime.Now.AddDays(15);
        //        DateTime selecteddate = CalendarDate.SelectedDate.Date;

        //        if (selecteddate < minDate || selecteddate > maxDate)
        //        {
        //            LbCalander.Visible = true;
        //            LbCalander.Text = "Please select a valid date (15 days from now).";
        //            args.IsValid = false;
        //        }
        //        else args.IsValid = true;

        //    }
        //    else
        //    {
        //        LbCalander.Visible = true;
        //        LbCalander.Text = "Please select a date.";
        //        args.IsValid = false;
        //    }
        //    args.IsValid = true;
        //}

        protected void Amount_Validate(object source, ServerValidateEventArgs args)
        {
            Boolean value = Regex.IsMatch(args.Value, @"^\d+$");

            if ((args.Value) is String && (value == false))
            {
                LbAmount1.Visible = true;
                LbAmount1.Text = "Please enter a valid amount.";
                args.IsValid = false;
            }
            else if (Convert.ToInt32(args.Value) < 1)
            {
                LbAmount1.Visible = true;
                LbAmount1.Text = "Please enter a valid amount.";
                args.IsValid = false;
            }
            else if (Convert.ToInt32(args.Value) > getAmount())
            {
                LbAmount1.Visible = true;
                LbAmount1.Text = "The entered amount is larger than the item available.";
                args.IsValid = false;
            }
            else if (getAmount() <= 0 && (Convert.ToInt32(args.Value) > 0))
            {
                LbAmount1.Visible = true;
                LbAmount1.Text = "The item amount is 0.";
                args.IsValid = false;
            }
            else
            {
                LbAmount1.Visible = false;
                args.IsValid = true;
            }
        }

        protected Boolean calendarCheck()
        {

            DateTime minDate = DateTime.Now.Date;
            DateTime maxDate = DateTime.Now.AddDays(15);
            DateTime selecteddate = CalendarDate.SelectedDate.Date;

            if (selecteddate < minDate || selecteddate > maxDate)
            {
                LbCalander.Visible = true;
                LbCalander.Text = "Please select a valid date (15 days from now).";
                return false;
            }
            else
            {
                LbCalander.Visible = false;
                return true;
            }
        }

    }
}