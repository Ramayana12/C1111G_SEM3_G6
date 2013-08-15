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
    public partial class AccountManagement : System.Web.UI.Page
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
                LoadAccounts();
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

        public void LoadAccounts()
        {
            gvAccountsList.DataSource = AccountBLL.GetAllAccount();
            gvAccountsList.DataBind();

            lblTotalRecord.Text = gvAccountsList.Rows.Count.ToString();
        }

        protected void txtUserName_TextChanged(object sender, EventArgs e)
        {
            gvAccountsList.DataSource = AccountBLL.SearchAccountByName(txtUserName.Text);
            gvAccountsList.DataBind();

            lblTotalRecord.Text = gvAccountsList.Rows.Count.ToString();
        }

        protected void ddlBranches_SelectedIndexChanged(object sender, EventArgs e)
        {
            gvAccountsList.DataSource = AccountBLL.GetAccountByBranchID(ddlBranches.SelectedValue.ToString());
            gvAccountsList.DataBind();

            lblTotalRecord.Text = gvAccountsList.Rows.Count.ToString();
        }

        protected void lbtnDelete_Command(object sender, CommandEventArgs e)
        {
            AccountBLL.DeleteAccount(Convert.ToInt32(e.CommandArgument.ToString()));
            LoadAccounts();
        }

        protected void lbtnDetails_Command(object sender, CommandEventArgs e)
        {
            Response.Redirect("AccountDetails.aspx?AccountID=" + e.CommandArgument.ToString());
        }

        protected void gvAccountsList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvAccountsList.PageIndex = e.NewPageIndex;
            LoadAccounts();
        }

        protected void lbtnDeactivate_Command(object sender, CommandEventArgs e)
        {
            Account account = new Account();
            account = AccountBLL.GetAccountByID(e.CommandArgument.ToString())[0];
            account.Active = (account.Active.Equals("True")) ? "0" : "1";
            AccountBLL.UpdateAccount(account);
            LoadAccounts();
        }

        protected void ddlRole_SelectedIndexChanged(object sender, EventArgs e)
        {
            gvAccountsList.DataSource = AccountBLL.GetAccountByRole(ddlRole.SelectedValue.ToString());
            gvAccountsList.DataBind();

            lblTotalRecord.Text = gvAccountsList.Rows.Count.ToString();
        }
    }
}