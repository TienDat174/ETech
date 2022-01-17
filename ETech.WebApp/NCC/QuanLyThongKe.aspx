<%@ Page Title="" Language="C#" MasterPageFile="~/NCC/MasterPage.Master" AutoEventWireup="true" CodeBehind="QuanLyThongKe.aspx.cs" Inherits="ETech.WebApp.NCC.QuanLyThongKe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .QLTKe__container {
            margin: 230px 0 0 500px;
            font-family: 'Roboto', sans-serif;
            max-width: 800px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: space-between;
        }

            .QLTKe__container h2 {
                margin-bottom: 30px;
            }

        .QLTKe__container-item {
            width: 100%;
            display: flex;
            justify-content: space-around;
            align-items: center;
        }

        .QLTKe__select-date {
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

        .QLTKe__btn {
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

            .QLTKe__btn:hover {
                cursor: pointer;
                background-color: var(--primary-color);
                color: white;
            }

            .QLTKe__btn:active {
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

            .row-header {
                font-weight: 900;
                color: #ffffff;
                background: var(--primary-color);
            }

        .cell {
            text-align: center;
            padding: 6px 10px;
            display: table-cell;
        }
        .qltn-column2{
        padding: 10px;
       border: 1px solid black;  
       line-height:1.3;
       text-align: left;
       color: #2f3542;
       font-weight:500;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="QLTKe__container">
        <h2>THỐNG KÊ DOANH THU</h2>
        <div class="QLTKe__container-item">
            <div class="QLTKe__select-date">
                <p>Từ ngày</p>
                 <asp:TextBox ID="txtNgayBD"  TextMode="Date" runat="server"></asp:TextBox>
            </div>
            <div class="QLTKe__select-date">
                <p>Đến ngày</p>
                <asp:TextBox ID="txtNgayKT"  TextMode="Date" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="QLTKe__divbtn">
            <asp:Button ID="btnTim" runat="server" Text="Tìm kiếm"  class="QLTKe__btn" OnClick="btnTim_Click"  />
            <asp:Button ID="btnHuy" runat="server" Text="Hủy"  class="QLTKe__btn" OnClick="btnHuy_Click"  />
        </div>
       <table class="table" cellpadding="0" cellspacing="0">
            <thead class="row-header">
                <tr>
                    <th class="cell" style="min-width: 200px">Mã Sản Phẩm</th>   
                    <th class="cell" style="min-width: 300px">Tên Sản Phẩm</th>
                    <th class="cell" style="min-width: 200px">SL Tồn Kho</th>
                    <th class="cell" style="min-width: 200px">SL Bán ra</th>
                    <th class="cell" style="min-width: 200px">Doanh thu</th>

                </tr>
            </thead>
            <tbody>
                    <asp:Panel ID="Panel1" runat="server"></asp:Panel>
            </tbody>
        </table>
    </div>
</asp:Content>
