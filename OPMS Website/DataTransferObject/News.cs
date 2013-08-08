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
            obj.Title = (dr["Title"] is DBNull) ? string.Empty : dr["Title"].ToString();
            obj.Subject = (dr["Subject"] is DBNull) ? string.Empty : dr["Subject"].ToString();
            obj.Content = (dr["Content"] is DBNull) ? string.Empty : dr["Content"].ToString();
            obj.CreateDate = (dr["CreateDate"] is DBNull) ? string.Empty : dr["CreateDate"].ToString();
            obj.Active = (dr["Active"] is DBNull) ? string.Empty : dr["Active"].ToString();
            return obj;
        }
        #endregion
    }
}
