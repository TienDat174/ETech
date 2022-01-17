﻿<%@ Page Title="" Language="C#" MasterPageFile="~/ADMIN/MasterPage.Master" AutoEventWireup="true" CodeBehind="QuanLyAdminChiTiet.aspx.cs" Inherits="ETech.WebApp.ADMIN.QuanLyAdminChiTiet" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
:root {
  --primary-color: #3e67b9;
}

body {
  font-family: 'Roboto', sans-serif;
  font-size: 18px;
  padding: 0;
  margin: 0;
  background-color: #eee;
}

.container {
  background-color: white;
  border-radius: 20px;
  box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
  margin: 120px 0 0 600px;
  max-width: 600px;
  height: 600px;
  padding: 70px;
  display: flex;
  flex-direction: column;
  align-items: center;
}

.title{
  margin-top: 30px;
  margin-bottom: 30px;
}

.head-container {
  position: relative;
  top: -20px;
  left: -150px;
}

.div {
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
.effect {
  height: 30px;
  border: 1px solid #ccc;
}
h5 {
  padding: 0;
  margin: 0;
  align-items: center;
}

a {
  text-decoration: none;
  color: inherit;
}

.btn {
  box-shadow: rgba(0, 0, 0, 0.05) 0px 6px 24px 0px, rgba(0, 0, 0, 0.08) 0px 0px 0px 1px;
  margin-top: 10px;
  margin-left: 10px;
  width: 100px;
  height: 30px;
  border: none;
  transition: .3s;
  border-radius: 7px;
  font-size: 18px;
  background: #fff;
}


.btn:hover {
  cursor: pointer;
  color: white;
  background-color: #F8333C;
}
.btnMo{
background:white;
display:none;
color:var(--primary-color);
width: 150px;
}
.btnMo:hover{
background: var(--primary-color);
transition:0.25s ;
color:white;
}
.btnKhoa{
background:white;
width: 150px;
display:none;
color:var(--primary-color);
padding:5px
}
.btnKhoa:hover{
background:var(--primary-color);
transition:0.25s;
}
.btn_update{
color:var(--primary-color);
width:150px;
}
.btn_update:hover {
  background-color: var(--primary-color);
}

        .auto-style2 {
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
        .txterror {
            color: tomato;
            margin-top: 5px;
            display: block;
            position: relative;
            top: 10px;
            margin-bottom: 10px;
        }
        .QLHS__box {
            width: 500px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-size: 21px;
            padding: 7px;
        }
         .QLHS__box-input {
            float: left;
            width: 300px;
            position: relative;
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
         .auto-style1 {
            float: left;
            width: 300px;
            position: relative;
            left: 0px;
            top: 0px;
        }
         .auto-style3 {
             width: 100%;
             display:flex;
             margin-bottom:20px;
             margin-left:270px;
         }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="auto-style2">
        <div class="title">
            <a href="QuanLyAdmin.aspx" class="head-container"><i class="fas fa-long-arrow-alt-left"></i>Back</a>
            <h3>QUẢN LÝ ADMIN CHI TIẾT</h3>
        </div>
        <div class="QLHS__box">
            <h5>Tên đăng nhập</h5>
            <div class="auto-style1">
                 <asp:Label ID="lbdangnhap" class="effect" runat="server" Width="300px"></asp:Label>
            </div>
        </div>

        <div class="QLHS__box">
            <h5>Họ tên</h5>
            <div class="QLHS__box-input">
                <asp:TextBox ID="txthoten" class="effect" runat="server" Width="300px"></asp:TextBox>
            <span class="focus-border"></span>
            </div>
        </div>

        <div class="QLHS__box">
            <h5>Email</h5>
            <div class="QLHS__box-input">
                 <asp:TextBox ID="txtemail" class="effect" runat="server" Width="300px"></asp:TextBox>
            <span class="focus-border"></span>
            </div>
        </div>

        <div class="QLHS__box">
            <h5>Địa chỉ</h5>
            <div class="QLHS__box-input">
                <asp:TextBox ID="txtdiachi" class="effect" runat="server" Width="300px"></asp:TextBox>
            <span class="focus-border"></span>
            </div>
        </div>

        <div class="QLHS__box">
            <h5>Số điện thoại</h5>
            <div class="QLHS__box-input">
                <asp:TextBox ID="txtsdt" class="effect" runat="server" Width="300px"></asp:TextBox>
            <span class="focus-border"></span>
            </div>
        </div>
        <asp:Label ID="lbThongBao" runat="server" Text="" CssClass="txterror"></asp:Label>
        <div class="auto-style3">
          <asp:button class="btn btn_update" runat="server" Text="Cập nhật" Height="30px" OnClick="btn_CapNhap_Click"></asp:button>
          <asp:button class="btn btnKhoa" runat="server" Text="Khoá tài khoản" Height="30px" OnClick="btn_Khoa_Click" ID="Khoa"></asp:button>
           <asp:button class="btn btnMo" runat="server" Text="Mở Tài Khoản" Height="30px" OnClick="btn_Mo_Click" ID="Mo"></asp:button>
        </div>
    </div>
</asp:Content>
