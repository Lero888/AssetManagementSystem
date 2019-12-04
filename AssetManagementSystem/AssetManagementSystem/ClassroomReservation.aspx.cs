using AssetManagementSystem.Credentials;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssetManagementSystem
{
    public partial class ClassroomReservation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fillDropDown();
            }


            if (Session["username"] == null)
                Response.Redirect("Login.aspx");

        }

        private void fillDropDown()
        {
            List<DateTime> arrList = new List<DateTime>();
            for (int i = 0; i < 10; i++)
            {
                arrList.Add(DateTime.Today.AddDays(i));
                ListItem newitem = new ListItem(arrList[i].Date.ToString("yyyy-MM-dd"));
                DropDownList1.Items.Add(newitem);
            }
           // generatedData();

           
        // DropDownList1.DataBind();
              
        }

        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList4.Items.Clear();
            if (DropDownList3.SelectedIndex == 1)
            {
                DropDownList4.Items.Add(new ListItem("B1 101B"));
                DropDownList4.Items.Add(new ListItem("B1 101C"));
                
            }
            else if (DropDownList3.SelectedIndex == 2)
            {
               
                DropDownList4.Items.Add(new ListItem("B1 B06-01"));
                DropDownList4.Items.Add(new ListItem("B1 B06-02"));
                DropDownList4.Items.Add(new ListItem("B1 B08"));
                DropDownList4.Items.Add(new ListItem("B1 B09"));
                DropDownList4.Items.Add(new ListItem("B1 B10"));
                DropDownList4.Items.Add(new ListItem("B1 213"));
                DropDownList4.Items.Add(new ListItem("B1 214"));
            }
            
        }

       
        protected void ConfirmBtn_Click(object sender, EventArgs e)
        {

            SqlConnection conn = new SqlConnection(
                "server=" + Credential.SERVER + "; " +
                "database=" + Credential.DATABASE + "; " +
                "uid=" + Credential.UID + "; " +
                "password=" + Credential.PASSWORD + ";");
            SqlCommand cmd = new SqlCommand(
                "select Time.Status, Classrooms.ClassName from Time,Classrooms " +
                "where Time.ClassroomDate=@DT and Time.ClassroomTime=@TM and Classrooms.ClassName=@CN and Classrooms.ClassroomID=Time.ClassroomID", conn);
           // conn.Open();
            cmd.Parameters.Add("@DT", SqlDbType.Date, 100).Value = DropDownList1.Text;
            cmd.Parameters.Add("@TM", SqlDbType.VarChar, 100).Value = DropDownList2.Text;
            cmd.Parameters.Add("@CN", SqlDbType.VarChar, 100).Value = DropDownList4.Text;
            SqlDataAdapter ada = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            ada.Fill(ds);

            if (ds.Tables[0].Rows.Count != 0)
            {
                if (ds.Tables[0].Rows[0][0].ToString() == "unavailable")
                {
                    Label1.Visible = true;
                    Label1.Text = "Sorry, the classroom has been booked.";
                }

                else
                {
                    Response.Redirect("ClassroomReservationForm.aspx?Name="+DropDownList4.Text+"&&DT="+DropDownList1.Text+"&&TM="+DropDownList2.Text);
                }
            }
            else
            {
                //Response.Write("Error");
                Response.Write(DropDownList4.Text);
                
            }
           
            

        }

    }
}