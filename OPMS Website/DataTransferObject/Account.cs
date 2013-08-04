using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace DataTransferObject
{
    public class Account
    {
        #region Properties
        public string ID { get; set; }
        public string BranchID { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public string Role { get; set; }
        public string FullName { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Address { get; set; }
        public string BirthDate { get; set; }
        public string CreateDate { get; set; }
        public string Picture { get; set; }
        public string Description { get; set; }
        public string Active { get; set; }
        #endregion

        #region Contructor
        public Account()
        {
            ID = "";
            BranchID = "";
            UserName = "";
            Password = "";
            Role = "";
            FullName = "";
            Email = "";
            Phone = "";
            Address = "";
            BirthDate = "";
            CreateDate = "";
            Picture = "~/Admin/imageEmployees/anonymous.png";
            Description = "";
            Active = "";
        }
        #endregion

        #region[Account IDataReader]
        public Account AccountIDatareader(IDataReader dr)
        {
            Account obj = new Account();
            obj.ID = (dr["ID"] is DBNull) ? string.Empty : dr["ID"].ToString();
            obj.BranchID = (dr["BranchID"] is DBNull) ? string.Empty : dr["BranchID"].ToString();
            obj.UserName = (dr["UserName"] is DBNull) ? string.Empty : dr["UserName"].ToString();
            obj.Password = (dr["Password"] is DBNull) ? string.Empty : dr["Password"].ToString();
            obj.Role = (dr["Role"] is DBNull) ? string.Empty : dr["Role"].ToString();
            obj.FullName = (dr["FullName"] is DBNull) ? string.Empty : dr["FullName"].ToString();
            obj.Email = (dr["Email"] is DBNull) ? string.Empty : dr["Email"].ToString();
            obj.Phone = (dr["Phone"] is DBNull) ? string.Empty : dr["Phone"].ToString();
            obj.Address = (dr["Address"] is DBNull) ? string.Empty : dr["Address"].ToString();
            obj.BirthDate = (dr["BirthDate"] is DBNull) ? string.Empty : dr["BirthDate"].ToString();
            obj.CreateDate = (dr["CreateDate"] is DBNull) ? string.Empty : dr["CreateDate"].ToString();
            obj.Picture = (dr["Picture"] is DBNull) ? string.Empty : dr["Picture"].ToString();
            obj.Description = (dr["Description"] is DBNull) ? string.Empty : dr["Description"].ToString();
            obj.Active = (dr["Active"] is DBNull) ? string.Empty : dr["Active"].ToString();
            return obj;
        }
        #endregion

    }
}
