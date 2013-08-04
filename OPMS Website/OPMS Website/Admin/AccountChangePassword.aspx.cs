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
    public partial class AccountChangePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AccountID"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            if (!IsPostBack)
            {
                LoadAccount();
            }
        }

        private void LoadAccount()
        {
            Account account = new Account();
            account = AccountBLL.GetAccountByID(Session["AccountID"].ToString())[0];
            txtUserName.Text = account.UserName;
            lblCheckOldPassword.Text = "";
        }

        protected void btnApplyChange_Click(object sender, EventArgs e)
        {
            Account account = new Account();
            account = AccountBLL.GetAccountByID(Session["AccountID"].ToString())[0];
            if (!Common.Encrypt(txtOldPassword.Text).Equals(account.Password))
            {
                lblCheckOldPassword.Text = "Old Password Invalid!";
                return;
            }
            account.Password = Common.Encrypt(txtNewPassword.Text);
            bool result = AccountBLL.UpdateAccount(account);
            if (result)
            {
                lblStatusChangePassword.Text = "Change Password Successfull!";
                lblCheckOldPassword.Text = "";
            }
            else
            {
                lblStatusChangePassword.Text = "Can not change Password!";
            }               
        }       
    }
}