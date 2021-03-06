﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace DataTransferObject
{
    public class WeightCharge
    {
        #region Properies
        public string ID { get; set; }
        public string Name { get; set; }
        public string Charge { get; set; }
        public string Description { get; set; }
        #endregion

        #region Contructor
        public WeightCharge()
        {
            ID = "";
            Name = "";
            Charge = "";
            Description = "";
        }
        #endregion

        #region[WeightCharge IDataReader]
        public WeightCharge WeightChargeIDatareader(IDataReader dr)
        {
            WeightCharge obj = new WeightCharge();
            obj.ID = (dr["ID"] is DBNull) ? string.Empty : dr["ID"].ToString();
            obj.Name = (dr["Name"] is DBNull) ? string.Empty : dr["Name"].ToString();
            obj.Charge = (dr["Charge"] is DBNull) ? string.Empty : dr["Charge"].ToString();
            obj.Description = (dr["Description"] is DBNull) ? string.Empty : dr["Description"].ToString();
            return obj;
        }
        #endregion
    }
}
