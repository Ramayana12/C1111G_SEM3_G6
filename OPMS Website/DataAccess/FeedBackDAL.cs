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
    public class FeedBackDAL : SqlDataProvider
    {
        #region Insert FeedBack
        public bool InsertFeedBack(FeedBack feedBack)
        {
            using (SqlCommand cmd = GetCommand("insertFeedBack", CommandType.StoredProcedure))
            {
                AddParameter(cmd, "@FullName", feedBack.FullName);
                AddParameter(cmd, "@Email", feedBack.Email);
                AddParameter(cmd, "@Content", feedBack.Content);

                int result = ExeNonQuery(cmd);
                return result > 0;
            }
        }
        #endregion

        #region Update FeedBack
        public bool UpdateFeedBack(FeedBack feedBack)
        {
            using (SqlCommand cmd = GetCommand("updateFeedBack", CommandType.StoredProcedure))
            {
                AddParameter(cmd, "@ID", feedBack.ID);
                AddParameter(cmd, "@FullName", feedBack.FullName);
                AddParameter(cmd, "@Email", feedBack.Email);
                AddParameter(cmd, "@Content", feedBack.Content);

                int result = ExeNonQuery(cmd);
                return result > 0;
            }
        }
        #endregion

        #region Delete FeedBack
        public bool DeleteFeedBack(int id)
        {
            using (SqlCommand cmd = GetCommand("deleteFeedBack", CommandType.StoredProcedure))
            {
                AddParameter(cmd, "@ID", id);
                int result = ExeNonQuery(cmd);
                return result > 0;
            }
        }
        #endregion

        #region Get All FeedBack
        public List<FeedBack> GetAllFeedBack()
        {
            List<FeedBack> list = new List<FeedBack>();
            using (SqlCommand cmd = GetCommand("getAllFeedBack", CommandType.StoredProcedure))
            {
                FeedBack feedBack = new FeedBack();
                using (SqlDataReader dr = ExeDataReader(cmd))
                {
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            list.Add(feedBack.FeedBackIDatareader(dr));
                        }
                    }
                }
                feedBack = null;
            }
            return list;
        }
        #endregion

        #region Get FeedBack by ID
        public List<FeedBack> GetFeedBackByID(string id)
        {
            List<FeedBack> list = new List<FeedBack>();
            using (SqlCommand cmd = GetCommand("getFeedBackByID", CommandType.StoredProcedure))
            {
                AddParameter(cmd, "@ID", Convert.ToInt32(id));
                FeedBack feedBack = new FeedBack();
                using (SqlDataReader dr = ExeDataReader(cmd))
                {
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            list.Add(feedBack.FeedBackIDatareader(dr));
                        }
                    }
                }
                feedBack = null;
            }
            return list;
        }
        #endregion

        #region Search FeedBack by Name
        public List<FeedBack> SearchFeedBackByName(string name)
        {
            List<FeedBack> list = new List<FeedBack>();
            using (SqlCommand cmd = GetCommand("SearchFeedBackByName", CommandType.StoredProcedure))
            {
                AddParameter(cmd, "@FullName", name);
                FeedBack feedBack = new FeedBack();
                using (SqlDataReader dr = ExeDataReader(cmd))
                {
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            list.Add(feedBack.FeedBackIDatareader(dr));
                        }
                    }
                }
                feedBack = null;
            }
            return list;
        }
        #endregion
    }
}
