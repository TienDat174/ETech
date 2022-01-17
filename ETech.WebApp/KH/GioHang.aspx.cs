using ETech.WebApp.AppCode;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Web;
using System.Web.UI.WebControls;
using WebApplication2;

namespace ETech.WebApp.KH
{
    public partial class GioHang : System.Web.UI.Page
    {
        DataAccess dataAccess = new DataAccess();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);
                HttpContext.Current.Response.Cache.SetNoServerCaching();
                HttpContext.Current.Response.Cache.SetNoStore();

                if (Session["cart"] != null)
                {
                    //Code ẩn nút Login 
                    //...

                    DataTable cart = Session["cart"] as DataTable;

                    //Hiển thị dữ liệu khách hàng
                    if (Session["userKH"] != null)
                    {
                        //Code hiển thị nút mua hàng khi khách hàng đã đăng nhập
                        //...
                        Button1.Style.Add("display", "none");

                        String usernameKH = Session["userKH"].ToString();

                        SqlParameter[] p =
                        {
                            new SqlParameter("@USERNAME",SqlDbType.NChar)
                        };
                        p[0].Value = usernameKH;

                        DataTable dt = dataAccess.ExecuteQuery("PROC_GETINFO_KH_BYUSERNAME", p);

                        if (dt != null && dt.Rows.Count > 0)
                        {
                            txtTen.Text = dt.Rows[0]["HOTEN"].ToString();
                            txtDiaChi.Text = dt.Rows[0]["DIACHI"].ToString();
                            txtSDT.Text = dt.Rows[0]["SDT"].ToString();
                            txtEmail.Text = dt.Rows[0]["EMAIL"].ToString();
                        }
                    }
                    else
                    {
                        btnThanhToan.Style.Add("display", "none");
                    }
                    //Tính tiền khách hàng khi chưa đăng nhập
                    if (cart != null && cart.Rows.Count > 0)
                    {
                        this.rptSPham.DataSource = cart;
                        this.rptSPham.DataBind();

                        int  tongTienTatCaSP = 0;

                        StringBuilder sb = new StringBuilder();

                        foreach (DataRow dr in cart.Rows)
                        {
                            //Tính tổng tiền tất cả đơn hàng             
                            tongTienTatCaSP =  tongTienTatCaSP + int.Parse(dr["TIENMUA"].ToString());
                            lbTongTatCaSP.Text = String.Format("{0:n0}", int.Parse(tongTienTatCaSP.ToString()));

                        }
                    }
                    //Tính tiền khi đã đăng nhập
                    else
                    {
                        if (cart != null && cart.Rows.Count > 0)
                        {
                            this.rptSPham.DataSource = cart;
                            this.rptSPham.DataBind();

                            int tongTienTatCaSP = 0;

                            foreach (DataRow dr in cart.Rows)
                            {
                                //Tính tổng tiền tất cả đơn hàng             
                                tongTienTatCaSP = tongTienTatCaSP + int.Parse(dr["TIENMUA"].ToString());
                                lbTongTatCaSP.Text = String.Format("{0:n0}", int.Parse(tongTienTatCaSP.ToString()));

                            }
                        }
                    }
                }

