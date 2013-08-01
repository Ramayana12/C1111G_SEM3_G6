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
    public partial class BranchManagement : System.Web.UI.Page
    {       
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["AccountID"] == null)
            //{
            //    Response.Redirect("Login.aspx");
            //}
            //else
            //{
                if (!IsPostBack)
                {
                    LoadBranch();
                }
            //}

        }

        /// <summary>
        /// Load all Branch to gridview
        /// </summary>
        public void LoadBranch()
        {
            gvBranchList.DataSource = BranchBLL.GetAllBranch();
            gvBranchList.DataBind();
            lblTotalRecord.Text = gvBranchList.Rows.Count.ToString();

            gvEmployee.Visible = false;
            lblEmployee.Text = "";
        }

        /// <summary>
        /// search banch by text input
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void txtBranchName_TextChanged(object sender, EventArgs e)
        {
            gvBranchList.DataSource = BranchBLL.SearchBranchByName(txtBranchName.Text);
            gvBranchList.DataBind();
            lblTotalRecord.Text = gvBranchList.Rows.Count.ToString();

            gvEmployee.Visible = false;
            lblEmployee.Text = "";
        }

        /// <summary>
        /// create branch
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void lbtCreateNewBranch_Click(object sender, EventArgs e)
        {
            Response.Redirect("BranchCreate.aspx");
        }

        /// <summary>
        /// change page gridview
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void grwBranchList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvBranchList.PageIndex = e.NewPageIndex;
            LoadBranch();
        }

        /// <summary>
        /// Delete branch
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void lbtDelete_Command(object sender, CommandEventArgs e)
        {
            BranchBLL.DeleteBranch(Convert.ToInt32(e.CommandArgument.ToString()));
            LoadBranch();
        }

        /// <summary>
        /// Update branch
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void lbtViewDetails_Command(object sender, CommandEventArgs e)
        {
            Response.Redirect("BranchUpdate.aspx?BranchID="+e.CommandArgument.ToString());
        }

        //search employee by variable branchID
        string branchID = "";

        /// <summary>
        /// Load Employees
        /// </summary>
        /// <param name="branchID"></param>
        public void loadEmployee(string branchID)
        {
            gvEmployee.DataSource = AccountBLL.GetAccountByBranchID(branchID);
            gvEmployee.DataBind();
            lblEmployee.Text = "ToTal Employees: " + gvEmployee.Rows.Count.ToString();
            gvEmployee.Visible = true;
        }

        protected void lbtViewEmployees_Command(object sender, CommandEventArgs e)
        {
            branchID = e.CommandArgument.ToString();
            loadEmployee(branchID);
        }

        protected void grwEmployee_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvEmployee.PageIndex = e.NewPageIndex;
            loadEmployee(branchID);
        }
              
    }
}