using ETech.WebApp.AppCode;
using System;
using System.Data;
using System.Data.SqlClient;

namespace ETech.WebApp.KH
{
    public partial class SPTHEODANHMUC : System.Web.UI.Page
    {
        DataAccess dataAccess = new DataAccess();
        protected void Page_Load(object sender, EventArgs e)
        {
            int idDM = int.Parse(Request.QueryString.Get("idDM"));
            dataAccess.MoKetNoiCSDL();
            SqlCommand cmd = new SqlCommand("PROC_VIEWSP_THEODANHMUC", dataAccess.getConnection());
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@LOAISPID", idDM);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt != null && dt.Rows.Count > 0)
            {
                lblDM.Text = dt.Rows[0]["TENLOAI"].ToString();
                this.rptItem.DataSource = dt;
                this.rptItem.DataBind();

            }
            else
            {
                lblThongBao.Text = "SẢN PHẨM HIỆN KHÔNG CÓ";
                lblDM.Text = "Mời bạn xem các sản phẩm khác";
                dataAccess.MoKetNoiCSDL();
                SqlCommand cmd2 = new SqlCommand("PROC_VIEWSP_THEODANHMUC2", dataAccess.getConnection());
                cmd2.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da2 = new SqlDataAdapter(cmd2);
                DataTable dt2 = new DataTable();
                da2.Fill(dt2);
                if (dt2 != null && dt2.Rows.Count > 0)
                {
                    this.rptItem.DataSource = dt2;
                    this.rptItem.DataBind();

                }
            }
        }
    }
}