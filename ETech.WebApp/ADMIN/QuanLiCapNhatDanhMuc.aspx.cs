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
    public partial class QuanLiCapNhatDanhMuc : System.Web.UI.Page
    {
        DataAccess dataAccess = new DataAccess();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userKH"] == null)
            {
                Response.Redirect("DangNhap.aspx");
            }
            if (!IsPostBack) {
                string idDM = Request.QueryString.Get("idDM").ToString();
                string sqlDM = "SELECT * FROM LOAISP WHERE LOAISPID=" + idDM;
                dataAccess.MoKetNoiCSDL();
                DataTable dtDM = dataAccess.LayBangDuLieu(sqlDM);
                if (dtDM != null && dtDM.Rows.Count > 0)
                {
                    txtTenDM.Text = dtDM.Rows[0]["TENLOAI"].ToString();
                    SqlCommand cmd = new SqlCommand(sqlDM, dataAccess.getConnection());
                }
                dataAccess.DongKetNoiCSDL();
            }      
        }

        protected void btnCapNhat_Click(object sender, EventArgs e)
        {
            string idDM = Request.QueryString.Get("idDM").ToString();
            SqlParameter[] p = {
                new SqlParameter("@LOAISPID",SqlDbType.Int),
                  new SqlParameter("@TENLOAI",SqlDbType.NVarChar,50)
            };
            p[0].Value = int.Parse(idDM);
            p[1].Value = txtTenDM.Text;

            int i = dataAccess.ExecuteNonQuery("PROC_UPDATE_DANHMUC", p);

            if (i > 0)
            {
                Response.Redirect("QuanLyDanhMuc.aspx");
            }
            else
            {
                lblThongBao.Text = "Đã tồn tại danh mục";
            }
        }

        protected void btnHuy_Click(object sender, EventArgs e)
        {
            Response.Redirect("QuanLyDanhMuc.aspx");
        }
    }
}