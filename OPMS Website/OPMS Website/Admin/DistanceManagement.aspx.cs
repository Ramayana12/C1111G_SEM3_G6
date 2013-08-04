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
    public partial class DistanceManagement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AccountID"] == null)
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
            gvDistance.DataSource = DistanceChargeBLL.GetAllDistanceCharge();
            gvDistance.DataBind();

            lblTotalService.Text = gvDistance.Rows.Count.ToString();
        }

        protected void gvDistance_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvDistance.PageIndex = e.NewPageIndex;
            LoadData();
        }

        protected void lbtnRemove_Command(object sender, CommandEventArgs e)
        {
            DistanceChargeBLL.DeleteDistanceCharge(Convert.ToInt32(e.CommandArgument.ToString()));
            LoadData();
        }

        protected void lbtnUpdate_Command(object sender, CommandEventArgs e)
        {
            Response.Redirect("DistanceUpdate.aspx?DistanceChargeID=" + e.CommandArgument.ToString());
        }
    }
}