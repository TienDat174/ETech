<%@ Page Title="" Language="C#" MasterPageFile="~/NCC/MasterPage.Master" AutoEventWireup="true" CodeBehind="QuanLyKhachHangChiTiet.aspx.cs" Inherits="ETech.WebApp.NCC.QuanLyKhachHangChiTiet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        :root {
            --primary-color: #f15f1b;
        }

        body {
            font-family: 'Roboto', sans-serif;
            font-size: 18px;
            padding: 0;
            margin: 0;
            background-color: #eee;
        }

        .QLKHchitiet__container {
            background-color: white;
            border-radius: 20px;
            box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
            margin: 180px 0 0 550px;
            max-width: 600px;
            padding: 30px;
            display: flex;
            flex-direction: column;
            align-items: center;
            height: 500px;
        }

        .QLKHchitiet__back {
            position: relative;
            top: -5px;
            left: -240px;
            text-decoration: none;
            color: inherit;
        }

        .QLKHchitiet__box {
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

        .QLKHchitiet__box-input {
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

            .effect ~ .focus-border {
                position: absolute;
                bottom: 0;
                left: 0;
                width: 0;
                height: 2px;
                background-color: var(--primary-color);
                transition: 0.3s;
            }

            .effect:focus ~ .focus-border {
                width: 100%;
                transition: 0.4s;
            }

        h5 {
            padding: 0;
            margin: 0;
            align-items: center;
        }

        .QLKHchitiet__btn a {
            text-decoration: none;
            color: inherit;
        }

        .QLKHchitiet__btn {
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

            .QLKHchitiet__btn:active {
                transform: scale(.8);
            }

            .QLKHchitiet__btn:hover {
                background-color: var(--primary-color);
                color: white;
            }

        .QLKHchitiet__btn-delete:hover {
            background-color: #F8333C;
            color: white;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="QLKHchitiet__container">
        <a href="QuanLyKhachHang.aspx" class="QLKHchitiet__back">
            <i class="fas fa-long-arrow-alt-left"></i>Back
        </a>
        <h3>QUẢN LÝ KHÁCH HÀNG CHI TIẾT</h3>
        <div class="QLKHchitiet__box">
            <h5>Tên đăng nhập</h5>
            <div class="QLKHchitiet__box-input">
                <input class="effect" type="text">
                <span class="focus-border"></span>
            </div>
        </div>

        <div class="QLKHchitiet__box">
            <h5>Họ tên</h5>
            <div class="QLKHchitiet__box-input">
                <input class="effect" type="text">
                <span class="focus-border"></span>
            </div>
        </div>

        <div class="QLKHchitiet__box">
            <h5>Số điện thoại</h5>
            <div class="QLKHchitiet__box-input">
                <input class="effect" type="text">
                <span class="focus-border"></span>
            </div>
        </div>

        <div class="QLKHchitiet__box">
            <h5>Email</h5>
            <div class="QLKHchitiet__box-input">
                <input class="effect" type="text">
                <span class="focus-border"></span>
            </div>
        </div>

        <div class="QLKHchitiet__box">
            <h5>Địa chỉ</h5>
            <div class="QLKHchitiet__box-input">
                <input class="effect" type="text">
                <span class="focus-border"></span>
            </div>
        </div>

        <div class="QLKHchitiet__box">
            <h5>Trạng thái</h5>
            <div class="QLKHchitiet__box-input">
                <input name="status" type="radio">Mở
        <input name="status" type="radio">Đóng
            </div>
        </div>

        <div>
            <button class="QLKHchitiet__btn"><a href="#">Lưu</a></button>
            <button class="QLKHchitiet__btn QLKHchitiet__btn-delete"><a href="#">Xoá</a></button>
        </div>
    </div>
</asp:Content>
