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
    public partial class WeightManagement : System.Web.UI.Page
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
            gvWeight.DataSource = WeightChargeBLL.GetAllWeightCharge();
            gvWeight.DataBind();

            lblTotalService.Text = gvWeight.Rows.Count.ToString();
        }

        protected void gvWeight_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvWeight.PageIndex = e.NewPageIndex;
            LoadData();
        }

        protected void lbtnRemove_Command(object sender, CommandEventArgs e)
        {
            WeightChargeBLL.DeleteWeightCharge(Convert.ToInt32(e.CommandArgument.ToString()));
            LoadData();
        }

        protected void lbtnUpdate_Command(object sender, CommandEventArgs e)
        {
            Response.Redirect("WeightUpdate.aspx?WeightChargeID=" + e.CommandArgument.ToString());
        }
    }
}