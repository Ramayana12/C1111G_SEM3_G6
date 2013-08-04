using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using DataTransferObject;

namespace DataAccess
{
    public class NewsDAL : SqlDataProvider
    {
        #region Insert News
        public bool InsertNews(News news)
        {
            using (SqlCommand cmd = GetCommand("insertNews", CommandType.StoredProcedure))
            {
                AddParameter(cmd, "@Title", news.Title);
                AddParameter(cmd, "@Subject", news.Subject);
                AddParameter(cmd, "@Content", news.Content);
                
                int result = ExeNonQuery(cmd);
                return result > 0;
            }
        }
        #endregion

        #region Update News
        public bool UpdateNews(News news)
        {
            using (SqlCommand cmd = GetCommand("updateNews", CommandType.StoredProcedure))
            {
                AddParameter(cmd, "@ID", news.ID);
                AddParameter(cmd, "@Title", news.Title);
                AddParameter(cmd, "@Subject", news.Subject);
                AddParameter(cmd, "@Content", news.Content);

                int result = ExeNonQuery(cmd);
                return result > 0;
            }
        }
        #endregion

        #region Delete News
        public bool DeleteNews(int id)
        {
            using (SqlCommand cmd = GetCommand("deleteNews", CommandType.StoredProcedure))
            {
                AddParameter(cmd, "@ID", id);
                int result = ExeNonQuery(cmd);
                return result > 0;
            }
        }
        #endregion

        #region Get All News
        public List<News> GetAllNews()
        {
            List<News> list = new List<News>();
            using (SqlCommand cmd = GetCommand("getAllNews", CommandType.StoredProcedure))
            {
                News news = new News();
                using (SqlDataReader dr = ExeDataReader(cmd))
                {
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            list.Add(news.NewsIDatareader(dr));
                        }
                    }
                }
                news = null;
            }
            return list;
        }
        #endregion

        #region Get News by ID
        public List<News> GetNewsByID(string id)
        {
            List<News> list = new List<News>();
            using (SqlCommand cmd = GetCommand("getNewsByID", CommandType.StoredProcedure))
            {
                AddParameter(cmd, "@ID", Convert.ToInt32(id));
                News news = new News();
                using (SqlDataReader dr = ExeDataReader(cmd))
                {
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            list.Add(news.NewsIDatareader(dr));
                        }
                    }
                }
                news = null;
            }
            return list;
        }
        #endregion
    }
}
