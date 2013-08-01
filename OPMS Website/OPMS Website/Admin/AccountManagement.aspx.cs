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
            //if (Session["AccountID"] == null)
            //{
            //    Response.Redirect("Login.aspx");
            //}
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
            gvAccountsList.DataSource = AccountBLL.SearchAccountByUserName(txtUserName.Text);
            gvAccountsList.DataBind();

            lblTotalRecord.Text = gvAccountsList.Rows.Count.ToString();
        }

        protected void txtFullName_TextChanged(object sender, EventArgs e)
        {
            gvAccountsList.DataSource = AccountBLL.SearchAccountByFullName(txtFullName.Text);
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
            Response.Redirect("AccountUpdate.aspx?AccountID=" + e.CommandArgument.ToString());
        }

        protected void gvAccountsList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvAccountsList.PageIndex = e.NewPageIndex;
            LoadAccounts();
        }

    }
}