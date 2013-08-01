using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataTransferObject;
using DataAccess;

namespace Business
{
    public class ServiceChargeBLL
    {
        public static ServiceChargeDAL db = new ServiceChargeDAL();

        #region Insert ServiceCharge
        public bool InsertServiceCharge(ServiceCharge serviceCharge)
        {
            return db.InsertServiceCharge(serviceCharge);
        }
        #endregion

        #region Update ServiceCharge
        public bool UpdateServiceCharge(ServiceCharge serviceCharge)
        {
            return db.UpdateServiceCharge(serviceCharge);
        }
        #endregion

        #region Delete ServiceCharge
        public bool DeleteServiceCharge(int id)
        {
            return db.DeleteServiceCharge(id);
        }
        #endregion

        #region Get All ServiceCharge
        public List<ServiceCharge> GetAllServiceCharge()
        {
            return db.GetAllServiceCharge();
        }
        #endregion

        #region Get ServiceCharge by ID
        public List<ServiceCharge> GetServiceChargeByID(string id)
        {
            return db.GetServiceChargeByID(id);
        }
        #endregion
    }
}
