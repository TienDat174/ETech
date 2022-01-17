using ETech.WebApp.AppCode;
using System;
using System.Data;
using System.Data.SqlClient;


namespace ETech.WebApp.NCC
{
    public partial class MailActive : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = Request.QueryString["emailadd"];
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            DataAccess dataAccess = new DataAccess();
            dataAccess.MoKetNoiCSDL();
            SqlCommand cmd = new SqlCommand("PROC_GET_EMAIL_NCC", dataAccess.getConnection());
            cmd.Parameters.AddWithValue("@EMAIL", Request.QueryString["emailadd"]);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            cmd.ExecuteNonQuery();
            dataAccess.DongKetNoiCSDL();

            //Lay ten nguoi dung
            //String sqlTen = "SELECT TENDANGNHAP FROM TAIKHOAN WHERE TENDANGNHAP=" + ;

            if (ds.Tables[0].Rows.Count > 0)
            {
                String maxacnhan;
                maxacnhan = ds.Tables[0].Rows[0]["MAXACNHAN"].ToString();
                if (maxacnhan == TextBox1.Text)
                {
                    changestatus();
                    Response.Redirect("MailActiveDone.aspx");
                }
                else
                {
                    Label2.Text = "Sai mã xác nhận";
                }
            }

        }
        private void changestatus()
        {
            //Lam lai ham changestatus
            DataAccess dataAccess = new DataAccess();
            dataAccess.MoKetNoiCSDL();
            SqlCommand cmd = new SqlCommand("PROC_CHANGE_STATUS_NCC", dataAccess.getConnection());
            cmd.Parameters.AddWithValue("@EMAIL", Request.QueryString["emailadd"]);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.ExecuteNonQuery();
            dataAccess.DongKetNoiCSDL();
        }
    }
}