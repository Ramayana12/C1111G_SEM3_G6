using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataTransferObject;
using DataAccess;

namespace Business
{
    public class NewsBLL
    {
        public static NewsDAL db = new NewsDAL();

        #region Insert News
        public static bool InsertNews(News news)
        {
            return db.InsertNews(news);
        }
        #endregion

        #region Update News
        public static bool UpdateNews(News news)
        {
            return db.UpdateNews(news);
        }
        #endregion

        #region Delete News
        public static bool DeleteNews(int id)
        {
            return db.DeleteNews(id);
        }
        #endregion

        #region Get All News
        public static List<News> GetAllNews()
        {
            return db.GetAllNews();
        }
        #endregion

        #region Get News by ID
        public static List<News> GetNewsByID(string id)
        {
            return db.GetNewsByID(id);
        }
        #endregion

        #region Search News by Title
        public static List<News> SearchNewsByTitle(string title)
        {
            return db.GetNewsByID(title);
        }
        #endregion
    }
}
