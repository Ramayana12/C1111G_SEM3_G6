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
            obj.FullName = (dr["Name"] is DBNull) ? string.Empty : dr["Name"].ToString();
            obj.Email = (dr["Email"] is DBNull) ? string.Empty : dr["Email"].ToString();
            obj.Content = (dr["Phone"] is DBNull) ? string.Empty : dr["Phone"].ToString();
            obj.CreateDate = (dr["Address"] is DBNull) ? string.Empty : dr["Address"].ToString();
            return obj;
        }
        #endregion
    }
}
