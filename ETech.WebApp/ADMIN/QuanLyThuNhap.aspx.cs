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
    public partial class QuanLyThuNhap : System.Web.UI.Page
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
                try
                {
                    SqlParameter[] p = { };
                    DataTable dt = dataAccess.ExecuteQuery("PROC_GET_NHACUNGCAP", p);

                    if (dt != null && dt.Rows.Count > 0)
                    {
                        this.ddNCC.DataSource = dt;
                        this.ddNCC.DataTextField = "TENNHACUNGCAP";
                        this.ddNCC.DataValueField = "NHACUNGCAPID";
                        this.ddNCC.DataBind();
                    }
                }
                catch
                {

                }
            }
        }
        protected void btnTim_Click(object sender, EventArgs e)
        {
            SqlParameter[] p = {
               new SqlParameter("@NHACUNGCAPID", SqlDbType.Int),
               new SqlParameter("@NGAYBATDAU", SqlDbType.NVarChar,50),
                new SqlParameter("@NGAYKETTHUC", SqlDbType.NVarChar,50),

            };
            p[0].Value = ddNCC.SelectedValue;
            p[1].Value = txtNgayBD.Text;
            p[2].Value = txtNgayKT.Text;
            DataTable dt = dataAccess.ExecuteQuery("PROC_THONGKE_THUNHAP", p);

            StringBuilder table = new StringBuilder();
            if (dt != null && dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    table.Append("<tr class=\"\">");
                    table.Append("<td class=\"qltn-column2\">" + dr[0] + "</td>");
                    table.Append("<td class=\"qltn-column2\">" + String.Format("{0:N0}", int.Parse(dr[1].ToString())) + " đ" + "</td>");
                    table.Append("<td class=\"qltn-column2\">" + String.Format("{0:N0}", int.Parse(dr[2].ToString())) + " đ"  + "</td>");
                    table.Append("</tr>");
                }
                Panel1.Controls.Add(new Label { Text = table.ToString() });
            }
        }
    }
}