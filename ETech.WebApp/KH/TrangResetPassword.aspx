<%@ Page Title="" Language="C#" MasterPageFile="~/KH/MasterPage.Master" AutoEventWireup="true" CodeBehind="TrangResetPassword.aspx.cs" Inherits="ETech.WebApp.KH.TrangResetPassword" %>
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
  margin: 110px 0 0 450px;
  max-width: 600px;
  padding: 70px;
  display: flex;
  flex-direction: column;
  align-items: center;
}

.title{
  margin-bottom: 30px;
}
    .head-container {
  position: relative;
  top: -20px;
  left: -110px;
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

.input {
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

.effect~.focus-border {
  position: absolute;
  bottom: 0;
  left: 0;
  width: 0;
  height: 2px;
  background-color: var(--primary-color);
  transition: 0.3s;
}

.effect:focus~.focus-border {
  width: 100%;
  transition: 0.4s;
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
             margin: 60px 20px;
             width: 100px;
            height: 30px;
             border: none;
             transition: .3s;
             border-radius: 7px;
            font-size: 18px;
            background: #fff;
}

.btn:active {
  transform: scale(.8);
}

.btn:hover {
  color: white;
  background-color: #F8333C;
}
.btnMo{
background:white;
display:none;
}
.btnMo:hover{
background: #6AB547;
transition:0.25s ;
}
.btnKhoa{
background:white;
width: 108px;
display:none;
}
.btnKhoa:hover{
background:#70161E;
transition:0.25s;
}

.btn_update:hover {
  background-color: var(--primary-color);
}

.btn_add:hover {
  background-color: #06BCC1;
}
.auto-style1 {
            float: left;
            width: 300px;
            position: relative;
            left: 0px;
            top: 0px;
        }
                .cnsp-rblTrangThai tbody tr td {
            display: flex;
        }

            .cnsp-rblTrangThai tbody tr td input {
                margin: 0;
                margin-top: 2px;
                margin-right: 10px;
                width: 10px;
            }

            .cnsp-rblTrangThai tbody tr td label {
                font-weight: normal;
            }

            .cnsp-rblTrangThai tbody tr td:last-child {
                display: flex
            }
            table.cnsp-table tbody tr td:last-child:not(.cnsp-rblTrangThai tbody tr td:last-child) {
            width: 100%;
            display: block;
            }
        .txterror {
            color: tomato;
            margin-top: 10px;
            display: block;
            position: relative;
            top: 10px;
            margin-bottom: 10px;
        }
        .auto-style2 {
            width: 50%;
            display:inline-flex;
            margin:auto;
        }
        .tmsp-error{
            color:var(--primary-color);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="title">
          <h3>ĐỔI MẬT KHẨU</h3>
       </div>
        <div class="div">
          <h5>Mật khẩu mới</h5>
          <div class="input">
              <asp:TextBox ID="txtpw2" runat="server" type="password"></asp:TextBox><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Vui lòng nhập mật khẩu" ControlToValidate="txtpw2" CssClass="tmsp-error" Display="Dynamic"></asp:RequiredFieldValidator>    
            <span class="focus-border"></span>
          </div>
        </div>

        <div class="div">
          <h5>Xác nhận mật khẩu</h5>
          <div class="input">
              <asp:TextBox ID="txtpw3" runat="server" type="password"></asp:TextBox><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Vui lòng nhập mật khẩu" ControlToValidate="txtpw3" CssClass="tmsp-error" Display="Dynamic"></asp:RequiredFieldValidator>  
              <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Không trùng khớp mật khẩu" ControlToValidate="txtpw3" ControlToCompare="txtpw2"></asp:CompareValidator>
            <span class="focus-border"></span>
          </div>
        </div>
        <div class="auto-style2">
          <asp:button ID="btnCapNhat" class="btn btn_update" runat="server" Text="Cập nhật" Height="30px" OnClick="btnCapNhat_Click"></asp:button>
          <asp:button ID="btnHuy" class="btn btn_add" runat="server" Text="Hủy" Height="30px" CausesValidation="false" OnClick="btnHuy_Click" ></asp:button>
        </div>
    </div>
</asp:Content>
