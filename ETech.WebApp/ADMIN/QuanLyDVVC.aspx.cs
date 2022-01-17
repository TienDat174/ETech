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

namespace ETech.WebApp.ADMIN
{
    public partial class QuanLyDVVC : System.Web.UI.Page
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
                BANG1();
                BANG2();
            }
        }
        void BANG1()
        {
            dataAccess.MoKetNoiCSDL();

            SqlParameter[] p = { };
            DataTable dt = dataAccess.ExecuteQuery("PROC_VIEW_DVVC_CHODUYET", p);

            StringBuilder table = new StringBuilder();
            if (dt != null && dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    table.Append("<tr class=\"\">");
                    table.Append("<td class=\"qldm-column2\" style=\"text-align:center;\">" + dr[0] + "</td>");
                    table.Append("<td class=\"qldm-column2\">" + dr[2] + "</td>");
                    table.Append("<td class=\"qldm-column2\">" + dr[1] + "</td>");
                    table.Append("<td class=\"qldm-column2\" style=\"text-align:center;\">");
                    table.Append("<a href=\"QuanLyDuyetDVVC.aspx?idDVVC=" + dr[0] + "\" class=\"cell_xem\">Duyệt</a>");
                    table.Append("</td>");
                    table.Append("</tr>");
                }
                Panel1.Controls.Add(new Label { Text = table.ToString() });
                //Panel1.Controls.Add(new Label { Text = table.ToString() });
            }
        }
        void BANG2()
        {
            dataAccess.MoKetNoiCSDL();

            SqlParameter[] p = { };
            DataTable dt = dataAccess.ExecuteQuery("PROC_VIEW_DONVIVANCHUYEN", p);

            StringBuilder table = new StringBuilder();
            if (dt != null && dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    table.Append("<tr class=\"\">");
                    table.Append("<td class=\"qldm-column2\" style=\"text-align:center;\">" + dr[0] + "</td>");
                    table.Append("<td class=\"qldm-column2\">" + dr[1] + "</td>");
                    table.Append("<td class=\"qldm-column2\" style=\"text-align:center;\">" + String.Format("{0:N0}", int.Parse(dr[2].ToString())) + " đ"  + "</td>");
                    table.Append("<td class=\"qldm-column2\" style=\"text-align:center;\">");
                    table.Append("<a href=\"QuanLyCapNhatDVVC.aspx?idDVVC=" + dr[0] + "\" class=\"cell_xem\">Cập nhật</a>" + "|");
                    table.Append("<a href=\"QuanLyXoaDVVC.aspx?idDVVC=" + dr[0] + "\" class=\"cell_xem\">Xóa</a>");
                    table.Append("</td>");
                    table.Append("</tr>");
                }
                Panel2.Controls.Add(new Label { Text = table.ToString() });
                //Panel1.Controls.Add(new Label { Text = table.ToString() });
            }
        }
    }
}