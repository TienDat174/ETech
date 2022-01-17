using ETech.WebApp.AppCode;
using System;
using System.Data;
using System.Data.SqlClient;

namespace ETech.WebApp.KH
{
    public partial class ChiTietDonHang : System.Web.UI.Page
    {
        DataAccess dataAccess = new DataAccess();
        protected void Page_Load(object sender, EventArgs e)
        {
            int idDH = int.Parse(Request.QueryString.Get("idDH"));
            if(!IsPostBack)
            {
                dataAccess.MoKetNoiCSDL();
                SqlCommand cmd = new SqlCommand("PROC_GET_VIEW_CTDONHANG", dataAccess.getConnection());
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@IDDONHANG", idDH);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt != null && dt.Rows.Count > 0)
                {
                   
                    this.rptCTDONHANG.DataSource = dt;
                    this.rptCTDONHANG.DataBind();

                }
            }    
        }
    }
}