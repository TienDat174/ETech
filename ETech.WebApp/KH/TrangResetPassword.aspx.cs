using ETech.WebApp.AppCode;
using System;
using System.Data;
using System.Data.SqlClient;

namespace ETech.WebApp.KH
{
    public partial class TrangResetPassword : System.Web.UI.Page
    {
        DataAccess dataAccess = new DataAccess();
        protected void Page_Load(object sender, EventArgs e)
        {
            dataAccess.MoKetNoiCSDL();
            int idTK = int.Parse(Request.QueryString.Get("idTK"));
        }

        protected void btnCapNhat_Click(object sender, EventArgs e)
        {
            int idTK = int.Parse(Request.QueryString.Get("idTK"));
            SqlCommand cmd = new SqlCommand("PROC_UPDATE_PASSWORDKH2", dataAccess.getConnection());
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@IDTK", idTK);
            cmd.Parameters.AddWithValue("@PW", txtpw2.Text);
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {
                Response.Write("<script>alert('Cập nhật mật khẩu thành công')</script>");
                Response.Redirect("Trangchu.aspx");
            }
            else
            {
                Response.Write("<script>alert('Đã xảy ra lỗi. Vui lòng thực hiện lại')</script>");
            }
        }

        protected void btnHuy_Click(object sender, EventArgs e)
        {
            Response.Redirect("TrangChu.aspx");
        }
    }
}