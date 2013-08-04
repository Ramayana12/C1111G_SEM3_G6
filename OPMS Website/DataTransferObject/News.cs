using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace DataTransferObject
{
    public class News
    {
        #region Properties
        public string ID { get; set; }
        public string Title { get; set; }
        public string Subject { get; set; }
        public string Content { get; set; }
        public string CreateDate { get; set; }
        public string Active { get; set; }
        #endregion

        #region Contructor
        public News()
        {
            ID = "";
            Title = "";
            Subject = "";
            Content = "";
            CreateDate = "";
            Active = "";
        }
        #endregion

        #region[News IDataReader]
        public News NewsIDatareader(IDataReader dr)
        {
            News obj = new News();
            obj.ID = (dr["ID"] is DBNull) ? string.Empty : dr["ID"].ToString();
            obj.Title = (dr["Name"] is DBNull) ? string.Empty : dr["Name"].ToString();
            obj.Subject = (dr["Email"] is DBNull) ? string.Empty : dr["Email"].ToString();
            obj.Content = (dr["Phone"] is DBNull) ? string.Empty : dr["Phone"].ToString();
            obj.CreateDate = (dr["Address"] is DBNull) ? string.Empty : dr["Address"].ToString();
            obj.Active = (dr["Description"] is DBNull) ? string.Empty : dr["Description"].ToString();
            return obj;
        }
        #endregion
    }
}
