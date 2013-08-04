using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Business;

namespace OPMS_Website.Admin
{
    public partial class admHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AccountID"] == null)
            {
                Response.Redirect("frmLoginForm.aspx");
            }
            if (!IsPostBack)
            {
                LoadData();
            }
        }

        private void LoadData()
        {
            lblBranch.Text = BranchBLL.GetAllBranch().Count.ToString();
            lblAccount.Text = AccountBLL.GetAllAccount().Count.ToString();
            lblService.Text = ServiceChargeBLL.GetAllServiceCharge().Count.ToString();
            lblFeedBack.Text = FeedBackBLL.GetAllFeedBack().Count.ToString();
        }
    }
}