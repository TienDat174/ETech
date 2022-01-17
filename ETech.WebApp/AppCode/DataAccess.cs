using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ETech.WebApp.AppCode
{
    public class DataAccess
    {
        public SqlConnection connection;

        public void MoKetNoiCSDL()
        {
            connection = new SqlConnection();
            connection.ConnectionString = @"Data Source=DESKTOP-R1LSG24;Initial Catalog=ETech_Data;User ID=sa;password=123456;MultipleActiveResultSets = true;";
            if (connection.State == ConnectionState.Closed)
                connection.Open();
        }

        public SqlConnection getConnection()
        {
            return this.connection;
        }

        public DataTable LayBangDuLieu(string procedureName, IDataParameter[] parameters)
        {
            MoKetNoiCSDL();
            SqlCommand cmd = new SqlCommand(procedureName);
            cmd.Connection = this.connection;
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dataTable = new DataTable();
            sda.Fill(dataTable);
            return dataTable;
        }

        public DataTable LayBangDuLieu(string sql)
        {
            SqlDataAdapter adapter = new SqlDataAdapter(sql, this.connection);
            DataTable dataTable = new DataTable();
            adapter.Fill(dataTable);
            return dataTable;
        }

        public void DongKetNoiCSDL()
        {
            if (connection.State == ConnectionState.Open)
                connection.Close();
        }

        public SqlCommand BuildCommand(string procedureName, IDataParameter[] parameters)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = procedureName;
            cmd.Connection = connection;
            cmd.CommandType = CommandType.StoredProcedure;
            foreach (SqlParameter parameter in parameters)
            {
                cmd.Parameters.Add(parameter);
            }
            return cmd;
        }

        public SqlCommand BuildIntCommand(string procedureName, IDataParameter[] parameters)
        {
            SqlCommand cmd = BuildCommand(procedureName, parameters);
            cmd.Parameters.Add(new SqlParameter("ReturnValue",
                SqlDbType.Int,
                4,
                ParameterDirection.ReturnValue,
                false,
                0, 0,
                string.Empty,
                DataRowVersion.Default,
                null));
            return cmd;
        }

        public int ExecuteIntCommand(string procedureName, IDataParameter[] parameters)
        {
            try
            {
                int returnValue;
                MoKetNoiCSDL();
                SqlCommand cmd = BuildIntCommand(procedureName, parameters);
                cmd.ExecuteNonQuery();
                returnValue = (int)cmd.Parameters["ReturnValue"].Value;
                DongKetNoiCSDL();
                return returnValue;
            }
            catch
            {
                throw new Exception("ExecuteIntCommand Error");
            }
        }

        public int ExecuteNonQuery(string procedureName, IDataParameter[] parameters)
        {
            try
            {
                MoKetNoiCSDL();
                SqlCommand cmd = BuildCommand(procedureName, parameters);
                cmd.CommandType = CommandType.StoredProcedure;
                int rowsAffected = cmd.ExecuteNonQuery();
                DongKetNoiCSDL();
                return rowsAffected;
            }
            catch (Exception)
            {
                throw new Exception("ExecuteNonQuery Error!");
            }
        }

        public DataTable ExecuteQuery(string procedureName, IDataParameter[] parameters)
        {
            try
            {
                DataSet dataSet = new DataSet();
                MoKetNoiCSDL();
                SqlDataAdapter sqlDA = new SqlDataAdapter();
                sqlDA.SelectCommand = BuildCommand(procedureName, parameters);
                sqlDA.Fill(dataSet);
                DongKetNoiCSDL();
                return dataSet.Tables[0];
            }
            catch (Exception exp)
            {
                throw exp;
            }
        }

        public object ExecuteScalar(string procedureName, IDataParameter[] parameters)
        {
            try
            {
                SqlCommand cmd = BuildCommand(procedureName, parameters);
                MoKetNoiCSDL();
                object retValue = cmd.ExecuteScalar();
                DongKetNoiCSDL();
                return retValue;
            }
            catch (Exception exp)
            {
                throw new Exception("Execute Scalar Error!", exp);
            }
        }
    }
}