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
    public partial class YeuCauDanhMuc : System.Web.UI.Page
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
            if (!IsPostBack)
            {
                try
                {
                    SqlParameter[] p = { };
                    DataTable dt = dataAccess.ExecuteQuery("PROC_VIEW_LOAISP", p);

                    if (dt != null && dt.Rows.Count > 0)
                    {
                        this.ddDM.DataSource = dt;
                        this.ddDM.DataTextField = "TENLOAI";
                        this.ddDM.DataValueField = "LOAISPID";
                        this.ddDM.DataBind();
                    }
                }
                catch
                {

                }
            }
            void BANG3()
            {
                dataAccess.MoKetNoiCSDL();

                SqlParameter[] p = { };
                DataTable dt = dataAccess.ExecuteQuery("PROC_VIEW_LOAISP", p);

                StringBuilder table = new StringBuilder();
                if (dt != null && dt.Rows.Count > 0)
                {
                    foreach (DataRow dr in dt.Rows)
                    {
                        table.Append("<tr class=\"row\">");
                        table.Append("<td class=\"qldm-column2\" style=\"text-align:center;\">" + dr[0] + "</td>");
                        table.Append("<td class=\"qldm-column2\">" + dr[1] + "</td>");
                        table.Append("</tr>");
                    }
                    Panel3.Controls.Add(new Label { Text = table.ToString() });
                }
            }
            void BANG2()
            {
                dataAccess.MoKetNoiCSDL();
                int id = int.Parse(Session["id"].ToString());
                SqlParameter[] p = {
                 new SqlParameter("@NHACUNGCAPID", SqlDbType.Int)
            };
                p[0].Value = id;
                DataTable dt = dataAccess.ExecuteQuery("PROC_VIEW_DM_CHODUYET", p);

                StringBuilder table = new StringBuilder();
                if (dt != null && dt.Rows.Count > 0)
                {
                    foreach (DataRow dr in dt.Rows)
                    {
                        table.Append("<tr class=\"row\">");
                        table.Append("<td class=\"qldm-column2\" style=\"text-align:center;\">" + dr[0] + "</td>");
                        table.Append("<td class=\"qldm-column2\">" + dr[1] + "</td>");
                        table.Append("<td class=\"qldm-column2\">" + dr[2] + "</td>");
                        table.Append("</tr>");
                    }
                    Panel2.Controls.Add(new Label { Text = table.ToString() }); ;
                }
            }
            void BANG1()
            {
                dataAccess.MoKetNoiCSDL();
                int id = int.Parse(Session["id"].ToString());
                SqlParameter[] p = {
                 new SqlParameter("@NHACUNGCAPID", SqlDbType.Int)
            };
                p[0].Value = id;
                DataTable dt = dataAccess.ExecuteQuery("PROC_VIEWDM_DADUYET", p);

                StringBuilder table = new StringBuilder();
                if (dt != null && dt.Rows.Count > 0)
                {
                    foreach (DataRow dr in dt.Rows)
                    {
                        table.Append("<tr class=\"row\">");
                        table.Append("<td class=\"qldm-column2\" style=\"text-align:center;\">" + dr[0] + "</td>");
                        table.Append("<td class=\"qldm-column2\">" + dr[1] + "</td>");
                        table.Append("<td class=\"qldm-column2\" style=\"text-align:center;\">");
                        table.Append("<a href=\"QuanLyXoaDM.aspx?idDM=" + dr[0] + "\" class=\"\" style=\"color:#f15f1b\">Xóa</a>");
                        table.Append("</td>");
                        table.Append("</tr>");
                    }
                    Panel1.Controls.Add(new Label { Text = table.ToString() });
                }
            }

        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            dataAccess.MoKetNoiCSDL();
            int id = int.Parse(Session["id"].ToString());
            SqlCommand cmd = new SqlCommand("PROC_GOIDUYET_DM", dataAccess.getConnection());
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@NHACUNGCAPID", id);
            cmd.Parameters.AddWithValue("@LOAISPID", ddDM.SelectedValue);
            int a = cmd.ExecuteNonQuery();
            if (a > 0)
            {
                Response.Redirect("YeuCauDanhMuc.aspx");
            }
            else
            {
                lblThongBao.Text = "Danh mục không có hoặc đã có và chờ duyệt";

            }
        }
    }
}