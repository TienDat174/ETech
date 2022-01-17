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
    public partial class QuanLyXoaDVVC : System.Web.UI.Page
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
                string idDVVC = Request.QueryString.Get("idDVVC").ToString();
                string sqlDVVC = "SELECT * FROM DONVIVANCHUYEN  WHERE DONVIVANCHUYENID=" + idDVVC;
                dataAccess.MoKetNoiCSDL();
                DataTable dtDM = dataAccess.LayBangDuLieu(sqlDVVC);
                if (dtDM != null && dtDM.Rows.Count > 0)
                {
                    lblDVVC.Text = dtDM.Rows[0]["TENDONVIVANCHUYEN"].ToString();
                }
                dataAccess.DongKetNoiCSDL();
            }
        }

        protected void btnXoa_Click(object sender, EventArgs e)
        {
            string idDVVC = Request.QueryString.Get("idDVVC").ToString();
            SqlParameter[] p = {
                new SqlParameter("@ID",SqlDbType.Int),

            };
            p[0].Value = int.Parse(idDVVC);
            int i = dataAccess.ExecuteNonQuery("PROC_DELETE_DVVC", p);

            if (i > 0)
            {
                Response.Redirect("QuanLyDVVC.aspx");
            }
        }

        protected void btnHuy_Click(object sender, EventArgs e)
        {
            Response.Redirect("QuanLyDVVC.aspx");
        }
    }
}