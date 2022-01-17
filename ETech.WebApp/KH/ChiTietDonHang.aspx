<%@ Page Title="" Language="C#" MasterPageFile="~/KH/MasterPage.Master" AutoEventWireup="true" CodeFile="ChiTietDonHang.aspx.cs" Inherits="ETech.WebApp.KH.ChiTietDonHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi tiết đơn hàng</title>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link
        href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
        rel="stylesheet">
    <link rel="stylesheet" href="../wwwroot/font-awsome/css/all.css">
    <style>
           .hinhthucgiaohang{
            width: 60%;
            padding: 15px;
            display:flex;
            justify-content:center;
           
            
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
        .cart-img{
            object-fit:cover;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="giohang-cover">
        <table class="giohang-table">
            <tr>
                <th>Hình Ảnh</th>
                <th>Tên Sản Phẩm</th>
                <th>Tên shop</th>
                <th>Trạng thái</th>
                <th>Giá</th>
                <th>Số Lượng</th> 
                <th>Tổng Tiền</th>
            </tr>
            <asp:Repeater ID="rptCTDONHANG" runat="server">
                <ItemTemplate>
                    <tr>
                       <a href="ChiTietSanPham.aspx?idSP=<%# Eval("SANPHAMID") %>">
                            <td id="td-cart">
                                <img src="../wwwroot/img/sp/<%# Eval("HINHANH") %>" alt="sq-sample26"  class="cart-img""/>
                            </td>
                        <td>
                            <%# Eval("TENSANPHAM") %>
                        </td>
                    </a>
                        <td>
                            <%# Eval("TENNHACUNGCAP") %>
                        </td>
                        <td>
                            <%# Eval("TRANGTHAI") %>
                        </td>
                        <td>
                           <%# Eval("DONGIA") %>
                        <td>
                           <%# Eval("SOLUONG") %>
                        </td>
                        <td>
                           <%# Eval("TONGTIEN") %>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </table> 
    </div>
</asp:Content>
