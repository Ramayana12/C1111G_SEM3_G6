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
    public class WeightChargeDAL : SqlDataProvider
    {
        #region Insert WeightCharge
        public bool InsertWeightCharge(WeightCharge weightCharge)
        {
            using (SqlCommand cmd = GetCommand("insertWeightCharge", CommandType.StoredProcedure))
            {
                AddParameter(cmd, "@Name", weightCharge.Name);
                AddParameter(cmd, "@Charge", weightCharge.Charge);
                AddParameter(cmd, "@Description", weightCharge.Description);

                int result = ExeNonQuery(cmd);
                return result > 0;
            }
        }
        #endregion

        #region Update WeightCharge
        public bool UpdateWeightCharge(WeightCharge weightCharge)
        {
            using (SqlCommand cmd = GetCommand("updateWeightCharge", CommandType.StoredProcedure))
            {
                AddParameter(cmd, "@ID", weightCharge.ID);
                AddParameter(cmd, "@Name", weightCharge.Name);
                AddParameter(cmd, "@Charge", weightCharge.Charge);
                AddParameter(cmd, "@Description", weightCharge.Description);

                int result = ExeNonQuery(cmd);
                return result > 0;
            }
        }
        #endregion

        #region Delete WeightCharge
        public bool DeleteWeightCharge(int id)
        {
            using (SqlCommand cmd = GetCommand("deleteWeightCharge", CommandType.StoredProcedure))
            {
                AddParameter(cmd, "@ID", id);
                int result = ExeNonQuery(cmd);
                return result > 0;
            }
        }
        #endregion

        #region Get All WeightCharge
        public List<WeightCharge> GetAllWeightCharge()
        {
            List<WeightCharge> list = new List<WeightCharge>();
            using (SqlCommand cmd = GetCommand("getAllWeightCharge", CommandType.StoredProcedure))
            {
                WeightCharge weightCharge = new WeightCharge();
                using (SqlDataReader dr = ExeDataReader(cmd))
                {
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            list.Add(weightCharge.WeightChargeIDatareader(dr));
                        }
                    }
                }
                weightCharge = null;
            }
            return list;
        }
        #endregion

        #region Get WeightCharge by ID
        public List<WeightCharge> GetWeightChargeByID(string id)
        {
            List<WeightCharge> list = new List<WeightCharge>();
            using (SqlCommand cmd = GetCommand("getWeightChargeByID", CommandType.StoredProcedure))
            {
                AddParameter(cmd, "@ID", Convert.ToInt32(id));
                WeightCharge weightCharge = new WeightCharge();
                using (SqlDataReader dr = ExeDataReader(cmd))
                {
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            list.Add(weightCharge.WeightChargeIDatareader(dr));
                        }
                    }
                }
                weightCharge = null;
            }
            return list;
        }
        #endregion

        #region Check exist WeightCharge
        public bool ExistWeightCharge(string name)
        {
            using (SqlCommand cmd = GetCommand("getWeightChargeByName", CommandType.StoredProcedure))
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
