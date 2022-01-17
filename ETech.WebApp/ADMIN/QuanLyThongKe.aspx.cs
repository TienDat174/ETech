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
    public partial class QuanLyThongKe : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userKH"] == null)
            {
                Response.Redirect("DangNhap.aspx");
            }
            THONGKE_KHACHHANG();
            THONGKE_NCC();
            THONGKE_ADMIN();
            THONGKE_DVVC();

        }
       void THONGKE_KHACHHANG()
        {
            DataAccess dataAccess = new DataAccess();
            dataAccess.MoKetNoiCSDL();
            SqlCommand cmd = new SqlCommand("PROC_THONGKE_KH", dataAccess.getConnection());
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {

                 lblTK.Text = dr.GetValue(0).ToString();
            }
        }
        void THONGKE_ADMIN()
        {
            DataAccess dataAccess = new DataAccess();
            dataAccess.MoKetNoiCSDL();
            SqlCommand cmd = new SqlCommand("PROC_THONGKE_ADMIN", dataAccess.getConnection());
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {

                lblAd.Text = dr.GetValue(0).ToString();
            }
        }
        void THONGKE_DVVC()
        {
            DataAccess dataAccess = new DataAccess();
            dataAccess.MoKetNoiCSDL();
            SqlCommand cmd = new SqlCommand("PROC_THONGKE_DVVC", dataAccess.getConnection());
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {

                lblDVVC.Text = dr.GetValue(0).ToString();
            }
        }
        void THONGKE_NCC()
        {
            DataAccess dataAccess = new DataAccess();
            dataAccess.MoKetNoiCSDL();
            SqlCommand cmd = new SqlCommand("PROC_THONGKE_NCC", dataAccess.getConnection());
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {

               lblNCC.Text = dr.GetValue(0).ToString();
            }
        }
    }
}