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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtUserName.Focus();
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (AccountBLL.CheckLoginAccount(txtUserName.Text, Common.Encrypt(txtPassword.Text)) == null)
            {
                lblStatusLogin.Text = "User Name or Password wrong!";
                txtUserName.Focus();
                return;
            }
            Account account = new Account();
            account = AccountBLL.CheckLoginAccount(txtUserName.Text, Common.Encrypt(txtPassword.Text))[0];
            if (!account.Active.Equals("True"))
            {
                lblStatusLogin.Text = "Your account is deactivated!";
                txtUserName.Focus();
                return;
            }
            if (account.Role.Equals("Administrator"))
            {
                Session["AccountID"] = account.ID;
                Session["UserName"] = account.UserName;
                Response.Redirect("HomeAdmin.aspx");
            }
            else
            {
                Session["EmployeeID"] = account.ID;
                Session["UserName"] = account.UserName;
                Response.Redirect("~/Employee/HomeEmployee.aspx");
            }
        }
    }
}