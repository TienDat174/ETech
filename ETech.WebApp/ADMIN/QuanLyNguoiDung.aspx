<%@ Page Title="" Language="C#" MasterPageFile="~/ADMIN/MasterPage.Master" AutoEventWireup="true" CodeBehind="QuanLyNguoiDung.aspx.cs" Inherits="ETech.WebApp.ADMIN.QuanLyNguoiDung" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
:root {
  --text-color: #333;
  --primary-color: #3e67b9;
}

body {
  font-family: 'Roboto', sans-serif;
  font-size: 14px;
  line-height: 20px;
  font-weight: 400;
  color: #3b3b3b;
  -webkit-font-smoothing: antialiased;
  font-smoothing: antialiased;
  background-color: #eee;
}

h2 {
  text-align: center;
  padding: 20px;
}

@media screen and (max-width: 580px) {
  body {
    font-size: 16px;
    line-height: 22px;
  }
}

.wrapper {
 max-width: 900px;
  margin: 170px 0 0 450px;
  padding: 40px;
}

.table {
  width: 100%;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.2);
  display: table;
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
  padding: 6px 12px;
  display: table-cell;
}

@media screen and (max-width: 580px) {
  .cell {
    padding: 2px 16px;
    display: block;
  }
}

.cell_xem {
  text-decoration: none;
  color: var(--text-color);
}

.cell_xem:hover {
  color: var(--primary-color);
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
.qltk-container{
        margin: 0 0px;
        max-width: 100%;
        min-width: 100%;
        display: flex;
        flex-direction: column;
        justify-content: center;
           
    }
    .qltk-container h4 {
        margin: 0 auto;
        font-size: 30px;
        font-weight: bold; 
        color: #262626;
    }
    .qltk-header {
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 40px 0;
    }
    .qltk-btnThemMoi-container {
        position: absolute;
        right: 40px;
        background: #031a43;
        padding: 11px 13px;
        border-radius: 5px;
    }

    .qltk-btnThemMoi-container:hover {
        background: #155e98;
        transition : all 0.2s ease-in;
    }

    .qltk-btnThemMoi-container a {
        display: flex;
        align-items: center;
    }
    .qltk-btnThemMoi-container i,
    .qltk-btnThemMoi-container span {
        display: block;
        color: white;
            
    }
    .qltk-btnThemMoi-container i {
        font-size: 12px;
    }
    .qltk-btnThemMoi-container span{
        font-size: 16px;
        font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
        margin-left: 10px;
    }
    .table {
        width: 80%;
        margin: 0 auto;
    }
    .table,
    .table-th,
    .table-tr,
    .table-item {
        border: 1px solid #adc9fa;  
        text-align: left;
        line-height: 1.3;
        color: #333333;
    }
    .table-th{
        padding: 10px;
        text-align: center;
        vertical-align: middle;
        font-weight: bold;
        background: #ffe4da
    }
    .table-item {
        padding: 10px;
    }
    .table-tr:nth-child(even){
        background: #fff9f9;
    }
    #table-item-tensp a {
        font-weight: bold;
        color: #031a43
    }
    #table-item-tensp a:hover{
        color: #0654a9;
        transition : all 0.1s ease-in;
    }
        .qltk-btnChiTiet {
        color: #0654a9;
        font-weight: bold;
        font-size: 14px;
        text-align: center;
        display: block;
    }
    .qltk-btnChiTiet:hover{
        color: #0094ff;
    }
        .auto-style1 {
            width: 100%;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.2);
            display: block;
            text-align: left;
            line-height: 1.3;
            color: #333333;
            border: 1px solid #adc9fa;
            margin-left: 0px;
            margin-right: auto;
            margin-top: 0;
            margin-bottom: 0;
        }
         /*.auto-style2 {
             position: absolute;
             right: 40px;
             background: #031a43;
             padding: 11px 13px;
             border-radius: 5px;
             top: 200px;
         }*/
                 .qldm-column {
  font-weight: 900;
  height:40px;
  color: #ffffff;
}
        .table {
  width:100%;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.2);
  display: table;
  margin:auto;
}
        .row-header{
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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="wrapper">
        <div class="auto-style2">
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Admin/QuanLyThemNguoiDung.aspx">
                    <i class="fas fa-user-plus"></i>
                    <span>Đăng kí User</span>
                </asp:HyperLink>
            
            </div>
        <h2>QUẢN LÝ NGƯỜI DÙNG</h2>
        
             <table class="table" cellpadding="0" cellspacing="0">
            <tr  class="row-header">
                <th class="qldm-column" >ID</th>
                <th class="qldm-column" style="min-width: 100px">Tên đăng nhập</th>
                <th class="qldm-column" style="min-width: 80px">Mật khẩu</th>
                <th class="qldm-column">Họ Tên</th>
                <th class="qldm-column">Email</th>
                <th class="qldm-column" style="min-width: 80px">Địa chỉ</th>
                <th class="qldm-column">SĐT</th>
                <th class="qldm-column">Trạng Thái</th>
                <%--<th class="table-th">Trạng Thái</th>--%>
                <th class="qldm-column">Tính Năng</th>

            </tr>
        <asp:PlaceHolder ID="PlaceHolder2" runat="server"></asp:PlaceHolder>
        </table> 
    </div>
</asp:Content>
