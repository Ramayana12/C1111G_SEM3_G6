﻿using System;
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
        public static bool InsertDistanceCharge(DistanceCharge distanceCharge)
        {
            return db.InsertDistanceCharge(distanceCharge);
        }
        #endregion

        #region Update DistanceCharge
        public static bool UpdateDistanceCharge(DistanceCharge distanceCharge)
        {
            return db.UpdateDistanceCharge(distanceCharge);
        }
        #endregion

        #region Delete DistanceCharge
        public static bool DeleteDistanceCharge(int id)
        {
            return db.DeleteDistanceCharge(id);
        }
        #endregion

        #region Get All DistanceCharge
        public static List<DistanceCharge> GetAllDistanceCharge()
        {
            return db.GetAllDistanceCharge();
        }
        #endregion

        #region Get DistanceCharge by ID
        public static List<DistanceCharge> GetDistanceChargeByID(string id)
        {
            return db.GetDistanceChargeByID(id);
        }
        #endregion

        #region Check exist DistanceCharge
        public static bool ExistDistanceCharge(string name)
        {
            return db.ExistDistanceCharge(name);
        }
        #endregion
    }
}
