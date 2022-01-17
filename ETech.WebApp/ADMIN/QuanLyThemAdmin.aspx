<%@ Page Title="" Language="C#" MasterPageFile="~/ADMIN/MasterPage.Master" AutoEventWireup="true" CodeBehind="QuanLyThemAdmin.aspx.cs" Inherits="ETech.WebApp.ADMIN.QuanLyThemAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style>
:root {
  --primary-color: #2d21ff;
  --text-color: rgb(36, 36, 36);
  --text-shadown: rgb(138, 138, 138);
}

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body,
input {
  font-family: 'Roboto', sans-serif;
}

.container {
  position: relative;
  width: 100%;
  background-color: #fff;
  min-height: 100vh;
  overflow: hidden;
}

.forms-container {
  position: absolute;
  width: 100%;
  height: 100%;
  top: 0;
  left: 0;
}

.signin-signup {
  position: absolute;
  top: 50%;
  transform: translate(-50%, -50%);
  left: 75%;
  width: 50%;
  transition: 1s 0.7s ease-in-out;
  display: grid;
  grid-template-columns: 1fr;
  z-index: 5;
}

form {
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
  padding: 10rem 5rem;
  transition: all 0.2s 0.7s;
  overflow: hidden;
  grid-column: 1 / 2;
  grid-row: 1 / 2;
}

form.sign-up-form {
  opacity: 0;
  z-index: 1;
}

form.sign-in-form {
  z-index: 2;
}

.title {
  font-size: 2.1rem;
  color: #444;
}

.input-field {
  max-width: 380px;
  width: 100%;
  margin: 2px 0;
  height: 45px;
  border-radius: 55px;
  display: grid;
  grid-template-columns: 15% 85%;
  padding: 0 0.4rem;
  position: relative;
}

.input-field i {
  text-align: center;
  line-height: 55px;
  color: #acacac;
  transition: 0.5s;
  font-size: 1.1rem;
}

.input-field input {
  background: none;
  outline: none;
  border: none;
  line-height: 1;
  font-weight: 600;
  font-size: 1.1rem;
  color: #333;
  border-bottom: 2px solid gray;
  transition: .3s linear;
}

.input:hover {
  border-bottom: 2px solid var(--primary-color);
}

.input-field input::placeholder {
  color: #aaa;
  font-weight: 500;
}

.social-text {
  padding: 0.7rem 0;
  font-size: 1rem;
}

.social-media {
  display: flex;
  justify-content: center;
}

.social-icon {
  height: 46px;
  width: 46px;
  display: flex;
  justify-content: center;
  align-items: center;
  margin: 0 0.45rem;
  color: #333;
  border-radius: 50%;
  border: 1px solid #333;
  text-decoration: none;
  font-size: 1.1rem;
  transition: 0.3s;
}

.social-icon:hover {
  color: var(--primary-color);
  border-color: var(--primary-color);
}

.btn {
  width: 150px;
  background-color: var(--primary-color);
  border: none;
  outline: none;
  height: 49px;
  border-radius: 49px;
  color: #fff;
  text-transform: uppercase;
  font-weight: 600;
  margin: 10px 0;
  cursor: pointer;
  transition: 0.5s;
}

.btn:hover {
  background-color: #140adb;
}

.panels-container {
  position: absolute;
  height: 100%;
  width: 100%;
  top: 0;
  left: 0;
  display: grid;
  grid-template-columns: repeat(2, 1fr);
}

.container:before {
  content: "";
  position: absolute;
  height: 2000px;
  width: 2000px;
  top: -10%;
  right: 48%;
  transform: translateY(-50%);
  background-image: linear-gradient(-45deg, var(--primary-color) 0%, var(--primary-color) 100%);
  transition: 1.8s ease-in-out;
  border-radius: 50%;
  z-index: 6;
}

.image {
  width: 100%;
  transition: transform 1.1s ease-in-out;
  transition-delay: 0.4s;
}

.panel {
  display: flex;
  flex-direction: column;
  align-items: flex-end;
  justify-content: space-around;
  text-align: center;
  z-index: 6;
}

