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
    public partial class Services : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["ServiceID"]==null)
            {
                Response.Redirect("Home.aspx");
            }
            if (!IsPostBack)
            {
                LoadData();
                LoadDropdownlist();
                Calculate();
            }
        }

        private void LoadData()
        {
            ServiceCharge service = new ServiceCharge();
            service = ServiceChargeBLL.GetServiceChargeByID(Request.QueryString["ServiceID"].ToString())[0];
            lblServiceName.Text = service.Name;
            ltrDescription.Text = service.Description;
        }

        private void LoadDropdownlist()
        {           
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
            decimal serviceCharge = Convert.ToDecimal(ServiceChargeBLL.GetServiceChargeByID(Request.QueryString["ServiceID"].ToString())[0].Charge);
            decimal distanceCharge = Convert.ToDecimal(DistanceChargeBLL.GetDistanceChargeByID(ddlDistance.SelectedValue)[0].Charge);
            decimal weightCharge = Convert.ToDecimal(WeightChargeBLL.GetWeightChargeByID(ddlWeight.SelectedValue)[0].Charge);
            txtTotal.Text = (serviceCharge + distanceCharge + weightCharge).ToString("c2");
        }

        protected void ddlDistance_SelectedIndexChanged(object sender, EventArgs e)
        {
            Calculate();
        }

        protected void ddlWeight_SelectedIndexChanged(object sender, EventArgs e)
        {
            Calculate();
        }
    }
}