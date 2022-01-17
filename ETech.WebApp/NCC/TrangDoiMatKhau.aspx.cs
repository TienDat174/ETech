using ETech.WebApp.AppCode;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ETech.WebApp.NCC
{
    public partial class TrangDoiMatKhau : System.Web.UI.Page
    {
        DataAccess dataAccess = new DataAccess();
        protected void Page_Load(object sender, EventArgs e)
        {
            StringBuilder table = new StringBuilder();

            string TenNCC = Request.QueryString.Get("user");        
            if (Session["userNCC"] == null)
            {
                Response.Redirect("DangKyDangNhapNCC.aspx");
            }
            if (!IsPostBack)
            {
                lbid.Text = TenNCC;
                //string sqlNCC = "Select * from NHACUNGCAP where TENNHACUNGCAP= '" + TenNCC +"'";
                //dataAccess.MoKetNoiCSDL();
                //DataTable dtNCC = dataAccess.LayBangDuLieu(sqlNCC);
                //if (dtNCC != null && dtNCC.Rows.Count > 0)
                //{
                //    lbid.Text = dtNCC.Rows[0]["TENNHACUNGCAP"].ToString();
                //}
            }
        }
        protected void btnLogin1_Click(object sender, EventArgs e)
        {
            string userNCC = Request.QueryString.Get("user");
            DataAccess dataAccess = new DataAccess();
            dataAccess.MoKetNoiCSDL();
            string strPasscu = txtmkcu.Text;
            string strPassMoi = txtmkm.Text;
            string strRePass = txtmkm.Text;
            string strTEN = lbid.Text;
            string sql = "SELECT * FROM NHACUNGCAP WHERE TENDANGNHAP =N '" + userNCC +"'";
            DataTable dt = dataAccess.LayBangDuLieu(sql);
            SqlCommand cmd;
            if (strPassMoi == "" || strPasscu =="")
            {
                lbTB1.Text = "Bạn Chưa nhập mật khẩu mới hoặc mật khẩu cũ";
            }
            else
            {
                cmd = new SqlCommand("PROC_CHANGEPASSNCC", dataAccess.getConnection());
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@TENDANGNHAP", strTEN);
                cmd.Parameters.AddWithValue("@MATKHAUCU", strPasscu);
                cmd.Parameters.AddWithValue("@MATKHAUMOI", strPassMoi);

                cmd.Parameters.Add("@ERROR", SqlDbType.NVarChar, 500);
                cmd.Parameters["@ERROR"].Direction = ParameterDirection.Output;
                int a = cmd.ExecuteNonQuery();
                if (a > 0)
                {
                    lbTB1.Text = "Cập nhập thành công";
                    dataAccess.DongKetNoiCSDL();
                    Response.Write("<script>alert(\"Cập nhập thành công\")</script>");
                }
                else
                {
                    lbTB1.Text = cmd.Parameters["@ERROR"].Value.ToString();
                }
            }
        }
    }
}