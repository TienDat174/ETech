<%@ Page Title="" Language="C#" MasterPageFile="~/KH/MasterPage.Master" AutoEventWireup="true" CodeBehind="QuanLyTaiKhoan.aspx.cs" Inherits="ETech.WebApp.KH.QuanLyTaiKhoan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý tài khoản</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link
        href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
        rel="stylesheet">
    <link rel="stylesheet" href="../wwwroot/font-awsome/css/all.css">
    <style>
        :root {
            --orange-color: #f15f1b;
            --primary-color: #3e67b9;
            --gray-color: #808080;
        }

        * {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            font-size: 20px;
        }

        .QLTK__container {
            width: 70%;
            margin: 50px auto;
            text-align: center;
            padding: 30px;
        }

        .QLTK__tittle {
            background-color: rgb(241, 241, 241);
            padding: 5px;
            display: flex;
            align-items: center;
            margin: 0 auto;
        }

            .QLTK__tittle p {
                margin: 10px;
            }

                .QLTK__tittle p:last-child:hover {
                    cursor: pointer;
                    color: black;
                }

                .QLTK__tittle p:last-child {
                    color: var(--primary-color);
                }

        .QLTK__container h2 {
            font-size: 25px;
            margin: 20px auto;
            color: var(--primary-color);
        }

        .QLTK__wrapper {
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .QLTK__wrapper-title {
            text-align: left;
            border-bottom: 1.5px solid #ddd;
            padding: 5px;
            font-weight: 600;
            width: 100%;
            font-size:22px;
        }

        .QLTK-wrapper-input {
            margin: 0 auto;
            width: 90%;
            padding: 20px 0;
        }

        .QLTK-input {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }

            .QLTK-input input,
            .QLTK-input textarea {
                padding: 3px;
                border: 1.5px solid #ddd;
                border-radius: 3px;
                width: 55%;
            }

                .QLTK-input input[type=text]:focus,
                .QLTK-input textarea:focus {
                    background: #e9e9e97c;
                }

        .QLTK-input_radio {
            padding: 6px;
            width: 58%;
            display: flex;
            align-items: center;
        }

            .QLTK-input_radio input {
                width: auto;
                margin-left: 20px;
            }

        .QLTK-radio + .QLTK-input {
            padding: 12px 10px;
            align-items: flex-start;
            border: none;
        }

        .QLTK-btn {
            border-top: 1.5px solid #ddd;
            padding: 15px;
        }

            .QLTK-btn button {
                font-size:24px;
                background: var(--primary-color);
                color: #fff;
                border: 1px solid #ddd;
                border-radius: 5px;
                box-shadow: rgba(0, 0, 0, 0.16) 0px 1px 4px;
                padding: 5px 10px;
                transition: .3s;
            }

                .QLTK-btn button:hover {
                    box-shadow: var(--primary-color) 0px 1px 4px;
                    border: 1px solid var(--primary-color);
                    cursor: pointer;
                }

                .QLTK-btn button:active {
                    transform: scale(0.8);
                }

        .QLTK-img {
            border: none;
        }

        #file-input {
            display: none;
        }

        .preview {
            display: flex;
            align-items: center;
            justify-content: space-between;
            width: 100%;
        }

            .preview img {
                width: 120px;
                height: 120px;
                object-fit: cover;
                box-shadow: rgba(0, 0, 0, 0.16) 0px 1px 4px;
            }

            .preview label {
                font-weight: 600;
                cursor: pointer;
                color: var(--text-color);
                border-radius: 5px;
                padding: 5px;
                background-color: var(--white-color);
                box-shadow: rgba(0, 0, 0, 0.16) 0px 1px 4px;
            }

            .preview div {
                width: 35%;
                display: flex;
                align-items: center;
                justify-content: space-between;
                margin-right: 200px;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="QLTK__container">
        <div class="QLTK__tittle">
            <p>Trang chủ</p>
            <i class="fas fa-chevron-right"></i>
            <p>Thông tin tài khoản</p>
        </div>
        <h2>THÔNG TIN TÀI KHOẢN</h2>
        <div class="QLTK__wrapper">
            <p class="QLTK__wrapper-title">Chi tiết thông tin cá nhân</p>
            <div class="QLTK-wrapper-input">
                <div class="QLTK-input">
                    <p>Tên đăng nhập</p>
                    <input type="text" name="" id="">
                </div>
                <div class="QLTK-input">
                    <p>Tên</p>
                    <input type="text" name="" id="">
                </div>
                <div class="QLTK-input">
                    <p>Email</p>
                    <input type="text" name="" id="">
                </div>
                <div class="QLTK-input">
                    <p>Số điện thoại</p>
                    <input type="text" name="" id="">
                </div>
                <div class="QLTK-input QLTK-radio">
                    <p>Giới tính</p>
                    <div class="QLTK-input_radio">
                        <input type="radio" name="sex" id="">Nam
                        <input type="radio" name="sex" id="">Nữ
                        <input type="radio" name="sex" id="">Khác
                    </div>
                </div>
                <div class="QLTK-input">
                    <p>Địa chỉ</p>
                    <textarea name="" id="" cols="21" rows="4"></textarea>
                </div>
            </div>
            <p class="QLTK__wrapper-title">Hình ảnh</p>
            <div class="QLTK-wrapper-input">
                <div class="QLTK-input QLTK-img">
                    <div class="preview">
                        <p>Ảnh đại diện</p>
                        <div>
                            <label for="file-input">Choose Image</label>
                            <img id="img-preview" />
                            <input accept="image/*" type="file" id="file-input" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="QLTK-btn">
            <button>Cập nhật</button>
        </div>
    </div>


    <script type="text/javascript">
        const input = document.getElementById('file-input');
        const image = document.getElementById('img-preview');

        input.addEventListener('change', (e) => {
            if (e.target.files.length) {
                const src = URL.createObjectURL(e.target.files[0]);
                image.src = src;
            }
        });
    </script>

</asp:Content>
