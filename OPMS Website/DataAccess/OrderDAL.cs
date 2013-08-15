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
    public class OrderDAL : SqlDataProvider
    {
        #region Insert Order
        public bool InsertOrder(Order order)
        {
            using (SqlCommand cmd = GetCommand("insertOrder", CommandType.StoredProcedure))
            {
                AddParameter(cmd, "@SenderName", order.SenderName);
                AddParameter(cmd, "@SenderAddress", order.SenderAddress);
                AddParameter(cmd, "@SenderPhone", order.SenderPhone);
                AddParameter(cmd, "@EmployeeID", order.EmployeeID);
                AddParameter(cmd, "@ReceiverName", order.ReceiverName);
                AddParameter(cmd, "@ReceiverAddress", order.ReceiverAddress);
                AddParameter(cmd, "@ReceiverPhone", order.ReceiverPhone);
                AddParameter(cmd, "@ServiceChargeID", order.ServiceChargeID);
                AddParameter(cmd, "@DistanceChargeID", order.DistanceChargeID);
                AddParameter(cmd, "@WeightChargeID", order.WeightChargeID);
                AddParameter(cmd, "@Total", order.Total);
                AddParameter(cmd, "@Note", order.Note);

                int result = ExeNonQuery(cmd);
                return result > 0;
            }
        }
        #endregion

        #region Update Order
        public bool UpdateOrder(Order order)
        {
            using (SqlCommand cmd = GetCommand("updateOrder", CommandType.StoredProcedure))
            {
                AddParameter(cmd, "@ID", order.ID);
                AddParameter(cmd, "@SenderName", order.SenderName);
                AddParameter(cmd, "@SenderAddress", order.SenderAddress);
                AddParameter(cmd, "@SenderPhone", order.SenderPhone);
                AddParameter(cmd, "@EmployeeID", order.EmployeeID);
                AddParameter(cmd, "@ReceiverName", order.ReceiverName);
                AddParameter(cmd, "@ReceiverAddress", order.ReceiverAddress);
                AddParameter(cmd, "@ReceiverPhone", order.ReceiverPhone);
                AddParameter(cmd, "@DeliveryEmployeeID", order.DeliveryEmployeeID);
                AddParameter(cmd, "@ReceiveDate", order.ReceiveDate);
                AddParameter(cmd, "@ServiceChargeID", order.ServiceChargeID);
                AddParameter(cmd, "@DistanceChargeID", order.DistanceChargeID);
                AddParameter(cmd, "@WeightChargeID", order.WeightChargeID);
                AddParameter(cmd, "@Total", order.Total);
                AddParameter(cmd, "@Status", order.Status);
                AddParameter(cmd, "@Note", order.Note);
                int result = ExeNonQuery(cmd);
                return result > 0;
            }
        }
        #endregion

        #region Delete Order
        public bool DeleteOrder(int id)
        {
            using (SqlCommand cmd = GetCommand("deleteOrder", CommandType.StoredProcedure))
            {
                AddParameter(cmd, "@ID", id);
                int result = ExeNonQuery(cmd);
                return result > 0;
            }
        }
        #endregion

        #region Get All Orders
        public List<Order> GetAllOrder()
        {
            List<Order> list = new List<Order>();
            using (SqlCommand cmd = GetCommand("getAllOrder", CommandType.StoredProcedure))
            {
                Order order = new Order();
                using (SqlDataReader dr = ExeDataReader(cmd))
                {
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            list.Add(order.OrderIDatareader(dr));
                        }
                    }
                }
                order = null;
            }
            return list;
        }
        #endregion

        #region Get Order by ID
        public List<Order> GetOrderByID(string id)
        {
            List<Order> list = new List<Order>();
            using (SqlCommand cmd = GetCommand("getOrderByID", CommandType.StoredProcedure))
            {
                AddParameter(cmd, "@ID", Convert.ToInt32(id));
                Order order = new Order();
                using (SqlDataReader dr = ExeDataReader(cmd))
                {
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            list.Add(order.OrderIDatareader(dr));
                        }
                    }
                }
                order = null;
            }
            return list;
        }
        #endregion

        #region Search Order by Name
        public List<Order> SearchOrderByName(string name)
        {
            List<Order> list = new List<Order>();
            using (SqlCommand cmd = GetCommand("searchOrderByName", CommandType.StoredProcedure))
            {
                AddParameter(cmd, "@Name", name);
                Order order = new Order();
                using (SqlDataReader dr = ExeDataReader(cmd))
                {
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            list.Add(order.OrderIDatareader(dr));
                        }
                    }
                }
                order = null;
            }
            return list;
        }
        #endregion

        #region Get Order by Status
        public List<Order> GetOrderByStatus(string status)
        {
            List<Order> list = new List<Order>();
            using (SqlCommand cmd = GetCommand("getOrderByStatus", CommandType.StoredProcedure))
            {
                AddParameter(cmd, "@Status", status);
                Order order = new Order();
                using (SqlDataReader dr = ExeDataReader(cmd))
                {
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            list.Add(order.OrderIDatareader(dr));
                        }
                    }
                }
                order = null;
            }
            return list;
        }
        #endregion

        #region Get Order by service charge ID
        public List<Order> GetOrderByServiceID(string id)
        {
            List<Order> list = new List<Order>();
            using (SqlCommand cmd = GetCommand("getOrderByServiceID", CommandType.StoredProcedure))
            {
                AddParameter(cmd, "@ServiceChargeID", Convert.ToInt32(id));
                Order order = new Order();
                using (SqlDataReader dr = ExeDataReader(cmd))
                {
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            list.Add(order.OrderIDatareader(dr));
                        }
                    }
                }
                order = null;
            }
            return list;
        }
        #endregion

        #region Get Order by distance charge ID
        public List<Order> GetOrderByDistanceID(string id)
        {
            List<Order> list = new List<Order>();
            using (SqlCommand cmd = GetCommand("getOrderByDistanceID", CommandType.StoredProcedure))
            {
                AddParameter(cmd, "@DistanceChargeID", Convert.ToInt32(id));
                Order order = new Order();
                using (SqlDataReader dr = ExeDataReader(cmd))
                {
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            list.Add(order.OrderIDatareader(dr));
                        }
                    }
                }
                order = null;
            }
            return list;
        }
        #endregion

        #region Get Order by weight charge ID
        public List<Order> GetOrderByWeightID(string id)
        {
            List<Order> list = new List<Order>();
            using (SqlCommand cmd = GetCommand("getOrderByWeightID", CommandType.StoredProcedure))
            {
                AddParameter(cmd, "@WeightChargeID", Convert.ToInt32(id));
                Order order = new Order();
                using (SqlDataReader dr = ExeDataReader(cmd))
                {
                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            list.Add(order.OrderIDatareader(dr));
                        }
                    }
                }
                order = null;
            }
            return list;
        }
        #endregion
    }
}
