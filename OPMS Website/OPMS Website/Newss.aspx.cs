using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Business;
using DataTransferObject;

namespace OPMS_Website
{
    public partial class Newss : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["ID"] == null)
            {
                Response.Redirect("Home.aspx");
            }
            if (!IsPostBack)
            {
                LoadData();
            }
        }

        private void LoadData()
        {
            News news =new News();
            news = NewsBLL.GetNewsByID(Request.QueryString["ID"].ToString())[0];

            lblTitle.Text = news.Title;
            ltrSubject.Text = news.Subject;
            ltrContent.Text = news.Content;
            lblCreateDate.Text = "Page last updated at: " + Convert.ToDateTime(news.CreateDate).ToLongDateString();
        }
    }
}