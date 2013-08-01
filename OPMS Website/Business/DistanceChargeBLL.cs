using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataTransferObject;
using DataAccess;

namespace Business
{
    public class DistanceChargeBLL
    {
        public static DistanceChargeDAL db = new DistanceChargeDAL();

        #region Insert DistanceCharge
        public bool InsertDistanceCharge(DistanceCharge distanceCharge)
        {
            return db.InsertDistanceCharge(distanceCharge);
        }
        #endregion

        #region Update DistanceCharge
        public bool UpdateDistanceCharge(DistanceCharge distanceCharge)
        {
            return db.UpdateDistanceCharge(distanceCharge);
        }
        #endregion

        #region Delete DistanceCharge
        public bool DeleteDistanceCharge(int id)
        {
            return db.DeleteDistanceCharge(id);
        }
        #endregion

        #region Get All DistanceCharge
        public List<DistanceCharge> GetAllDistanceCharge()
        {
            return db.GetAllDistanceCharge();
        }
        #endregion

        #region Get DistanceCharge by ID
        public List<DistanceCharge> GetDistanceChargeByID(string id)
        {
            return db.GetDistanceChargeByID(id);
        }
        #endregion
    }
}
