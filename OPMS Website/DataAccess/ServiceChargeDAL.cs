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
    public class ServiceChargeDAL : SqlDataProvider
    {
        #region Insert ServiceCharge
        public bool InsertServiceCharge(ServiceCharge serviceCharge)
        {
            using (SqlCommand cmd = GetCommand("insertServiceCharge", CommandType.StoredProcedure))
            {
                AddParameter(cmd, "@Name", serviceCharge.Name);
                AddParameter(cmd, "@Charge", serviceCharge.Charge);
                AddParameter(cmd, "@Description", serviceCharge.Description);

                int result = ExeNonQuery(cmd);
                return result > 0;
            }
        }
        #endregion

        #region Update ServiceCharge
        public bool UpdateServiceCharge(ServiceCharge serviceCharge)
        {
            using (SqlCommand cmd = GetCommand("updateServiceCharge", CommandType.StoredProcedure))
            {
                AddParameter(cmd, "@ID", serviceCharge.ID);
                AddParameter(cmd, "@Name", serviceCharge.Name);
                AddParameter(cmd, "@Charge", serviceCharge.Charge);
                AddParameter(cmd, "@Description", serviceCharge.Description);

                int result = ExeNonQuery(cmd);
                return result > 0;
            }
        }
        #endregion

        #region Delete ServiceCharge
        public bool DeleteServiceCharge(int id)
        {
            using (SqlCommand cmd = GetCommand("deleteServiceCharge", CommandType.StoredProcedure))
            {
                AddParameter(cmd, "@ID", id);
                int result = ExeNonQuery(cmd);
                return result > 0;
            }
        }
        #endregion

        #region Get All ServiceCharge
        public List<ServiceCharge> GetAllServiceCharge()
        {
            List<ServiceCharge> list = new List<ServiceCharge>();
            using (SqlCommand cmd = GetCommand("getAllServiceCharge", CommandType.StoredProcedure))
            {
                ServiceCharge serviceCharge = new ServiceCharge();
                using (SqlDataReader dr = ExeDataReader(cmd))
                {
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            list.Add(serviceCharge.ServiceChargeIDatareader(dr));
                        }
                    }
                }
                serviceCharge = null;
            }
            return list;
        }
        #endregion

        #region Get ServiceCharge by ID
        public List<ServiceCharge> GetServiceChargeByID(string id)
        {
            List<ServiceCharge> list = new List<ServiceCharge>();
            using (SqlCommand cmd = GetCommand("getServiceChargeByID", CommandType.StoredProcedure))
            {
                AddParameter(cmd, "@ID", Convert.ToInt32(id));
                ServiceCharge serviceCharge = new ServiceCharge();
                using (SqlDataReader dr = ExeDataReader(cmd))
                {
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            list.Add(serviceCharge.ServiceChargeIDatareader(dr));
                        }
                    }
                }
                serviceCharge = null;
            }
            return list;
        }
        #endregion

    }
}
