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
    public partial class QuanLyNguoiDungChiTiet : System.Web.UI.Page
    {
        DataAccess dataAccess = new DataAccess();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userKH"] == null)
            {
                Response.Redirect("DangNhap.aspx");
            }
            else
            {

            }
            if (!IsPostBack)
            {
                string id = Request.QueryString.Get("id").ToString();

                dataAccess.MoKetNoiCSDL();
                String sqlTrangThaiTK = "SELECT TRANGTHAI FROM TAIKHOAN WHERE TAIKHOANID=" + id;
                DataTable tbTrangThai = dataAccess.LayBangDuLieu(sqlTrangThaiTK);

                string TrangThaiTk = tbTrangThai.Rows[0]["TRANGTHAI"].ToString();

                if (TrangThaiTk != "1")
                {
                    Mo.Style.Add("display", "block");
                }
                else if (TrangThaiTk == "1")
                {
                    Khoa.Style.Add("display", "block");
                }
                string sql = "SELECT * FROM TAIKHOAN T, LOAITK L WHERE T.LOAITKID = L.LOAITKID AND TAIKHOANID = " + id;
                DataTable dt = dataAccess.LayBangDuLieu(sql);
                if (dt != null && dt.Rows.Count > 0)
                {
                    lbdangnhap.Text = dt.Rows[0]["TENDANGNHAP"].ToString();
                    txthoten.Text = dt.Rows[0]["HOTEN"].ToString();
                    txtemail.Text = dt.Rows[0]["EMAIL"].ToString();
                    txtdiachi.Text = dt.Rows[0]["DIACHI"].ToString();
                    txtsdt.Text = dt.Rows[0]["SDT"].ToString();
                    //rblTrangThai.Items.FindByValue((dt.Rows[0]["TRANGTHAI"].Equals(true)) ? 1 + "" : 0 + "").Selected = true;
                }
                dataAccess.DongKetNoiCSDL();
            }
        }

        protected void btn_CapNhap_Click(object sender, EventArgs e)
        {
            string idtk = Request.QueryString.Get("id").ToString();
            SqlParameter[] p =
            {   new SqlParameter("@TENDANGNHAP",SqlDbType.NVarChar),
                new SqlParameter("@HOTEN",SqlDbType.NVarChar),
                new SqlParameter("@EMAIL", SqlDbType.NVarChar),
                new SqlParameter("@DIACHI", SqlDbType.NVarChar),
                new SqlParameter("@SDT", SqlDbType.NVarChar),
            };
            p[0].Value = lbdangnhap.Text;
            p[1].Value = txthoten.Text;
            p[2].Value = txtemail.Text;
            p[3].Value = txtdiachi.Text;
            p[4].Value = txtsdt.Text;
            int i = dataAccess.ExecuteNonQuery("PROC_UPDATEACCOUNT_KH", p);
            if (i > 0)
            {
                Response.Redirect("QuanLyNguoiDung.aspx");

            }
            else
            {
                lbThongBao.Text = "Cập nhật không thành công";
            }
        }

        protected void btn_Xoa_Click(object sender, EventArgs e)
        {
            string idtk = Request.QueryString.Get("id").ToString();
            SqlParameter[] p =
            {   new SqlParameter("@TAIKHOANID",SqlDbType.Int),
            };
            p[0].Value = int.Parse(idtk);
            int i = dataAccess.ExecuteNonQuery("PROC_DELETEACCOUNT_KH", p);
            if (i > 0)
            {
                lbThongBao.Text = "Xóa thành công";
                Response.Redirect("QuanLyNguoiDung.aspx");

            }
            else
            {
                lbThongBao.Text = "Xoa không thành công";
            }
        }

        protected void btn_Khoa_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString.Get("id");
            DataAccess dataAccess = new DataAccess();

            dataAccess.MoKetNoiCSDL();
            string sql = "UPDATE TAIKHOAN SET TRANGTHAI = '0' WHERE  TAIKHOANID =" + id;
            SqlCommand cmd = new SqlCommand(sql, dataAccess.getConnection());
            cmd.ExecuteNonQuery();

            string sqlCheckTK = "SELECT * FROM TAIKHOAN WHERE TAIKHOANID =" + id;
            DataTable dt = dataAccess.LayBangDuLieu(sqlCheckTK);

            string loaiTK = dt.Rows[0]["TRANGTHAI"].ToString();
            if (int.Parse(loaiTK) == 0)
            {
                Response.Redirect("QuanLyNguoiDung.aspx");
            }
            if (int.Parse(loaiTK) == 1)
            {
                lbThongBao.Text = "ERROR";
            }
            dataAccess.DongKetNoiCSDL();
        }

        protected void btn_Mo_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString.Get("id");
            DataAccess dataAccess = new DataAccess();

            dataAccess.MoKetNoiCSDL();
            string sql = "UPDATE TAIKHOAN SET TRANGTHAI = '1' WHERE TAIKHOANID =" + id;
            SqlCommand cmd = new SqlCommand(sql, dataAccess.getConnection());
            cmd.ExecuteNonQuery();

            string sqlCheckTK = "SELECT * FROM TAIKHOAN WHERE TAIKHOANID =" + id;
            DataTable dt = dataAccess.LayBangDuLieu(sqlCheckTK);

            string loaiTK = dt.Rows[0]["TRANGTHAI"].ToString();
            if (int.Parse(loaiTK) == 1)
            {
                Response.Redirect("QuanLyNguoiDung.aspx");
            }
            if (int.Parse(loaiTK) == 0)
            {
                lbThongBao.Text = "ERROR";
            }
            dataAccess.DongKetNoiCSDL();
        }
    }
}