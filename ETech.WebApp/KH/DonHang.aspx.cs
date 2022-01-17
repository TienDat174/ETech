using ETech.WebApp.AppCode;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Web.UI.WebControls;

namespace ETech.WebApp.KH
{
    public partial class DonHang : System.Web.UI.Page
    {
        DataAccess dataAccess = new DataAccess();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["userKH"] != null)
                {
                    panelNotLogin.Style.Add("display", "none");


                    string userKH = Session["userKH"].ToString();

                    SqlParameter[] p =
                    {
                        new SqlParameter("@TENDANGNHAP",SqlDbType.NVarChar,50)
                    };
                    p[0].Value = userKH;

                    DataTable dtDH = dataAccess.ExecuteQuery("PROC_GETINFO_DONHANG_BYTENDANGNHAP", p);

                    StringBuilder table = new StringBuilder();

                    if (dtDH != null && dtDH.Rows.Count > 0)
                    {
                        foreach (DataRow dr in dtDH.Rows)
                        {
                            int status = int.Parse(dr["TRANGTHAI"].ToString());


                            table.Append("<tr>");

                            table.Append("<td>" + dr["DONHANGID"] + "</td>");
                            table.Append("<td>" + dr["NGAY"] + "</td>");
                            table.Append("<td>" + dr["HIENTHI_TRANGTHAI"] + "</td>");
                            table.Append("<td>" + dr["TONGSL"] + "</td>");
                            table.Append("<td>" + dr["TONGTIEN"] + "</td>");

                            if (status == 0)
                            {
                                table.Append("<td><i class=\"fas fa-times-circle x-icon\"></i></td>");
                            }
                            if (status == 1 || status == 2 || status == 3)
                            {
                                table.Append("<td class=\"td-btn-dh\"><a href=\"/KH/ChiTietDonHang.aspx?idDH=" + dr["DONHANGID"] + "\"> Xem chi tiết</a></td>");
                            }
                            table.Append("</tr>");
                        }
                        Panel1.Controls.Add(new Label { Text = table.ToString() });
                    }
                }
                if (Session["userKH"] == null)
                {
                    panelDonHang.Style.Add("display", "none");
                }
            }
        }
    }
}