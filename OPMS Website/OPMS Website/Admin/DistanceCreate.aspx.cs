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
    public partial class DistanceCreate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AccountID"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            if (!IsPostBack)
            {
                txtName.Focus();
                lblStatusCreate.Text = "";
            }
        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            if (checkName() && checkChargeFormat() && Page.IsValid)
            {
                DistanceCharge distanceCharge = new DistanceCharge();
                distanceCharge.Name = txtName.Text;
                distanceCharge.Charge = txtCharge.Text;
                distanceCharge.Description = txtDescription.Text;
                bool result = DistanceChargeBLL.InsertDistanceCharge(distanceCharge);
                if (result)
                {
                    lblStatusCreate.Text = "Create Distance Charge successful!";
                    Response.AddHeader("REFRESH", "2;URL=DistanceManagement.aspx");
                }
                else
                {
                    lblStatusCreate.Text = "Can not create new Distance Charge!";
                    return;
                }
            }
        }

        private bool checkName()
        {
            if (txtName.Text != string.Empty && DistanceChargeBLL.ExistDistanceCharge(txtName.Text))
            {
                lblCheckExist.Text = "Distance Charge Name existed!";
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