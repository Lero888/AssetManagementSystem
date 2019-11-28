using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssetManagementSystem
{
    public partial class ItemBorrowingForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {

            }
            else
            {

            }
        }

        protected void DateStartValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (Calendar1.SelectedDate < DateTime.Now.Date)
            {
                args.IsValid = false;
            }
        }

        protected void DateEndValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            //DateTime maxDate = DateTime.Parse("9999/12/28");
            if (Calendar1.SelectedDate > DateTime.Now.AddDays(30))
            {
                args.IsValid = false;
            }
        }
    }
}