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
    public partial class ServiceUpdate : System.Web.UI.Page
    {
        private string serviceChargeID;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AccountID"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            if (Request.QueryString["ServiceChargeID"] != null)
            {
                serviceChargeID = Request.QueryString["ServiceChargeID"].ToString();
            }
            if (!IsPostBack)
            {
                LoadService();
                txtName.Focus();
                lblStatusCreate.Text = "";
            }
        }

        private void LoadService()
        {
            ServiceCharge serviceCharge = new ServiceCharge();
            serviceCharge = ServiceChargeBLL.GetServiceChargeByID(serviceChargeID)[0];
            txtName.Text = serviceCharge.Name;
            txtCharge.Text = Convert.ToDecimal(serviceCharge.Charge).ToString("F");
            txtDescription.Text = serviceCharge.Description;
        }

        private bool checkName()
        {
            if (!txtName.Text.ToLower().Equals(ServiceChargeBLL.GetServiceChargeByID(serviceChargeID)[0].Name.ToLower()) && ServiceChargeBLL.ExistServiceCharge(txtName.Text))
            {
                lblCheckExist.Text = "Service Name existed!";
                txtName.Focus();
                return false;
            }
            else
            {
                lblCheckExist.Text = "";
                txtCharge.Focus();
                return true;
            }
        }

        private bool checkChargeFormat()
        {
            try
            {
                decimal charge = Convert.ToDecimal(txtCharge.Text);
                lblCheckFormat.Text = "";
                txtDescription.Focus();
                return true;
            }
            catch (FormatException)
            {
                txtCharge.Text = "";
                txtCharge.Focus();
                lblCheckFormat.Text = "Charge Invalid Format!";
                return false;
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (checkName() && checkChargeFormat() && Page.IsValid)
            {
                ServiceCharge serviceCharge = new ServiceCharge();
                serviceCharge.ID = serviceChargeID;
                serviceCharge.Name = txtName.Text;
                serviceCharge.Charge = txtCharge.Text;
                serviceCharge.Description = txtDescription.Text;
                bool result = ServiceChargeBLL.UpdateServiceCharge(serviceCharge);
                if (result)
                {
                    lblStatusCreate.Text = "Update Service successful!";
                    Response.Redirect("ServiceManagement.aspx");
                }
                else
                {
                    lblStatusCreate.Text = "Can not update Service!";
                    return;
                }
            }
        }

        protected void txtName_TextChanged(object sender, EventArgs e)
        {
            if (!checkName())
            {
                return;
            }
        }

        protected void txtCharge_TextChanged(object sender, EventArgs e)
        {
            if (checkChargeFormat())
            {
                return;
            }
        }
    }
}