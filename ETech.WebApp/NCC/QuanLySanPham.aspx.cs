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
    public partial class QuanLySanPham : System.Web.UI.Page
    {
        DataAccess dataAccess = new DataAccess();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userNCC"] == null)
            {
                Response.Redirect("DangKyDangNhapNCC.aspx");
            }
            if (!IsPostBack)
            {
                SHOWSANPHAM();
            }    
        }
        protected void SHOWSANPHAM()
        { 
            dataAccess.MoKetNoiCSDL();
            int id = int.Parse(Session["id"].ToString());
            SqlParameter[] p = {
                 new SqlParameter("@NHACUNGCAPID", SqlDbType.Int)
            };
            p[0].Value = id;
            DataTable dt = dataAccess.ExecuteQuery("PROC_VIEWSP_NCC", p);

            StringBuilder table = new StringBuilder();
            if (dt != null && dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    table.Append("<tr class=\"row\">");
                    table.Append("<td class=\"qldm-column2\" style=\"text-align:center;\">" + dr[0] + "</td>");
                    table.Append("<td class=\"qldm-column2\">" + dr[1] + "</td>");
                    table.Append("<td class=\"qldm-column2\">" + String.Format("{0:N0}", int.Parse(dr[2].ToString())) + " VNĐ" + "</td>");
                    table.Append("<td class=\"qldm-column2\">" + dr[3] + "</td>");
                    table.Append("<td class=\"qldm-column2\">" + dr[4] + "</td>");
                    table.Append("<td class=\"qldm-column2\">" + dr[5] + "</td>");
                    table.Append("<td class=\"qldm-column2\" style=\"text-align:center;\">");
                    table.Append("<a href=\"QuanLySanPhamChiTiet.aspx?idSP=" + dr[6] + "\"  class=\"cell_xem\">Chỉnh sửa</a>");
                    table.Append("</td>");
                    table.Append("</tr>");
                }
                Panel1.Controls.Add(new Label { Text = table.ToString() });
                //Panel1.Controls.Add(new Label { Text = table.ToString() });
            }
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            Response.Redirect("ThemSanPhamChiTiet.aspx");
        }
    }
}