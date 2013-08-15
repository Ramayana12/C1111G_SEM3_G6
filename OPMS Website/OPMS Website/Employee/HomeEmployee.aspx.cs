using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Business;
using DataTransferObject;

namespace OPMS_Website.Employee
{
    public partial class HomeEmployee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["EmployeeID"] == null)
            {
                Response.Redirect("~/Admin/Login.aspx");
            }
            if (!IsPostBack)
            {            
                LoadData();               
            }
        }

        private void LoadData()
        {
            Account account = new Account();
            account = AccountBLL.GetAccountByID(Session["EmployeeID"].ToString())[0];
            lblFullName.Text = account.FullName;
            lblBranchName.Text = BranchBLL.GetBranchByID(account.BranchID)[0].Name;
            lblTotalOrder.Text = OrderBLL.GetAllOrder().Count.ToString();
            lblOrderSending.Text = OrderBLL.GetOrderByStatus("Sending").Count.ToString();
        }
    }
}