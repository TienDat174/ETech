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
    public partial class QuanLyDonHang : System.Web.UI.Page
    {
        DataAccess dataAccess = new DataAccess();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["userNCC"] == null)
            {
                Response.Redirect("DangKyDangNhapNCC.aspx");
            }
            
                BANG1();
                BANG2();
                BANG3();
                BANG4();          
        }
        void BANG1()
        {
            dataAccess.MoKetNoiCSDL();
            int id = int.Parse(Session["id"].ToString());
            SqlParameter[] p = new SqlParameter[] {
                    new SqlParameter("@NHACUNGCAPID", SqlDbType.Int)
                };
            p[0].Value = id;
            DataTable dt = dataAccess.ExecuteQuery("PROC_DH_CHODUYET", p);
            StringBuilder table = new StringBuilder();
            if (dt != null && dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    table.Append("<tr class=\"row\">");
                    table.Append("<td class=\"qldm-column2\" style=\"text-align:center;\">" + dr[0] + "</td>");
                    table.Append("<td class=\"qldm-column2\">" + dr[1] + "</td>");
                    table.Append("<td class=\"qldm-column2\">" + dr[3] + "</td>");
                    table.Append("<td class=\"qldm-column2\">" + dr[4] + "</td>");
                    table.Append("<td class=\"qldm-column2\">" + dr[2] + "</td>");
                    table.Append("<td class=\"qldm-column2\" style=\"text-align:center;\">");
                    table.Append("<a href=\"DuyetDonHang.aspx?idDH=" + dr[0] + "\"  class=\"cell_xem\">Xem chi tiết</a>");
                    table.Append("</td>");
                    table.Append("</tr>");
                }
                Panel1.Controls.Add(new Label { Text = table.ToString() }); ;
            }
        }
        void BANG2()
        {
            dataAccess.MoKetNoiCSDL();
            int id = int.Parse(Session["id"].ToString());
            SqlParameter[] p = new SqlParameter[] {
                    new SqlParameter("@NHACUNGCAPID", SqlDbType.Int)
                };
            p[0].Value = id;
            DataTable dt = dataAccess.ExecuteQuery("PROC_DH_VANCHUYEN", p);
            StringBuilder table = new StringBuilder();
            if (dt != null && dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    table.Append("<tr class=\"row\">");
                    table.Append("<td class=\"qldm-column2\" style=\"text-align:center;\">" + dr[0] + "</td>");
                    table.Append("<td class=\"qldm-column2\">" + dr[1] + "</td>");
                    table.Append("<td class=\"qldm-column2\">" + dr[3] + "</td>");
                    table.Append("<td class=\"qldm-column2\">" + dr[4] + "</td>");
                    table.Append("<td class=\"qldm-column2\">" + dr[2] + "</td>");
                    table.Append("<td class=\"qldm-column2\" style=\"text-align:center;\">");
                    table.Append("<a href=\"Xacnhanthanhctoan.aspx?idDH=" + dr[0] + "\"  class=\"cell_xem\">Xem chi tiết</a>");
                    table.Append("</td>");
                    table.Append("</tr>");
                }
                Panel2.Controls.Add(new Label { Text = table.ToString() }); ;
            }
        }
        void BANG3()
        {
            dataAccess.MoKetNoiCSDL();
            int id = int.Parse(Session["id"].ToString());
            SqlParameter[] p = new SqlParameter[] {
                    new SqlParameter("@NHACUNGCAPID", SqlDbType.Int)
                };
            p[0].Value = id;
            DataTable dt = dataAccess.ExecuteQuery("PROC_DH_THANHTOAN", p);
            StringBuilder table = new StringBuilder();
            if (dt != null && dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    table.Append("<tr class=\"row\">");
                    table.Append("<td class=\"qldm-column2\" style=\"text-align:center;\">" + dr[0] + "</td>");
                    table.Append("<td class=\"qldm-column2\">" + dr[1] + "</td>");
                    table.Append("<td class=\"qldm-column2\">" + dr[3] + "</td>");
                    table.Append("<td class=\"qldm-column2\">" + dr[4] + "</td>");
                    table.Append("<td class=\"qldm-column2\">" + dr[2] + "</td>");
                    table.Append("</tr>");
                }
                Panel3.Controls.Add(new Label { Text = table.ToString() }); ;
            }
        }
        void BANG4()
        {
            dataAccess.MoKetNoiCSDL();
            int id = int.Parse(Session["id"].ToString());
            SqlParameter[] p = new SqlParameter[] {
                    new SqlParameter("@NHACUNGCAPID", SqlDbType.Int)
                };
            p[0].Value = id;
            DataTable dt = dataAccess.ExecuteQuery("PROC_DH_DAHUY", p);
            StringBuilder table = new StringBuilder();
            if (dt != null && dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    table.Append("<tr class=\"row\">");
                    table.Append("<td class=\"qldm-column2\" style=\"text-align:center;\">" + dr[0] + "</td>");
                    table.Append("<td class=\"qldm-column2\">" + dr[1] + "</td>");
                    table.Append("<td class=\"qldm-column2\">" + dr[3] + "</td>");
                    table.Append("<td class=\"qldm-column2\">" + dr[4] + "</td>");
                    table.Append("<td class=\"qldm-column2\">" + dr[2] + "</td>");
                    table.Append("</tr>");
                }
                Panel4.Controls.Add(new Label { Text = table.ToString() }); ;
            }
        }
    }
}