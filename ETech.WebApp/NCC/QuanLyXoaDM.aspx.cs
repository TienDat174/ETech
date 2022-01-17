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
    public partial class QuanLyXoaDM : System.Web.UI.Page
    {
        DataAccess dataAccess = new DataAccess();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string idDM = Request.QueryString.Get("idDM").ToString();
                string sqlDM = "SELECT a.TENLOAI FROM LOAISP a, CHITIETDANHMUC b WHERE a.LOAISPID = b.LOAISPID and b.ID_CHITIETDM =" + idDM;
                dataAccess.MoKetNoiCSDL();
                DataTable dtDM = dataAccess.LayBangDuLieu(sqlDM);
                if (dtDM != null && dtDM.Rows.Count > 0)
                {
                    lblDM.Text = dtDM.Rows[0]["TENLOAI"].ToString();
                    SqlCommand cmd = new SqlCommand(sqlDM, dataAccess.getConnection());
                    dataAccess.DongKetNoiCSDL();
                }
            }
        }

        protected void btnXoa_Click(object sender, EventArgs e)
        {
            string idDM = Request.QueryString.Get("idDM").ToString();
            int id = int.Parse(Session["id"].ToString());
            SqlParameter[] p = {
                 new SqlParameter("@NHACUNGCAPID",SqlDbType.Int),
                new SqlParameter("@ID",SqlDbType.Int)
            };
            p[0].Value =  id ;
            p[1].Value = int.Parse(idDM);

            int i = dataAccess.ExecuteNonQuery("PROC_DELETE_DANHMUC2", p);

            if(i>0)
            {
                Response.Redirect("YeuCauDanhMuc.aspx");
            }    
        }

        protected void btnHuy_Click(object sender, EventArgs e)
        {
            Response.Redirect("YeuCauDanhMuc.aspx");
        }
    }
}