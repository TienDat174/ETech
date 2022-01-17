using ETech.WebApp.AppCode;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ETech.WebApp.ADMIN
{
    public partial class QuanLyDuyetDVVC : System.Web.UI.Page
    {
        DataAccess dataAccess = new DataAccess();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dataAccess.MoKetNoiCSDL();
                string idDVVC = Request.QueryString.Get("idDVVC").ToString();
                SqlCommand cmd = new SqlCommand("PROC_VIEW_DVVC_CHODUYET2", dataAccess.getConnection());
                cmd.Parameters.AddWithValue("@ID",idDVVC);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {

                    lblTen.Text = dr.GetValue(0).ToString();
                }
            }
        }

        protected void btnDuyet_Click(object sender, EventArgs e)
        {
            string idDVVC = Request.QueryString.Get("idDVVC").ToString();
            SqlParameter[] p = {
                new SqlParameter("@ID",SqlDbType.Int)
            };
            p[0].Value = int.Parse(idDVVC);

            int i = dataAccess.ExecuteNonQuery("PROC_DUYET_DONVIVANCHUYEN", p);

            if (i > 0)
            {
                Response.Redirect("QuanLyDVVC.aspx");
            }
        }
        protected void btnHuy_Click(object sender, EventArgs e)
        {
            Response.Redirect("QuanLyDVVC.aspx");
        } 
    }
}