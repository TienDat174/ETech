<%@ Page Title="" Language="C#" MasterPageFile="~/NCC/MasterPage.Master" AutoEventWireup="true" CodeBehind="QuanLyKhuyenMai.aspx.cs" Inherits="ETech.WebApp.NCC.QuanLyKhuyenMai" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        :root {
            --text-color: #333;
            --primary-color: #f15f1b;
        }

        body {
            margin: 0;
            padding: 0;
            background-color: #eee;
        }

        .QLKM__container {
            margin: 170px 0 0 500px;
            font-family: 'Roboto', sans-serif;
            max-width: 850px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: space-between;
        }

            .QLKM__container h2 {
                margin-bottom: 30px;
            }

        .QLKM__container-item {
            width: 100%;
            display: flex;
            justify-content: space-around;
            align-items: center;
        }

        .QLKM__select-date {
            display: flex;
            align-items: center;
        }

        input[type="date"i] {
            margin: 8px 0 0 10px;
            height: 35px;
            padding: 0;
            font-size: 16px;
            text-align: right;
        }

        .QLKMchitiet__box-input {
            margin-left: 10px;
        }

            .QLKMchitiet__box-input input {
                width: 150px;
                height: 31px;
                font-size: 17px;
            }

        .QLKM__box {
            display: flex;
            align-items: center;
        }

        .QLKM__btn {
            font-size: 16px;
            margin: 40px 20px;
            height: 30px;
            width: 80px;
            border: none;
            border-radius: 5px;
            background-color: white;
            transition: .3s;
            box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
        }

            .QLKM__btn:hover {
                cursor: pointer;
                background-color: var(--primary-color);
                color: white;
            }

            .QLKM__btn:active {
                transform: scale(0.8);
            }

        /* TABLE */
        .table {
            width: 100%;
            box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
            display: table;
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
            padding: 6px 10px;
            display: table-cell;
        }

        .QLKM__details {
            font-size: 15px;
            font-weight: bold;
            text-decoration: none;
            color: var(--text-color);
        }

            .QLKM__details:hover {
                color: var(--primary-color);
            }
            .tab-content {
  margin-top: 30px;
}
            .qldm-column2{
        padding: 10px;
       border: 1px solid black;  
       line-height:1.3;
       text-align: left;
       font-weight:600;
        }
            .qldm-column {
  font-weight: 900;
  height:40px;
  color: #ffffff;
}
            .row-header{
      background: var(--primary-color);
}
            .cell_xem {
  text-decoration: none;
  color: var(--text-color);
  margin: 5px;
  font-weight: bold;
  text-align:center;
}

.cell_xem:hover {
  color: var(--primary-color);
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="QLKM__container">
        <h2>QUẢN LÝ KHUYẾN MÃI</h2>

        <div class="tab-content">
        <div id="menu_1" class="tab-content-item">
        <table class="table" cellpadding="0" cellspacing="0">
            <thead class="row-header">
                <tr>
                    <th class="qldm-column" style="min-width: 100px">ID</th>   
                    <th class="qldm-column" style="min-width: 100px">Tên Khuyến Mãi</th>
                    <th class="qldm-column" style="min-width: 200px">Tên Nhà Cung Cấp</th>
                    <th class="qldm-column" style="min-width: 150px">Ngày Bắt Đầu</th>
                    <th class="qldm-column" style="min-width: 150px">Ngày Kết Thúc</th>
                    <th class="qldm-column" style="min-width: 100px">Chức Năng</th>
                    
                </tr>
            </thead>
            <tbody>
                    <asp:Panel ID="Panel1" runat="server"></asp:Panel>
            </tbody>
        </table>
    </div>
    </div>
</asp:Content>
