using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataTransferObject;
using DataAccess;

namespace Business
{
    public class AccountBLL
    {
        public static AccountDAL db = new AccountDAL();

        #region Insert Account
        public static bool InsertAccount(Account account)
        {
            return db.InsertAccount(account);
        }
        #endregion

        #region Update Account
        public static bool UpdateAccount(Account account)
        {
            return db.UpdateAccount(account);
        }
        #endregion

        #region Delete Account
        public static bool DeleteAccount(int id)
        {
            return db.DeleteAccount(id);
        }
        #endregion

        #region Get All Accounts
        public static List<Account> GetAllAccount()
        {
            return db.GetAllAccount();
        }
        #endregion

        #region Get Account by ID
        public static List<Account> GetAccountByID(string id)
        {
            return db.GetAccountByID(id);
        }
        #endregion

        #region Get Account by BranchID
        public static List<Account> GetAccountByBranchID(string id)
        {
            return db.GetAccountByBranchID(id);
        }
        #endregion

        #region Get Account by UserName
        public static List<Account> GetAccountByUserName(string userName)
        {
            return db.GetAccountByUserName(userName);
        }
        #endregion

        #region Get Account by Active
        public static List<Account> GetAccountByActive(string active)
        {
            return db.GetAccountByActive(active);
        }
        #endregion

        #region Check Login Account
        public static List<Account> CheckLoginAccount(string userName, string password)
        {
            return db.CheckLoginAccount(userName, password);
        }
        #endregion

        #region Check Exist UserName
        public static bool CheckExistUserName(string userName)
        {
            return db.CheckExistUserName(userName);
        }
        #endregion

        #region Search Account by UserName
        /// <summary>
        /// Search Account by UserName
        /// </summary>
        /// <param name="userName"></param>
        /// <returns></returns>
        public static List<Account> SearchAccountByUserName(string userName)
        {
            return db.SearchAccountByUserName(userName);
        }
        #endregion

        #region Search Account by FullName
        /// <summary>
        /// Search Account by FullName
        /// </summary>
        /// <param name="fullName"></param>
        /// <returns></returns>
        public static List<Account> SearchAccountByFullName(string fullName)
        {
            return db.SearchAccountByFullName(fullName);
        }
        #endregion
    }
}
