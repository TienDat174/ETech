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
    public partial class Xacnhanthanhctoan : System.Web.UI.Page
    {
        DataAccess dataAccess = new DataAccess();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userNCC"] == null)
            {
                Response.Redirect("DangKyDangNhapNCC.aspx");
            }
            int idDH = int.Parse(Request.QueryString.Get("idDH"));
            int idNCC = int.Parse(Session["id"].ToString());
            if (!IsPostBack)
            {
                dataAccess.MoKetNoiCSDL();
                SqlCommand cmd = new SqlCommand("PROC_GET_VIEW_CTDONHANG3", dataAccess.getConnection());
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@IDDONHANG", idDH);
                cmd.Parameters.AddWithValue("@NHACUNGCAPID", idNCC);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt != null && dt.Rows.Count > 0)
                {

                    this.rptCTDONHANG.DataSource = dt;
                    this.rptCTDONHANG.DataBind();

                }
            }
        }

        protected void btnDuyet_Click(object sender, EventArgs e)
        {
            int idDH = int.Parse(Request.QueryString.Get("idDH"));
            int idNCC = int.Parse(Session["id"].ToString());
            dataAccess.MoKetNoiCSDL();
            SqlCommand cmd = new SqlCommand("PROC_XACNHANTHANHTOAN_DONHANG", dataAccess.getConnection());
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@IDDH", idDH);
            cmd.Parameters.AddWithValue("@NHACUNGCAPID", idNCC);
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {
                Response.Redirect("QuanLyDonHang.aspx");
            }
            else
            {
                Response.Write("<script>alert('Duyệt thất bại')</script>");
            }   
        }

        protected void btnHuy_Click(object sender, EventArgs e)
        {
            Response.Redirect("QuanLyDonHang.aspx");
        }
    }
}