.left-panel {
  pointer-events: all;
  padding: 3rem 17% 2rem 12%;
}

.right-panel {
  pointer-events: none;
  padding: 3rem 12% 2rem 17%;
}

.panel .content {
  color: #fff;
  transition: transform 0.9s ease-in-out;
  transition-delay: 0.6s;
}

.panel h3 {
  font-weight: 600;
  line-height: 1;
  font-size: 1.5rem;
}

.panel p {
  font-size: 0.95rem;
  padding: 0.7rem 0;
}

.btn.transparent {
  margin: 0;
  background: none;
  border: 2px solid #fff;
  width: 130px;
  height: 41px;
  font-weight: 600;
  font-size: 0.8rem;
}

.right-panel .image,
.right-panel .content {
  transform: translateX(800px);
}

/* ANIMATION */

.container.sign-up-mode:before {
  transform: translate(100%, -50%);
  right: 52%;
}

.container.sign-up-mode .left-panel .image,
.container.sign-up-mode .left-panel .content {
  transform: translateX(-800px);
}

.container.sign-up-mode .signin-signup {
  left: 30%;
}

.container.sign-up-mode form.sign-up-form {
  opacity: 1;
  z-index: 2;
}

.container.sign-up-mode form.sign-in-form {
  opacity: 0;
  z-index: 1;
}

.container.sign-up-mode .right-panel .image,
.container.sign-up-mode .right-panel .content {
  transform: translateX(0%);
}

.container.sign-up-mode .left-panel {
  pointer-events: none;
}

.container.sign-up-mode .right-panel {
  pointer-events: all;
}

@media (max-width: 870px) {
  .container {
    min-height: 800px;
    height: 100vh;
  }

  .signin-signup {
    width: 100%;
    top: 95%;
    transform: translate(-50%, -100%);
    transition: 1s 0.8s ease-in-out;
  }

  .signin-signup,
  .container.sign-up-mode .signin-signup {
    left: 50%;
  }

  .panels-container {
    grid-template-columns: 1fr;
    grid-template-rows: 1fr 2fr 1fr;
  }

  .panel {
    flex-direction: row;
    justify-content: space-around;
    align-items: center;
    padding: 2.5rem 8%;
    grid-column: 1 / 2;
  }

  .right-panel {
    grid-row: 3 / 4;
  }

  .left-panel {
    grid-row: 1 / 2;
  }

  .image {
    width: 200px;
    transition: transform 0.9s ease-in-out;
    transition-delay: 0.6s;
  }

  .panel .content {
    padding-right: 15%;
    transition: transform 0.9s ease-in-out;
    transition-delay: 0.8s;
  }

  .panel h3 {
    font-size: 1.2rem;
  }

  .panel p {
    font-size: 0.7rem;
    padding: 0.5rem 0;
  }

  .btn.transparent {
    width: 110px;
    height: 35px;
    font-size: 0.7rem;
  }

  .container:before {
    width: 1500px;
    height: 1500px;
    transform: translateX(-50%);
    left: 30%;
    bottom: 68%;
    right: initial;
    top: initial;
    transition: 2s ease-in-out;
  }

  .container.sign-up-mode:before {
    transform: translate(-50%, 100%);
    bottom: 32%;
    right: initial;
  }

  .container.sign-up-mode .left-panel .image,
  .container.sign-up-mode .left-panel .content {
    transform: translateY(-300px);
  }

  .container.sign-up-mode .right-panel .image,
  .container.sign-up-mode .right-panel .content {
    transform: translateY(0px);
  }

  .right-panel .image,
  .right-panel .content {
    transform: translateY(300px);
  }

  .container.sign-up-mode .signin-signup {
    top: 5%;
    transform: translate(-50%, 0);
  }
}

@media (max-width: 570px) {
  form {
    padding: 0 1.5rem;
  }

  .image {
    display: none;
  }

  .panel .content {
    padding: 0.5rem 1rem;
  }

  .container {
    padding: 1.5rem;
  }

  .container:before {
    bottom: 72%;
    left: 50%;
  }

  .container.sign-up-mode:before {
    bottom: 28%;
    left: 50%;
  }
}
.forget_pass {
  text-decoration: none;
  color: #999;
}

