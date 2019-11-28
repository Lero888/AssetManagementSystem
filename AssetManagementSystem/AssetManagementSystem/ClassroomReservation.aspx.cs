using System;
using System.Collections;
using System.Collections.Generic;
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
        }

        private void fillDropDown()
        {
            List<DateTime> arrList = new List<DateTime>();
            for (int i = 0; i < 7; i++)
            {
                arrList.Add(DateTime.Today.AddDays(i));
                ListItem newitem = new ListItem(arrList[i].Date.ToString("d/M/yyyy"));
                DropDownList1.Items.Add(newitem);
            }

           
        // DropDownList1.DataBind();
              
        }

        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList4.Items.Clear();
            if (DropDownList3.SelectedIndex == 1)
            {
                DropDownList4.Items.Add(new ListItem("B1 101B", "1"));
                DropDownList4.Items.Add(new ListItem("B1 101C", "2"));
                
            }
            else if (DropDownList3.SelectedIndex == 2)
            {
                DropDownList4.Items.Add(new ListItem("B1 B11", "1"));
                DropDownList4.Items.Add(new ListItem("B1 303", "2"));
                DropDownList4.Items.Add(new ListItem("A4 113", "3"));
                DropDownList4.Items.Add(new ListItem("A5 119", "4"));
            }
            else if (DropDownList3.SelectedIndex == 3)
            {
                DropDownList4.Items.Add(new ListItem("B1 B02-02", "1"));
                DropDownList4.Items.Add(new ListItem("B1 B02-03", "2"));
                DropDownList4.Items.Add(new ListItem("B1 B04-01", "3"));
                DropDownList4.Items.Add(new ListItem("B1 B04-02", "4"));
                DropDownList4.Items.Add(new ListItem("B1 B04-03", "5"));
                DropDownList4.Items.Add(new ListItem("B1 B05-01", "6"));
                DropDownList4.Items.Add(new ListItem("B1 B05-02", "7"));
                DropDownList4.Items.Add(new ListItem("B1 B05-03", "8"));
                DropDownList4.Items.Add(new ListItem("B1 B06-01", "9"));
                DropDownList4.Items.Add(new ListItem("B1 B06-02", "10"));
                DropDownList4.Items.Add(new ListItem("B1 B08", "11"));
                DropDownList4.Items.Add(new ListItem("B1 B09", "12"));
                DropDownList4.Items.Add(new ListItem("B1 B10", "13"));
                DropDownList4.Items.Add(new ListItem("B1 213", "14"));
                DropDownList4.Items.Add(new ListItem("B1 214", "15"));
            }
            else if (DropDownList3.SelectedIndex == 4)
            {
                DropDownList4.Items.Add(new ListItem("A2 109", "1"));
                DropDownList4.Items.Add(new ListItem("LY3 GF", "2"));
                DropDownList4.Items.Add(new ListItem("LY3 2F", "3"));
            }
        }
    }
}