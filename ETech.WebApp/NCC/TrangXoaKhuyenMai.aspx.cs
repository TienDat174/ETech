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
    public partial class TrangXoaKhuyenMai : System.Web.UI.Page
    {
        DataAccess dataAccess = new DataAccess();
        protected void Page_Load(object sender, EventArgs e)
        {
            string idKM = Request.QueryString.Get("KHUYENMAIID").ToString();
            String sqlKM= "select * from KHUYENMAI WHERE KHUYEMAIID ='" +idKM + "'";
            dataAccess.MoKetNoiCSDL();
            DataTable dtDM = dataAccess.LayBangDuLieu(sqlKM);
            if (dtDM != null && dtDM.Rows.Count > 0)
            {
                lblDM.Text = dtDM.Rows[0]["TENKM"].ToString();
                SqlCommand cmd = new SqlCommand(sqlKM, dataAccess.getConnection());
                dataAccess.DongKetNoiCSDL();
            }
        }

        protected void btnXoa_Click(object sender, EventArgs e)
        {
            string idKM = Request.QueryString.Get("KHUYENMAIID").ToString();
            int id = int.Parse(Session["id"].ToString());
            SqlParameter[] p = {
                 
                new SqlParameter("@ID",SqlDbType.Int),
                new SqlParameter("@NHACUNGCAPID",SqlDbType.Int)
            };
            p[0].Value = int.Parse(idKM);
            p[1].Value = id;
            int i = dataAccess.ExecuteNonQuery("PROC_DELETE_KM", p);

            if (i > 0)
            {
                Response.Redirect("QuanLyKhuyenMai.aspx");
            }
        }

        protected void btnHuy_Click(object sender, EventArgs e)
        {
            Response.Redirect("QuanLyKhuyenMai.aspx");
        }
    }
}