                //Nếu không có sản phẩm trong giỏ hàng
                else
                {
                    //Code ẩn table và show một div thông báo "Mời bạn thêm sản phẩm"
                    //...
                    pnHaveCart.Style.Add("display", "none");
                    Label1.Style.Add("display", "block");
                    
                }
            }
        }

        protected void btnDelete_Click(object sender, CommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);

            DataTable cart = Session["cart"] as DataTable;

            cart.Rows[index].Delete();
            cart.AcceptChanges();
            if (cart != null && cart.Rows.Count > 0)
            {
                this.rptSPham.DataSource = cart;
                this.rptSPham.DataBind();

            }
            Response.Redirect("GioHang.aspx");
            
     

        }

        protected void btnContinues_Click(object sender, EventArgs e)
        {
            Response.Redirect("TrangChu.aspx");

        }

        protected void btnThanhToan_Click(object sender, EventArgs e)
        {
            string phuongthucthanhtoan = "";
            if (rbOnepay.Checked)
            {
                phuongthucthanhtoan = "Onepay";
            }
            else if (rbOnepayQuocTe.Checked)
            {
                phuongthucthanhtoan = "OnepayQuocTe";
            }
            else if (rbTruyenthong.Checked)
            {
                phuongthucthanhtoan = "Thanhtoantruyenthong";
            }
            if (Session["userKH"] != null)
            {
                //Lấy thông tin khách hàng
                string userKH = Session["userKH"].ToString();
                DataAccess dataAccess = new DataAccess();
                dataAccess.MoKetNoiCSDL();
                string sqlKH = "select * from TAIKHOAN where TENDANGNHAP = N'" + userKH + "'";
                DataTable dtKH = dataAccess.LayBangDuLieu(sqlKH);


                //Insert vào đơn hàng
                SqlCommand cmdDonHang = new SqlCommand("PROC_INSERT_DONHANG", dataAccess.getConnection());

                cmdDonHang.CommandType = CommandType.StoredProcedure;

                cmdDonHang.Parameters.AddWithValue("@TAIKHOANID", int.Parse(dtKH.Rows[0]["TAIKHOANID"].ToString()));
                cmdDonHang.Parameters.AddWithValue("@DIACHI", txtDiaChi.Text);
                cmdDonHang.Parameters.AddWithValue("@SDT", txtSDT.Text);
                cmdDonHang.Parameters.AddWithValue("@EMAIL", txtEmail.Text);
                cmdDonHang.Parameters.AddWithValue("@TRANGTHAI",1);


                cmdDonHang.ExecuteNonQuery();

                if (Session["cart"] != null)
                {
                    DataTable cart1 = Session["cart"] as DataTable;
                    int tongTienTatCaSP = 0;
                    string mathanhtoantructuyen = DateTime.Now.Ticks.ToString();
                    if (cart1 != null && cart1.Rows.Count > 0)
                    {
                        foreach (DataRow dr in cart1.Rows)
                        {
                            using (SqlCommand cmdCTDonHang = new SqlCommand("PROC_INSERT_CHITIETDONHANG"))
                            {
                                cmdCTDonHang.CommandType = CommandType.StoredProcedure;
                                cmdCTDonHang.Parameters.AddWithValue("@SANPHAMID", dr["ID"]);
                                cmdCTDonHang.Parameters.AddWithValue("@SOLUONG", dr["SOLUONG"]);
                                cmdCTDonHang.Parameters.AddWithValue("@DONGIA", dr["DONGIA"]);
                                cmdCTDonHang.Parameters.AddWithValue("@NHACUNGCAPID", dr["NHACUNGCAPID"]);
                                cmdCTDonHang.Parameters.AddWithValue("@PHUONGTHUCTHANHTOAN", phuongthucthanhtoan);
                                cmdCTDonHang.Parameters.AddWithValue("@MATHANHTOANTRUCTUYEN", mathanhtoantructuyen);
                                cmdCTDonHang.Parameters.AddWithValue("@TRANGTHAI", 1);
                                cmdCTDonHang.Connection = dataAccess.getConnection();
                                if (dataAccess.getConnection().State == ConnectionState.Closed)
                                    dataAccess.getConnection().Open();
                                cmdCTDonHang.ExecuteNonQuery();
                                dataAccess.DongKetNoiCSDL();
                            }
                            tongTienTatCaSP = tongTienTatCaSP + int.Parse(dr["TIENMUA"].ToString());
                        }
                    }

                    string ketQua = "";

                    switch (phuongthucthanhtoan)
                    {
                        case "Thanhtoantruyenthong":
                            Response.Redirect("DonHang.aspx");
                            break;
                        case "Onepay":
                            #region 
                            string SECURE_SECRET = OnepayCode.SECURE_SECRET;//Hòa: cần thanh bằng mã thật cấu hình trong app_code
                                                                            // Khoi tao lop thu vien va gan gia tri cac tham so gui sang cong thanh toan
                            VPCRequest conn = new VPCRequest(OnepayCode.VPCRequest);//Hòa: Cần thay bằng cổng thật cấu hình trong app_code
                            conn.SetSecureSecret(SECURE_SECRET);
                            // Add the Digital Order Fields for the functionality you wish to use
                            // Core Transaction Fields
                            conn.AddDigitalOrderField("Title", "onepay paygate");
                            conn.AddDigitalOrderField("vpc_Locale", "vn");//Chon ngon ngu hien thi tren cong thanh toan (vn/en)
                            conn.AddDigitalOrderField("vpc_Version", "2");
                            conn.AddDigitalOrderField("vpc_Command", "pay");
                            conn.AddDigitalOrderField("vpc_Merchant", OnepayCode.Merchant);//Hòa: cần thanh bằng mã thật cấu hình trong app_code
                            conn.AddDigitalOrderField("vpc_AccessCode", OnepayCode.AccessCode);//Hòa: cần thanh bằng mã thật cấu hình trong app_code
                            conn.AddDigitalOrderField("vpc_MerchTxnRef", mathanhtoantructuyen);//Hòa: mã thanh toán
                            conn.AddDigitalOrderField("vpc_OrderInfo", mathanhtoantructuyen);//Hòa: thông tin đơn hàng
                            conn.AddDigitalOrderField("vpc_Amount", (tongTienTatCaSP * 100).ToString());//Hòa: chi phí cần nhân 100 theo yêu cầu của onepay
                            conn.AddDigitalOrderField("vpc_Currency", "VND");
                            conn.AddDigitalOrderField("vpc_ReturnURL", OnepayCode.ReturnURL);//Hòa: địa chỉ nhận kết quả trả về
                                                                                             // Thong tin them ve khach hang. De trong neu khong co thong tin
                            conn.AddDigitalOrderField("vpc_SHIP_Street01", "");
                            conn.AddDigitalOrderField("vpc_SHIP_Provice", "");
                            conn.AddDigitalOrderField("vpc_SHIP_City", "");
                            conn.AddDigitalOrderField("vpc_SHIP_Country", "");
                            conn.AddDigitalOrderField("vpc_Customer_Phone", "");
                            conn.AddDigitalOrderField("vpc_Customer_Email", "");
                            conn.AddDigitalOrderField("vpc_Customer_Id", "");
                            // Dia chi IP cua khach hang
                            conn.AddDigitalOrderField("vpc_TicketNo", Request.UserHostAddress);
                            // Chuyen huong trinh duyet sang cong thanh toan
                            String url = conn.Create3PartyQueryString();
                            #endregion

                            ketQua = url;

                            break;
                        case "OnepayQuocTe":
                            string SECURE_SECRET1 = OnepayQuocTeCode.SECURE_SECRET;//Hòa: cần thanh bằng mã thật cấu hình trong app_code; 
                                                                                   // Khoi tao lop thu vien va gan gia tri cac tham so gui sang cong thanh toan
                            VPCRequest conn1 = new VPCRequest(OnepayQuocTeCode.VPCRequest);//Hòa: Cần thay bằng cổng thật
                            conn1.SetSecureSecret(SECURE_SECRET1);
                            // Add the Digital Order Fields for the functionality you wish to use
                            // Core Transaction Fields
                            conn1.AddDigitalOrderField("AgainLink", "http://onepay.vn");
                            conn1.AddDigitalOrderField("Title", "onepay paygate");
                            conn1.AddDigitalOrderField("vpc_Locale", "en");//Chon ngon ngu hien thi tren cong thanh toan (vn/en)
                            conn1.AddDigitalOrderField("vpc_Version", "2");
                            conn1.AddDigitalOrderField("vpc_Command", "pay");
                            conn1.AddDigitalOrderField("vpc_Merchant", OnepayQuocTeCode.Merchant);//Hòa: cần thanh bằng mã thật cấu hình trong app_code
                            conn1.AddDigitalOrderField("vpc_AccessCode", OnepayQuocTeCode.AccessCode);//Hòa: cần thanh bằng mã thật cấu hình trong app_code
                            conn1.AddDigitalOrderField("vpc_MerchTxnRef", mathanhtoantructuyen);//Hòa: mã thanh toán
                            conn1.AddDigitalOrderField("vpc_OrderInfo", mathanhtoantructuyen);//Hòa: mã thanh toán
                            conn1.AddDigitalOrderField("vpc_Amount", (tongTienTatCaSP * 100).ToString());//Hòa: chi phí cần nhân 100 theo yêu cầu của onepay

                            conn1.AddDigitalOrderField("vpc_ReturnURL", OnepayQuocTeCode.ReturnURL);//Hòa: địa chỉ nhận kết quả trả về
                                                                                                    // Thong tin them ve khach hang. De trong neu khong co thong tin
                            conn1.AddDigitalOrderField("vpc_SHIP_Street01", "");
                            conn1.AddDigitalOrderField("vpc_SHIP_Provice", "");
                            conn1.AddDigitalOrderField("vpc_SHIP_City", "");
                            conn1.AddDigitalOrderField("vpc_SHIP_Country", "");
                            conn1.AddDigitalOrderField("vpc_Customer_Phone", "");
                            conn1.AddDigitalOrderField("vpc_Customer_Email", "");
                            conn1.AddDigitalOrderField("vpc_Customer_Id", "");
                            // Dia chi IP cua khach hang
                            conn1.AddDigitalOrderField("vpc_TicketNo", Request.UserHostAddress);
                            // Chuyen huong trinh duyet sang cong thanh toan
                            String url1 = conn1.Create3PartyQueryString();
                            ketQua = url1;

                            break;
                    }
                    Response.Write($"<script>alert(\"Duong link  {ketQua} thanh toan onl\")</script>");
                    Response.Redirect(ketQua);
                }

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("TrangDangKyDangNhapKH.aspx");
        }
    }
}