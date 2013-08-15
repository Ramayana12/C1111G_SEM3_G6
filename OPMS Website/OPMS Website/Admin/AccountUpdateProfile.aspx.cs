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
            if (Session["AccountID"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            if (!IsPostBack)
            {
                LoadData();
                lblStatusUpdate.Text = "";
            }
        }

        public void LoadData()
        {
            Account account = new Account();
            account = AccountBLL.GetAccountByID(Session["AccountID"].ToString())[0];
            txtFullName.Text = account.FullName;
            imgPicture.ImageUrl = account.Picture;
            //txtBirthDate.Text = Convert.ToDateTime(account.BirthDate).ToShortDateString();
            txtBirthDate.Text = (account.BirthDate == "1/1/1900 12:00:00 AM" || account.BirthDate == "") ? "" : Convert.ToDateTime(account.BirthDate).ToShortDateString();
            txtEmail.Text = account.Email;
            txtPhone.Text = account.Phone;
            txtAddress.Text = account.Address;
            txtDescription.Text = account.Description;
        }

        protected void btnApplyChange_Click(object sender, EventArgs e)
        {
            if (checkBirthDate() && Page.IsValid)
            {
                Account account = new Account();
                account = AccountBLL.GetAccountByID(Session["AccountID"].ToString())[0];
                account.FullName = txtFullName.Text;
                account.BirthDate = txtBirthDate.Text;
                account.Email = txtEmail.Text;
                account.Phone = txtPhone.Text;
                account.Address = txtAddress.Text;
                account.Description = txtDescription.Text;
                if (fuPicture.HasFile)
                {
                    string serverPath = Server.MapPath(".");
                    string url = serverPath + @"\imageEmployees\" + fuPicture.FileName;
                    fuPicture.SaveAs(url);

                    account.Picture = "~/Admin/imageEmployees/" + fuPicture.FileName;
                }

                bool result = AccountBLL.UpdateAccount(account);
                if (result)
                {
                    lblStatusUpdate.Text = "Update Successfull!";
                    Response.AddHeader("REFRESH", "2;URL=AccountManagement.aspx");
                }
                else
                {
                    lblStatusUpdate.Text = "Can not Update Profile!";
                }
            }
        }

        public bool checkBirthDate()
        {
            try
            {
                DateTime date = Convert.ToDateTime(txtBirthDate.Text);
                lblCheckBirthDate.Text = "";
                txtPhone.Focus();
                return true;
            }
            catch (FormatException)
            {
                txtBirthDate.Text = "";
                txtBirthDate.Focus();
                lblCheckBirthDate.Text = "Birth Date Invalid Format!";
                return false;
            }
        }
    }
}