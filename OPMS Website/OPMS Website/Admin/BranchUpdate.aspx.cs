using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataTransferObject;
using Business;

namespace OPMS_Website.Admin
{
    public partial class BranchUpdate : System.Web.UI.Page
    {
        string branchID = "";
        Branch branch;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["BranchID"] != null)
            {
                branchID = Request.QueryString["BranchID"].ToString();
            }
            if (Session["AccountID"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            if (!IsPostBack)
            {
                LoadBranch();
            }
        }

        public void LoadBranch()
        {
            branch = new Branch();
            branch = BranchBLL.GetBranchByID(branchID)[0];
            txtBranchName.Text = branch.Name;
            txtBranchEmail.Text = branch.Email;
            txtPhone.Text = branch.Phone;
            txtAddress.Text = branch.Address;
            txtDescription.Text = branch.Description;
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (checkName() && Page.IsValid)
            {
                Branch _Branch = new Branch();
                _Branch.ID = branchID;
                _Branch.Name = txtBranchName.Text;
                _Branch.Email = txtBranchEmail.Text;
                _Branch.Phone = txtPhone.Text;
                _Branch.Address = txtAddress.Text;
                _Branch.Description = txtDescription.Text;

                bool result = BranchBLL.UpdateBranch(_Branch);
                if (result)
                {
                    Response.Redirect("BranchManagement.aspx");
                }
                else
                {
                    lblStatusUpdate.Text = "Can not update branch !";
                    return;
                }
            }
        }
        public bool checkName()
        {
            if (!txtBranchName.Text.ToLower().Equals(BranchBLL.GetBranchByID(branchID)[0].Name.ToLower()) && BranchBLL.ExistBranch(txtBranchName.Text))
            {
                lblCheckBranchName.Text = "Branch Name existed !";
                txtBranchName.Focus();
                return false;
            }
            else
            {
                lblCheckBranchName.Text = "";
                txtBranchEmail.Focus();
                return true;
            }
        }

        protected void txtBranchName_TextChanged(object sender, EventArgs e)
        {
            if (!checkName())
            {
                return;
            }
        }

    }
}