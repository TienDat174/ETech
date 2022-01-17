using ETech.WebApp.AppCode;
using System;
using System.Data;
using System.Data.SqlClient;

namespace ETech.WebApp.KH
{
    public partial class MailActive : System.Web.UI.Page
    {
        DataAccess dataAccess = new DataAccess();
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = Request.QueryString["emailadd"];
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlParameter[] p = {
                new SqlParameter("@EMAIL",SqlDbType.NVarChar,50)
            };
            p[0].Value = Request.QueryString["emailadd"].ToString();

            DataTable dt = dataAccess.ExecuteQuery("PROC_GET_EMAIL_KH", p);

            if (dt.Rows.Count > 0 && dt != null)
            {
                String maxacnhan;
                maxacnhan = dt.Rows[0]["MAXACNHAN"].ToString();
                if (maxacnhan == TextBox1.Text)
                {
                    ChangeStatus();
                    Response.Redirect("MailActiveDone.aspx");
                }
                else
                {
                    Label2.Text = "Sai mã xác nhận";
                }
            }
        }

        private void ChangeStatus()
        {
            DataAccess dataAccess = new DataAccess();
            dataAccess.MoKetNoiCSDL();
            SqlCommand cmd = new SqlCommand("PROC_CHANGE_STATUS_KH", dataAccess.getConnection());
            cmd.Parameters.AddWithValue("@EMAIL", Request.QueryString["emailadd"]);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.ExecuteNonQuery();
            dataAccess.DongKetNoiCSDL();
        }
    }
}