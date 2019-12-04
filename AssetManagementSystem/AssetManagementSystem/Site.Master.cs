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
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LogoutBtn_Click(object sender, EventArgs e)
        {
           SqlConnection conn = new SqlConnection(
           "server=" + Credential.SERVER + "; " +
           "database=" + Credential.DATABASE + "; " +
           "uid=" + Credential.UID + "; " +
           "password=" + Credential.PASSWORD + ";");
            conn.Open();

            SqlCommand cmd_session = new SqlCommand(
                "delete from Session where uid = @UID", conn);

            cmd_session.Parameters.Add("@UID", SqlDbType.VarChar, 100).Value = Session["uid"];

            cmd_session.ExecuteNonQuery();
            cmd_session.Dispose();

            Session["username"] = null;
            Session["uid"] = null;         

            Session.Clear();
            Response.Redirect("Login.aspx");
        }
    }
}