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
    public partial class AccountCreate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AccountID"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            if (!IsPostBack)
            {
                LoadBranches();
            }
        }

        public void LoadBranches()
        {
            ddlBranches.DataSource = BranchBLL.GetAllBranch();
            ddlBranches.DataTextField = "Name";
            ddlBranches.DataValueField = "ID";
            ddlBranches.DataBind();
            ddlBranches.SelectedIndex = 0;
        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            if (checkUserName() && Page.IsValid)
            {
                Account account = new Account();
                account.BranchID = ddlBranches.SelectedValue.ToString();
                account.FullName = txtFullName.Text;
                account.UserName = txtUserName.Text;
                account.Password = Common.Encrypt("123456");
                account.Role = ddlRole.SelectedItem.ToString();
                account.Description = txtDescription.Text;

                bool result = AccountBLL.InsertAccount(account);
                if (result)
                {
                    lblStatusAddNewAccount.Text = "create new Account Successful!";
                    Response.Redirect("AccountManagement.aspx");
                }
                else
                {
                    lblStatusAddNewAccount.Text = "Can not create new Account !";
                    return;
                }
            }
        }

        public bool checkUserName()
        {
            bool ck = true;
            if (txtUserName.Text != string.Empty && AccountBLL.CheckExistUserName(txtUserName.Text))
            {
                lblCheckUserNameExist.Text = "User Name existed !";
                txtUserName.Focus();
                ck = false;
            }
            else
            {
                lblCheckUserNameExist.Text = "";
                ddlRole.Focus();
                ck = true;
            }
            return ck;
        }

        protected void txtUserName_TextChanged(object sender, EventArgs e)
        {
            if (!checkUserName())
            {
                return;
            }
        }
    }
}