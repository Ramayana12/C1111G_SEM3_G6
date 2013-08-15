using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Business;
using DataTransferObject;

namespace OPMS_Website
{
    public partial class Services : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["ServiceID"]==null)
            {
                Response.Redirect("Home.aspx");
            }
            if (!IsPostBack)
            {
                LoadData();
            }
        }

        private void LoadData()
        {
            ServiceCharge service = new ServiceCharge();
            service = ServiceChargeBLL.GetServiceChargeByID(Request.QueryString["ServiceID"].ToString())[0];
            lblServiceName.Text = service.Name;
            ltrDescription.Text = service.Description;
        }
    }
}