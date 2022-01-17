using ETech.WebApp.AppCode;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ETech.WebApp.ADMIN
{
    public partial class QuanLyDanhMucChiTiet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userKH"] == null)
            {
                Response.Redirect("DangNhap.aspx");
            }
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            DataAccess dataAccess = new DataAccess();
            dataAccess.MoKetNoiCSDL();

            SqlCommand cmd = new SqlCommand("PROC_INSERT_DANHMUC", dataAccess.getConnection());
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@TENLOAI", txtDM.Text);
            int a = cmd.ExecuteNonQuery();
            if (a > 0)
            {
                Response.Redirect("QuanLyDanhMuc.aspx");

            }
            else
            {
                lblThongBao.Text = "Đã tồn tại Danh Mục";
            }
        }

        protected void btnHuy_Click(object sender, EventArgs e)
        {
            Response.Redirect("QuanLyDanhMuc.aspx");
        }
    }
}