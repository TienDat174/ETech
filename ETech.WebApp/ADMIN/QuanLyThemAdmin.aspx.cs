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
    public partial class QuanLyThemAdmin : System.Web.UI.Page
    {
        DataAccess dataAccess = new DataAccess();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btn_ThemMoi_Click(object sender, EventArgs e)
        {

            dataAccess.MoKetNoiCSDL();
            SqlCommand cmd = new SqlCommand("dbo.PROC_ADINSERTACCOUNT_AD", dataAccess.getConnection());
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@TENDANGNHAP", txtTenDangNhap.Text);
            cmd.Parameters.AddWithValue("@MATKHAU", txtpass.Text);
            cmd.Parameters.AddWithValue("@HOTEN", txtHoTen.Text);
            cmd.Parameters.AddWithValue("@EMAIL", txtEmail.Text);
            cmd.Parameters.AddWithValue("@DIACHI", txtDiaChi.Text);
            cmd.Parameters.AddWithValue("@SDT", txtSDT.Text);
            cmd.Parameters.Add("@ERROR", SqlDbType.NVarChar, 500);
            cmd.Parameters["@ERROR"].Direction = ParameterDirection.Output;
            int a = cmd.ExecuteNonQuery();
            if (a > 0)
            {
                lbThongBao.Text = cmd.Parameters["@ERROR"].Value.ToString();
                Response.Redirect("QuanLyAdmin.aspx");
            }
            else
            {
                lbThongBao.Text = cmd.Parameters["@ERROR"].Value.ToString();
            }
        }
        protected void btn_Huy_Click(object sender, EventArgs e)
        {
            Response.Redirect("QuanLyAdmin.aspx");
        }
    }
}