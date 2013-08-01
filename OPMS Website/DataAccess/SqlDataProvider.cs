using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace DataAccess
{
    public class SqlDataProvider
    {
        private string strConnect = ConfigurationManager.ConnectionStrings["SQLConnectiongString"].ConnectionString;

        /// <summary>
        /// Tra ve doi tuong command
        /// </summary>
        /// <param name="query"></param>
        /// <param name="type"></param>
        /// <returns>command</returns>
        public SqlCommand GetCommand(String sql, CommandType type)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = type;
            cmd.CommandText = sql;

            return cmd;
        }

        /// <summary>
        /// Set value cho parameter
        /// </summary>
        /// <param name="command"></param>
        /// <param name="paraName"></param>
        /// <param name="value"></param>
        public void AddParameter(SqlCommand cmd, string paraName, object value)
        {
            SqlParameter param = new SqlParameter(paraName, value);

            if (!cmd.Parameters.Contains(paraName))
            {
                cmd.Parameters.Add(param);
            }
        }

        /// <summary>
        /// Thuc thi va tra ve DataTable
        /// </summary>
        /// <param name="command"></param>
        /// <returns></returns>
        public DataTable ExeDataTable(SqlCommand cmd)
        {
            using (SqlConnection conn = new SqlConnection(strConnect))
            {
                cmd.Connection = conn;
                using (DataSet ds = new DataSet())
                {
                    using (SqlDataAdapter da = new SqlDataAdapter())
                    {
                        da.SelectCommand = cmd;
                        da.Fill(ds);
                        return ds.Tables[0];
                    }
                }
            }
        }

        /// <summary>
        /// Thuc thi va tra ve DataReader
        /// </summary>
        /// <param name="command"></param>
        /// <returns></returns>
        public SqlDataReader ExeDataReader(SqlCommand cmd)
        {
            SqlConnection conn = new SqlConnection(strConnect);
            cmd.Connection = conn;
            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            return dr;
        }

        /// <summary>
        /// Thuc thi query
        /// </summary>
        /// <param name="command"></param>
        /// <returns>int</returns>
        public int ExeNonQuery(SqlCommand cmd)
        {
            int result = 0;
            using (SqlConnection conn = new SqlConnection(strConnect))
            {
                cmd.Connection = conn;
                conn.Open();

                result = cmd.ExecuteNonQuery();
            }
            return result;
        }
    }
}
