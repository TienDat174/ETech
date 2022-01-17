<%@ Page Title="" Language="C#" MasterPageFile="~/ADMIN/MasterPage.Master" AutoEventWireup="true" CodeBehind="QuanLyThongKe.aspx.cs" Inherits="ETech.WebApp.ADMIN.QuanLyThongKe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
body {
  margin: 0;
  padding: 0;
  font-family: 'Roboto', sans-serif;
  font-size: 18px;
  background-color: #eee;
}

.title {
  margin-top: 30px;
  text-align: center;
}

hr {
  width: 400px;
  background-color: #ddd;
  border: 1px solid #ddd;
}

.main-container {
  background-color: white;
  border-radius: 20px;
  box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
  margin: 150px 0 0 650px;
  max-width: 550px;
  height: 500px;
  padding: 70px;
}

.container {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
}

.block_item {
  margin: 20px;
  width: 140px;
  height: 120px;
  text-align: center;
  padding: 10px;
  background-color: #fff;
  box-shadow: rgba(99, 99, 99, 0.2) 0px 2px 8px 0px;
  border-radius: 10px;
  display: flex;
  flex-direction: column;
  justify-content: space-around;
  transition: .3s;
}

.block_item:hover {
  box-shadow: #abc1ff 0px 2px 8px 0px;
  transform: scale(1.05);
}
.block_item h4{
  margin: 0;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div class="main-container">
    <h2 class="title">THỐNG KÊ TỔNG QUAN</h2>
    <hr>
    <div class="container">
      <div class="block_item">
        <h4>Người dùng</h4>
          <asp:Label ID="lblTK" runat="server" Text=""></asp:Label>
      </div>
      <div class="block_item">
        <h4>Nhà cung cấp</h4>
          <asp:Label ID="lblNCC" runat="server" Text=""></asp:Label>
      </div>
      <div class="block_item">
        <h4>Admin</h4>
          <asp:Label ID="lblAd" runat="server" Text=""></asp:Label>
      </div>
      <div class="block_item">
        <h4>Đơn vị <br> vận chuyển</h4>
          <asp:Label ID="lblDVVC" runat="server" Text=""></asp:Label>
      </div>
    </div>
  </div>
</asp:Content>
