using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using ETech.WebApp.AppCode;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace ETech.WebApp.ADMIN
{
    public partial class QuanLyNCCChiTiet : System.Web.UI.Page
    {
        DataAccess dataAccess = new DataAccess();
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (!IsPostBack)
            {

                string idNCC = Request.QueryString.Get("NHACUNGCAPID").ToString();
                string sql = "select * from NHACUNGCAP where NHACUNGCAPID = " + idNCC;
                dataAccess.MoKetNoiCSDL();
                DataTable dtNCC = dataAccess.LayBangDuLieu(sql);
                if (dtNCC != null && dtNCC.Rows.Count > 0)
                {
                    tendangnhap.Text = dtNCC.Rows[0]["TENDANGNHAP"].ToString();
                    hoten.Text = dtNCC.Rows[0]["TENNHACUNGCAP"].ToString();
                    email.Text = dtNCC.Rows[0]["EMAIL"].ToString();
                    diachi.Text = dtNCC.Rows[0]["DIACHI"].ToString();
                    sdt.Text = dtNCC.Rows[0]["SDT"].ToString();
                    SqlCommand cmd = new SqlCommand(sql, dataAccess.getConnection());
                    string state = dtNCC.Rows[0]["TRANGTHAI"].ToString();
                    if(state == "1")
                    {
                        rdb_open.Checked = true;
                    }
                    else
                    {
                        rdb_close.Checked = true;
                    }
                }
                dataAccess.DongKetNoiCSDL();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int idnhacungcap = int.Parse(Request.QueryString.Get("NHACUNGCAPID").ToString());
            if (rdb_open.Checked)
            {
                DataAccess dataAccess = new DataAccess();
                try
                {
                    SqlParameter[] p =
                    {
                    new SqlParameter("@IDNHACUNGCAP",SqlDbType.Int)
                };
                    p[0].Value = idnhacungcap;
                    int a = dataAccess.ExecuteNonQuery("PROC_DOITRANGTHAI_NCC", p);

                }
                catch { }
                Response.Redirect("QuanLyNCC.aspx");
            }
            
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            int idnhacungcap = int.Parse(Request.QueryString.Get("NHACUNGCAPID").ToString());
            DataAccess dataAccess = new DataAccess();
            try
            {
                SqlParameter[] p =
                {
                    new SqlParameter("@IDNHACUNGCAP",SqlDbType.Int)
                };
                p[0].Value = idnhacungcap;
                int a = dataAccess.ExecuteNonQuery("PROC_DOITRANGTHAI_KHOA_NCC", p);

            }
            catch { }
            Response.Redirect("QuanLyNCC.aspx");
        }
    }
}