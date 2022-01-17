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
    public partial class QuanLyCapNhatDVVC : System.Web.UI.Page
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
                    txtTenDVVC.Text= dtDM.Rows[0]["TENDONVIVANCHUYEN"].ToString();
                    txtprice.Text = dtDM.Rows[0]["PHIVANCHUYEN"].ToString();
                    SqlCommand cmd = new SqlCommand(sqlDVVC, dataAccess.getConnection());
                }
                dataAccess.DongKetNoiCSDL();
            }
        }

        protected void btnCapNhat_Click(object sender, EventArgs e)
        {
            string idDVVC = Request.QueryString.Get("idDVVC").ToString();
            SqlParameter[] p = {
                new SqlParameter("@DONVIVANCHUYENID",SqlDbType.Int),
                new SqlParameter("@TENDONVIVANCHUYEN",SqlDbType.NVarChar,50),
                new SqlParameter("@PHIVANCHUYEN",SqlDbType.Int),
            };
            p[0].Value = int.Parse(idDVVC);
            p[1].Value = txtTenDVVC.Text;
            p[2].Value = txtprice.Text;

            int i = dataAccess.ExecuteNonQuery("PROC_UPDATE_DVVC", p);

            if (i > 0)
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