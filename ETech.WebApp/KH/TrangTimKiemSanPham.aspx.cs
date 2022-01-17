using ETech.WebApp.AppCode;
using System;
using System.Data;
using System.Data.SqlClient;

namespace ETech.WebApp.KH
{
    public partial class TrangTimKiemSanPham : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataAccess dataAccess = new DataAccess();
            string search = Request.QueryString.Get("search");

            dataAccess.MoKetNoiCSDL();
            SqlParameter[] p =
            {
                new SqlParameter("@SEARCH",SqlDbType.NVarChar)
            };
            p[0].Value = search;
            DataTable dt = dataAccess.ExecuteQuery("PROC_VIEW_SP_SEARCH", p);
            if (dt != null && dt.Rows.Count > 0)
            {
                this.rpt2.DataSource = dt;
                this.rpt2.DataBind();
            }

        }
    }
}