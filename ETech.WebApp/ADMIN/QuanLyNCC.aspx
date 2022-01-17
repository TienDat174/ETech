<%@ Page Title="" Language="C#" MasterPageFile="~/ADMIN/MasterPage.Master" AutoEventWireup="true" CodeBehind="QuanLyNCC.aspx.cs" Inherits="ETech.WebApp.ADMIN.QuanLyNCC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
:root {
  --primary-color: #3e67b9;
  --text-color: #333
}

body {
  font-size: 16px;
  font-family: 'Roboto', sans-serif;
  background-color: #eee;
}

#container {
  max-width: 1150px;
  margin: 180px 0 0 300px;
  padding: 40px;
}

.title {
  text-align: center;
  margin-bottom: 70px;
}

.nav-tabs {
  display: flex;
  justify-content: space-between;
  list-style: none;
  margin: 0;
  padding: 0;
  border-bottom: 3px solid #ddd;
}

.nav-tabs li {
  margin-right: 10px;
}

.nav-tabs li a {
  display: block;
  padding: 6px 10px;
  text-decoration: none;
  position: relative;
  color: var(--text-color);
}

.nav-tabs li a:active {
  color: var(--primary-color);
}

.nav-tabs li a::after {
  content: "";
  height: 3px;
  width: 100%;
  position: absolute;
  left: 0px;
  bottom: -3px;
  background: transparent;
}

.nav-tabs li.active a::after,
.nav-tabs li:hover a::after {
  background: var(--primary-color);
}

.active a {
  font-weight: bold;
}

.dangki_ncc {
  flex-grow: 1;
  text-align: right;
  color: var(--text-color);
  font-size: 17px;
  text-decoration: none;
  transition: .3s;
}

.dangki_ncc:hover {
  color: var(--primary-color);
}

.dangki_ncc .fas {
  margin-right: 5px;
}

/* Tab style */
.table {
  
  width: 100%;
  width:100%;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.2);
  display: table;
  margin:auto;

}

.row {
  display: table-row;
  background: #f6f6f6;
}

.row:nth-of-type(odd) {
  background: #e9e9e9;
}

.row.header {
  font-weight: 900;
  color: #ffffff;
  background: var(--primary-color);
}

.cell {
  text-align: center;
  padding: 6px 12px;
  display: table-cell;
}

.cell_xem {
  text-decoration: none;
  color: var(--text-color);
  margin: 5px;
  font-weight: bold;
}

.cell_xem:hover {
  color: var(--primary-color);
}

.tab-content {
  margin-top: 30px;
}
.row-header{
      background: var(--primary-color);
}
.qldm-column {
  font-weight: 900;
  height:40px;
  color: #ffffff;
  background: var(--primary-color);
}
.qldm-column2{
        padding: 10px;
       border: 1px solid black;  
       line-height:1.3;
       text-align: left;
       color: #2f3542;
       font-weight:600;
}
.container-popup{
    width: 100%;
    height: 730px;
    position: fixed;
    background-color: rgba(0, 0, 0, 0.473);
    display: none;
    top:0;
    z-index: 100;
}
.popup{
    width: 300px;
    height: 170px;
    background-color: whitesmoke;
    margin-left: auto;
    margin-right: auto;
    margin-top: 16%;
    border-radius: 8px;
    box-shadow: 2px 4px 10px rgb(75, 75, 75);
    z-index:111;
}
.x-icon{
    font-size: 35px;
    margin-left: 45%;
    margin-top: 40px;
    color: #a9ca25;
}
.text-popup{
    font-weight: 600;
    color: rgb(97, 97, 97);
    margin-left: 28%;
    margin-top: 30px;
} 
.active{
    display: block;
}
        .forquit {
            display: none!important;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <div id="container">
        <h2 class="title">QUẢN LÝ NHÀ CUNG CẤP</h2>
        <div class="tabs">
          <ul class="nav-tabs">
            <li class="active"><a href="#menu_1">NCC CHỜ DUYỆT</a></li>
            <li><a href="#menu_2">NCC ĐANG TỒN TẠI</a></li>
            <li><a href="#menu_3">NCC ĐÃ HUỶ</a></li>
              <a class="dangki_ncc" href="QuanLyNCCChiTiet.aspx">
                  <i class="fas fa-user-plus"></i>Đăng kí nhà cung cấp
              </a>
          </ul>
          <div class="tab-content">
            <div id="menu_1" class="tab-content-item">
            <table class="table" cellpadding="0" cellspacing="0">
            <thead class="row-header">
                <tr>
                    <th class="qldm-column" style="min-width: 50px">ID</th>   
                    <th class="qldm-column" style="min-width: 250px">Tên Nhà Cung Cấp</th>
                    <th class="qldm-column" style="min-width: 250px">Địa chỉ</th>
                    <th class="qldm-column" style="min-width: 150px">SĐT</th>
                    <th class="qldm-column" style="min-width: 150px">Email</th>
                    
                    <th class="qldm-column" style="min-width: 150px">Chỉnh sửa</th>
                </tr>
            </thead>
            <tbody>
                    <asp:Panel ID="Panel1" runat="server"></asp:Panel>
            </tbody>
        </table>

            </div>
            <div id="menu_2" class="tab-content-item">
              <table class="table"  cellpadding="0" cellspacing="0">
            <thead class="row-header" >
                <tr>
                    <th class="qldm-column" style="min-width: 50px">ID</th>   
                    <th class="qldm-column" style="min-width: 250px">Tên Nhà Cung Cấp</th>
                    <th class="qldm-column" style="min-width: 250px">Địa chỉ</th>
                    <th class="qldm-column" style="min-width: 150px">SĐT</th>
                    <th class="qldm-column" style="min-width: 150px">Email</th>
                    <th class="qldm-column" style="min-width: 150px">Trạng thái</th>
                </tr>
            </thead>
            <tbody>
                <asp:Panel ID="Panel2" runat="server"></asp:Panel>
            </tbody>
        </table>
            </div>
            <div id="menu_3" class="tab-content-item">
              <table class="table"  cellpadding="0" cellspacing="0">
            <thead class="row-header" >
                <tr>
                   <th class="qldm-column" style="min-width: 50px">ID</th>   
                    <th class="qldm-column" style="min-width: 250px">Tên Nhà Cung Cấp</th>
                    <th class="qldm-column" style="min-width: 250px">Địa chỉ</th>
                    <th class="qldm-column" style="min-width: 150px">SĐT</th>
                    <th class="qldm-column" style="min-width: 150px">Email</th>
                    <th class="qldm-column" style="min-width: 150px">Trạng thái</th>
                </tr>
            </thead>
            <tbody>
                <asp:Panel ID="Panel3" runat="server"></asp:Panel>
            </tbody>
        </table>
            </div>
          </div>
        </div>

    </div>

    <script>
     
      $(document).ready(function () {
        $('.tab-content-item').hide();
        $('.tab-content-item:first-child').fadeIn();
        $('.nav-tabs li').click(function () {
          $('.nav-tabs li').removeClass('active')
          $(this).addClass('active');

          let id_tab_content = $(this).children('a').attr('href');
          $('.tab-content-item').hide();
          $(id_tab_content).fadeIn();

          return false;
        });
      });
    </script>
</asp:Content>
