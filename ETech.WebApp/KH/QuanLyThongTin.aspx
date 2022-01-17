<%@ Page Title="" Language="C#" MasterPageFile="~/KH/MasterPage.Master" AutoEventWireup="true" CodeBehind="QuanLyThongTin.aspx.cs" Inherits="ETech.WebApp.KH.QuanLyThongTin" %>
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
            height: 70px;
             border: none;
             transition: .3s;
             border-radius: 7px;
            font-size: 18px;
            background: #fff;
}

.btn_update{
    background-color:var(--primary-color);
    color:white;
    font-weight:600;
}
         .btn_update:hover {
             background-color: white;
             color: var(--primary-color);
         }
         .btn_huy{
               background-color: dimgrey;
               color:white;
             font-weight:600;
         }
.btn_huy:hover {
  background-color: white;
  color:dimgrey;
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
          <a href="TrangChu.aspx" class="head-container"><i class="fas fa-long-arrow-alt-left"></i>Back</a>
          <h3>QUẢN LÝ THÔNG TIN CÁ NHÂN</h3>
       </div>
        <div class="div">
          <h5>Tên đăng nhập</h5>
          <div class="auto-style1">
              <asp:Label ID="lbdangnhap" runat="server"></asp:Label>
            <span class="focus-border"></span>
          </div>
        </div>

        <div class="div">
          <h5>Họ tên</h5>
          <div class="input">
              <asp:TextBox ID="txthoten" runat="server"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Vui lòng nhập họ tên" ControlToValidate="txthoten" CssClass="tmsp-error" Display="Dynamic"></asp:RequiredFieldValidator>    
            <span class="focus-border"></span>
          </div>
        </div>

        <div class="div">
          <h5>Email</h5>
          <div class="input">
              <asp:TextBox ID="txtemail" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Vui lòng nhập email" ControlToValidate="txtemail" CssClass="tmsp-error" Display="Dynamic"></asp:RequiredFieldValidator>    
            <span class="focus-border"></span>
          </div>
        </div>

        <div class="div">
          <h5>Địa chỉ</h5>
          <div class="input">
              <asp:TextBox ID="txtdiachi" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Vui lòng nhập địa chỉ" ControlToValidate="txtdiachi" CssClass="tmsp-error" Display="Dynamic"></asp:RequiredFieldValidator>    
            <span class="focus-border"></span>
          </div>
        </div>
        
       <div class="div">
          <h5>Số điện thoại</h5>
          <div class="input">
              <asp:TextBox ID="txtsdt" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Vui lòng nhập số điện thoại" ControlToValidate="txtsdt" CssClass="tmsp-error" Display="Dynamic"></asp:RequiredFieldValidator>    
            <span class="focus-border"></span>
          </div>
        </div>

        <asp:Label ID="lbThongBao" runat="server" Text="" CssClass="txterror"></asp:Label>
        <div class="auto-style2">
          <asp:button ID="btnCapNhat" class="btn btn_update" runat="server" Text="Cập nhật" Height="30px" OnClick="btnCapNhat_Click"></asp:button>
          <asp:button ID="btnHuy" class="btn btn_huy" runat="server" Text="Hủy" Height="30px" CausesValidation="false" OnClick="btnHuy_Click"  ></asp:button>
        </div>
    </div>
</asp:Content>
