using ETech.WebApp.AppCode;
using System;
using ETech.WebApp;
using System.Data;
using System.Data.SqlClient;
using WebApplication2;

public partial class onepay_vpc_dr : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string SECURE_SECRET = OnepayCode.SECURE_SECRET;//Hòa: cần thay bằng mã thật từ app_code
        string hashvalidateResult = "";
        // Khoi tao lop thu vien
        VPCRequest conn = new VPCRequest("http://onepay.vn");
        conn.SetSecureSecret(SECURE_SECRET);
        // Xu ly tham so tra ve va kiem tra chuoi du lieu ma hoa
        hashvalidateResult = conn.Process3PartyResponse(Request.QueryString);

        // Lay gia tri tham so tra ve tu cong thanh toan
        String vpc_TxnResponseCode = conn.GetResultField("vpc_TxnResponseCode", "Unknown");
        string amount = conn.GetResultField("vpc_Amount", "Unknown");
        string localed = conn.GetResultField("vpc_Locale", "Unknown");
        string command = conn.GetResultField("vpc_Command", "Unknown");
        string version = conn.GetResultField("vpc_Version", "Unknown");
        string cardBin = conn.GetResultField("vpc_Card", "Unknown");
        string orderInfo = conn.GetResultField("vpc_OrderInfo", "Unknown");
        string merchantID = conn.GetResultField("vpc_Merchant", "Unknown");
        string authorizeID = conn.GetResultField("vpc_AuthorizeId", "Unknown");
        string merchTxnRef = conn.GetResultField("vpc_MerchTxnRef", "Unknown");
        string transactionNo = conn.GetResultField("vpc_TransactionNo", "Unknown");
        string txnResponseCode = vpc_TxnResponseCode;
        string message = conn.GetResultField("vpc_Message", "Unknown");

        string mathanhtoantructuyen = merchTxnRef;

        // Sua lai ham check chuoi ma hoa du lieu            
        if (hashvalidateResult == "CORRECTED" && txnResponseCode.Trim() == "0")
        {
            //vpc_Result.Text = "Transaction was paid successful";

            #region Cập nhật vào db theo mã đơn hàng
            DataAccess dataAccess = new DataAccess();
            try
            {
                SqlParameter[] p =
               {
                    new SqlParameter("@MATHANHTOANTRUCTUYEN",SqlDbType.NVarChar)
                };
                p[0].Value = mathanhtoantructuyen;
                int a = dataAccess.ExecuteNonQuery("UPDATE_DONHANG_THANHCONG", p);
            }
            catch { }
            #endregion

            Response.Write("<div class='result'>Đã thanh toán thành công</div>");
        }
        else if (hashvalidateResult == "INVALIDATED" && txnResponseCode.Trim() == "0")
        {
            #region Cập nhật vào db theo mã đơn hàng
            DataAccess dataAccess = new DataAccess();
            try
            {
                SqlParameter[] p =
               {
                    new SqlParameter("@MATHANHTOANTRUCTUYEN",SqlDbType.NVarChar)
                };
                p[0].Value = mathanhtoantructuyen;
                int a = dataAccess.ExecuteNonQuery("PROC_UPDATE_DONHANG_DANGCHO", p);
            }
            catch { }

            #endregion

            //vpc_Result.Text = "Transaction is pending";
            Response.Write("Error description : " + message + "<br/>");
            Response.Write("<div class='result'>Thanh toán đang chờ</div>");
        }
        else
        {
            #region Cập nhật vào db theo mã đơn hàng
            DataAccess dataAccess = new DataAccess();
            try
            {
                SqlParameter[] p =
               {
                    new SqlParameter("@MATHANHTOANTRUCTUYEN",SqlDbType.NVarChar)
                };
                p[0].Value = mathanhtoantructuyen;
                int a = dataAccess.ExecuteNonQuery("PROC_UPDATE_DONHANG_KOTHANHCONG", p);
            }
            catch { }

            #endregion

            //vpc_Result.Text = "Transaction was not paid successful";
            Response.Write("Error description : " + message + "<br/>");
            Response.Write("<div class='result'>Thanh toán không thành công</div>");
        }
    }
}