using ETech.WebApp.AppCode;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ETech.WebApp.NCC
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        DataAccess dataAccess = new DataAccess();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userNCC"] != null)
            {
                hlUser.NavigateUrl = "QuanLyHoSo.aspx?userNCC=" + Session["userNCC"].ToString();
                lbADName.Text = Session["userNCC"].ToString();
                hlhsnc.NavigateUrl= "QuanLyHoSo.aspx?userNCC=" + Session["userNCC"].ToString();
            }
            else{
                hlUser.NavigateUrl = "DangKyDangNhap.aspx";
            } 
            dataAccess.MoKetNoiCSDL();
            string TenNCC = Session["userNCC"].ToString();
            SqlCommand cmd = new SqlCommand("PROC_GET_ID_NCC", dataAccess.getConnection());
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@TENDANGNHAP", TenNCC);
           
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            Session["id"] = int.Parse(dt.Rows[0]["NHACUNGCAPID"].ToString());
            dataAccess.DongKetNoiCSDL();
        }
        public string ADName
        {
            get { return lbADName.Text; }
            set { lbADName.Text = value; }
        }
        protected void btnDangXuat_Click(object sender, EventArgs e)
        {
            Session["userNCC"] = null;
            Session.Clear();
            Response.Cookies.Clear();
            Response.Cache.SetNoStore();
            Response.CacheControl = "no-cache";
            Response.Redirect("DangKyDangNhapNCC.aspx");
        }
    }
}