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
    public partial class ServiceChargeManagement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AccountID"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            if (!IsPostBack)
            {
                LoadService();
            }
        }

        private void LoadService()
        {
            gvService.DataSource = ServiceChargeBLL.GetAllServiceCharge();
            gvService.DataBind();

            lblTotalService.Text = gvService.Rows.Count.ToString();
        }

        protected void gvService_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvService.PageIndex = e.NewPageIndex;
            LoadService();
        }

        protected void lbtnRemove_Command(object sender, CommandEventArgs e)
        {
            ServiceChargeBLL.DeleteServiceCharge(Convert.ToInt32(e.CommandArgument.ToString()));
            LoadService();
        }

        protected void lbtnUpdate_Command(object sender, CommandEventArgs e)
        {
            Response.Redirect("ServiceUpdate.aspx?ServiceChargeID=" + e.CommandArgument.ToString());
        }
    }
}