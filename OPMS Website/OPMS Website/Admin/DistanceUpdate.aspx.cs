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
    public partial class DistanceUpdate : System.Web.UI.Page
    {
        private string distanceChargeID;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AccountID"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            if (Request.QueryString["DistanceChargeID"] != null)
            {
                distanceChargeID = Request.QueryString["DistanceChargeID"].ToString();
            }
            if (!IsPostBack)
            {
                LoadDistanceCharge();
                txtName.Focus();
                lblStatusCreate.Text = "";
            }
        }

        private void LoadDistanceCharge()
        {
            DistanceCharge distanceCharge = new DistanceCharge();
            distanceCharge = DistanceChargeBLL.GetDistanceChargeByID(distanceChargeID)[0];
            txtName.Text = distanceCharge.Name;
            txtCharge.Text = Convert.ToDecimal(distanceCharge.Charge).ToString("F");
            txtDescription.Text = distanceCharge.Description;
        }

        private bool checkName()
        {
            if (!txtName.Text.ToLower().Equals(DistanceChargeBLL.GetDistanceChargeByID(distanceChargeID)[0].Name.ToLower()) && DistanceChargeBLL.ExistDistanceCharge(txtName.Text))
            {
                lblCheckExist.Text = "Distance Charge Name existed!";
                txtName.Focus();
                return false;
            }
            else
            {
                lblCheckExist.Text = "";
                return true;
            }
        }

        private bool checkChargeFormat()
        {
            try
            {
                decimal charge = Convert.ToDecimal(txtCharge.Text);
                lblCheckFormat.Text = "";
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
                DistanceCharge distanceCharge = new DistanceCharge();
                distanceCharge.ID = distanceChargeID;
                distanceCharge.Name = txtName.Text;
                distanceCharge.Charge = txtCharge.Text;
                distanceCharge.Description = txtDescription.Text;
                bool result = DistanceChargeBLL.UpdateDistanceCharge(distanceCharge);
                if (result)
                {
                    lblStatusCreate.Text = "Update Distance Charge successful!";
                    Response.Redirect("DistanceManagement.aspx");
                }
                else
                {
                    lblStatusCreate.Text = "Can not update Distance Charge!";
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