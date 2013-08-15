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
    public partial class NewsCreate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AccountID"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            if (!IsPostBack)
            {
                lblReport.Text = "";
            }
        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                News news = new News();
                news.Title = txtTitle.Text;
                news.Subject = txtSubject.Text;
                news.Content = ftbBody.Text;
                bool result = NewsBLL.InsertNews(news);
                if (result)
                {
                    lblReport.Text = "Create new News Successful!";
                    Response.AddHeader("REFRESH", "2;URL=NewsManagement.aspx");
                }
                else
                {
                    lblReport.Text = "Insert Eror!";
                }
            }
        }
    }
}