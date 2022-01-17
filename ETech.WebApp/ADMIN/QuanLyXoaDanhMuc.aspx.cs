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
    public partial class QuanLyXoaDanhMuc : System.Web.UI.Page
    {
        DataAccess dataAccess = new DataAccess();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userKH"] == null)
            {
                Response.Redirect("DangNhap.aspx");
            }
            if (!IsPostBack)
            {
                string idDM = Request.QueryString.Get("idDM").ToString();
                string sqlDM = "SELECT * FROM LOAISP WHERE LOAISPID=" + idDM;
                dataAccess.MoKetNoiCSDL();
                DataTable dtDM = dataAccess.LayBangDuLieu(sqlDM);
                if (dtDM != null && dtDM.Rows.Count > 0)
                {
                    lblDanhMuc.Text = dtDM.Rows[0]["TENLOAI"].ToString();
                    SqlCommand cmd = new SqlCommand(sqlDM, dataAccess.getConnection());
                }
                dataAccess.DongKetNoiCSDL();
            }
        }

        protected void btnHuy_Click(object sender, EventArgs e)
        {
            Response.Redirect("QuanLyDanhMuc.aspx");
        }

        protected void btnXoa_Click(object sender, EventArgs e)
        {
            string idDM = Request.QueryString.Get("idDM").ToString();
            SqlParameter[] p = {
                new SqlParameter("@LOAISPID",SqlDbType.Int)
            };
            p[0].Value = int.Parse(idDM);

            int i = dataAccess.ExecuteNonQuery("PROC_DELETE_DANHMUC", p);

            if (i > 0)
            {
                Response.Redirect("QuanLyDanhMuc.aspx");
            }
        }
    }
}