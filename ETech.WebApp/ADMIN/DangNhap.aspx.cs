using ETech.WebApp.AppCode;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace ETech.WebApp.ADMIN
{
    public partial class DangNhap : System.Web.UI.Page
    {
        DataAccess dataAccess = new DataAccess();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if(Request.Cookies["usernameKH"] != null && Request.Cookies["passwordKH"] != null)
                {
                    txtUser.Text = Request.Cookies["usernameKH"].Value;
                    txtPass.Text = Request.Cookies["passwordKH"].Value;

                    cbReLogin.Checked = true;
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            bool isCaptchaValid = false;
            if (Session["CaptchaText"] != null && Session["CaptchaText"].ToString() == txtCaptcha.Text)
            {
                isCaptchaValid = true;
            }
            else
            {
                txtTB.Text = "Sai mã Captcha";
                txtTB.Style.Add("color", "red");
                txtTB.Style.Add("margin-left", "33%!important");
            }

            if (isCaptchaValid)
            {
                SqlParameter[] p =
                {
                    new SqlParameter("@TENDANGNHAP",SqlDbType.NVarChar,50),
                    new SqlParameter("@MATKHAU",SqlDbType.NVarChar,50)
                };

                p[0].Value = txtUser.Text;
                p[1].Value = txtPass.Text;

                int i = dataAccess.ExecuteIntCommand("func_checklogin_admin", p);

                if (i == 1)
                {
                    if (cbReLogin.Checked)
                    {
                        Response.Cookies["usernameKH"].Value = txtUser.Text;
                        Response.Cookies["passwordKH"].Value = txtPass.Text;

                        Response.Cookies["usernameKH"].Expires = DateTime.Now.AddMinutes(60);
                        Response.Cookies["passwordKH"].Expires = DateTime.Now.AddMinutes(60);
                    }
                    else
                    {
                        Response.Cookies["usernameKH"].Expires = DateTime.Now;
                        Response.Cookies["passwordKH"].Expires = DateTime.Now;
                    }

                    Session["userKH"] = txtUser.Text;
                    Response.Redirect("QuanLyAdmin.aspx");
                    Session.RemoveAll();
                }
                else
                {
                    txtTB.Text = "Sai tài khoản, mật khẩu";
                    txtTB.Style.Add("Color", "red");
                    txtTB.Style.Add("margin-left", "33%!important");
                }
            }
        }

        protected void txtCaptcha_TextChanged(object sender, EventArgs e)
        {

        }
    }
}