using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OPMS_Website.Employee
{
    public partial class masterPageEmployee : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null || Session["EmployeeID"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                lbtnUserName.Text = Session["UserName"].ToString();
            }
        }

        protected void lbtnLogout_Click(object sender, EventArgs e)
        {
            Session["EmployeeID"] = null;
        }

        protected void lbtnHome_Click(object sender, EventArgs e)
        {
            Session["UserName"] = null;
        }
    }
}