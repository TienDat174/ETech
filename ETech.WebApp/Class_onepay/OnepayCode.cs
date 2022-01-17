
/// <summary>
/// Lưu các mã cho tài khoản onepay
/// </summary>
public class OnepayCode
{
    public const string VPCRequest = "https://mtf.onepay.vn/onecomm-pay/vpc.op";//Url payment thật: https://onepay.vn/onecomm-pay/vpc.op 
    public const string Merchant = "ONEPAY";     
    public const string AccessCode = "D67342C2";
    public const string SECURE_SECRET = "A3EFDFABA8653DF2342E8DAC29B51AF0";    

    public static string ReturnURL = "https://localhost:44303/Onepay/vpc_dr.aspx";
    /*
Thông tin kết nối Môi trường Test cổng thanh toán Nội địa: 
=========================================================
URL Payment test: https://mtf.onepay.vn/onecomm-pay/vpc.op 
-  Loại tiền tệ thanh toán: VND:  
-  Merchant ID (vpc_Merchant): ONEPAY 
-  Access code (vpc_AccessCode): D67342C2 
-  Hash code (SECURE_SECRET): A3EFDFABA8653DF2342E8DAC29B51AF0 

=========================================================
***Thông tin thẻ test thành công:***
Card Type  Card Name  Card Number  Date(MM/YY)  OPT 
VCB  NGUYEN HONG NHUNG  6868682607535021  12/08  1234567890

============================================================
11.  Loại tiền thanh toán trên cổng 
Loại tiền sử dụng trên cổng thanh toán là VND. 
Nếu website niêm yết tiền ngoại tệ khác như USD thì phải chuyển đổi giá trị sang VND (tham số 
vpc_Amount) theo tỉ giá USD - VND trước khi chuyển sang cổng thanh toán Onepay. 
File XML tỉ giá chuẩn của Vietcombank :
http://www.vietcombank.com.vn/ExchangeRates/ExrateXML.aspx
     */
}