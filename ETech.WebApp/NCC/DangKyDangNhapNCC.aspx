<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DangKyDangNhapNCC.aspx.cs" Inherits="ETech.WebApp.NCC.DangKyNCC" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../wwwroot/font-awsome/css/all.css"/>
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
    <link rel="preconnect" href="https://fonts.gstatic.com"/>
    <link
        href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
        rel="stylesheet"/>
    <title>Sign in & Sign up</title>
    <style>
        :root {
             --primary-color: #f15f1b;
            --shadown-color: #db4b08;
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
        .form {
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            padding: 0rem 5rem;
            transition: all 0.2s 0.7s;
            overflow: hidden;
            grid-column: 1 / 2;
            grid-row: 1 / 2;
        }
            .form.sign-up-form {
                opacity: 0;
                z-index: 1;
            }
            .form.sign-in-form {
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
            font-weight: bold;
            display:flex;
            align-items:center;
            justify-content:center;
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
            margin:0 95px;
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
            left: 25%;
        }
        .container.sign-up-mode .form.sign-up-form {
            opacity: 1;
            z-index: 2;
        }
        .container.sign-up-mode .form.sign-in-form {
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
            .form {
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
        .captcha-container {
            margin: 30px 0;
            display: flex;
            justify-content: space-between;
        }
        .captcha {
            background-color: red;
            width: 100px;
            height: 60px;
            margin-right: 20px;
        }
        .input-captcha {
            display: flex;
            flex-direction: column;
        }
            .input-captcha input {
                border: none;
                width: 160px;
                height: 40px;
                font-size: 18px;
                border-bottom: 2px solid gray;
                outline: none;
            }
                .input-captcha input:hover {
                    border-bottom: 2px solid var(--primary-color);
                }
        .text-captcha {
            color: #999;
            font-size: 14px;
        }
        .forget_pass {
            text-decoration: none;
            color: #999;
        }
            .forget_pass:hover {
                color: var(--primary-color);
            }
                    .txterror {
            color: tomato;
            display: block;
            margin-top: 5px;
        }              
.active{
    display: block;
}
 .forquit {
            display: none!important;
        }
        .txtCaptcha{
            border: 0;
            border-bottom: 2px solid gray;
            outline: 0;
            font-size: 1.3rem;
            color: white;
            padding: 7px 0;
            background: transparent;
            transition: border-color 0.2s;
            color: #7B68EE;
            width: 50%;
            text-align: center;
            border-color: yellowgreen;
        }
        .input-address{
            padding: 15px 15px 15px 15px;
            font-family: sans-serif;
        }
        .input-sign-up{
            font-weight: normal!important;
            
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="forms-container">
                <div class="signin-signup">
                    <div class="sign-in-form form" aria-autocomplete="inline">
                        <h2 class="title">Sign in</h2>
                        <div class="input-field">
                            <i class="fas fa-user"></i>
                            <%--<input type="text" placeholder="Username" class="input" />--%>
                            <asp:TextBox ID="txtdangnhap" AutoCompleteType="Disabled" CssClass="input" runat="server" placeholder="Username"></asp:TextBox>
                        </div>
                        <div class="input-field">
                            <i class="fas fa-lock"></i>
                            <%--<input type="password" placeholder="Password" class="input" />--%>
                             <asp:TextBox ID="txtmk" CssClass="input" AutoCompleteType="Disabled" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                        </div>
                        <div class="captcha-container">
                            <div class="input-captcha">
                                <asp:Image ID="Image1" CssClass="content-txt" runat="server" ImageUrl="~/NCC/CaptchaImage.aspx" />
                                <asp:TextBox ID="txtcaptcha1" AutoCompleteType="Disabled" CssClass="txtCaptcha content-txt"  runat="server" Width="100px" />
                            </div>
                        </div>
                        <asp:Label ID="lbTB1" runat="server" Text="" CssClass="txterror lbThongBao"></asp:Label>
                        
                        <asp:Button  ID="btnLogin" CssClass="btn" runat="server" Text="sign in " OnClick="btnLogin1_Click" CausesValidation="False"/>
                        <asp:CheckBox ID="cbReLogin" CssClass="cbReLogin" runat="server" /><span class="textRelogin">Ghi nhớ đăng nhập</span>
                        <a href="#" class="forget_pass">Quên mật khẩu?</a>
                    </div>
                    <div class="sign-up-form form">
                        <h2 class="title">Sign up</h2>
                        <div class="input-field">
                            <i class="fas fa-user"></i>
                            <asp:TextBox ID="txtTenDangNhap" AutoCompleteType="Disabled" CssClass="input input-sign-up" runat="server" placeholder="Tên đăng nhập"></asp:TextBox>
                            <%--<input type="text" placeholder="Username" class="input" />--%>
                        </div>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Bạn chưa nhập tên đăng nhập" ControlToValidate="txtTenDangNhap" CssClass="txterror" Display="Dynamic"></asp:RequiredFieldValidator>
                            <div class="input-field">
                            <i class="fas fa-user"></i>
                            <asp:TextBox ID="txtHoTen" AutoCompleteType="Disabled" CssClass="input" runat="server" placeholder="Tên Nhà Cung Cấp"></asp:TextBox>
                        </div>
                        <div class="input-field">
                            <i class="fas fa-lock"></i>
                           <asp:TextBox ID="txtMatKhau" AutoCompleteType="Disabled" CssClass="input" runat="server" placeholder="Mật khẩu (*)" TextMode="Password"></asp:TextBox>
                            
                        </div>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Bạn chưa nhập mật khẩu" ControlToValidate="txtMatKhau" CssClass="txterror" Display="Dynamic"></asp:RequiredFieldValidator>
                        <div class="input-field">
                            <i class="fas fa-lock"></i>
                            <asp:TextBox ID="txtNhapLaiMatKhau" AutoCompleteType="Disabled" CssClass="input" runat="server" placeholder="Nhập lại mật khẩu (*)" TextMode="Password"></asp:TextBox>
                        </div>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Mật khẩu không trùng khớp" ControlToValidate="txtNhapLaiMatKhau" ControlToCompare="txtMatKhau" Type="String" CssClass="txterror" Display="Dynamic"></asp:CompareValidator>

                        <div class="input-field">
                            <i class="fas fa-envelope"></i>
                            <asp:TextBox ID="txtEmail" AutoCompleteType="Disabled" CssClass="input" runat="server" placeholder="Email" TextMode="Email"></asp:TextBox>
                        </div>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email không hợp lệ" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" CssClass="txterror" Display="Dynamic"></asp:RegularExpressionValidator>

                        <div class="input-field">
                            <i class="fas fa-phone-alt"></i>
                            <%--<input type="text" placeholder="Phone number" id="txtphone" class="input" />--%>
                           <asp:TextBox ID="txtSDT" AutoCompleteType="Disabled" CssClass="input" runat="server" placeholder="Số điện thoại (*)" TextMode="Number"></asp:TextBox>
                        </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Bạn chưa nhập số điện thoại" ControlToValidate="txtSDT" CssClass="txterror" Display="Dynamic"></asp:RequiredFieldValidator>

                        <div class="input-field">
                            <i class="fas fa-map-marked"></i>
                            <%--<input type="text" placeholder="Address" id="txtdiachi" class="input" />--%>
                             <asp:TextBox ID="txtDiaChi" AutoCompleteType="Disabled" CssClass="input input-address" runat="server" placeholder="Địa Chỉ" TextMode="MultiLine"></asp:TextBox>
                        </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Bạn phải nhập địa chỉ" ControlToValidate="txtDiaChi" CssClass="txterror" Display="Dynamic"></asp:RequiredFieldValidator>
                        <div class="captcha-container">
                            <div class="input-captcha">
                                <asp:Image ID="imgCaptcha" CssClass="content-txt" runat="server" ImageUrl="~/NCC/CaptchaImage.aspx" />
                        <asp:TextBox ID="txtCaptchaText" CssClass="txtCaptcha content-txt"  runat="server" Width="100px" />
                            </div>
                        </div>
                        <asp:Label ID="lbThongBao" runat="server" Text="" CssClass="txterror lbThongBao"></asp:Label>                
                         <asp:Button ID="Button1" runat="server" CssClass="btn" Text="Sign up" OnClick="Button1_Click" CausesValidation="False" />
                        
                    </div>
                </div>
            </div>

            <div class="panels-container">
                <div class="panel left-panel">
                    <div class="content">
                        <h3>New here ?</h3>
                        <p>
                            Đăng kí tài khoản để bắt đầu kinh doanh bạn nhé !!!
                        </p>
                        <div class="btn transparent" id="sign-up-btn">
                            Sign up
                        </div>
                    </div>
                    <img src="../wwwroot/img/icon/BG_SIN_ncc.svg" class="image" alt="" />
                </div>
                <div class="panel right-panel">
                    <div class="content">
                        <h3>One of us ?</h3>
                        <p>
                            Bạn đã có tài khoản rồi, hãy đăng nhập nào!!!
                        </p>
                        <div class="btn transparent" id="sign-in-btn">
                            Sign in
                        </div>
                    </div>
                    <img src="../wwwroot/img/icon/BG_SUP_kh.svg" class="image" alt="" />
                </div>
            </div>
        </div>

        <script type="text/javascript">
            const sign_in_btn = document.querySelector("#sign-in-btn");
            const sign_up_btn = document.querySelector("#sign-up-btn");
            const container = document.querySelector(".container");
             var background = document.querySelector('.container-popup');
            sign_up_btn.addEventListener("click", () => {
                container.classList.add("sign-up-mode");
            });
            sign_in_btn.addEventListener("click", () => {
                container.classList.remove("sign-up-mode");
            });
        </script>
    </form>
</body>
</html>