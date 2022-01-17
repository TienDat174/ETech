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
    public partial class QuanLyKhuyenMai : System.Web.UI.Page
    {
        DataAccess dataAccess = new DataAccess();
        protected void Page_Load(object sender, EventArgs e)
        {
            string TenNCC = Request.QueryString.Get("userNCC");
            if (Session["userNCC"] == null)
            {
                Response.Redirect("~/NCC/DangKyDangNhapNCC.aspx");
            }
            BANG1();
        }
        void BANG1()
        {
            dataAccess.MoKetNoiCSDL();
            string TenNCC = Session["userNCC"].ToString();
            dataAccess.MoKetNoiCSDL();
            //string sql = "SELECT CHITIETKM.KHUYENMAIID,KHUYENMAI.TENKM, NHACUNGCAP.TENNHACUNGCAP,KHUYENMAI.NGAYBD,KHUYENMAI.NGAYKT FROM CHITIETKM,KHUYENMAI,NHACUNGCAP WHERE CHITIETKM.KHUYENMAIID=KHUYENMAI.KHUYEMAIID AND KHUYENMAI.NHACUNGCAPID=NHACUNGCAP.NHACUNGCAPID AND NHACUNGCAP.TENDANGNHAP =N'"+ TenNCC+"'";
            //DataTable dt = dataAccess.LayBangDuLieu(sql);            
            SqlCommand cmd = new SqlCommand("PROC_VIEW_KM_NCC", dataAccess.getConnection());
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@TENDANGNHAP", TenNCC);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            StringBuilder table = new StringBuilder();
            if (dt != null && dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    table.Append("<tr class=\"\">");
                    table.Append("<td class=\"qldm-column2\" style=\"text-align:center;\">" + dr[0] + "</td>");
                    table.Append("<td class=\"qldm-column2\">" + dr[1] + "</td>");
                    table.Append("<td class=\"qldm-column2\">" + dr[2] + "</td>");
                    table.Append("<td class=\"qldm-column2\">" + dr[3] + "</td>");
                    table.Append("<td class=\"qldm-column2\">" + dr[4] + "</td>");
                    table.Append("<td class=\"qldm-column2\" style=\"text-align:center;\">");
                    table.Append("<a href=\"TrangXoaKhuyenMai.aspx?KHUYENMAIID=" + dr[0] + "\" class=\"cell_xem\">Xóa</a>");
                    table.Append("</td>");
                    table.Append("</tr>");
                }
                Panel1.Controls.Add(new Label { Text = table.ToString() });
                //Panel1.Controls.Add(new Label { Text = table.ToString() });
            }
        }
    }
}