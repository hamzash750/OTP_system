using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace OTP_system
{
    public class Regiser
    {
        public string Name;
        public string Email;
        public string City;
        public string Phonenumber;
        public string Password;
        public string Repassword;
        public string Gender;

        public void addnewUser()
        {
            SqlParameter[] Parameters=new SqlParameter[7];
            Parameters[0] = DAL.Addparameter("@Name",Name, System.Data.SqlDbType.VarChar, 200);
            Parameters[1] = DAL.Addparameter("@Email", Email, System.Data.SqlDbType.VarChar, 200);
            Parameters[2] = DAL.Addparameter("@Phonenumber", City, System.Data.SqlDbType.VarChar, 200);
            Parameters[3] = DAL.Addparameter("@City", Phonenumber, System.Data.SqlDbType.VarChar, 200);
            Parameters[4] = DAL.Addparameter("@Password", Password, System.Data.SqlDbType.VarChar, 200);
            Parameters[5] = DAL.Addparameter("@Repassword", Repassword, System.Data.SqlDbType.VarChar, 200);
            Parameters[6] = DAL.Addparameter("@gender", Gender, System.Data.SqlDbType.VarChar, 200);

            DataTable dt = DAL.ExcuteDtbyprocdure("Sp_AddnewUser", Parameters);
        }
 

    }


}