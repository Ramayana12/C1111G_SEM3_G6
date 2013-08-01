using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OPMS_Website.Admin
{
    public partial class masterPageAdmin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["UserName"] == null || Session["AccountID"] == null)
            //{
            //    Response.Redirect("frmLoginForm.aspx");
            //}
            //else
            //{
            //    lbtUserName.Text = (string)Session["UserName"];
            //}
        }

        protected void lbtLogout_Click(object sender, EventArgs e)
        {
            Session["UserName"] = null;
            Session["Password"] = null;
            Session["AccountID"] = null;
        }

        protected void lbtnHomePage_Click(object sender, EventArgs e)
        {
            Session["UserName"] = null;
            Session["Password"] = null;
        }
    }
}