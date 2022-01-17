<%@ Page Title="" Language="C#" MasterPageFile="~/NCC/MasterPage.Master" AutoEventWireup="true" CodeFile="QuanLySanPham.aspx.cs" Inherits="ETech.WebApp.NCC.QuanLySanPham" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        :root {
            --text-color: #333;
            --primary-color: #f15f1b;
        }
        .QLSP__title {
            text-align: center;
            padding: 10px;
            margin-bottom: 0;
        }

        .QLSP__btn-add {
            float: right;
            margin-bottom: 10px;
            padding: 5px;
            border-radius: 8px;
            border: none;
            box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
            cursor: pointer;
            transition: .3s;
            font-size: 15px;
        }

            .QLSP__btn-add:hover {
                background-color: var(--primary-color);
                color: #eee;
            }

            .QLSP__btn-add:active {
                transform: scale(0.8);
            }

        .QLSP__container {
            margin: 180px 0 0 320px;
            padding: 0;
            max-width: 1100px;
        }

        .table {
            width: 1100px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.2);
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
            padding: 6px 12px;
            display: table-cell;
        }

        .QLSP__link {
            font-weight: bold;
            text-decoration: none;
            color: var(--text-color);
        }

            .QLSP__link:hover {
                color: var(--primary-color);
            }
            .qldm-column2{
                padding: 10px;
                border: 1px solid black;  
                line-height:1.3;
                 text-align: left;
                color: #2f3542;
                font-weight:500;
                font-size:15px;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="QLSP__container">
        <div>
            <h2 class="QLSP__title">QUẢN LÝ SẢN PHẨM</h2>
            <asp:Button ID="btnThem"  class="QLSP__btn-add" runat="server" Text="+ Thêm sản phẩm" OnClick="btnThem_Click" />
         <table class="table" cellpadding="0" cellspacing="0">
            <thead class="row-header">
                <tr>
                    <th class="cell" style="min-width: 50px">STT</th>   
                    <th class="cell" style="min-width: 400px">Tên Sản Phẩm</th>
                    <th class="cell" style="min-width: 150px">Giá</th>
                    <th class="cell" style="min-width: 50px">Số lượng</th>
                    <th class="cell" style="min-width: 100px">Thương hiệu</th>
                    <th class="cell" style="min-width: 100px">Trạng thái</th>
                    <th class="cell" style="min-width: 100px">Chỉnh sửa</th>
                </tr>
            </thead>
            <tbody>
                    <asp:Panel ID="Panel1" runat="server"></asp:Panel>
            </tbody>
        </table>  
      </div>
        </div>
</asp:Content>
