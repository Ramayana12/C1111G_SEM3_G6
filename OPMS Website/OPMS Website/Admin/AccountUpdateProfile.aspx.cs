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
    public partial class AccountUpdateProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["AccountID"] == null)
            //{
            //    Response.Redirect("Login.aspx");
            //}
            if (!IsPostBack)
            {
                LoadData();
            }

        }

        public void LoadData()
        {
            Account account = new Account();
            //account = AccountBLL.GetAccountByID(Session["AccountID"].ToString())[0];
            account = AccountBLL.GetAccountByID("1")[0];
            txtFullName.Text = account.FullName;
            imgPicture.ImageUrl = account.Picture;
            txtBirthDate.Text = account.BirthDate;
            txtPhone.Text = account.Phone;
            txtAddress.Text = account.Address;
            txtDescription.Text = account.Description;
        }

        protected void btnApplyChange_Click(object sender, EventArgs e)
        {

        }
    }
}