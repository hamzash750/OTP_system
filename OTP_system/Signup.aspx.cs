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
    public partial class Signup : System.Web.UI.Page
    {
        DAL db = new DAL();
        Regiser r = new Regiser();
        SqlConnection con;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void userregiser_Click(object sender, EventArgs e)
        {
            con = db.createConnection("connection");
            con = db.connectionOpen(con);

            SqlCommand cmdn = new SqlCommand("select * from tbl_admin where fld_email=@Email", con);
            cmdn.Parameters.Add(new SqlParameter("@Email", txt_email.Text));

            SqlDataReader rd = cmdn.ExecuteReader();
            if (rd.Read())
            {
                lbl_msg.Text = "Email Already Register Plz Chose Differnt";
                rd.Close();
                con = db.connectionClose(con);
            }
            else
            {
                //con = db.createConnection("connection");
                //con = db.connectionOpen(con);
                //db.crudOperation("insert into tbl_admin (fld_name,fld_email,fld_phonenumber,fld_city,fld_password,fld_repassword) values('" + txt_name.Text + "','" + txt_email.Text + "','" + txt_phonenumber.Text + "','" + txt_city.Text + "','" + txt_password.Text + "','" + txt_repassword.Text + "')", con);
                //con = db.connectionClose(con);



                r.Name = txt_name.Text;
                r.Email = txt_email.Text;
                r.Phonenumber = txt_phonenumber.Text;
                r.City = txt_city.Text;

                r.Password = EncryptPassword(txt_password.Text);
                r.Repassword = EncryptPassword(txt_repassword.Text);
                r.Gender = ddl_gender.SelectedValue;
                r.addnewUser();

                lbl_msg.Text = "User Register";
            }


        }
        private string EncryptPassword(string pass)
        {
            byte[] bytes = System.Text.Encoding.Unicode.GetBytes(pass);
            string encrptpassword = Convert.ToBase64String(bytes);
            return encrptpassword;
        }
        private string DecryptPassword(string pass)
        {
            byte[] bytes = Convert.FromBase64String(pass);
            string Decryptpassword = System.Text.Encoding.Unicode.GetString(bytes);
            return Decryptpassword;
        }


    }
}