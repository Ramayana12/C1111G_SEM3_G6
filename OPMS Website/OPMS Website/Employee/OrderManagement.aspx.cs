using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Business;
using DataTransferObject;

namespace OPMS_Website.Employee
{
    public partial class OderManagement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["EmployeeID"] == null)
            {
                Response.Redirect("~/Admin/Login.aspx");
            }
            if (!IsPostBack)
            {
                LoadData();
                LoadOrder();
            }
        }

        private void LoadData()
        {
            ddlService.DataSource = ServiceChargeBLL.GetAllServiceCharge();
            ddlService.DataTextField = "Name";
            ddlService.DataValueField = "ID";
            ddlService.DataBind();
            ddlService.SelectedIndex = 0;

            ddlDistance.DataSource = DistanceChargeBLL.GetAllDistanceCharge();
            ddlDistance.DataTextField = "Name";
            ddlDistance.DataValueField = "ID";
            ddlDistance.DataBind();
            ddlDistance.SelectedIndex = 0;

            ddlWeight.DataSource = WeightChargeBLL.GetAllWeightCharge();
            ddlWeight.DataTextField = "Name";
            ddlWeight.DataValueField = "ID";
            ddlWeight.DataBind();
            ddlWeight.SelectedIndex = 0;

            ddlStatus.DataSource = OrderBLL.GetAllOrder();
            ddlStatus.DataTextField = "Status";
            ddlStatus.DataValueField = "Status";
            ddlStatus.DataBind();
            ddlStatus.SelectedIndex = 0;
        }

        private void LoadOrder()
        {
            gvOrder.DataSource = OrderBLL.GetAllOrder();
            gvOrder.DataBind();
            lblTotalRecord.Text = gvOrder.Rows.Count.ToString();
        }

        protected void gvOrder_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvOrder.PageIndex = e.NewPageIndex;
            LoadOrder();
        }

        protected void lbtnEdit_Command(object sender, CommandEventArgs e)
        {
            Response.Redirect("OrderDetails.aspx?OrderID=" + e.CommandArgument.ToString());
        }

        protected void lbtnUpdate_Command(object sender, CommandEventArgs e)
        {
            Response.Redirect("OrderUpdate.aspx?OrderID=" + e.CommandArgument.ToString());         
        }

        protected void txtName_TextChanged(object sender, EventArgs e)
        {
            gvOrder.DataSource = OrderBLL.SearchOrderByName(txtName.Text);
            gvOrder.DataBind();
            lblTotalRecord.Text = gvOrder.Rows.Count.ToString();
        }

        protected void ddlService_SelectedIndexChanged(object sender, EventArgs e)
        {
            gvOrder.DataSource = OrderBLL.GetOrderByServiceID(ddlService.SelectedValue);
            gvOrder.DataBind();
            lblTotalRecord.Text = gvOrder.Rows.Count.ToString();
        }

        protected void ddlDistance_SelectedIndexChanged(object sender, EventArgs e)
        {
            gvOrder.DataSource = OrderBLL.GetOrderByDistanceID(ddlDistance.SelectedValue);
            gvOrder.DataBind();
            lblTotalRecord.Text = gvOrder.Rows.Count.ToString();
        }

        protected void ddlWeight_SelectedIndexChanged(object sender, EventArgs e)
        {
            gvOrder.DataSource = OrderBLL.GetOrderByWeightID(ddlWeight.SelectedValue);
            gvOrder.DataBind();
            lblTotalRecord.Text = gvOrder.Rows.Count.ToString();
        }

        protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            gvOrder.DataSource = OrderBLL.GetOrderByStatus(ddlStatus.SelectedValue);
            gvOrder.DataBind();
            lblTotalRecord.Text = gvOrder.Rows.Count.ToString();
        }
    }
}