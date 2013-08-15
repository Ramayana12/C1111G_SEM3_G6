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
    public partial class Support : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblReport.Text = "";
            }
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                FeedBack feedBack = new FeedBack();
                feedBack.FullName = txtFullName.Text;
                feedBack.Email = txtEmail.Text;
                feedBack.Content = txtContent.Text;

                bool result = FeedBackBLL.InsertFeedBack(feedBack);
                if (result)
                {
                    lblReport.Text = "Send feedback Successful!";
                    Response.AddHeader("REFRESH", "2;URL=Support.aspx");
                }
                else
                {
                    lblReport.Text = "Can't send feed back";
                }
            }
        }
    }
}