using ETech.WebApp.AppCode;
using System;
using System.Data;
using System.Data.SqlClient;

namespace ETech.WebApp.KH
{
    public partial class TrangDoiMatKhau : System.Web.UI.Page
    {
        DataAccess dataAccess = new DataAccess();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userKH"] == null)
            {
                Response.Redirect("TrangDangKyDangNhapKH.aspx");
            }
            string tendangnhap = Request.QueryString.Get("username");
            if (!IsPostBack)
            {
                dataAccess.MoKetNoiCSDL();
                SqlCommand cmd = new SqlCommand("PROC_KH_DETAIL", dataAccess.getConnection());
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@TENDANGNHAP", tendangnhap);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt != null && dt.Rows.Count > 0)
                {
                    lbdangnhap.Text = dt.Rows[0]["TENDANGNHAP"].ToString();
                }
            }
        }

        protected void btnCapNhat_Click(object sender, EventArgs e)
        {
            if (Session["userKH"] == null)
            {
                Response.Redirect("TrangDangKyDangNhapKH.aspx");
            }
            string tendangnhap = Request.QueryString.Get("username");
            dataAccess.MoKetNoiCSDL();
            SqlCommand cmd = new SqlCommand("PROC_KH_DETAIL", dataAccess.getConnection());
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@TENDANGNHAP", tendangnhap);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (txtpw1.Text!=dt.Rows[0]["MATKHAU"].ToString())
            {
                lbThongBao.Text = "Bạn nhập sai mật khẩu";
            }
            else
            {
                SqlCommand cmd2 = new SqlCommand("PROC_UPDATE_PASSWORD", dataAccess.getConnection());
                cmd2.CommandType = CommandType.StoredProcedure;
                cmd2.Parameters.AddWithValue("@TENDANGNHAP", tendangnhap);
                cmd2.Parameters.AddWithValue("@PW1", txtpw1.Text);
                cmd2.Parameters.AddWithValue("@PW2", txtpw2.Text);
                int i = cmd2.ExecuteNonQuery();
                if (i > 0)
                {
                    Response.Write("<script>alert('Cập nhật mật khẩu thành công')</script>");
                }
                else
                {
                    Response.Write("<script>alert('Đã xảy ra lỗi. Vui lòng thực hiện lại')</script>");
                }
            }
        }

        protected void btnHuy_Click(object sender, EventArgs e)
        {
            Response.Redirect("TrangChu.aspx");
        }
    }
}