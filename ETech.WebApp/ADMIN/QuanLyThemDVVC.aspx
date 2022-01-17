<%@ Page Title="" Language="C#" MasterPageFile="~/ADMIN/MasterPage.Master" AutoEventWireup="true" CodeBehind="QuanLyThemDVVC.aspx.cs" Inherits="ETech.WebApp.ADMIN.QuanLyThemDVVC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   <style>
    :root {
  --primary-color: #3e67b9;
}

body {
  margin: 0;
  padding: 0;
  background-color: #eee;
}

.container {
  background-color: white;
  border-radius: 20px;
  box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
  font-family: 'Roboto', sans-serif;
  max-width: 550px;
  height: 350px;
  text-align: center;
  margin: 150px 0 0 630px;
  padding: 40px;
}

.head-container {
  position: relative;
  top: -20px;
  left: -180px;
  text-decoration: none;
  color: #333;
}

.title{
  margin-bottom: 30px;
}

.name_input {
  display: flex;
  justify-content: space-evenly;
  align-items: center;
}
.price_input{
    margin:auto;
   display: flex;
  justify-content: space-evenly;
  align-items: center;
}
.price_input h4{
    margin-top:20px;
}
:focus {
  outline: none;
}

.input {
  float: left;
  width: 200px;
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
      margin:auto;
     border: 0;
     border-bottom: 2px solid #3e67b9;
      outline: 0;
      font-size: 1.3rem;
      background: transparent;
      transition: border-color 0.2s;
      color: #3e67b9;
      width: 150px;
     text-align: center;
     border-color:#3e67b9;
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
.tmdm-error {
     font-size:18px;
     font-weight:bold;
     color:#3e67b9;
     margin:auto;
     width:400PX;
}
.btn{
    margin:auto;
    margin-top:30px;
}
.btn-add {
    font-size: 17px;
    background-color: #3e67b9;
    color: white;
    width:80px;
    height:40px;
    cursor: pointer;
    transition: 0.25s;
    border-radius: 2px;
    border:none;
}

.btn-add:active {
  transform: scale(.8);
}

.btn-add:hover {
      background-color: white;
      border: 1px solid #3e67b9;
      color: #3e67b9;
}
.btn-huy{
        background-color:#b2bec3;
        font-size: 17px;
        color: white;
        width:80px;
        height:40px;
        cursor: pointer;
        transition: 0.25s;
        border-radius: 2px;
        border:none;
}
.btn-huy:hover{
            background-color:white;
            color:#b2bec3;
            border: 1px solid #b2bec3;
}
.name_input h4{
    margin: 0;
}
 .lblThongBao{
             color:#b2bec3;
            font-size:18px;
            font-weight:bold;
        }
 .error{
     margin-top:20px;
 }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
    <div class="title">
      <a href="QuanLyDVVC.aspx" class="head-container"><i class="fas fa-long-arrow-alt-left"></i>Back</a>
      <h2>QUẢN LÍ THÊM ĐƠN VỊ VẬN CHUYỂN</h2>
    </div>
    <div class="name_input">
      <h4>Tên đơn vị vận chuyển</h4>
      <div class="input">
          <asp:TextBox ID="txtDVVC" runat="server" class="effect price"></asp:TextBox>
      </div>
    </div>
    <div class="price_input">
      <h4>Phí vận chuyển</h4>
      <div class="input">
          <asp:TextBox ID="txtprice" runat="server" class="effect"></asp:TextBox>
      </div>
    </div>
    <div class="error">
      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Vui lòng nhập tên đươn vị vận chuyển" ControlToValidate="txtDVVC" CssClass="tmdm-error" Display="Dynamic"></asp:RequiredFieldValidator>
        <br />
      <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Vui lòng nhập phí vận chuyển" ControlToValidate="txtprice" CssClass="tmdm-error" Display="Dynamic"></asp:RequiredFieldValidator>
       <br />
        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Giá tiền phải lớn hơn hoặc bằng 0" ControlToValidate="txtprice" ValueToCompare="0" Type="Integer" Operator="GreaterThanEqual" CssClass="tmdm-error" Display="Dynamic"></asp:CompareValidator>
        <br />
      <asp:Label ID="lblThongBao" runat="server" Text="" CssClass="lblThongBao"></asp:Label>
   </div>
    <div class="btn">
        <asp:Button ID="btnThem" runat="server" class="btn-add" Text="Thêm" OnClick="btnThem_Click"/>
        <asp:Button ID="btnHuy" runat="server" class="btn-huy" Text="Hủy" CausesValidation="false" OnClick="btnHuy_Click"/>
    </div>
  </div>
</asp:Content>
