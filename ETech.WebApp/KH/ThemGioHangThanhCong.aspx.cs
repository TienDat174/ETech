using ETech.WebApp.AppCode;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;

namespace ETech.WebApp.KH
{
    public partial class ThemGioHangThanhCong : System.Web.UI.Page
    {
        DataAccess dataAccess = new DataAccess();
        protected void Page_Load(object sender, EventArgs e)
        {
            string idSP = Request.QueryString.Get("idSP");
            string slSP = Request.QueryString.Get("sl");

            if (!Page.IsPostBack)
            {

                
                dataAccess.MoKetNoiCSDL();

                dataAccess.MoKetNoiCSDL();
                SqlCommand cmd = new SqlCommand("PROC_VIEWSP_THEODANHMUC2", dataAccess.getConnection());
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt != null && dt.Rows.Count > 0)
                {
                    this.rptItem.DataSource = dt;
                    this.rptItem.DataBind();

                }
                //mo ket noi du lieu (goi class DataAccess, xem file dataAccess de hieu, cai nay giong java)
                HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);
                HttpContext.Current.Response.Cache.SetNoServerCaching();
                HttpContext.Current.Response.Cache.SetNoStore();
                SqlCommand cmd2 = new SqlCommand("PROC_VIEW_PRODUCT_DETAIL", dataAccess.getConnection());
                cmd2.CommandType = CommandType.StoredProcedure;
                cmd2.Parameters.AddWithValue("@IDSP", idSP);

                SqlDataAdapter da2 = new SqlDataAdapter(cmd2);
                DataTable dt2 = new DataTable();
                da2.Fill(dt2);

                //dat du lieu cho cac lable da tao o trang aspx

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
                if (!String.IsNullOrEmpty(Request.QueryString["action"]))
                {
                    if (Request.QueryString["action"] == "add")
                    {

                        int soLuongConLai = int.Parse(dt2.Rows[0]["SOLUONGCONLAI"].ToString());
                        int soLuongDatHang = int.Parse(slSP);


                        if (soLuongDatHang > soLuongConLai)
                        {
                            Response.Write($"<script>alert(\"Bạn chỉ được phép đặt {soLuongConLai} sản phẩm\")</script>");
                        }
                        else
                        {
                            bool isExisted = false;
                            foreach (DataRow dr in cart.Rows)
                            {
                                if (dr["ID"].ToString() == idSP)
                                {
                                    dr["SOLUONG"] = int.Parse(dr["SOLUONG"].ToString()) + soLuongDatHang;
                                    isExisted = true;
                                    break;
                                }
                            }
                            if (!isExisted)//Chưa có sản phẩm trong giỏ hàng
                            {
                                DataRow dr = cart.NewRow();
                                dr["ID"] = dt2.Rows[0]["SANPHAMID"].ToString();
                                dr["HINH"] = dt2.Rows[0]["HINHANH"].ToString();
                                dr["TENSP"] = dt2.Rows[0]["TENSANPHAM"].ToString();
                                dr["DONGIA"] = dt2.Rows[0]["DONGIA"].ToString();
                                dr["NHACUNGCAPID"] = dt2.Rows[0]["NHACUNGCAPID"].ToString();
                                dr["SOLUONG"] = soLuongDatHang;
                                dr["TIENMUA"] = int.Parse(dt2.Rows[0]["DONGIA"].ToString()) * soLuongDatHang;

                                cart.Rows.Add(dr);
                            }
                            //Lưu lại thông tin giỏ hàng mới nhất vào session["Cart"]
                            Session["cart"] = cart;
                        }
                    }

                    //dong ket noi
                    dataAccess.DongKetNoiCSDL();
                }
            }
        }
    }
}