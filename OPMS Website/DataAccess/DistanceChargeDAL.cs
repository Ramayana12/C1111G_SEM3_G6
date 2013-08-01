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
    public class DistanceChargeDAL : SqlDataProvider
    {
        #region Insert DistanceCharge
        public bool InsertDistanceCharge(DistanceCharge distanceCharge)
        {
            using (SqlCommand cmd = GetCommand("insertServiceCharge", CommandType.StoredProcedure))
            {
                AddParameter(cmd, "@Name", distanceCharge.Name);
                AddParameter(cmd, "@Charge", distanceCharge.Charge);
                AddParameter(cmd, "@Description", distanceCharge.Description);

                int result = ExeNonQuery(cmd);
                return result > 0;
            }
        }
        #endregion

        #region Update DistanceCharge
        public bool UpdateDistanceCharge(DistanceCharge distanceCharge)
        {
            using (SqlCommand cmd = GetCommand("updateServiceCharge", CommandType.StoredProcedure))
            {
                AddParameter(cmd, "@ID", distanceCharge.ID);
                AddParameter(cmd, "@Name", distanceCharge.Name);
                AddParameter(cmd, "@Charge", distanceCharge.Charge);
                AddParameter(cmd, "@Description", distanceCharge.Description);

                int result = ExeNonQuery(cmd);
                return result > 0;
            }
        }
        #endregion

        #region Delete DistanceCharge
        public bool DeleteDistanceCharge(int id)
        {
            using (SqlCommand cmd = GetCommand("deleteDistanceCharge", CommandType.StoredProcedure))
            {
                AddParameter(cmd, "@ID", id);
                int result = ExeNonQuery(cmd);
                return result > 0;
            }
        }
        #endregion

        #region Get All DistanceCharge
        public List<DistanceCharge> GetAllDistanceCharge()
        {
            List<DistanceCharge> list = new List<DistanceCharge>();
            using (SqlCommand cmd = GetCommand("getAllDistanceCharge", CommandType.StoredProcedure))
            {
                DistanceCharge distanceCharge = new DistanceCharge();
                using (SqlDataReader dr = ExeDataReader(cmd))
                {
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            list.Add(distanceCharge.DistanceChargeIDatareader(dr));
                        }
                    }
                }
                distanceCharge = null;
            }
            return list;
        }
        #endregion

        #region Get DistanceCharge by ID
        public List<DistanceCharge> GetDistanceChargeByID(string id)
        {
            List<DistanceCharge> list = new List<DistanceCharge>();
            using (SqlCommand cmd = GetCommand("getDistanceChargeByID", CommandType.StoredProcedure))
            {
                AddParameter(cmd, "@ID", Convert.ToInt32(id));
                DistanceCharge distanceCharge = new DistanceCharge();
                using (SqlDataReader dr = ExeDataReader(cmd))
                {
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            list.Add(distanceCharge.DistanceChargeIDatareader(dr));
                        }
                    }
                }
                distanceCharge = null;
            }
            return list;
        }
        #endregion
    }
}
