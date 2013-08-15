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
    public partial class ServiceCreate : System.Web.UI.Page
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
                ServiceCharge serviceCharge = new ServiceCharge();
                serviceCharge.Name = txtName.Text;
                serviceCharge.Charge = txtCharge.Text;
                serviceCharge.Description = txtDescription.Text;
                bool result = ServiceChargeBLL.InsertServiceCharge(serviceCharge);
                if (result)
                {
                    lblStatusCreate.Text = "Create Service successful!";
                    Response.AddHeader("REFRESH", "2;URL=ServiceManagement.aspx");
                }
                else
                {
                    lblStatusCreate.Text = "Can not create new Service!";
                    return;
                }
            }
        }

        private bool checkName()
        {
            if (txtName.Text != string.Empty && ServiceChargeBLL.ExistServiceCharge(txtName.Text))
            {
                lblCheckExist.Text = "Service Name existed!";
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