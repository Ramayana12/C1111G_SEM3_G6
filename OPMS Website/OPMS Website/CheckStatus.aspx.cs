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
    public partial class CheckStatus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["OrderID"] == null)
            {
                Response.Redirect("Home.aspx");
            }
            if (!IsPostBack)
            {
                LoadData();
            }
        }

        private void LoadData()
        {
            try
            {
                Order order = new Order();
                order = OrderBLL.GetOrderByID(Request.QueryString["OrderID"].ToString())[0];
                lblOrderID.Text = order.ID;
                lblStatus.Text = order.Status;
                lblSendDate.Text = Convert.ToDateTime(order.CreateDate).ToShortDateString();
                lblSenderName.Text = order.SenderName;
                lblReceiverName.Text = order.ReceiverName;
                lblReceivedDate.Text = Convert.ToDateTime(order.ReceiveDate).ToShortDateString();
                lblService.Text = ServiceChargeBLL.GetServiceChargeByID(order.ServiceChargeID)[0].Name;
                lblDistance.Text = DistanceChargeBLL.GetDistanceChargeByID(order.DistanceChargeID)[0].Name;
                lblWeight.Text = WeightChargeBLL.GetWeightChargeByID(order.WeightChargeID)[0].Name;
                lblTotalFee.Text = Convert.ToDecimal(order.Total).ToString("c2");
            }
            catch (Exception)
            {

                Label1.Text = "This information does not exist !";
                Label2.Visible = false;
                Label3.Visible = false;
                Label4.Visible = false;
                Label5.Visible = false;
                Label6.Visible = false;
                Label7.Visible = false;
                Label8.Visible = false;
                Label10.Visible = false;
                Label9.Visible = false;
                receiverDate.Visible = false;
            }
        }
    }
}