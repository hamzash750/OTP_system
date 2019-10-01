using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Net.NetworkInformation;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Security.Cryptography;
using System.Net;

namespace OTP_system
{
    public partial class OTP : System.Web.UI.Page
    {
        DAL db = new DAL();
        SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LoginName"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            if (!IsPostBack)
            {
                string number = "0123456789";
                int length = number.Length;
                string otp = string.Empty;
                //how many digts
                int otpdigts = 4;
                string findedigit;
                int getindex;
                for (int i = 0; i < otpdigts; i++)
                {
                    do
                    {
                        getindex = new Random().Next(0, length);
                        findedigit = number.ToCharArray()[getindex].ToString();
                    } while (otp.IndexOf(findedigit) != -1);
                    otp += findedigit;
                }
                if (IsConnectedToInternet())
                {
                    Session["value"] = otp;
                    string Email = Session["Email"].ToString();
                    string MyUsername = "923006406512"; //Your Username At Sendpk.com 
                    string MyPassword = "3126"; //Your Password At Sendpk.com 
                    string toNumber = "923498250026"; //Recepient cell phone number with country code 
                    string Masking = "OPT GENERTER"; //Your Company Brand Name 
                    string MessageText = "YOUR OTP NUMBER IS ("+otp +") AND YOUR EMAIL "+Email +"YOU LOGIN";
                    string jsonResponse = SendSMS(Masking, toNumber, MessageText, MyUsername, MyPassword);
                    Console.Write(jsonResponse);
                    Label1.Text = "OTP CODE SEND  TO " + toNumber+" PLEASE WAIT WHILE YOU RECEIVE " ;
                    //MailMessage Msg = new MailMessage();
                    //Msg.From = new MailAddress("zahamsh75@gmail.com");
                    //Msg.To.Add("hamzash75@gmail.com");
                    //Msg.Subject = "hELLO";
                    ////Msg.Body = Request.QueryString["uname"];
                    ////if (Session["CustomerData"] != null)
                    ////{
                    //Msg.Body ="YOUR SECRET OTP CODE IS "+ otp;
                    ////}
                    ////else
                    ////{
                    ////    Msg.Body = Request.QueryString["uname"];
                    ////}
                    //Msg.IsBodyHtml = true;
                    //SmtpClient smtp = new SmtpClient();
                    //smtp.Host = "smtp.gmail.com";
                    //System.Net.NetworkCredential Networkcred = new System.Net.NetworkCredential();
                    //Networkcred.UserName = "zahamsh75@gmail.com";
                    //Networkcred.Password = "room2008";
                    //smtp.UseDefaultCredentials = true;
                    //smtp.Credentials = Networkcred;
                    //smtp.Port = 587;
                    //smtp.EnableSsl = true;
                    //smtp.Send(Msg);
                }
            }
        }
        public bool IsConnectedToInternet()
        {
            string host = "www.google.com";
            bool result = false;
            Ping p = new Ping();
            try
            {
                PingReply reply = p.Send(host, 3000);
                if (reply.Status == IPStatus.Success)
                    return true;
            }
            catch { }
            return result;
        }

        protected void confirm_Click(object sender, EventArgs e)
        {
            if (Session["value"].ToString() == txt_otp.Text)
            {
                string hash;
                string ussrid = Session["Email"].ToString();
                string otp = Session["value"].ToString();

                using (MD5 md5Hash = MD5.Create())
                {
                  hash = GetMd5Hash(md5Hash, otp);
                }

                con = db.createConnection("connection");
                con = db.connectionOpen(con);
                db.crudOperation("insert into tbl_OTP (fld_otp,fld_user) values ('"+hash+ "','" + ussrid+ "')", con);
                con = db.connectionClose(con);

                Response.Redirect("Welcom.aspx");
            }
            else
            {
                Label1.Text = "Please Enter Correct Code";
            }
            
        }
        public static string SendSMS(string Masking, string toNumber, string MessageText, string MyUsername, string MyPassword)
        {
            String URI = "http://Sendpk.com" +
            "/api/sms.php?" +
            "username=" + MyUsername +
            "&password=" + MyPassword +
            "&sender=" + Masking +
            "&mobile=" + toNumber +
            "&message=" + Uri.UnescapeDataString(MessageText); // Visual Studio 10-15 

            try
            {
                WebRequest req = WebRequest.Create(URI);
                WebResponse resp = req.GetResponse();
                var sr = new System.IO.StreamReader(resp.GetResponseStream());
                return sr.ReadToEnd().Trim();
            }
            catch (WebException ex)
            {
                var httpWebResponse = ex.Response as HttpWebResponse;
                if (httpWebResponse != null)
                {
                    switch (httpWebResponse.StatusCode)
                    {
                        case HttpStatusCode.NotFound:
                            return "404:URL not found :" + URI;
                            break;
                        case HttpStatusCode.BadRequest:
                            return "400:Bad Request";
                            break;
                        default:
                            return httpWebResponse.StatusCode.ToString();
                    }
                }
            }
            return null;
        }
        static string GetMd5Hash(MD5 md5Hash, string input)
        {


            // Convert the input string to a byte array and compute the hash.
            byte[] data = md5Hash.ComputeHash(Encoding.UTF8.GetBytes(input));

            // Create a new Stringbuilder to collect the bytes
            // and create a string.
            StringBuilder sBuilder = new StringBuilder();

            // Loop through each byte of the hashed data 
            // and format each one as a hexadecimal string.
            for (int i = 0; i < data.Length; i++)
            {
                sBuilder.Append(data[i].ToString("x2"));
            }

            // Return the hexadecimal string.
            return sBuilder.ToString();
        }
    }
}