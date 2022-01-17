<%@ Page Title="" Language="C#" MasterPageFile="~/KH/MasterPage.Master" AutoEventWireup="true" CodeBehind="TrangQuenMatKhau.aspx.cs" Inherits="ETech.WebApp.KH.TrangQuenMatKhau" %>
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
            padding:40px;
            display: flex;
            flex-direction: column;
            align-items: center;
            height:200px;
     }
    .container h3{
        color:var(--primary-color);
    }
    .input-email{
        width:230px;
        height:30px;
        border:none;
        border-bottom:2px solid var(--primary-color);
    }
    .input-email:active{
        border:none;
        outline:none;
        border-bottom:1px solid var(--primary-color);
    }
    .btnGoi{
        margin-top:20px;
        width:90px;
        height:50px;
        background-color:var(--primary-color);
        color:white;
        border-radius:5px;
        font-size:15px;
    }
      .btnGoi:hover, .btnGoi:active{
        background-color:white;
        color:var(--primary-color);
    }
      .error{
          margin-top:10px;
          color:var(--primary-color);
          font-size:20px;

      }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h3>Nhập Email để đổi mật khẩu</h3>
        <asp:TextBox ID="txtEmail" runat="server" CssClass="input-email"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtemail" runat="server" ErrorMessage="Bạn phải nhập email" CssClass="error"></asp:RequiredFieldValidator>
        <asp:Button ID="btnSend" runat="server" Text="Gởi" CssClass="btnGoi" OnClick="btnSend_Click" />
    </div>
</asp:Content>
