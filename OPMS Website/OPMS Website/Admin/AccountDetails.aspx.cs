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
    public partial class Account_Details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AccountID"] == null || Request.QueryString["AccountID"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            if (!IsPostBack)
            {
                LoadBranches();
                LoadData();
                lblStatusUpdateAccount.Text = "";
            }
        }

        public void LoadData()
        {
            Account account = new Account();
            account = AccountBLL.GetAccountByID(Request.QueryString["AccountID"].ToString())[0];
            txtFullName.Text = account.FullName;
            imgPicture.ImageUrl = account.Picture;
            //txtBirthDate.Text = Convert.ToDateTime(account.BirthDate).ToShortDateString();
            txtBirthDate.Text = (account.BirthDate.Equals("1/1/1900 12:00:00 AM") || account.BirthDate == null) ? null : Convert.ToDateTime(account.BirthDate).ToShortDateString();
            txtEmail.Text = account.Email;
            txtPhone.Text = account.Phone;
            txtAddress.Text = account.Address;
            txtUserName.Text = account.UserName;
            ddlBranches.SelectedValue = account.BranchID;
            ddlRole.SelectedIndex = (account.Role.Equals("Administrator")) ? 1 : 0;
            cbActive.Checked = Convert.ToBoolean(account.Active);
            txtDescription.Text = account.Description;
        }

        public void LoadBranches()
        {
            ddlBranches.DataSource = BranchBLL.GetAllBranch();
            ddlBranches.DataTextField = "Name";
            ddlBranches.DataValueField = "ID";
            ddlBranches.DataBind();
        }

        protected void btnApplyChange_Click(object sender, EventArgs e)
        {
            Account account = new Account();
            account = AccountBLL.GetAccountByID(Request.QueryString["AccountID"].ToString())[0];
            account.BranchID = ddlBranches.SelectedValue;
            account.Role = ddlRole.SelectedItem.ToString();
            account.Active = (cbActive.Checked) ? "1" : "0";
            account.Description = txtDescription.Text;

            bool result = AccountBLL.UpdateAccount(account);
            if (result)
            {
                lblStatusUpdateAccount.Text = "Update Successfull!";
                Response.Redirect("AccountManagement.aspx");
            }
            else
            {
                lblStatusUpdateAccount.Text = "Can not Update Account!";
            }
        }

        protected void btnResetPassword_Click(object sender, EventArgs e)
        {
            Account account = new Account();
            account = AccountBLL.GetAccountByID(Request.QueryString["AccountID"].ToString())[0];
            account.Password = Common.Encrypt("123456");
            bool result = AccountBLL.UpdateAccount(account);
            if (result)
            {
                lblStatusUpdateAccount.Text = "Reset Password Successfull!";
            }
            else
            {
                lblStatusUpdateAccount.Text = "Can not Reset Password!";
            }
        }
    }
}