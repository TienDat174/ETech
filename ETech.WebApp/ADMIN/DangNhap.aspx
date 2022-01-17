<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DangNhap.aspx.cs" Inherits="ETech.WebApp.ADMIN.DangNhap" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>ĐĂNG NHẬP</title>
  <link rel="stylesheet" href="../wwwroot/font-awsome/css/all.css"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>

  <link rel="preconnect" href="https://fonts.googleapis.com"/>
  <link rel="preconnect" href="https://fonts.gstatic.com" />
  <link
    href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
    rel="stylesheet"/>
    <style>
        :root {
  --primary-color: #2d21ff;
  --text-color: rgb(36, 36, 36);
  --text-shadown: rgb(138, 138, 138);
}

* {
  padding: 0;
  margin: 0;
  box-sizing: border-box;
}

body {
  font-family: 'Roboto', sans-serif;
  overflow: hidden;
}

.wave {
  position: fixed;
  bottom: 0;
  left: 0;
  height: 100%;
  z-index: -1;
  width: 1000px;
}

.container {
  width: 100vw;
  height: 100vh;
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  grid-gap: 7rem;
  padding: 0 2rem;
}

.img {
  display: flex;
  justify-content: flex-end;
  align-items: center;
}
.avatar{
    margin-left: 110px;
}
.login-content {
  display: flex;
/*  flex-direction: column;*/
  justify-content: flex-start;
  align-items: center;
 
 
 
}

.img img {
  width: 500px;
}

.form {
  box-shadow: rgba(99, 99, 99, 0.2) 0px 2px 8px 0px;
  padding: 20px 40px 40px 40px; 
  border-radius: 25px;
  width: 400px;
}

.login-content img {
  height: 100px;
  text-align: center;
}

.login-content h3 {
  margin: 5px 0;
  color: #333;
  text-transform: uppercase;
  font-size: 25px;
}

.login-content .input-div {
  position: relative;
  display: grid;
  grid-template-columns: 7% 93%;
  margin: 25px 0;
  padding: 5px 0;
  border-bottom: 2px solid #d9d9d9;
}
.title{text-align:center; margin-bottom:15px;}
.login-content .input-div.one {
  margin-top: 0;
}

.i {
  color: #d9d9d9;
  display: flex;
  justify-content: center;
  align-items: center;
}

.i i {
  transition: .3s;
}

.input-div>div {
  position: relative;
  height: 45px;
}

.input-div>div>h5 {
  position: absolute;
  left: 10px;
  top: 57%;
  transform: translateY(-50%);
  color: #999;
  font-size: 15px;
  transition: .3s;
}

.input-div:before,
.input-div:after {
  content: '';
  position: absolute;
  bottom: -2px;
  width: 0%;
  height: 2px;
  background-color: var(--primary-color);
  transition: .4s;
}

.input-div:before {
  right: 50%;
}

.input-div:after {
  left: 50%;
}

.input-div.focus:before,
.input-div.focus:after {
  width: 50%;
}

.input-div.focus>div>h5 {
  top: -5px;
  font-size: 15px;
}

.input-div.focus>.i>i {
  color: var(--primary-color);
}

.input-div>div>input {
  position: absolute;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  border: none;
  outline: none;
  background: none;
  padding: 0.5rem 0.7rem;
  font-size: 1.2rem;
  color: #555;
  font-family: 'Roboto', sans-serif;
}

.input-div.pass {
  margin-bottom: 4px;
}

a {
  display: block;
  text-align: center;
  text-decoration: none;
  color: #999;
  font-size: 0.9rem;
  transition: .3s;
}

a:hover {
  color: var(--primary-color);
}

