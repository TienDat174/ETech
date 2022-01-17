
/// <summary>
/// Lưu các mã cho tài khoản onepay
/// </summary>
public class OnepayQuocTeCode
{
    public const string VPCRequest = "https://mtf.onepay.vn/vpcpay/vpcpay.op";//Url payment thật: https://onepay.vn/onecomm-pay/vpc.op 
    public const string Merchant = "TESTONEPAY";    
    public const string AccessCode = "6BEB2546";
    public const string SECURE_SECRET = "6D0870CDE5F24F34F3915FB0045120DB";

    public static string ReturnURL = "https://localhost:44303/Onepay/vpc_dr_quocte.aspx";

    /*
Thông tin kết nối Môi trường Test cổng thanh toán Quốc tế:
============================================================
URL Payment test: https://mtf.onepay.vn/vpcpay/vpcpay.op 
-  Loại tiền tệ thanh toán: VND:
-  Merchant ID (vpc_Merchant): TESTONEPAY
-  Access code (vpc_AccessCode): 6BEB2546
-  Hash code (SECURE_SECRET): 6D0870CDE5F24F34F3915FB0045120DB
============================================================
Thông tin thẻ test thành công:  
Card Type  Card Number  Expire date(MM/YY)  CVV/CSC 
Visa  4005550000000001  05/17  123
============================================================
Thông tin thẻ test thất bại trả về mã lỗi B, F: 
Card Type  Card Number  Expire date(MM/YY)  CVV/CSC 
Master  5313581000123430  05/17  123

============================================================
11.  Loại tiền thanh toán trên cổng 
Loại tiền sử dụng trên cổng thanh toán là VND. 
Nếu website niêm yết tiền ngoại tệ khác như USD thì phải chuyển đổi giá trị sang VND (tham số 
vpc_Amount) theo tỉ giá USD - VND trước khi chuyển sang cổng thanh toán Onepay.
File XML tỉ giá chuẩn của Vietcombank :
http://www.vietcombank.com.vn/ExchangeRates/ExrateXML.aspx
     */
}