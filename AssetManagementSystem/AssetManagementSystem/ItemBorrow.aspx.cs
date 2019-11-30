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
    public partial class ItemBorrow : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            checkQuantity();
            int tquantity = Convert.ToInt32(TableQuantity.Text);
            int cquantity = Convert.ToInt32(ChairQuantity.Text);
            if (tquantity <= 0)
            {
                ImageTable.Enabled = false;
                ImageTable.Visible = false;
                ImageTableDisabled.Visible = true;
                if (ImageTableDisabled.Enabled == false)
                {
                    ImageTableDisabled.Style["background-color"] = "#b7b7b7";
                    ImageTableDisabled.Style["opacity"] = "80%";
                }
                
            }

            if (cquantity <= 0)
            {
                ImageChair.Enabled = false;
                ImageChair.Visible = false;
                ImageChairDisabled.Visible = true;
                if (ImageChairDisabled.Enabled == false)
                {
                    ImageChairDisabled.Style["background-color"] = "#b7b7b7";
                    ImageChairDisabled.Style["opacity"] = "80%";
                }

            }
        }

        protected void checkQuantity()
        {
            SqlConnection conn = new SqlConnection(
                   "server=" + Credential.SERVER + "; " +
                   "database=" + Credential.DATABASE + "; " +
                   "uid=" + Credential.UID + "; " +
                   "password=" + Credential.PASSWORD + ";");
            SqlCommand cmd = new SqlCommand(
                "select ItemID,QuantityLeft from Items where ItemID=1 or ItemID=2", conn);
            conn.Open();
            SqlDataAdapter ada = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            ada.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                if ((int)ds.Tables[0].Rows[0][0] == 1)
                {
                    int quantity= (int)ds.Tables[0].Rows[0][1];
                    TableQuantity.Text = quantity.ToString();
                }

                if ((int)ds.Tables[0].Rows[1][0] == 2)
                {
                    int quantity = (int)ds.Tables[0].Rows[1][1];
                    ChairQuantity.Text = quantity.ToString();
                }
            }
            
        }

        protected void ImageTable_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("ItemBorrowingForm.aspx");
        }

        protected void ImageChair_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("ItemBorrowingForm.aspx");
        }
    }
}