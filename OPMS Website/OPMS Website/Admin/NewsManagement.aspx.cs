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
    public partial class NewsManagement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadNews();
            }
        }

        /// <summary>
        /// get all news to grid view
        /// </summary>
        private void LoadNews()
        {
            gvNews.DataSource = NewsBLL.GetAllNews();
            gvNews.DataBind();
            lblTotalReport.Text = gvNews.Rows.Count.ToString();
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            gvNews.DataSource = NewsBLL.SearchNewsByTitle(txtSearch.Text);
            gvNews.DataBind();
            lblTotalReport.Text = gvNews.Rows.Count.ToString();
        }

        protected void gvNews_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvNews.PageIndex = e.NewPageIndex;
            LoadNews();
        }

        protected void lbtnDelete_Command(object sender, CommandEventArgs e)
        {
            NewsBLL.DeleteNews(Convert.ToInt32(e.CommandArgument.ToString()));
            LoadNews();
        }

        protected void lbtnViewDetails_Command(object sender, CommandEventArgs e)
        {
            Response.Redirect("NewsUpdate.aspx?ID=" + e.CommandArgument.ToString());
        }
    }
}