<%@ Page Title="" Language="C#" MasterPageFile="~/NCC/MasterPage.Master" AutoEventWireup="true" CodeBehind="QuanLyKhachHang.aspx.cs" Inherits="ETech.WebApp.NCC.QuanLyKhachHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        :root {
            --text-color: #333;
            --primary-color: #f15f1b;
        }

        body {
            font-family: 'Roboto', sans-serif;
            font-size: 18px;
            line-height: 20px;
            font-weight: 400;
            color: #3b3b3b;
            -webkit-font-smoothing: antialiased;
            font-smoothing: antialiased;
            background-color: #eee;
        }

        .QLKH__title {
            text-align: center;
            padding: 20px;
        }

        .QLKH__container {
            margin: 230px 0 0 450px;
            padding: 0;
            max-width: 950px;
        }

        .table {
            width: 100%;
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

        .QLKH__details {
            font-weight: bold;
            text-decoration: none;
            color: var(--text-color);
        }

            .QLKH__details:hover {
                color: var(--primary-color);
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="QLKH__container">
        <h2 class="QLKH__title">QUẢN LÝ TÀI KHOẢN KHÁCH HÀNG</h2>
        <div class="table">
            <div class="row header">
                <div class="cell">
                    Tên đăng nhập
                </div>
                <div class="cell">
                    Họ tên
                </div>
                <div class="cell">
                    SĐT
                </div>
                <div class="cell">
                    Email
                </div>
                <div class="cell">
                    Địa chỉ
                </div>
                <div class="cell">
                    Trạng thái
                </div>
                <div class="cell">
                    Tính năng
                </div>
            </div>

            <div class="row">
                <div class="cell">
                    vynguyen
                </div>
                <div class="cell">
                    Thảo Vy
                </div>
                <div class="cell">
                    09746483
                </div>
                <div class="cell">
                    thaovy@gmail.com
                </div>
                <div class="cell">
                    500 Tôn Đản
                </div>
                <div class="cell">
                    Mở
                </div>
                <div class="cell">
                    <a class="QLKH__details" href="QuanLyKhachHangChiTiet.aspx">Xem chi tiết</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
