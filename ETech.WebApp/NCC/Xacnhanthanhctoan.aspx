<%@ Page Title="" Language="C#" MasterPageFile="~/NCC/MasterPage.Master" AutoEventWireup="true" CodeBehind="Xacnhanthanhctoan.aspx.cs" Inherits="ETech.WebApp.NCC.Xacnhanthanhctoan" %>
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
  <link rel="stylesheet" href="../wwwroot/css/kh_giohang.css" />
    <style>
        .giohang-cover{
            margin: 200px 0 0 260px;
            padding: 40px;
        }
        .btn{
            margin-left:480px;
        }
          .btnDuyet{
          font-size: 17px;
          background-color: #3e67b9;
          color: white;
            width:120px;
           height:40px;
            cursor: pointer;
            transition: 0.25s;
            border-radius: 2px;
            border:none;
        }
        .btnHuy{
          background-color:#b2bec3;
          font-size: 17px;
          color: white;
           width:120px;
           height:40px;
           cursor: pointer;
           transition: 0.25s;
           border-radius: 2px;
           border:none;
        }
        .btnDuyet:hover{
            background-color: white;
            border: 1px solid #3e67b9;
            color: #3e67b9;
        }
        .btnHuy:hover{
            background-color:white;
            color:#b2bec3;
            border: 1px solid #b2bec3;
        }
        .head-container{
            color:black;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
          <div class="giohang-cover">
          <a href="QuanLyDonHang.aspx" class="head-container"><i class="fas fa-long-arrow-alt-left"></i>Back</a>
        <table class="giohang-table">
            <tr>
                <th>Hình Ảnh</th>
                <th>Tên Sản Phẩm</th>
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
        <div class="btn">
            <asp:Button ID="btnDuyet" runat="server" CssClass="btnDuyet" Text="Đã thanh toán" OnClick="btnDuyet_Click"/>
             <asp:Button ID="btnHuy" runat="server" CssClass="btnHuy" Text="Trở về" OnClick="btnHuy_Click"  />
        </div>
    </div>
</asp:Content>
