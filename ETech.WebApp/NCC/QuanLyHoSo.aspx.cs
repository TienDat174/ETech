using ETech.WebApp.AppCode;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ETech.WebApp.NCC
{
    public partial class QuanLyHoSo : System.Web.UI.Page
    {
        DataAccess dataAccess = new DataAccess();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userNCC"] == null)
            {
                Response.Redirect("DangKyDangNhapNCC.aspx");
            }
            StringBuilder table = new StringBuilder();


            dataAccess.MoKetNoiCSDL();
            string tenNCC = Request.QueryString.Get("userNCC");
            if (Session["userNCC"] == null)
            {
                Response.Redirect("DangKyDangNhapNCC.aspx");
            }

            if (!IsPostBack)
            {

                string sqlNCC = "SELECT * FROM NHACUNGCAP  WHERE TENDANGNHAP= N'" + tenNCC + "'";
                dataAccess.MoKetNoiCSDL();
                DataTable dtNCC = dataAccess.LayBangDuLieu(sqlNCC);
                if (dtNCC != null && dtNCC.Rows.Count > 0)
                {
                    lbdangnhap.Text = dtNCC.Rows[0]["TENDANGNHAP"].ToString();
                    txthoten.Text = dtNCC.Rows[0]["TENNHACUNGCAP"].ToString();
                    txtemail.Text = dtNCC.Rows[0]["EMAIL"].ToString();
                    txtdiachi.Text = dtNCC.Rows[0]["DIACHI"].ToString();
                    txtsdt.Text = dtNCC.Rows[0]["SDT"].ToString();
                    //SqlCommand cmd = new SqlCommand(sqlNCC, dataAccess.getConnection());
                }

                dataAccess.DongKetNoiCSDL();
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            string tenNCC = Request.QueryString.Get("userNCC");
            SqlParameter[] p =
           {   new SqlParameter("@TENDANGNHAP",SqlDbType.NVarChar),
                new SqlParameter("@TENNHACUNGCAP",SqlDbType.NVarChar),
                new SqlParameter("@EMAIL", SqlDbType.NVarChar),
                new SqlParameter("@DIACHI", SqlDbType.NVarChar),
                new SqlParameter("@SDT", SqlDbType.NVarChar),
            };
            p[0].Value = lbdangnhap.Text;
            p[1].Value = txthoten.Text;
            p[2].Value = txtemail.Text;
            p[3].Value = txtdiachi.Text;
            p[4].Value = txtsdt.Text;
            int i = dataAccess.ExecuteNonQuery("PROC_UPDATEACCOUNT_NCC", p);
            if (i > 0)
            {
                //Response.Redirect("QuanLyHoSo.aspx");
                lbThongBao.Text = "Cập nhật thành công";
            }
            else
            {
                lbThongBao.Text = "Cập nhật không thành công";

            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("TrangDoiMatKhau.aspx?user=" + lbdangnhap.Text);

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string tenNCC = Request.QueryString.Get("userNCC");
            DataAccess dataAccess = new DataAccess();
            dataAccess.MoKetNoiCSDL();
            SqlCommand cmd;
            if (txtMKC.Text == "" || txtMKM.Text == null)
            {                
                SqlParameter[] p =
               {   new SqlParameter("@TENDANGNHAP",SqlDbType.NVarChar),
                new SqlParameter("@TENNHACUNGCAP",SqlDbType.NVarChar),
                new SqlParameter("@EMAIL", SqlDbType.NVarChar),
                new SqlParameter("@DIACHI", SqlDbType.NVarChar),
                new SqlParameter("@SDT", SqlDbType.NVarChar),
            };
                p[0].Value = lbdangnhap.Text;
                p[1].Value = txthoten.Text;
                p[2].Value = txtemail.Text;
                p[3].Value = txtdiachi.Text;
                p[4].Value = txtsdt.Text;
                int i = dataAccess.ExecuteNonQuery("PROC_UPDATEACCOUNT_NCC", p);
                if (i > 0)
                {
                    //Response.Redirect("QuanLyHoSo.aspx");
                    lbThongBao.Text = "Cập nhật thành công";
                }
                else
                {
                    lbThongBao.Text = "Cập nhật không thành công";

                }
            }
            else if (txtMKC.Text != "" && txtMKM.Text == "")
            {
                lbThongBao.Text = "Bạn chưa nhập mật khẩu mới";

            }
            else
            {
                cmd = new SqlCommand("PROC_CHANGEPASSNCC", dataAccess.getConnection());
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@TENDANGNHAP", lbdangnhap.Text);
                cmd.Parameters.AddWithValue("@MATKHAUCU", txtMKC.Text);
                cmd.Parameters.AddWithValue("@TENNHACUNGCAP", txthoten.Text);
                cmd.Parameters.AddWithValue("@EMAIL", txtemail.Text);
                cmd.Parameters.AddWithValue("@DIACHI", txtdiachi.Text);
                cmd.Parameters.AddWithValue("@SDT", txtsdt.Text);
                cmd.Parameters.AddWithValue("@MATKHAUMOI", txtMKM.Text);

                cmd.Parameters.Add("@ERROR",SqlDbType.NVarChar,500);
                cmd.Parameters["@ERROR"].Direction= ParameterDirection.Output;
                int a = cmd.ExecuteNonQuery();

                if (a > 0)
                {
                    lbThongBao.Text = "Cập Nhập Thành Công";
                    dataAccess.DongKetNoiCSDL();
                    Response.Write("<script>alert(\"Cập nhập thành công\")</script>");
                }
                else{
                    lbThongBao.Text = cmd.Parameters["@ERROR"].Value.ToString();
                }
            }

        }
    }
}