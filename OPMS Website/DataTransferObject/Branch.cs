using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace DataTransferObject
{
    public class Branch
    {
        #region Properties
        public string ID { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Address { get; set; }
        public string Description { get; set; }
        #endregion

        #region Contructor
        public Branch()
        {
            ID = "";
            Name = "";
            Email = "";
            Phone = "";
            Address = "";
            Description = "";
        }
        #endregion

        #region[Branch IDataReader]
        public Branch BranchIDatareader(IDataReader dr)
        {
            Branch obj = new Branch();
            obj.ID = (dr["ID"] is DBNull) ? string.Empty : dr["ID"].ToString();
            obj.Name = (dr["Name"] is DBNull) ? string.Empty : dr["Name"].ToString();
            obj.Email = (dr["Email"] is DBNull) ? string.Empty : dr["Email"].ToString();
            obj.Phone = (dr["Phone"] is DBNull) ? string.Empty : dr["Phone"].ToString();
            obj.Address = (dr["Address"] is DBNull) ? string.Empty : dr["Address"].ToString();
            obj.Description = (dr["Description"] is DBNull) ? string.Empty : dr["Description"].ToString();
            return obj;
        }
        #endregion
    }
}
