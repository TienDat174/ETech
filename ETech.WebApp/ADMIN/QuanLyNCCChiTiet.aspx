<%@ Page Title="" Language="C#" MasterPageFile="~/ADMIN/MasterPage.Master" AutoEventWireup="true" CodeBehind="QuanLyNCCChiTiet.aspx.cs" Inherits="ETech.WebApp.ADMIN.QuanLyNCCChiTiet" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
:root {
    --primary-color: #3e67b9;
}

body {
    font-family: 'Roboto', sans-serif;
    font-size: 18px;
    padding: 0;
    margin: 0;
    background-color: #eee;
}

.container {
    max-width: 600px;
    height: 600px;
    padding: 70px;
    display: flex;
    flex-direction: column;
    align-items: center;
    background-color: white;
    border-radius: 20px;
    box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
    margin: 110px 0 0 600px;
}

.title{
    margin-bottom: 30px;
}

.head-container {
  position: relative;
  top: -20px;
  left: -100px;
}

.div {
    width: 500px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    font-size: 21px;
    padding: 7px;
}

:focus {
    outline: none;
}

.input {
        float: left;
        width: 300px;
        position: relative;
        font-size: 18px;
}

input[type="text"] {
    color: #333;
    width: 100%;
    box-sizing: border-box;
    font-size: 18px;
}

.effect {
    height: 30px;
    border: 1px solid #ccc;
}

.effect~.focus-border {
    position: absolute;
    bottom: 0;
    left: 0;
    width: 0;
    height: 2px;
    background-color: var(--primary-color);
    transition: 0.3s;
}

.effect:focus~.focus-border {
    width: 100%;
    transition: 0.4s;
}

h5 {
    padding: 0;
    margin: 0;
    align-items: center;
}

a {
    text-decoration: none;
    color: inherit;
}

.btn {
    box-shadow: rgba(0, 0, 0, 0.05) 0px 6px 24px 0px, rgba(0, 0, 0, 0.08) 0px 0px 0px 1px;
    margin: 60px 20px;
    width: 100px;
    height: 30px;
    border: none;
    transition: .3s;
    border-radius: 7px;
    font-size: 18px;
    background: #fff;
}

.btn:active {
    transform: scale(.8);
}

.btn:hover {
    color: white;
    background-color: #F8333C;
}

.btn_update {
    color: white;
    background-color:var(--primary-color);
        font-weight:500;
}

.btn_update:hover {
    background-color: white;
    color:var(--primary-color);
}

.btn_add:hover {
    background-color: #06BCC1;
}
.btnHuy{
    background-color:dimgrey;
    color:white;
    font-weight:500;
}
.btnHuy:hover{
    color:dimgrey;
    background-color:white;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="title">
          <a href="QuanLyNCC.aspx" class="head-container"><i class="fas fa-long-arrow-alt-left"></i>Back</a>
          <h3>QUẢN LÝ NHÀ CUNG CẤP CHI TIẾT</h3>
        </div>
        <div class="div">
          <h5>Tên đăng nhập</h5>
          <div class="input">
            
              <asp:TextBox ID="tendangnhap" runat="server" CssClass="effect" Text=""></asp:TextBox>
            <span class="focus-border"></span>
          </div>
        </div>

        

        <div class="div">
          <h5>Tên nhà cung cấp</h5>
          <div class="input">
            <asp:TextBox ID="hoten" CssClass="effect" runat="server"></asp:TextBox>
            <span class="focus-border"></span>
          </div>
        </div>

        <div class="div">
          <h5>Email</h5>
          <div class="input">
            <asp:TextBox ID="email" CssClass="effect" runat="server"></asp:TextBox>
            <span class="focus-border"></span>
          </div>
        </div>

        <div class="div">
          <h5>Địa chỉ</h5>
          <div class="input">
            <asp:TextBox ID="diachi" CssClass="effect" runat="server"></asp:TextBox>
            <span class="focus-border"></span>
          </div>
        </div>

        <div class="div">
          <h5>Số điện thoại</h5>
          <div class="input">
            <asp:TextBox ID="sdt" CssClass="effect" runat="server"></asp:TextBox>
            <span class="focus-border"></span>
          </div>
        </div>

        <div class="div">
          <h5>Trạng thái</h5>
          <div class="input">
              <asp:RadioButton ID="rdb_open" GroupName="Group1" Text="Mở" runat="server" />
              <asp:RadioButton ID="rdb_close" GroupName="Group1" Text="Đóng" style="margin-left: 30px" runat="server" />      
            <span class="focus-border"></span>
          </div>
        </div>

        <div>
            <asp:Button ID="Button1" CssClass="btn btn_update" runat="server" OnClick="Button1_Click" Text="Cập nhật" />
          
          
            <asp:Button ID="Button2" CssClass="btn btnHuy" runat="server" OnClick="Button2_Click" Text="Hủy" />
        </div>
    </div>
</asp:Content>
