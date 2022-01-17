using ETech.WebApp.AppCode;
using System;
using System.Data;
using System.Data.SqlClient;


namespace ETech.WebApp.KH
{
    public partial class QuanLyThongTin : System.Web.UI.Page
    {
        DataAccess dataAccess = new DataAccess();
        protected void Page_Load(object sender, EventArgs e)
        {
            //checklogin
            if(Session["userKH"]==null)
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
                if (dt != null && dt.Rows.Count>0)
                {
                    lbdangnhap.Text = dt.Rows[0]["TENDANGNHAP"].ToString();
                    txthoten.Text= dt.Rows[0]["HOTEN"].ToString();
                    txtemail.Text= dt.Rows[0]["EMAIL"].ToString();
                    txtdiachi.Text= dt.Rows[0]["DIACHI"].ToString();
                    txtsdt.Text = dt.Rows[0]["SDT"].ToString();

                }    
            }
            

        }

        protected void btnCapNhat_Click(object sender, EventArgs e)
        {
            dataAccess.MoKetNoiCSDL();
            string tendangnhap = Request.QueryString.Get("username");
            SqlCommand cmd = new SqlCommand("PROC_UPDATE_KH", dataAccess.getConnection());
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@TENDANGNHAP", tendangnhap);
            cmd.Parameters.AddWithValue("@HOTEN", txthoten.Text);
            cmd.Parameters.AddWithValue("@EMAIL",txtemail.Text );
            cmd.Parameters.AddWithValue("@DIACHI", txtdiachi.Text);
            cmd.Parameters.AddWithValue("@SDT", txtsdt.Text);
            int i = cmd.ExecuteNonQuery();
            if(i>0)
            {
                Response.Write("<script>alert('Cập nhật thành công')</script>");
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