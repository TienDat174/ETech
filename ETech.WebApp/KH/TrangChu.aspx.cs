using ETech.WebApp.AppCode;
using System;
using System.Data;
using System.Data.SqlClient;

namespace ETech.WebApp.KH
{
    public partial class TrangChu : System.Web.UI.Page
    {
        DataAccess dataAccess = new DataAccess();
        protected void Page_Load(object sender, EventArgs e)
        {
            //Đổ sản phẩm vào trang chủ

            SqlParameter[] p = { };
            DataTable tbAllSP = dataAccess.ExecuteQuery("PROC_GET_SP_KM", p);

            if (tbAllSP != null && tbAllSP.Rows.Count > 0)
            {
                this.repeaterItem.DataSource = tbAllSP;
                this.repeaterItem.DataBind();

            }

            //Đổ sản phẩm bán chạy
            SqlParameter[] p2 = { };
            DataTable tbBanChay = dataAccess.ExecuteQuery("PROC_GET_SP_BANCHAY", p2);

            if (tbBanChay != null && tbBanChay.Rows.Count > 0)
            {
                this.repeater1.DataSource = tbBanChay;
                this.repeater1.DataBind();
            }

            //Đổ sản phẩm máy tính
            SqlParameter[] p3 = { };
            DataTable tbMayTinh = dataAccess.ExecuteQuery("PROC_GET_SP_MAYTINH", p3);

            if (tbMayTinh != null && tbMayTinh.Rows.Count > 0)
            {
                this.repeater2.DataSource = tbMayTinh;
                this.repeater2.DataBind();
            }

            //Đổ sản phẩm điện thoại
            SqlParameter[] p4 = { };
            DataTable tbDienThoai = dataAccess.ExecuteQuery("PROC_GET_SP_MANHINH", p4);

            if (tbDienThoai != null && tbDienThoai.Rows.Count > 0)
            {
                this.repeater3.DataSource = tbDienThoai;
                this.repeater3.DataBind();
            }
        }
    }
}