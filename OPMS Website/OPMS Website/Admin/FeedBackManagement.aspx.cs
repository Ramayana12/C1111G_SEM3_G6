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
    public partial class FeedBackManagement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AccountID"]==null)
            {
                Response.Redirect("Longin.aspx");
            }
            if (!IsPostBack)
            {
                LoadFeedBack();
            }
        }

        private void LoadFeedBack()
        {
            gvFeedBack.DataSource = FeedBackBLL.GetAllFeedBack();
            gvFeedBack.DataBind();
            lblTotalReport.Text = gvFeedBack.Rows.Count.ToString();
        }

        protected void gvFeedBack_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvFeedBack.PageIndex = e.NewPageIndex;
            LoadFeedBack();
        }

        protected void lbtnViewDetails_Command(object sender, CommandEventArgs e)
        {
            Response.Redirect("FeedBackDetails.aspx?FeedBackID=" + e.CommandArgument.ToString());
        }

        protected void lbtnDelete_Command(object sender, CommandEventArgs e)
        {
            FeedBackBLL.DeleteFeedBack(Convert.ToInt32(e.CommandArgument.ToString()));
            LoadFeedBack();
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            gvFeedBack.DataSource = FeedBackBLL.SearchFeedBackByName(txtSearch.Text);
            gvFeedBack.DataBind();
            lblTotalReport.Text = gvFeedBack.Rows.Count.ToString();
        }
    }
}