using ETech.WebApp.AppCode;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ETech.WebApp.KH
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        DataAccess dataAccess = new DataAccess();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["userKH"] != null)
            {
                HyperLink1.NavigateUrl = "QuanLyThongTin.aspx?username=" + Session["userKH"].ToString();
                HyperLink2.NavigateUrl = "TrangDoiMatKhau.aspx?username=" + Session["userKH"].ToString();
                lbTaiKhoan.Text = Session["userKH"].ToString();
                panelDangNhap.Style.Add("display", "none");
            }
            if(Session["userKH"] == null)
            {
                panelUser.Style.Add("display", "none");
            }

            if(Session["cart"] != null)
            {
                DataTable cart = Session["cart"] as DataTable;
                lbSL.Text = cart.Rows.Count.ToString();
            }

            //Đổ danh mục sản phẩm
            SqlParameter[] p = { };
            DataTable dt = dataAccess.ExecuteQuery("PROC_GET_DANHMUC_SP", p);

            if(dt != null && dt.Rows.Count > 0)
            {
                this.Repeater1.DataSource = dt;
                this.Repeater1.DataBind();
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("TrangTimKiemSanPham.aspx?search=" + txtsr.Text.Trim());
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Session["userKH"] = null;
            Session.Clear();
            Response.Cookies.Clear();
            Response.Cache.SetNoStore();
            Response.CacheControl = "no-cache";
            Response.Redirect("TrangDangKyDangNhapKH.aspx");
        }
    }
}