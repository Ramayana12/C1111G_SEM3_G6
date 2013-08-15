using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataTransferObject;
using DataAccess;

namespace Business
{
    public class OrderBLL
    {
        public static OrderDAL db = new OrderDAL();

        #region Insert Order
        public static bool InsertOrder(Order order)
        {
            return db.InsertOrder(order);
        }
        #endregion

        #region Update Order
        public static bool UpdateOrder(Order order)
        {
            return db.UpdateOrder(order);
        }
        #endregion

        #region Delete Order
        public static bool DeleteOrder(int id)
        {
            return db.DeleteOrder(id);
        }
        #endregion

        #region Get All Orders
        public static List<Order> GetAllOrder()
        {
            return db.GetAllOrder();
        }
        #endregion

        #region Get Order by ID
        public static List<Order> GetOrderByID(string id)
        {
            return db.GetOrderByID(id);
        }
        #endregion

        #region Search Order by Name
        public static List<Order> SearchOrderByName(string name)
        {
            return db.SearchOrderByName(name);
        }
        #endregion

        #region Get Order by Status
        public static List<Order> GetOrderByStatus(string status)
        {
            return db.GetOrderByStatus(status);
        }
        #endregion

        #region Get Order by service charge ID
        public static List<Order> GetOrderByServiceID(string id)
        {
            return db.GetOrderByServiceID(id);
        }
        #endregion

        #region Get Order by distance charge ID
        public static List<Order> GetOrderByDistanceID(string id)
        {
            return db.GetOrderByDistanceID(id);
        }
        #endregion

        #region Get Order by weight charge ID
        public static List<Order> GetOrderByWeightID(string id)
        {
            return db.GetOrderByWeightID(id);
        }
        #endregion
    }
}
