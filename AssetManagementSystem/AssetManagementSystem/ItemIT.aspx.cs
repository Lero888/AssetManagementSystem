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
    public partial class ItemIT : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["username"] == null)
            {
                Response.Redirect("Login.aspx?postbackURL=ItemIT");
            }

            checkQuantity();
            int squantity = Convert.ToInt32(SpeakerQuantity.Text);
            int mquantity = Convert.ToInt32(MicQuantity.Text);
            int aquantity= Convert.ToInt32(AdapterQuantity.Text);
            if (squantity <= 0)
            {
                ImageSpeaker.Enabled = false;
                ImageSpeaker.Visible = false;
                ImageSpeakerDisabled.Visible = true;
                if (ImageSpeakerDisabled.Enabled == false)
                {
                    ImageSpeakerDisabled.Style["background-color"] = "#b7b7b7";
                    ImageSpeakerDisabled.Style["opacity"] = "80%";
                }

            }

            if (mquantity <= 0)
            {
                ImageMic.Enabled = false;
                ImageMic.Visible = false;
                ImageMicDisabled.Visible = true;
                if (ImageMicDisabled.Enabled == false)
                {
                    ImageMicDisabled.Style["background-color"] = "#b7b7b7";
                    ImageMicDisabled.Style["opacity"] = "80%";
                }
            }

            if (aquantity <= 0)
            {
                ImageAdapter.Enabled = false;
                ImageAdapter.Visible = false;
                ImageAdapterDisabled.Visible = true;
                if (ImageAdapterDisabled.Enabled == false)
                {
                    ImageAdapterDisabled.Style["background-color"] = "#b7b7b7";
                    ImageAdapterDisabled.Style["opacity"] = "80%";
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
                "select ItemID, Quantity from Items where ItemID=3 or ItemID=4 or ItemID=5", conn);
            conn.Open();
            SqlDataAdapter ada = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            ada.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
               
                if ((int)ds.Tables[0].Rows[0][0] == 3)
                {
                    int quantity = (int)ds.Tables[0].Rows[0][1];
                    SpeakerQuantity.Text = quantity.ToString();
                }

                if ((int)ds.Tables[0].Rows[1][0] == 4)
                {
                    int quantity = (int)ds.Tables[0].Rows[1][1];
                    MicQuantity.Text = quantity.ToString();
                }


                if ((int)ds.Tables[0].Rows[2][0] == 5)
                {
                    int quantity = (int)ds.Tables[0].Rows[2][1];
                    AdapterQuantity.Text = quantity.ToString();
                }

            }

        }

        protected void ImageSpeaker_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("ItemBorrowingForm.aspx?ItemID=3");
        }

        protected void ImageMic_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("ItemBorrowingForm.aspx?ItemID=4");
        }

        protected void ImageAdapter_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("ItemBorrowingForm.aspx?ItemID=5");
        }
    }
}