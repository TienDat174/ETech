<%@ Page Title="" Language="C#" MasterPageFile="~/ADMIN/MasterPage.Master" AutoEventWireup="true" CodeBehind="QuanLyThuNhap.aspx.cs" Inherits="ETech.WebApp.ADMIN.QuanLyThuNhap" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
:root {
  --text-color: #333;
  --primary-color: #3e67b9;
}

body {
  margin: 0;
  padding: 0;
  background-color: #eee;
}

.container {
  margin: 200px 0 0 450px;
  font-family: 'Roboto', sans-serif;
  max-width: 800px;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: space-between;
  background-color: white;
  border-radius: 20px;
  box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
  padding: 50px;
}

.container h2{
  margin-bottom: 30px;
}

.container-item {
  width: 100%;
  display: flex;
  justify-content: space-around;
  align-items: center;
}

.select_date {
  display: flex;
  align-items: center;
}

input[type="date"i] {
  margin: 0px 0 0 10px;
  height: 35px;
  padding: 0;
  font-size: 16px;
  text-align: right;
}

.selectdiv select {
  height: 35px;
  padding: 5px;
  font-size: 16px;
}

.search {
  font-size: 16px;
  margin: 40px 0;
  height: 30px;
  width: 80px;
  border: none;
  border-radius: 5px;
  background-color: white;
  transition: .3s;
  box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
}

.search:hover {
  cursor: pointer;
  background-color: var(--primary-color);
  color: white;
}

.search:active {
  transform: scale(0.8);
}

/* TABLE */
.table {
  width: 100%;
  box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
  display: table;
}
.qltn-column {
  font-weight: 900;
  height:40px;
  color: #ffffff;
}
.row-header{
      background: var(--primary-color);
}

@media screen and (max-width: 580px) {
  .table {
    display: block;
  }
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

@media screen and (max-width: 580px) {
  .row {
    padding: 14px 0 7px;
    display: block;
  }

  .row.header {
    padding: 0;
    height: 6px;
  }

  .row.header .cell {
    display: none;
  }

  .row .cell {
    margin-bottom: 10px;
  }

  .row .cell:before {
    margin-bottom: 3px;
    content: attr(data-title);
    min-width: 98px;
    font-size: 10px;
    line-height: 10px;
    font-weight: bold;
    text-transform: uppercase;
    color: #969696;
    display: block;
  }
}

.cell {
  text-align: center;
  padding: 6px 50px;
  display: table-cell;
}

@media screen and (max-width: 580px) {
  .cell {
    padding: 2px 16px;
    display: block;
  }
}
 .edit-container {
            display: flex;
            align-items: center;
            justify-content: space-between;
            width: 150px;
            color:rgb(131, 131, 131);
            height:30px;
  }
.qltn-column2{
        padding: 10px;
       border: 1px solid black;  
       line-height:1.3;
       text-align: left;
       color: #2f3542;
       font-weight:600;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div class="container">
    <h2>XEM THU NHẬP NHÀ CUNG CẤP</h2>
    <div class="container-item">
      <div class="select_date">
        <p>Từ ngày</p>
       <asp:TextBox ID="txtNgayBD" CssClass="input-percent" TextMode="Date" runat="server"></asp:TextBox>
      </div>
      <div class="select_date">
        <p>Đến ngày</p>
        <asp:TextBox ID="txtNgayKT" CssClass="input-percent" TextMode="Date" runat="server"></asp:TextBox>
      </div>
      <div class="selectdiv">
        <asp:DropDownList CssClass="edit-container" ID="ddNCC" runat="server"></asp:DropDownList>
      </div>
    </div>
      <asp:Button ID="btnTim" runat="server" Text="Tìm kiếm"  class="search" OnClick="btnTim_Click" />
     <table class="table" cellpadding="0" cellspacing="0">
            <thead class="row-header">
                <tr>
                    <th class="qltn-column" style="min-width: 300px">Tên nhà cung cấp</th>   
                    <th class="qltn-column" style="min-width: 200px">Doanh Thu</th>
                    <th class="qltn-column" style="min-width: 200px">Thuế</th>
                </tr>
            </thead>
            <tbody>
                    <asp:Panel ID="Panel1" runat="server"></asp:Panel>
            </tbody>
        </table>
  </div>
</asp:Content>
