using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace DataTransferObject
{
    public class FeedBack
    {
        #region Properties
        public string ID { get; set; }
        public string FullName { get; set; }
        public string Email { get; set; }
        public string Content { get; set; }
        public string CreateDate { get; set; }
        #endregion

        #region Contructor
        public FeedBack()
        {
            ID = "";
            FullName = "";
            Email = "";
            Content = "";
            CreateDate = "";
        }
        #endregion

        #region[FeedBack IDataReader]
        public FeedBack FeedBackIDatareader(IDataReader dr)
        {
            FeedBack obj = new FeedBack();
            obj.ID = (dr["ID"] is DBNull) ? string.Empty : dr["ID"].ToString();
            obj.FullName = (dr["FullName"] is DBNull) ? string.Empty : dr["FullName"].ToString();
            obj.Email = (dr["Email"] is DBNull) ? string.Empty : dr["Email"].ToString();
            obj.Content = (dr["Content"] is DBNull) ? string.Empty : dr["Content"].ToString();
            obj.CreateDate = (dr["CreateDate"] is DBNull) ? string.Empty : dr["CreateDate"].ToString();
            return obj;
        }
        #endregion
    }
}
