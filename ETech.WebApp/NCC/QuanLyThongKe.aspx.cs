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
    public partial class QuanLyThongKe : System.Web.UI.Page
    {
        DataAccess dataAccess = new DataAccess();
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnHuy_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.RawUrl);
        }

        protected void btnTim_Click(object sender, EventArgs e)
        {
            int id = int.Parse(Session["id"].ToString());
            SqlParameter[] p = {
                 new SqlParameter("@NHACUNGCAPID", SqlDbType.Int),
                 new SqlParameter("@NGAYBATDAU", SqlDbType.NVarChar,50),
                 new SqlParameter("@NGAYKETTHUC", SqlDbType.NVarChar,50)
            };
            p[0].Value = id;
            p[1].Value = txtNgayBD.Text;
            p[2].Value = txtNgayKT.Text;
            DataTable dt = dataAccess.ExecuteQuery("PROC_THONGKE_DOANHTHU", p);

            StringBuilder table = new StringBuilder();
            if (dt != null && dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    table.Append("<tr class=\"row\">");
                    table.Append("<td class=\"qltn-column2\" style=\"text-align:center\" >" + dr[0] + "</td>");
                    table.Append("<td class=\"qltn-column2\">" + dr[1]+ "</td>");
                    table.Append("<td class=\"qltn-column2\" style=\"text-align:center\">" + dr[2] + "</td>");
                    table.Append("<td class=\"qltn-column2\" style=\"text-align:center\">" + dr[3] + "</td>");
                    table.Append("<td class=\"qltn-column2\">" + String.Format("{0:N0}", int.Parse(dr[4].ToString())) + " VNĐ" + "</td>");
                    table.Append("</tr>");
                }
                Panel1.Controls.Add(new Label { Text = table.ToString() });
            }
        }
    }
}