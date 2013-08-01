using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataTransferObject;
using DataAccess;

namespace Business
{
    public class WeightChargeBLL
    {
        public static WeightChargeDAL db = new WeightChargeDAL();

        #region Insert WeightCharge
        public bool InsertWeightCharge(WeightCharge weightCharge)
        {
            return db.InsertWeightCharge(weightCharge);
        }
        #endregion

        #region Update WeightCharge
        public bool UpdateWeightCharge(WeightCharge weightCharge)
        {
            return db.UpdateWeightCharge(weightCharge);
        }
        #endregion

        #region Delete WeightCharge
        public bool DeleteWeightCharge(int id)
        {
            return db.DeleteWeightCharge(id);
        }
        #endregion

        #region Get All WeightCharge
        public List<WeightCharge> GetAllWeightCharge()
        {
            return db.GetAllWeightCharge();
        }
        #endregion

        #region Get WeightCharge by ID
        public List<WeightCharge> GetWeightChargeByID(string id)
        {
            return db.GetWeightChargeByID(id);
        }
        #endregion
    }
}
