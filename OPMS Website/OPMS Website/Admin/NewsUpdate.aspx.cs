using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Business;
using DataTransferObject;

namespace OPMS_Website.Admin
{
    public partial class NewsUpdate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AccountID"] == null || Request.QueryString["ID"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            if (!IsPostBack)
            {
                LoadData();
            }
        }

        /// <summary>
        /// Load news
        /// </summary>
        private void LoadData()
        {
            News news = new News();
            news = NewsBLL.GetNewsByID(Request.QueryString["ID"].ToString())[0];
            txtTitle.Text = news.Title;
            txtSubject.Text = news.Subject;
            ftbBody.Text = news.Content;
            cbActive.Checked =Convert.ToBoolean(news.Active);
            lblReport.Text = "";
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                News news = new News();
            news = NewsBLL.GetNewsByID(Request.QueryString["ID"].ToString())[0];
            news.Title = txtTitle.Text;
            news.Subject = txtSubject.Text;
            news.Content = ftbBody.Text;
            news.Active = (cbActive.Checked) ? "1" : "0";
            bool result = NewsBLL.UpdateNews(news);
            if (result)
            {
                Response.Redirect("NewsManagement.aspx");
            }
            else
            {
                lblReport.Text = "Update Eror!";
            }
            }
        }
    }
}