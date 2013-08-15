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
    public partial class OrderDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["EmployeeID"] == null || Request.QueryString["OrderID"] == null)
            {
                Response.Redirect("~/Admin/Login.aspx");
            }
            if (!IsPostBack)
            {
                LoadDropdownlist();
                LoadData();
                Calculate();
                lblStatusEditOrder.Text = "";
            }
        }

        private void LoadData()
        {
            Order order = new Order();
            order = OrderBLL.GetOrderByID(Request.QueryString["OrderID"].ToString())[0];
            txtSenderName.Text = order.SenderName;
            txtSenderPhone.Text = order.SenderPhone;
            txtSenderAddress.Text = order.SenderAddress;
            txtReceiverName.Text = order.ReceiverName;
            txtReceiverPhone.Text = order.ReceiverPhone;
            txtReceiverAddress.Text = order.ReceiverAddress;
            ddlService.SelectedValue = order.ServiceChargeID;
            ddlDistance.SelectedValue = order.DistanceChargeID;
            ddlWeight.SelectedValue = order.WeightChargeID;
            txtNote.Text = order.Note;
        }

        private void LoadDropdownlist()
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
        }

        private void Calculate()
        {
            decimal serviceCharge = Convert.ToDecimal(ServiceChargeBLL.GetServiceChargeByID(ddlService.SelectedValue)[0].Charge);
            decimal distanceCharge = Convert.ToDecimal(DistanceChargeBLL.GetDistanceChargeByID(ddlDistance.SelectedValue)[0].Charge);
            decimal weightCharge = Convert.ToDecimal(WeightChargeBLL.GetWeightChargeByID(ddlWeight.SelectedValue)[0].Charge);
            txtTotal.Text = (serviceCharge + distanceCharge + weightCharge).ToString("c2");
        }

        protected void ddlService_SelectedIndexChanged(object sender, EventArgs e)
        {
            Calculate();
        }

        protected void ddlDistance_SelectedIndexChanged(object sender, EventArgs e)
        {
            Calculate();
        }

        protected void ddlWeight_SelectedIndexChanged(object sender, EventArgs e)
        {
            Calculate();
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Order order = new Order();
                order = OrderBLL.GetOrderByID(Request.QueryString["OrderID"].ToString())[0];
                order.SenderName = txtSenderName.Text;
                order.SenderPhone = txtSenderPhone.Text;
                order.SenderAddress = txtSenderAddress.Text;
                order.ReceiverName = txtReceiverName.Text;
                order.ReceiverPhone = txtReceiverPhone.Text;
                order.ReceiverAddress = txtReceiverAddress.Text;
                order.ServiceChargeID = ddlService.SelectedValue;
                order.DistanceChargeID = ddlDistance.SelectedValue;
                order.WeightChargeID = ddlWeight.SelectedValue;
                order.Total = txtTotal.Text;
                order.Note = txtNote.Text;
                order.DeliveryEmployeeID = Session["EmployeeID"].ToString();

                bool result = OrderBLL.UpdateOrder(order);
                if (result)
                {
                    lblStatusEditOrder.Text = "Edit Order Successful!";
                    Response.AddHeader("REFRESH", "2;URL=OrderManagement.aspx");
                }
                else
                {
                    lblStatusEditOrder.Text = "Can not edit Order!";
                    return;
                }
            }
        }     
    }
}