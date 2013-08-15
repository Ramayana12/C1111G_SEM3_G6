using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace DataTransferObject
{
    public class Order
    {
        #region Properties
        public string ID { get; set; }
        public string CreateDate { get; set; }
        public string SenderName { get; set; }
        public string SenderAddress { get; set; }
        public string SenderPhone { get; set; }
        public string EmployeeID { get; set; }
        public string ReceiverName { get; set; }
        public string ReceiverAddress { get; set; }
        public string ReceiverPhone { get; set; }
        public string DeliveryEmployeeID { get; set; }
        public string ReceiveDate { get; set; }
        public string ServiceChargeID { get; set; }
        public string DistanceChargeID { get; set; }
        public string WeightChargeID { get; set; }
        public string Total { get; set; }
        public string Status { get; set; }
        public string Note { get; set; }
        #endregion

        #region Contructor
        public Order()
        {
            ID = "";
            CreateDate = "";
            SenderName = "";
            SenderAddress = "";
            SenderPhone = "";
            EmployeeID = "";
            ReceiverName = "";
            ReceiverAddress = "";
            ReceiverPhone = "";
            DeliveryEmployeeID = "";
            ReceiveDate = "";
            ServiceChargeID = "";
            DistanceChargeID = "";
            WeightChargeID = "";
            Total = "";
            Status = "";
            Note = "";
        }
        #endregion

        #region[Order IDataReader]
        public Order OrderIDatareader(IDataReader dr)
        {
            Order obj = new Order();
            obj.ID = (dr["ID"] is DBNull) ? string.Empty : dr["ID"].ToString();
            obj.CreateDate = (dr["CreateDate"] is DBNull) ? string.Empty : dr["CreateDate"].ToString();
            obj.SenderName = (dr["SenderName"] is DBNull) ? string.Empty : dr["SenderName"].ToString();
            obj.SenderAddress = (dr["SenderAddress"] is DBNull) ? string.Empty : dr["SenderAddress"].ToString();
            obj.SenderPhone = (dr["SenderPhone"] is DBNull) ? string.Empty : dr["SenderPhone"].ToString();
            obj.EmployeeID = (dr["EmployeeID"] is DBNull) ? string.Empty : dr["EmployeeID"].ToString();
            obj.ReceiverName = (dr["ReceiverName"] is DBNull) ? string.Empty : dr["ReceiverName"].ToString();
            obj.ReceiverAddress = (dr["ReceiverAddress"] is DBNull) ? string.Empty : dr["ReceiverAddress"].ToString();
            obj.ReceiverPhone = (dr["ReceiverPhone"] is DBNull) ? string.Empty : dr["ReceiverPhone"].ToString();
            obj.DeliveryEmployeeID = (dr["DeliveryEmployeeID"] is DBNull) ? string.Empty : dr["DeliveryEmployeeID"].ToString();
            obj.ReceiveDate = (dr["ReceiveDate"] is DBNull) ? string.Empty : dr["ReceiveDate"].ToString();
            obj.ServiceChargeID = (dr["ServiceChargeID"] is DBNull) ? string.Empty : dr["ServiceChargeID"].ToString();
            obj.DistanceChargeID = (dr["DistanceChargeID"] is DBNull) ? string.Empty : dr["DistanceChargeID"].ToString();
            obj.WeightChargeID = (dr["WeightChargeID"] is DBNull) ? string.Empty : dr["WeightChargeID"].ToString();
            obj.Total = (dr["Total"] is DBNull) ? string.Empty : dr["Total"].ToString();
            obj.Status = (dr["Status"] is DBNull) ? string.Empty : dr["Status"].ToString();
            obj.Note = (dr["Note"] is DBNull) ? string.Empty : dr["Note"].ToString();
            return obj;
        }
        #endregion
    }
}
