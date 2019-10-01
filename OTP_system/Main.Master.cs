using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OTP_system
{
    public partial class Main : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["LoginName"]==null)
            {
                Response.Redirect("Login.aspx");
            }
           lbl_name.Text= Session["LoginName"].ToString();
        }
    }
}