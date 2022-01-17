using ETech.WebApp.AppCode;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;

namespace ETech.WebApp.KH
{
    public partial class TrangDangKyDangNhap : System.Web.UI.Page
    {
        private string activationcode;
        DataAccess dataAccess = new DataAccess();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["usernameKH"] != null && Request.Cookies["passwordKH"] != null)
                {
                    txtdangnhap.Text = Request.Cookies["usernameKH"].Value;
                    txtmk.Text = Request.Cookies["passwordKH"].Value;

                    cbReLogin.Checked = true;
                }
            }
        }
        protected void btnLogin1_Click(object sender, EventArgs e)
        {
            bool isCaptchaValid = false;
            if (Session["CaptchaText"] != null && Session["CaptchaText"].ToString() == txtcaptcha1.Text)
            {
                isCaptchaValid = true;
            }
            else
            {
                txtcaptcha1.Text = "";
                lbTB1.Text = "Mã Captcha Sai";
            }

            if (isCaptchaValid)
            {
                SqlParameter[] p =
                {
                    new SqlParameter("@TENDANGNHAP",SqlDbType.NVarChar,50),
                    new SqlParameter("@MATKHAU",SqlDbType.NVarChar,50)
                };

                p[0].Value = txtdangnhap.Text;
                p[1].Value = txtmk.Text;

                int i = dataAccess.ExecuteIntCommand("Func_CheckLogin_KH", p);

                if (i == 1)
                {
                    if (cbReLogin.Checked)
                    {
                        Response.Cookies["usernameKH"].Value = txtdangnhap.Text;
                        Response.Cookies["passwordKH"].Value = txtMatKhau.Text;

                        Response.Cookies["usernameKH"].Expires = DateTime.Now.AddMinutes(60);
                        Response.Cookies["passwordKH"].Expires = DateTime.Now.AddMinutes(60);
                    }
                    else
                    {
                        Response.Cookies["usernameKH"].Expires = DateTime.Now;
                        Response.Cookies["passwordKH"].Expires = DateTime.Now;
                    }

                    Session["userKH"] = txtdangnhap.Text;
                    Response.Redirect("~/KH/TrangChu.aspx?userKH=" + txtdangnhap.Text);
                    Session.RemoveAll();
                }
                else
                {
                    txtcaptcha1.Text = "";
                    lbTB1.Text = "Sai Tài Khoản hoặc Mật Khẩu";
                }
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            bool isCaptchaValid = false;
            if (Session["CaptchaText"] != null && Session["CaptchaText"].ToString() == txtCaptchaText.Text)
            {
                isCaptchaValid = true;
            }
            if (isCaptchaValid)
            {
                Random random = new Random();
                activationcode = random.Next(1001, 9999).ToString().Trim();

                DataAccess dataAccess = new DataAccess();
                dataAccess.MoKetNoiCSDL();

                SqlCommand cmd = new SqlCommand("PROC_INSERTACCOUNT_KH", dataAccess.getConnection());
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@TENDANGNHAP", txtTenDangNhap.Text);
                cmd.Parameters.AddWithValue("@HOTEN", txtHoTen.Text);
                cmd.Parameters.AddWithValue("@MATKHAU", txtMatKhau.Text);
                cmd.Parameters.AddWithValue("@EMAIL", txtEmail.Text);
                cmd.Parameters.AddWithValue("@SDT", txtSDT.Text);
                cmd.Parameters.AddWithValue("@DIACHI", txtDiaChi.Text);
                cmd.Parameters.AddWithValue("@TRANGTHAI", "0");
                cmd.Parameters.AddWithValue("@MAXACNHAN", activationcode.Trim());
                //cmd.Parameters.Add("@ERROR", SqlDbType.NVarChar, 500);
                //cmd.Parameters["@ERROR"].Direction = ParameterDirection.Output;
                int a = cmd.ExecuteNonQuery();

                //co the thu int a = cmd.ExecuteNonQuery(); de check so row effected
                if (a > 0)
                {
                    sendcode();
                    //lbThongBao.Text = cmd.Parameters["@ERROR"].Value.ToString();
                    Response.Redirect("~/KH/MailActive.aspx?emailadd=" + txtEmail.Text);

                }
                else
                {
                    lbThongBao.Text = "Sai Cú Pháp";
                }
            }
            else
            {
                //containerpu.Style.Add("display", "block");
            }
        }

        private void sendcode()
        {
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.Credentials = new System.Net.NetworkCredential("proxgroupcdio4@gmail.com", "ProxTichHop2022");
            smtp.EnableSsl = true;
            MailMessage msg = new MailMessage();
            msg.Subject = "Xác nhận email của bạn";
            msg.Body = "Chào " + txtEmail.Text + ", Mã xác nhận của Khách Hàng là: " + activationcode + " cảm ơn bạn đã đăng ký!";
            string toaddress = txtEmail.Text;
            msg.To.Add(toaddress);
            string fromaddress = "From ProXGroup <proxgroupcdio4@gmail.com>";
            msg.From = new MailAddress(fromaddress);
            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            try
            {
                smtp.Send(msg);
            }
            catch
            {
                throw;
            }
        }
    }
}