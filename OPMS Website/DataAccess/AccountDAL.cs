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
    public class AccountDAL : SqlDataProvider
    {
        #region Insert Account
        /// <summary>
        /// Insert Account
        /// </summary>
        /// <param name="account"></param>
        /// <returns></returns>
        public bool InsertAccount(Account account)
        {
            using (SqlCommand cmd = GetCommand("insertAccount", CommandType.StoredProcedure))
            {
                AddParameter(cmd, "@BranchID", account.BranchID);
                AddParameter(cmd, "@UserName", account.UserName);
                AddParameter(cmd, "@Password", account.Password);
                AddParameter(cmd, "@Role", account.Role);
                AddParameter(cmd, "@FullName", account.FullName);
                AddParameter(cmd, "@Email", account.Email);
                AddParameter(cmd, "@Phone", account.Phone);
                AddParameter(cmd, "@Address", account.Address);
                AddParameter(cmd, "@BirthDate", account.BirthDate);
                AddParameter(cmd, "@Picture", account.Picture);
                AddParameter(cmd, "@Description", account.Description);
                int result = ExeNonQuery(cmd);
                return result > 0;
            }
        }
        #endregion

        #region Update Account
        public bool UpdateAccount(Account account)
        {
            using (SqlCommand cmd = GetCommand("updateAccount", CommandType.StoredProcedure))
            {
                AddParameter(cmd, "@ID", account.ID);
                AddParameter(cmd, "@BranchID", account.BranchID);
                AddParameter(cmd, "@UserName", account.UserName);
                AddParameter(cmd, "@Password", account.Password);
                AddParameter(cmd, "@Role", account.Role);
                AddParameter(cmd, "@FullName", account.FullName);
                AddParameter(cmd, "@Email", account.Email);
                AddParameter(cmd, "@Phone", account.Phone);
                AddParameter(cmd, "@Address", account.Address);
                AddParameter(cmd, "@BirthDate", account.BirthDate);
                AddParameter(cmd, "@Picture", account.Picture);
                AddParameter(cmd, "@Description", account.Description);
                AddParameter(cmd, "@Active", account.Active);
                int result = ExeNonQuery(cmd);
                return result > 0;
            }
        }
        #endregion

        #region Delete Account
        public bool DeleteAccount(int id)
        {
            using (SqlCommand cmd = GetCommand("deleteAccount", CommandType.StoredProcedure))
            {
                AddParameter(cmd, "@ID", id);
                int result = ExeNonQuery(cmd);
                return result > 0;
            }
        }
        #endregion

        #region Get All Accounts
        public List<Account> GetAllAccount()
        {
            List<Account> list = new List<Account>();
            using (SqlCommand cmd = GetCommand("getAllAccount", CommandType.StoredProcedure))
            {
                Account account = new Account();
                using (SqlDataReader dr = ExeDataReader(cmd))
                {
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            list.Add(account.AccountIDatareader(dr));
                        }
                    }
                }
                account = null;
            }
            return list;
        }
        #endregion

        #region Get Account by ID
        public List<Account> GetAccountByID(string id)
        {
            List<Account> list = new List<Account>();
            using (SqlCommand cmd = GetCommand("getAccountByID", CommandType.StoredProcedure))
            {
                AddParameter(cmd, "@ID", Convert.ToInt32(id));
                Account account = new Account();
                using (SqlDataReader dr = ExeDataReader(cmd))
                {
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            list.Add(account.AccountIDatareader(dr));
                        }
                    }
                }
                account = null;
            }
            return list;
        }
        #endregion

        #region Get Account by BranchID
        public List<Account> GetAccountByBranchID(string id)
        {
            List<Account> list = new List<Account>();
            using (SqlCommand cmd = GetCommand("getAccountByBranchID", CommandType.StoredProcedure))
            {
                AddParameter(cmd, "@ID", Convert.ToInt32(id));
                Account account = new Account();
                using (SqlDataReader dr = ExeDataReader(cmd))
                {
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            list.Add(account.AccountIDatareader(dr));
                        }
                    }
                }
                account = null;
            }
            return list;
        }
        #endregion

        #region Get Account by UserName
        /// <summary>
        /// Get Account by UserName
        /// </summary>
        /// <param name="userName"></param>
        /// <returns></returns>
        public List<Account> GetAccountByUserName(string userName)
        {
            List<Account> list = new List<Account>();
            using (SqlCommand cmd = GetCommand("getAccountByUserName", CommandType.StoredProcedure))
            {
                AddParameter(cmd, "@UserName", userName);
                Account account = new Account();
                using (SqlDataReader dr = ExeDataReader(cmd))
                {
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            list.Add(account.AccountIDatareader(dr));
                        }
                    }
                }
                account = null;
            }
            return list;
        }
        #endregion

        #region Get Account by Active
        public List<Account> GetAccountByActive(string active)
        {
            List<Account> list = new List<Account>();
            using (SqlCommand cmd = GetCommand("getAccountByActive", CommandType.StoredProcedure))
            {
                AddParameter(cmd, "@Active", Convert.ToInt32(active));
                Account account = new Account();
                using (SqlDataReader dr = ExeDataReader(cmd))
                {
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            list.Add(account.AccountIDatareader(dr));
                        }
                    }
                }
                account = null;
            }
            return list;
        }
        #endregion

        #region Check Login Account
        /// <summary>
        /// Check Login Account
        /// </summary>
        /// <param name="userName"></param>
        /// <returns></returns>
        public List<Account> CheckLoginAccount(string userName, string password)
        {
            List<Account> list = new List<Account>();
            using (SqlCommand cmd = GetCommand("checkLoginAccount", CommandType.StoredProcedure))
            {
                AddParameter(cmd, "@UserName", userName);
                AddParameter(cmd, "@Password", password);
                Account account = new Account();
                using (SqlDataReader dr = ExeDataReader(cmd))
                {
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            list.Add(account.AccountIDatareader(dr));
                        }
                        account = null;
                        return list;
                    }
                    else
                        return null;
                }               
            }
        }
        #endregion

        #region Check Exist UserName
        public bool CheckExistUserName(string userName)
        {
            using (SqlCommand cmd = GetCommand("getAccountByUserName", CommandType.StoredProcedure))
            {
                AddParameter(cmd, "@UserName", userName);
                using (SqlDataReader dr = ExeDataReader(cmd))
                {
                    if (dr.HasRows)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
            }
        }
        #endregion

        #region Search Account by UserName
        /// <summary>
        /// Search Account by UserName
        /// </summary>
        /// <param name="userName"></param>
        /// <returns></returns>
        public List<Account> SearchAccountByUserName(string userName)
        {
            List<Account> list = new List<Account>();
            using (SqlCommand cmd = GetCommand("searchAccountByUserName", CommandType.StoredProcedure))
            {
                AddParameter(cmd, "@UserName", userName);
                Account account = new Account();
                using (SqlDataReader dr = ExeDataReader(cmd))
                {
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            list.Add(account.AccountIDatareader(dr));
                        }
                    }
                }
                account = null;
            }
            return list;
        }
        #endregion

        #region Search Account by FullName
        public List<Account> SearchAccountByFullName(string fullName)
        {
            List<Account> list = new List<Account>();
            using (SqlCommand cmd = GetCommand("searchAccountByFullName", CommandType.StoredProcedure))
            {
                AddParameter(cmd, "@FullName", fullName);
                Account account = new Account();
                using (SqlDataReader dr = ExeDataReader(cmd))
                {
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            list.Add(account.AccountIDatareader(dr));
                        }
                    }
                }
                account = null;
            }
            return list;
        }
        #endregion

    }
}
