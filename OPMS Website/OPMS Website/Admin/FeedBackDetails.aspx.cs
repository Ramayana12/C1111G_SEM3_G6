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
    public partial class FeedBackDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AccountID"] == null || Request.QueryString["FeedBackID"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            if (!IsPostBack)
            {
                LoadData();
            }
        }

        private void LoadData()
        {
            FeedBack feedBack = new FeedBack();
            feedBack = FeedBackBLL.GetFeedBackByID(Request.QueryString["FeedBackID"].ToString())[0];
            lblFullName.Text = feedBack.FullName;
            lblEmail.Text = feedBack.Email;
            ltrContent.Text = feedBack.Content;
        }
    }
}