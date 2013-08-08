using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataTransferObject;
using DataAccess;

namespace Business
{
    public class FeedBackBLL
    {
        public static FeedBackDAL db = new FeedBackDAL();

        #region Insert FeedBack
        public static bool InsertFeedBack(FeedBack feedBack)
        {
            return db.InsertFeedBack(feedBack);
        }
        #endregion

        #region Update FeedBack
        public static bool UpdateFeedBack(FeedBack feedBack)
        {
            return db.UpdateFeedBack(feedBack);
        }
        #endregion

        #region Delete FeedBack
        public static bool DeleteFeedBack(int id)
        {
            return db.DeleteFeedBack(id);
        }
        #endregion

        #region Get All FeedBack
        public static List<FeedBack> GetAllFeedBack()
        {
            return db.GetAllFeedBack();
        }
        #endregion

        #region Get FeedBack by ID
        public static List<FeedBack> GetFeedBackByID(string id)
        {
            return db.GetFeedBackByID(id);
        }
        #endregion

        #region Search FeedBack by Name
        public static List<FeedBack> SearchFeedBackByName(string name)
        {
            return db.GetFeedBackByID(name);
        }
        #endregion
    }
}
