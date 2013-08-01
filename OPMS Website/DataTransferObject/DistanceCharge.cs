using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace DataTransferObject
{
    public class DistanceCharge
    {
        #region Properies
        public string ID { get; set; }
        public string Name { get; set; }
        public string Charge { get; set; }
        public string Description { get; set; }
        #endregion

        #region Contructor
        public DistanceCharge()
        {
            ID = "";
            Name = "";
            Charge = "";
            Description = "";
        }
        #endregion

        #region[DistanceCharge IDataReader]
        public DistanceCharge DistanceChargeIDatareader(IDataReader dr)
        {
            DistanceCharge obj = new DistanceCharge();
            obj.ID = (dr["ID"] is DBNull) ? string.Empty : dr["ID"].ToString();
            obj.Name = (dr["Name"] is DBNull) ? string.Empty : dr["Name"].ToString();
            obj.Charge = (dr["Charge"] is DBNull) ? string.Empty : dr["Charge"].ToString();
            obj.Description = (dr["Description"] is DBNull) ? string.Empty : dr["Description"].ToString();
            return obj;
        }
        #endregion
    }
}
