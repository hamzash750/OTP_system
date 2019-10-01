using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace OTP_system
{
    public partial class Login : System.Web.UI.Page
    {

        DAL db = new DAL();
        SqlConnection con;


        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void Login_user_Click(object sender, EventArgs e)
        {

            con = db.createConnection("connection");
            con = db.connectionOpen(con);

            SqlCommand cmd = new SqlCommand("adminlogin", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Email", emaiTextBox.Text);
            cmd.Parameters.AddWithValue("@Pass", EncryptPassword(passTextBox.Text));

            string output = cmd.ExecuteScalar().ToString();
            if (output == "1")
            {

                SqlCommand cmdn = new SqlCommand("Select fld_name from tbl_admin where fld_email=@Email", con);
                cmdn.Parameters.Add(new SqlParameter("@Email", emaiTextBox.Text));

                string CustomerEmail = cmdn.ExecuteScalar().ToString();
                Session["LoginName"] = CustomerEmail;
                Session["Email"] = emaiTextBox.Text;

                con = db.connectionClose(con);

                Response.Redirect("OTP.aspx");
            }


           
            else
            {
                Response.Write("<script>alert('Please enter valid Username and Password')</script>");
            }
        }
        private string EncryptPassword(string pass)
        {
            byte[] bytes = System.Text.Encoding.Unicode.GetBytes(pass);
            string encrptpassword = Convert.ToBase64String(bytes);
            return encrptpassword;
        }
    }
}