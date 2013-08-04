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
        public static bool InsertServiceCharge(ServiceCharge serviceCharge)
        {
            return db.InsertServiceCharge(serviceCharge);
        }
        #endregion

        #region Update ServiceCharge
        public static bool UpdateServiceCharge(ServiceCharge serviceCharge)
        {
            return db.UpdateServiceCharge(serviceCharge);
        }
        #endregion

        #region Delete ServiceCharge
        public static bool DeleteServiceCharge(int id)
        {
            return db.DeleteServiceCharge(id);
        }
        #endregion

        #region Get All ServiceCharge
        public static List<ServiceCharge> GetAllServiceCharge()
        {
            return db.GetAllServiceCharge();
        }
        #endregion

        #region Get ServiceCharge by ID
        public static List<ServiceCharge> GetServiceChargeByID(string id)
        {
            return db.GetServiceChargeByID(id);
        }
        #endregion

        #region Check exist ServiceCharge
        public static bool ExistServiceCharge(string name)
        {
            return db.ExistServiceCharge(name);
        }
        #endregion
    }
}
