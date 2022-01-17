<%@ Page Title="" Language="C#" MasterPageFile="~/NCC/MasterPage.Master" AutoEventWireup="true" CodeBehind="QuanLyHoSo.aspx.cs" Inherits="ETech.WebApp.NCC.QuanLyHoSo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .QLHS__container {
            background-color: #fff;
            border-radius: 20px;
            box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
            margin: 180px 0 0 600px;
            max-width: 600px;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .QLHS__title {
            margin-top: 30px;
            margin-bottom: 30px;
        }

        .QLHS__box {
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

        .QLHS__box-input {
            float: left;
            width: 300px;
            position: relative;
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

        .QLHS__btn a {
            text-decoration: none;
            color: inherit;
        }

        .QLHS__btn {
            box-shadow: rgba(0, 0, 0, 0.05) 0px 6px 24px 0px, rgba(0, 0, 0, 0.08) 0px 0px 0px 1.5px;
            margin: 60px 30px;
            width: 100px;
            height: 30px;
            border: none;
            transition: .3s;
            border-radius: 7px;
            font-size: 18px;
            background: #fff;
        }

        .QLHS__btn-changePW {
            width: 140px;
            height: 30px;
        }

            .QLHS__btn-changePW:active,
            .QLHS__btn-save:active {
                transform: scale(0.8);
            }

            .QLHS__btn-changePW:hover,
            .QLHS__btn-save:hover {
                cursor: pointer;
                color: #fff;
                background-color: var(--primary-color);
            }

        .auto-style1 {
            float: left;
            width: 300px;
            position: relative;
            left: 0px;
            top: 0px;
        }

        .txterror {
            color: tomato;
            margin-top: 5px;
            display: block;
            position: relative;
            top: 10px;
            margin-bottom: 10px;
        }

        .Deo_BIET_CSS {
            display: flex;
            justify-content: space-around;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="QLHS__container">
        <div class="QLHS__title">
            <h3>QUẢN LÝ HỒ SƠ</h3>
        </div>
        <div class="QLHS__box">
            <h5>Tên đăng nhập</h5>
            <div class="auto-style1">
                <asp:Label ID="lbdangnhap" runat="server"></asp:Label>
                &nbsp;<span class="focus-border"></span>
            </div>
        </div>

        <div class="QLHS__box">
            <h5>Họ tên</h5>
            <div class="QLHS__box-input">
                <asp:TextBox ID="txthoten" class="effect" runat="server"></asp:TextBox>
                <span class="focus-border"></span>
            </div>
        </div>

        <div class="QLHS__box">
            <h5>Email</h5>
            <div class="QLHS__box-input">
                <asp:TextBox ID="txtemail" class="effect" runat="server"></asp:TextBox>
                <span class="focus-border"></span>
            </div>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtemail" ErrorMessage="Email không hợp lệ" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" CssClass="txterror" Display="Dynamic"></asp:RegularExpressionValidator>
        </div>

        <div class="QLHS__box">
            <h5>Địa chỉ</h5>
            <div class="QLHS__box-input">
                <asp:TextBox ID="txtdiachi" class="effect" runat="server"></asp:TextBox>
                <span class="focus-border"></span>
            </div>
        </div>

        <div class="QLHS__box">
            <h5>Số điện thoại</h5>
            <div class="QLHS__box-input">
                <asp:TextBox ID="txtsdt" class="effect" runat="server"></asp:TextBox>
                <span class="focus-border"></span>
            </div>
        </div>
        <asp:Label ID="lbThongBao" runat="server" Text="" CssClass="txterror"></asp:Label>

        <div class="QLHS__title">
            <h3>Đổi Mật Khẩu</h3>
        </div>
        <div class="QLHS__box">
            <h5>Mật Khẩu Cũ</h5>
            <div class="QLHS__box-input">
                <asp:TextBox ID="txtMKC" CssClass="effect" runat="server" placeholder="Old Password" TextMode="Password" Width="300px"></asp:TextBox>
                <span class="focus-border"></span>
            </div>
        </div>
        <div>
            <div class="QLHS__box">
                <h5>Mật Khẩu Mới</h5>
                <div class="QLHS__box-input">
                    <asp:TextBox ID="txtMKM" CssClass="effect" runat="server" placeholder="New Password" TextMode="Password" Width="300px"></asp:TextBox>
                    <span class="focus-border"></span>
                </div>
            </div>
            <div>
                <div class="QLHS__box">
                    <h5>Nhập Lại Mật Khẩu</h5>
                    <div class="QLHS__box-input">
                        <asp:TextBox ID="TextBox3" CssClass="effect" runat="server" placeholder="Confirm Password" TextMode="Password" Width="300px"></asp:TextBox>
                        <asp:CompareValidator ID="check" runat="server" ErrorMessage="Mật Khẩu không trùng khớp" ControlToValidate="TextBox3" ControlToCompare="txtMKM" Type="String" CssClass="txterror" Display="Dynamic"></asp:CompareValidator>
                        <span class="focus-border"></span>
                    </div>

                </div>
            </div>
            <div class="Deo_BIET_CSS">
                <asp:Button ID="Button3" runat="server" CssClass="QLHS__btn QLHS__btn-save" Text="Cập Nhập" CausesValidation="False" OnClick="Button3_Click" />
                <asp:Button ID="Button4" runat="server" CssClass="QLHS__btn QLHS__btn-changePW" Text="Hủy" OnClick="Button2_Click" CausesValidation="False" />
            </div>
        </div>
    </div>
</asp:Content>
