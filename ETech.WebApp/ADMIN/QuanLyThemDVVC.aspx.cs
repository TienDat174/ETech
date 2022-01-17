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
    public partial class QuanLyThemDVVC : System.Web.UI.Page
    {
        DataAccess dataAccess = new DataAccess();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userKH"] == null)
            {
                Response.Redirect("DangNhap.aspx");
            }
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            dataAccess.MoKetNoiCSDL();

            SqlCommand cmd = new SqlCommand("PROC_INSERT_DVVC", dataAccess.getConnection());
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@TENDONVIVANCHUYEN", txtDVVC.Text);
            cmd.Parameters.AddWithValue("@PHIVANCHUYEN", txtprice.Text);
            int a = cmd.ExecuteNonQuery();
            if (a > 0)
            {
                Response.Redirect("QuanLyDVVC.aspx");

            }
            else
            {
                lblThongBao.Text = "Đã tồn tại đơn vị vận chuyển";
            }
        }

        protected void btnHuy_Click(object sender, EventArgs e)
        {
            Response.Redirect("QuanLyDVVC.aspx");
        }
    }
}