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
    public partial class MasterPageHome : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
            }
        }

        private void LoadData()
        {
            dtlService.DataSource = ServiceChargeBLL.GetAllServiceCharge();
            dtlService.DataBind();

            dtlNews.DataSource = NewsBLL.GetAllNews();
            dtlNews.DataBind();
        }

        protected void btnSearchStatus_Click(object sender, EventArgs e)
        {

        }
    }
}