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
    public partial class OrderUpdate : System.Web.UI.Page
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
            txtTotal.Text = order.Total;
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

        private bool checkDate()
        {
            try
            {
                DateTime date = Convert.ToDateTime(txtDate.Text);
                lblCheckDate.Text = "";
                txtNote.Focus();
                return true;
            }
            catch (FormatException)
            {
                txtDate.Text = "";
                txtDate.Focus();
                lblCheckDate.Text = "Date Invalid Format!";
                return false;
            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            if (checkDate() && Page.IsValid)
            {
                Order order = new Order();
                order = OrderBLL.GetOrderByID(Request.QueryString["OrderID"].ToString())[0];
                order.Note = txtNote.Text;
                order.DeliveryEmployeeID = Session["EmployeeID"].ToString();
                order.Status = ddlStatus.SelectedValue.ToString();
                order.ReceiveDate = txtDate.Text;

                bool result = OrderBLL.UpdateOrder(order);
                if (result)
                {
                    lblStatusEditOrder.Text = "Update Order Successful!";
                    Response.AddHeader("REFRESH", "2;URL=OrderManagement.aspx");
                }
                else
                {
                    lblStatusEditOrder.Text = "Can not update Order!";
                    return;
                }
            }
        }
    }
}