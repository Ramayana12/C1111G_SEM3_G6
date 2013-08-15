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
    public partial class WeightUpdate : System.Web.UI.Page
    {
        private string WeightChargeID;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AccountID"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            if (Request.QueryString["WeightChargeID"] != null)
            {
                WeightChargeID = Request.QueryString["WeightChargeID"].ToString();
            }
            if (!IsPostBack)
            {
                LoadWeightCharge();
                txtName.Focus();
                lblStatusCreate.Text = "";
            }
        }

        private void LoadWeightCharge()
        {
            WeightCharge weightCharge = new WeightCharge();
            weightCharge = WeightChargeBLL.GetWeightChargeByID(WeightChargeID)[0];
            txtName.Text = weightCharge.Name;
            txtCharge.Text = Convert.ToDecimal(weightCharge.Charge).ToString("F");
            txtDescription.Text = weightCharge.Description;
        }

        private bool checkName()
        {
            if (!txtName.Text.ToLower().Equals(WeightChargeBLL.GetWeightChargeByID(WeightChargeID)[0].Name.ToLower()) && WeightChargeBLL.ExistWeightCharge(txtName.Text))
            {
                lblCheckExist.Text = "Weight Charge Name existed!";
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
                WeightCharge weightCharge = new WeightCharge();
                weightCharge.ID = WeightChargeID;
                weightCharge.Name = txtName.Text;
                weightCharge.Charge = txtCharge.Text;
                weightCharge.Description = txtDescription.Text;
                bool result = WeightChargeBLL.UpdateWeightCharge(weightCharge);
                if (result)
                {
                    lblStatusCreate.Text = "Update Weight Charge successful!";
                    Response.AddHeader("REFRESH", "2;URL=WeightManagement.aspx");
                }
                else
                {
                    lblStatusCreate.Text = "Can not update Weight Charge!";
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