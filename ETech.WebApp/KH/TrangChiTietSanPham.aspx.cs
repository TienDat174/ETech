using ETech.WebApp.AppCode;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;

namespace ETech.WebApp.KH
{
    public partial class TrangChiTietSanPham : System.Web.UI.Page
    {
        DataAccess dataAccess = new DataAccess();
        protected void Page_Load(object sender, EventArgs e)
        {
            string idSP = Request.QueryString.Get("idSP");
            if (!IsPostBack)
            {
                HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);
                HttpContext.Current.Response.Cache.SetNoServerCaching();
                HttpContext.Current.Response.Cache.SetNoStore();
                dataAccess.MoKetNoiCSDL();
                SqlCommand cmd = new SqlCommand("PROC_VIEW_PRODUCT_DETAIL", dataAccess.getConnection());
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@IDSP",idSP);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt != null && dt.Rows.Count>0)
                {
                    imgSP.ImageUrl = "~/wwwroot/img/sp/" + dt.Rows[0]["HINHANH"].ToString();
                    lblTenSP.Text = dt.Rows[0]["TENSANPHAM"].ToString();
                    lblprice1.Text = String.Format("{0:N0}", dt.Rows[0]["DONGIA"]) + "VND";
                    lblprice2.Text = String.Format("{0:N0}", dt.Rows[0]["DONGIA"] )+ "VND";
                    lblNCC.Text = dt.Rows[0]["TENNHACUNGCAP"].ToString();
                    lblCT.Text = dt.Rows[0]["CHITIET"].ToString();
                    lblSL.Text = dt.Rows[0]["SOLUONGCONLAI"].ToString();
                }
                DataTable cart = new DataTable();
                if (Session["cart"] == null)
                {
                    //Nếu chưa có giỏ hàng, tạo giỏ hàng thông qua DataTable với 4 cột chính
                    cart.Columns.Add("ID");
                    cart.Columns.Add("HINH");
                    cart.Columns.Add("TENSP");
                    cart.Columns.Add("DONGIA");
                    cart.Columns.Add("SOLUONG");
                    cart.Columns.Add("NHACUNGCAPID");
                    cart.Columns.Add("TIENMUA");

                    //Sau khi tạo xong thì lưu lại vào session
                    Session["cart"] = cart;
                }
                else
                {
                    //Lấy thông tin giỏ hàng từ Session["cart"]
                    cart = Session["cart"] as DataTable;
                }

            }
        }

        protected void btnBuy_Click(object sender, EventArgs e)
        {
            string idSP = Request.QueryString.Get("idSP");
            dataAccess.MoKetNoiCSDL();
            int soLuongConLai = int.Parse(lblSL.Text);
            if (int.Parse(txtSL.Text) > soLuongConLai)
            {
                Response.Write($"<script>alert(\"Bạn chỉ được phép đặt {soLuongConLai} sản phẩm\")</script>");
            }
            else
            {
                Response.Redirect("ThemGioHangThanhCong.aspx?action=add&idSP=" + idSP + "&sl=" + txtSL.Text);
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("TrangChu.aspx");
        }
    }
}