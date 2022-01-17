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
    public partial class YeuCauVanChuyen : System.Web.UI.Page
    {
        DataAccess dataAccess = new DataAccess();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userNCC"] == null)
            {
                Response.Redirect("DangKyDangNhapNCC.aspx");
            }
            BANG1();
            if (!IsPostBack)
            {
                try
                {
                    SqlParameter[] p = { };
                    DataTable dt = dataAccess.ExecuteQuery("PROC_VIEW_DVVC", p);

                    if (dt != null && dt.Rows.Count > 0)
                    {
                        this.ddDVVC.DataSource = dt;
                        this.ddDVVC.DataTextField = "TENDONVIVANCHUYEN";
                        this.ddDVVC.DataValueField = "DONVIVANCHUYENID";
                        this.ddDVVC.DataBind();
                    }
                }
                catch
                {

                }
            }
            void BANG1()
            {
                dataAccess.MoKetNoiCSDL();
                dataAccess.MoKetNoiCSDL();
                int id = int.Parse(Session["id"].ToString());
                SqlParameter[] p = {
                 new SqlParameter("@ID", SqlDbType.Int)
            };
                p[0].Value = id;
                
                DataTable dt = dataAccess.ExecuteQuery("PROC_VIEWDVVC_CHODUYET_NCC", p);

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
                        table.Append("</tr>");
                    }
                    Panel1.Controls.Add(new Label { Text = table.ToString() });
                }
            }

        }

        protected void btnGoi_Click(object sender, EventArgs e)
        {
            dataAccess.MoKetNoiCSDL();
            int id = int.Parse(Session["id"].ToString());

            SqlCommand cmd = new SqlCommand("PROC_GOIDUYET_DVVC", dataAccess.getConnection());
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@ID", id);
            cmd.Parameters.AddWithValue("@IDDVVC", ddDVVC.SelectedValue);
            int a = cmd.ExecuteNonQuery();
            if (a > 0)
            {

                Response.Redirect("YeuCauVanChuyen.aspx");
            }
            else
            {
                lblThongBao.Text = "Đơn vị vận chuyển không có hoặc đã có và chờ duyệt";

            }
        }
    }
}