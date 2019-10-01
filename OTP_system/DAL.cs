using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace OTP_system
{
    public class DAL
    {
   SqlDataAdapter sda = new SqlDataAdapter();
        DataTable dt = new DataTable();
  

        public DAL()
        { }
        public SqlConnection createConnection(string stringname)
        {
          return new SqlConnection (System.Configuration.ConfigurationManager.ConnectionStrings[stringname].ConnectionString);
        }

        public SqlConnection connectionOpen(SqlConnection con)
        {
            if (con.State == ConnectionState.Closed)
                
                con.Open();

            return con;

        }
        public SqlConnection connectionClose(SqlConnection con)
        {
            if (con.State == ConnectionState.Open)
                con.Close();
            return con;

        }
        public DataTable getTable(string v,SqlConnection con)
        {
            sda.SelectCommand = new SqlCommand(v);
            sda.SelectCommand.Connection = con;
            sda.Fill(dt);
            return dt;
        }
        public int insertData(string v,SqlConnection con)
        {
            sda.InsertCommand = new SqlCommand(v);
            sda.InsertCommand.Connection = con;
            return sda.InsertCommand.ExecuteNonQuery();
        }
        public int updateData(string v,SqlConnection con)
        {
            sda.UpdateCommand = new SqlCommand(v);
            sda.UpdateCommand.Connection = con;
            return sda.UpdateCommand.ExecuteNonQuery();
        }
        public int deleteData(string v,SqlConnection con)
        {
            sda.DeleteCommand = new SqlCommand(v);
            sda.DeleteCommand.Connection = con;
            return sda.DeleteCommand.ExecuteNonQuery();
        }
        internal void Crud()
        {
            SqlCommandBuilder scb = new SqlCommandBuilder(sda);
            sda.Update(dt);
        }
        internal int crudOperation(string v,SqlConnection con)
        {
            SqlCommand cmd = new SqlCommand(v, con);
            return cmd.ExecuteNonQuery();
        }
        internal SqlDataReader getReader(string v,SqlConnection con)
        {
            SqlCommand cmd = new SqlCommand(v, con);
            return cmd.ExecuteReader();
        }
         public static SqlParameter Addparameter(string pramname,object value,SqlDbType DbType,int size)
        {
            SqlParameter param = new SqlParameter();
            param.ParameterName = pramname;
            param.Value = value.ToString();
            param.SqlDbType = DbType;
            param.Size = size;
            param.Direction = ParameterDirection.Input;
            return param;

        }
         public static string conncetionstring
         {
             get
             {
                 return ConfigurationManager.ConnectionStrings["connection"].ConnectionString.ToString();
             }

         }
        
        public static DataTable ExcuteDtbyprocdure(string ProcdureName,SqlParameter[] Params)
        {
            SqlConnection conn = new SqlConnection(conncetionstring);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = ProcdureName;
            cmd.Parameters.AddRange(Params);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter adopter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            try
            {
                adopter.Fill(dt);

            }
            catch (Exception ex)
            {
                string s = ex.ToString();
            }
            finally
            {
                adopter.Dispose();
                cmd.Parameters.Clear();
                cmd.Dispose();
                conn.Dispose();
            }
            return dt;
        }


        public static SqlDataReader RdExcuteDtbyprocdure(string ProcdureName, SqlParameter[] Params)
        {
            SqlConnection conn = new SqlConnection(conncetionstring);
            conn.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = ProcdureName;
            cmd.Parameters.AddRange(Params);
            cmd.CommandType = CommandType.StoredProcedure;
           
            return cmd.ExecuteReader();
            
        }

    }
}