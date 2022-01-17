<%@ Page Title="" Language="C#" MasterPageFile="~/KH/MasterPage.Master" AutoEventWireup="true" CodeBehind="DonHang.aspx.cs" Inherits="ETech.WebApp.KH.DonHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Đơn hàng</title>
    <link rel="stylesheet" href="../wwwroot/css/kh_donhang.css" />
    <style>
        .link-direct{
            text-decoration:none!important;
            color:white!important;
        }
        .not-login-wrapper{
            padding-bottom: 20px!important;
            color:white;
            margin-top:5%!important;
            margin: 0 auto;
            width:50%;
            background:#3e67b9;
            text-align: center;
            display:block;
            padding: 10px 10px 10px 10px;
            border-radius:5px;
        }
        .link-direct:hover{
            transition: ease-in-out 0.25s;
            border: white solid 1px;
            padding: 6px 6px 6px 6px;
        }
        td-btn-dh{
            color:#3e67b9!important;
        }
        a, a:hover, a:focus, a:active {
      text-decoration: none;
      color: inherit;
 }
        .tr{
            border-bottom: 1px solid black!important;
        }
        .head-lead{
            height: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="head-lead">Trang chủ > <span id="lead-text">Đơn hàng</span></div>
    <asp:Panel ID="panelNotLogin" CssClass="not-login-wrapper" runat="server">
        <h3>Đăng nhập để xem đơn hàng của bạn</h3>
        <asp:HyperLink ID="HyperLink2" runat="server" CssClass="link-direct" NavigateUrl="~/KH/TrangDangKyDangNhapKH.aspx">Đăng nhập</asp:HyperLink>
    </asp:Panel>

    
    <asp:Panel ID="panelDonHang" CssClass="panelDonHang" runat="server">
        <div class="donhang-cover">
        <table class="donhang-table">
            <tr>
                <th>Mã đơn hàng</th>
                <th>Ngày</th>  
                <th>Trạng thái</th>
                <th>Tổng số lượng</th>
                <th>Tổng tiền</th>
                <th>Chi tiết</th>    
            </tr>
            <asp:Panel ID="Panel1" runat="server"></asp:Panel>
        </table>
    </div>
    </asp:Panel>
</asp:Content>
