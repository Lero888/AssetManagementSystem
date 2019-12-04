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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
        {

        }

        protected void Username_TextChanged(object sender, EventArgs e)
        {

        }

        protected void LoginBtn_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(
                "server=" + Credential.SERVER + "; " +
                "database=" + Credential.DATABASE + "; " +
                "uid=" + Credential.UID + "; " +
                "password=" + Credential.PASSWORD + ";");

            SqlCommand cmd = new SqlCommand(
                "select * from Users where Username=@UN and Password=@PWD", conn);
            cmd.Parameters.Add("@UN", SqlDbType.VarChar, 100).Value = tbUsername.Text;
            cmd.Parameters.Add("@PWD", SqlDbType.VarChar, 100).Value = tbPassword.Text;
            SqlDataAdapter ada = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            ada.Fill(ds);

            if (ds.Tables[0].Rows.Count == 0)
            {
                Label1.Text = "Not Match.";
                Label1.Visible = true;
            }

            else
            {
                Session["username"] = tbUsername.Text;
                Session["uid"] = ds.Tables[0].Rows[0][0];
                if (Request["postbackURL"] == null)
                    Response.Redirect("BookingStatus.aspx");
                else
                    Response.Redirect(Request["postbackURL"] + ".aspx");

            }
        }
    }
}