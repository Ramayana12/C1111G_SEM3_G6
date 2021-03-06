﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Business;
using DataTransferObject;

namespace OPMS_Website.Admin
{
    public partial class BranchCreate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AccountID"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            if (!IsPostBack)
            {
                txtBranchName.Focus();
            }
        }

        protected void btnCreateBranch_Click(object sender, EventArgs e)
        {
            if (checkName() && Page.IsValid)
            {
                Branch branch = new Branch();
                branch.Name = txtBranchName.Text;
                branch.Email = txtBranchEmail.Text;
                branch.Phone = txtPhone.Text;
                branch.Address = txtAddress.Text;
                branch.Description = txtDescription.Text;

                bool result = BranchBLL.InsertBranch(branch);
                if (result)
                {
                    lblStatusAddNewBranch.Text = "create new branch Successful!";
                    Response.AddHeader("REFRESH", "2;URL=BranchManagement.aspx");
                }
                else
                {
                    lblStatusAddNewBranch.Text = "Can not create new branch!";
                    return;
                }
            }
        }

        public bool checkName()
        {
            bool ck = true;
            if (txtBranchName.Text != string.Empty && BranchBLL.ExistBranch(txtBranchName.Text))
            {
                lblCheckBranchName.Text = "Branch Name existed !";
                txtBranchName.Focus();
                ck = false;
            }
            else
            {
                lblCheckBranchName.Text = "";
                txtBranchEmail.Focus();
                ck = true;
            }
            return ck;
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