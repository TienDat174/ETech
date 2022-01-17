using ETech.WebApp.AppCode;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;
using System.Text;


namespace ETech.WebApp.KH
{
    public partial class TrangQuenMatKhau : System.Web.UI.Page
    {
        DataAccess dataAccess = new DataAccess();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            dataAccess.MoKetNoiCSDL();
            string email = txtEmail.Text.ToString();
            string sql = "SELECT * FROM TAIKHOAN WHERE LOAITKID=2 AND EMAIL = " ;
            StringBuilder stringBuilder = new StringBuilder(sql);
            stringBuilder.Append(@"'");
            stringBuilder.Append(email);
            stringBuilder.Append(@"'");
            string sql2 = stringBuilder.ToString();
            SqlCommand cmd = new SqlCommand(sql2, dataAccess.getConnection());
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            

            if (dt.Rows.Count>0 && dt !=null)
            {
                cmd.ExecuteNonQuery();
                try {
                    int idTK = int.Parse(dt.Rows[0]["TAIKHOANID"].ToString());
                    String ToEmail = txtEmail.Text;
                    String UserName = dt.Rows[0]["HOTEN"].ToString();
                    String EmailBody = "Hi " + UserName + ",<br/><br/>Nhập vào link sau để lấy password: <br/> <br/> https://localhost:44303/KH/TrangResetPassword.aspx?idTK=" + idTK;
                    MailMessage mailMessage = new MailMessage("proxgroupcdio4@gmail.com", ToEmail);
                    mailMessage.Body = EmailBody;
                    mailMessage.IsBodyHtml = true;
                    mailMessage.Subject = "Reset Password";
                    mailMessage.Priority = MailPriority.High;
                    SmtpClient SMTP = new SmtpClient("smtp.gmail.com", 587);
                    SMTP.DeliveryMethod = SmtpDeliveryMethod.Network;
                    SMTP.UseDefaultCredentials = false;
                    SMTP.Credentials = new NetworkCredential()
                    {
                        UserName = "proxgroupcdio4@gmail.com",
                        Password = "ProxTichHop2022"
                    };
                    SMTP.EnableSsl = true;
                    SMTP.Send(mailMessage);
                    Response.Write("<script>alert('Đã gởi tới email của bạn.Vui lòng kiểm tra email')</script>");
                }
                catch
                {
                    Response.Write("<script>alert('Đã xảy ra lỗi')</script>");
                }
               
            }
            else
            {
                Response.Write("<script>alert('Email của bạn không chính xác')</script>");
            }
        }
    }
}