.forget_pass:hover {
  color: var(--primary-color);
}

.btn:active {
  transform: scale(.8);
}

.btn:hover {
  color: white;
  background-color: #F8333C;
}

.btn_update:hover {
  background-color: var(--primary-color);
}

.btn_add:hover {
  background-color: #06BCC1;
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

.txterror {
color: tomato;
margin-top: 5px;
display: block;
position: relative;
top: 10px;
margin-bottom: 10px;
}
.content-checkbox {
margin-left: 10px;
}

.content-checkbox input {
margin-right: 8px;
display: block;
width: 15px;
height: 15px;
}

.content-checkbox p {
font-size: 14px;
}
* {
color: #2b2b2b;
}
.content-body {
padding: 25px;
display: flex;
flex-direction: column;
align-items: center;
}

.content-body .img {
font-size: 100px;
text-align: center;
display: block;
color: #2f3542;
justify-content: center;
}

.content-body-header p {
text-align: center;
font-family: Calibri, 'Trebuchet MS', sans-serif;
font-weight: bold;
margin: 15px;
}
.content-body-items {
width: 70%;
margin: 0px auto 20px;
}
.khdangki-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: auto;
            padding: 70px 0;
        }
.content-header {
            display: flex;
            align-items: center;
            font-weight: bold;
            font-size: 17px;
            font-family: Calibri, 'Trebuchet MS', sans-serif;
        }

            .content-header p {
                width: 50%;
                text-align: center;
                margin: 0;
                padding: 15px 0;
            }

            .content-header a {
                display: block;
                width: 50%;
                text-decoration: none;
                background: #f7faff;
                box-shadow: rgba(0,0,0,0.2) -2px -2px 5px inset;
                height: 100%;
                text-align: center;
                padding: 15px 0;
                color: #171717;
            }
         .auto-style1 {
             float: left;
             width: 100%;
             position: relative;
             font-size: 18px;
             left: 0px;
             top: 0px;
         }
         .auto-style2 {
             float: left;
             width: 100%;;
             position: relative;
             font-size: 18px;
             left: 0px;
             top: 0px;
         }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div  >
       <form action="#" class="sign-up-form">
          <h2 class="title">Thêm Khách Hàng</h2>
          <div class="input-field">
            <i class="fas fa-user"></i>
            <asp:TextBox runat="server"  placeholder="Username" class="auto-style1" id="txtTenDangNhap"  ></asp:TextBox>
          </div>
            <div class="input-field">
            <i class="fas fa-lock"></i>
            <asp:TextBox runat="server" type="password" placeholder="Password" class="input" id="txtpass" ></asp:TextBox>
          </div>  
          <div class="input-field">
            <i class="fas fa-user"></i>
            <asp:TextBox runat="server" type="text" placeholder="Fullname" class="auto-style2" id="txtHoTen"  ></asp:TextBox>
          </div>
             
          <div class="input-field">
            <i class="fas fa-envelope"></i>
            <asp:TextBox runat="server" type="email" placeholder="Email" class="input" id="txtEmail" ></asp:TextBox>
          </div>
          <div class="input-field">
            <i class="fas fa-phone-alt"></i>
            <asp:TextBox runat="server" type="text" placeholder="Phone number" class="auto-style1" id="txtSDT" ></asp:TextBox>
          </div>
          <div class="input-field">
            <i class="fas fa-map-marked"></i>
            <asp:TextBox runat="server" type="text" placeholder="Address" class="input" id="txtDiaChi" ></asp:TextBox>
          </div>
          &nbsp;</form>
        <asp:Label ID="lbThongBao" runat="server" Text="" CssClass="txterror"></asp:Label>
        <div>
          <asp:button class="btn btn_add" runat="server" Text="Thêm mới" Height="30px" OnClick="btn_ThemMoi_Click"></asp:button>
          <asp:button class="btn" runat="server" Text="Hủy" Height="30px" OnClick="btn_Huy_Click"></asp:button>
        </div>
    </div>
    </div>
</asp:Content>

