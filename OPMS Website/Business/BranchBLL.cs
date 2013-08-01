using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataTransferObject;
using DataAccess;

namespace Business
{
    public class BranchBLL
    {
        public static BranchDAL db = new BranchDAL();

        #region Insert Branch
        public static bool InsertBranch(Branch branch)
        {
            return db.InsertBranch(branch);
        }
        #endregion

        #region Update Branch
        public static bool UpdateBranch(Branch branch)
        {
            return db.UpdateBranch(branch);
        }
        #endregion

        #region Delete Branch
        public static bool DeleteBranch(int id)
        {
            return db.DeleteBranch(id);
        }
        #endregion

        #region Get All Branches
        public static List<Branch> GetAllBranch()
        {
            return db.GetAllBranch();          
        }
        #endregion

        #region Get Branch by ID
        public static List<Branch> GetBranchByID(string id)
        {
            return db.GetBranchByID(id);
        }
        #endregion

        #region Get Branch by Name
        public static List<Branch> GetBranchByName(string name)
        {
            return db.GetBranchByName(name);
        }
        #endregion

        #region Search Branch by Name
        public static List<Branch> SearchBranchByName(string name)
        {
            return db.SearchBranchByName(name);
        }
        #endregion

        #region Check Exist Branch
        public static bool ExistBranch(string name)
        {
            return db.ExistBranch(name);
        }
        #endregion
    }
}
