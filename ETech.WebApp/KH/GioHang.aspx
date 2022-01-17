<%@ Page Title="" Language="C#" MasterPageFile="~/KH/MasterPage.Master" AutoEventWireup="true" CodeFile="GioHang.aspx.cs" Inherits="ETech.WebApp.KH.GioHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Giỏ hàng</title>
    <style>
        .hinhthucgiaohang{
            padding-bottom: 30px!important;
            width: 80%;
            padding: 15px;
            display:flex;
            justify-content:center;
           border: solid 1px #3e67b9;
           margin: 0 auto;
           margin-top:30px;
            
        }
        .paymentInfo{
            margin-top: 15px;
            overflow:auto;
            padding: 20px;
        }
        .text{
            text-align: center;
            font-size: 23px;
            display: none;
            margin-top: 50px;

        }
        .datngu{
            
        }
        .quangngu{
            margin-top: 10px;
        }
        
    </style>
    <link rel="stylesheet" href="../wwwroot/css/kh_giohang.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="pnHaveCart" runat="server">
        <div class="head-lead">Trang chủ > <span id="lead-text">Giỏ hàng</span></div>
        <div class="head-lead">
      <div class="infor-kh"><i class="fas fa-shopping-cart"></i>Thông tin người nhận</div>
      <div class="infor-kh-div">
        <asp:TextBox ID="txtTen" CssClass="infor-kh-input" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtDiaChi" CssClass="infor-kh-input infor-kh-dchi" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtSDT" CssClass="infor-kh-input" runat="server"></asp:TextBox>
        <asp:TextBox ID="txtEmail" CssClass="infor-kh-input" runat="server"></asp:TextBox>
      </div>
    </div>
    <div class="giohang-cover">
        <table class="giohang-table">
            <tr>
                <th>Hình Ảnh</th>
                <th>Tên Sản Phẩm</th>
                <th>Giá</th>
                <th>Số Lượng</th> 
                <th>Tổng Tiền</th>
                <th>Xoá</th>
            </tr>
            <asp:Repeater ID="rptSPham" runat="server">
                <ItemTemplate>
                    <tr>
                        <a href="ChiTietSanPham.aspx?idSP=<%# Eval("ID") %>">
                            <td id="td-cart">
                                <img src="../wwwroot/img/sp/<%# Eval("HINH") %>" alt="" class="cart-img"></td>
                            <td><%# Eval("TENSP") %></td>
                        </a>
                        <td><%# Eval("DONGIA","{0:n}") %></td>
                        <td>
                            <%# Eval("SOLUONG") %>
                        <td>
                            <%# Eval("TIENMUA","{0:n}") %>
                        </td>
                        <td>
                            <asp:Button ID="btnDelete" CssClass="btn-delete-cart" runat="server" Text="X" OnCommand="btnDelete_Click" CommandArgument='<%# Container.ItemIndex %>'/>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </table> 
    </div>
    <div class="hinhthucgiaohang">
                
                   <div class="datngu">
                       <h4 style="font-size: 20px;" > Chọn hình thức giao hàng</h4>  
                                  
                     <asp:RadioButton ID="rbOnepay" Checked="true" runat="server" GroupName="Group1" /><label for="rbOnepay">Thanh toán trực tuyến qua thẻ ATM</label>
                     <div class="paymentInfo">       
                        <script type="text/javascript"src="http://202.9.84.88/documents/payment/logoscript.jsp?logos=at&lang=vi"></script> 
                        <div class="cb"><!----></div>
                    </div>                                   
                    <asp:RadioButton ID="rbOnepayQuocTe"  runat="server" GroupName="Group1" /><label for="rbOnepayQuocTe">Thanh toán trực tuyến qua thẻ Visa, Master, American Express,...</label>
                    <div class="paymentInfo">       
                        <script type="text/javascript"src="http://202.9.84.88/documents/payment/logoscript.jsp?logos=v,m,a,j,u&lang=en"></script> 
                        <div class="cb"><!----></div>
                    </div>
                    <asp:RadioButton ID="rbTruyenthong" runat="server" GroupName="Group1"  /><label for="rbTruyenthong">Thanh toán khi nhận hàng</label> 
                </div>
                </div>

    <div class="cart-footer">
        <asp:Button ID="btnContinues" CssClass="btn-cart-cotinues" runat="server" Text="Tiếp tục mua sắm" OnClick="btnContinues_Click" />
        <div class="sum-cart">
            <p class="bold-text">TỔNG TIỀN</p>
            <p class="bold-text color-primary">TỔNG TIỀN: <asp:Label ID="lbTongTatCaSP" runat="server" Text="0"></asp:Label></p>
            <asp:Button ID="btnThanhToan" CssClass="btn-cart-cotinues" runat="server" Text="Thanh toán" OnClick="btnThanhToan_Click" />
            <asp:Button ID="Button1" runat="server" CssClass="btn-cart-cotinues" Text="Đăng nhập để thanh toán" OnClick="Button1_Click" />
        </div>
    </div>

    </asp:Panel>
    
    <asp:Label ID="Label1" CssClass="text" runat="server" Text="BẠN CHƯA CHỌN SẢN PHẨM"></asp:Label>
    
    
</asp:Content>
