using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace MSO.DAO
{
    public class SqlHelper
    {
        SqlConnection sqlCon;

        public SqlConnection GetSqlConnection()
        {

            try
            {
                string conStr = ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;
                sqlCon = new SqlConnection(conStr);
                sqlCon.Open();
            }
            catch (SqlException sql)
            {
                throw sql;
            }

            catch (Exception ex)
            {
                throw ex;
            }

            return sqlCon;
        }

        public DataSet ExecuteDataSet(string spName, SqlParameter[] sqlParams)
        {
            DataSet ds = new DataSet();
            try
            {

                SqlConnection con = this.GetSqlConnection();
                SqlCommand cmd = new SqlCommand(spName, con);
                cmd.CommandType = CommandType.StoredProcedure;
                if(sqlParams!=null)
                    cmd.Parameters.AddRange(sqlParams);
                SqlDataAdapter adap = new SqlDataAdapter(cmd);
                adap.Fill(ds);
                con.Close();
            }
            catch (Exception ex)
            {
                LogException(ex);
            }
            return ds;

        }

        public DataSet ExecuteDataSet(string spName)
        {
            DataSet ds = new DataSet();
            try
            {

                SqlConnection con = this.GetSqlConnection();
                SqlCommand cmd = new SqlCommand(spName, con);
                SqlDataAdapter adap = new SqlDataAdapter(cmd);
                adap.Fill(ds);
                con.Close();
            }
            catch (Exception ex)
            {
                LogException(ex);
            }
            return ds;

        }


        public static void LogException(Exception ex)
        {
                
        }

        public int ExcecuteNonQuery(string spName, SqlParameter[] sqlParams)
        {

            int i = -1;
            
                SqlConnection con = this.GetSqlConnection();
                SqlCommand cmd = new SqlCommand(spName, con);
                cmd.CommandType = CommandType.StoredProcedure;
                if (sqlParams != null)
                    cmd.Parameters.AddRange(sqlParams);
                 i = cmd.ExecuteNonQuery();
            
            if (con.State == ConnectionState.Open)
                con.Close(); 

            return i;

        }

      

    }


     
}
