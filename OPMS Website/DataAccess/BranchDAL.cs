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
    public class BranchDAL : SqlDataProvider
    {
        #region Insert Branch
        public bool InsertBranch(Branch branch)
        {
            using (SqlCommand cmd = GetCommand("insertBranch", CommandType.StoredProcedure))
            {
                AddParameter(cmd, "@Name", branch.Name);
                AddParameter(cmd, "@Email", branch.Email);
                AddParameter(cmd, "@Phone", branch.Phone);
                AddParameter(cmd, "@Address", branch.Address);
                AddParameter(cmd, "@Description", branch.Description);
                int result = ExeNonQuery(cmd);
                return result > 0;
            }
        }
        #endregion

        #region Update Branch
        public bool UpdateBranch(Branch branch)
        {
            using (SqlCommand cmd = GetCommand("updateBranch", CommandType.StoredProcedure))
            {
                AddParameter(cmd, "@ID", branch.ID);
                AddParameter(cmd, "@Name", branch.Name);
                AddParameter(cmd, "@Email", branch.Email);
                AddParameter(cmd, "@Phone", branch.Phone);
                AddParameter(cmd, "@Address", branch.Address);
                AddParameter(cmd, "@Description", branch.Description);
                int result = ExeNonQuery(cmd);
                return result > 0;
            }
        }
        #endregion

        #region Delete Branch
        public bool DeleteBranch(int id)
        {
            using (SqlCommand cmd = GetCommand("deleteBranch", CommandType.StoredProcedure))
            {
                AddParameter(cmd, "@ID", id);
                int result = ExeNonQuery(cmd);
                return result > 0;
            }
        }
        #endregion

        #region Get All Branches
        public List<Branch> GetAllBranch()
        {
            List<Branch> list = new List<Branch>();
            using (SqlCommand cmd = GetCommand("getAllBranch", CommandType.StoredProcedure))
            {
                Branch branch = new Branch();
                using (SqlDataReader dr = ExeDataReader(cmd))
                {
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            list.Add(branch.BranchIDatareader(dr));
                        }
                    }
                }
                branch = null;
            }
            return list;
        }
        #endregion

        #region Get Branch by ID
        public List<Branch> GetBranchByID(string id)
        {
            List<Branch> list = new List<Branch>();
            using (SqlCommand cmd = GetCommand("getBranchByID", CommandType.StoredProcedure))
            {
                AddParameter(cmd, "@ID", Convert.ToInt32(id));
                Branch branch = new Branch();
                using (SqlDataReader dr = ExeDataReader(cmd))
                {
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            list.Add(branch.BranchIDatareader(dr));
                        }
                    }
                }
                branch = null;
            }
            return list;
        }
        #endregion

        #region Get Branch by Name
        public List<Branch> GetBranchByName(string name)
        {
            List<Branch> list = new List<Branch>();
            using (SqlCommand cmd = GetCommand("getBranchByName", CommandType.StoredProcedure))
            {
                AddParameter(cmd, "@Name", name);
                Branch branch = new Branch();
                using (SqlDataReader dr = ExeDataReader(cmd))
                {
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            list.Add(branch.BranchIDatareader(dr));
                        }
                    }
                }
                branch = null;
            }
            return list;
        }
        #endregion

        #region Search Branch by Name
        public List<Branch> SearchBranchByName(string name)
        {
            List<Branch> list = new List<Branch>();
            using (SqlCommand cmd = GetCommand("searchBranchByName", CommandType.StoredProcedure))
            {
                AddParameter(cmd, "@Name", name);
                Branch branch = new Branch();
                using (SqlDataReader dr = ExeDataReader(cmd))
                {
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            list.Add(branch.BranchIDatareader(dr));
                        }
                    }
                }
                branch = null;
            }
            return list;
        }
        #endregion

        #region Check Exist Branch
        public bool ExistBranch(string name)
        {
            List<Branch> list = new List<Branch>();
            using (SqlCommand cmd = GetCommand("getBranchByName", CommandType.StoredProcedure))
            {
                AddParameter(cmd, "@Name", name);
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
    }
}