.btn {
  display: block;
  width: 100%;
  height: 50px;
  border-radius: 25px;
  outline: none;
  border: none;
  background-image: linear-gradient(to right, #2d21ff, #130c9e, #39339b);
  background-size: 200%;
  font-size: 1.2rem;
  color: #fff;
  font-family: 'Roboto', sans-serif;
  text-transform: uppercase;
  margin: 1rem 0;
  cursor: pointer;
  transition: .5s;
  font-weight: bold;
}

.btn:hover {
  background-position: right;
}
.captcha-container{
  margin: 30px 0;
  display: flex;
  justify-content: space-between;
}
.captcha{
  background-color: red;
  width: 100px;
  height: 60px;
}
.input-captcha{
  display: flex;
  flex-direction: column;
}
.input-captcha input{
  border: none;
  width: 160px;
  height: 40px;
  font-size: 18px;
  border-bottom: 2px solid #d9d9d9;
  outline: none;
}
.text-captcha{
  color: #999;
  font-size: 14px;
}
.cbReLogin{
      margin-left:80px;
 }
.textRelogin{
    color: #999999;
    padding-left:5px;
}
.forgetPass{
    margin-top:20px;
}
@media screen and (max-width: 1050px) {
  .container {
    grid-gap: 5rem;
  }
}

@media screen and (max-width: 1000px) {
  form {
    width: 290px;
  }

  .login-content h2 {
    font-size: 2.4rem;
    margin: 8px 0;
  }

  .img img {
    width: 400px;
  }
}

@media screen and (max-width: 900px) {
  .container {
    grid-template-columns: 1fr;
  }

  .img {
    display: none;
  }

  .wave {
    display: none;
  }

  .login-content {
    justify-content: center;
  }
  .captcha-size{
      height:70px;
      width:100px;
  }
  .text-tb{
      text-align:center!important;
      color:orangered!important;
  }
}
    </style>
</head>
<body>
    <form runat="server">
        <div>
            <img class="wave" src="../wwwroot/img/icon/wave.png" />
            <div class="container">
                <div class="img">
                    <img src="../wwwroot/img/icon/background.svg" />
                </div>
                <div class="login-content">
                    <div class="form">
                        <img src="../wwwroot/img/icon/avatar.svg" class="avatar" />
                        <h3 class="title">Welcome</h3>
                        <div class="input-div one">
                        <div class="i">
                            <i class="fas fa-user"></i>
                        </div>
                        <div class="div">
                            <h5>Username</h5>
                            <asp:TextBox ID="txtUser" AutoCompleteType="Disabled" CssClass="input" runat="server"></asp:TextBox>
                        </div>
                    </div>
                        <div class="input-div pass">
                        <div class="i">
                            <i class="fas fa-lock"></i>
                        </div>
                        <div class="div">
                            <h5>Password</h5>
                            <asp:TextBox ID="txtPass" AutoCompleteType="Disabled" CssClass="input" runat="server" TextMode="Password"></asp:TextBox>
                        </div>
                    </div>
                        <div class="captcha-container">
                        <asp:Image ID="imgCaptcha" CssClass="captcha-size" runat="server" ImageUrl="~/ADMIN/CaptchaImage.aspx" />
                        <div class="input-captcha">
                            <p class="text-captcha">Vui lòng nhập mã Captcha</p>
                            <asp:TextBox ID="txtCaptcha" AutoCompleteType="Disabled" runat="server"></asp:TextBox>
                        </div>
                    </div>
                        <asp:Button ID="btnLogin" CssClass="btn" runat="server" Text="Đăng nhập" OnClick="btnLogin_Click" />
                        <asp:CheckBox ID="cbReLogin" CssClass="cbReLogin" runat="server" /><span class="textRelogin">Ghi nhớ đăng nhập</span>
                    <a class="forgetPass" href="#">Quên mật khẩu?</a>
                        <asp:Label ID="txtTB" CssClass="text-tb" runat="server" Text=""></asp:Label>
                    </div>
                </div>
            </div>
        </div>
       
    </form>
     <script>
         const inputs = document.querySelectorAll(".input");


         function addcl() {
             let parent = this.parentNode.parentNode;
             parent.classList.add("focus");
         }

         function remcl() {
             let parent = this.parentNode.parentNode;
             if (this.value == "") {
                 parent.classList.remove("focus");
             }
         }


         inputs.forEach(input => {
             input.addEventListener("focus", addcl);
             input.addEventListener("blur", remcl);
         });

     </script>
</body>
</html>
