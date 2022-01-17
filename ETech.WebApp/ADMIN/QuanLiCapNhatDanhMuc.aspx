﻿<%@ Page Title="" Language="C#" MasterPageFile="~/ADMIN/MasterPage.Master" AutoEventWireup="true" CodeBehind="QuanLiCapNhatDanhMuc.aspx.cs" Inherits="ETech.WebApp.ADMIN.QuanLiCapNhatDanhMuc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
          .tmdm-container{
           flex-direction: column;
            padding: 120px 0 0 200px;
           margin:auto;

        }
       
        h3{
            text-transform: uppercase;
            color: rgb(141, 141, 141);
            font-weight: 600;
            margin:auto;
        }
        .body{
            width:400px;
            margin:auto;
             box-shadow: 0 3px 10px 0 rgb(0 0 0 / 14%);
             border-radius: 3px;
             border: none;
             transition:1s;
        }
        .title{
            width:500px;
            margin:auto;
        }
        h4{
           font-weight: bold;
           color: rgb(141, 141, 141);
           margin-top:20px;
           text-align:center;
        }
        .tmdm-ten{   
             margin:auto;
            border: 0;
            border-bottom: 2px solid #3e67b9;
            outline: 0;
            font-size: 1.3rem;
            background: transparent;
            transition: border-color 0.2s;
            color: #3e67b9;
            width: 220px;
            text-align: center;
            border-color:#3e67b9;
        }
        .nut{
            width:500px;
            margin-left:30%;
            margin-top:20px;
            padding-bottom:20px;
        }
        .btnCapNhat{
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
        .btnHuy{
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
        .btnCapNhat:hover{
            background-color: white;
            border: 1px solid #3e67b9;
            color: #3e67b9;
        }
        .btnHuy:hover{
            background-color:white;
            color:#b2bec3;
            border: 1px solid #b2bec3;
        }
        .tmdm-error {
           font-size:18px;
            font-weight:bold;
            color:#e55039;
           margin-left:31%;
           margin-top:20px;
        }
        .cell{
            width:400px;
            text-align:center;
        }
        .lblThongBao{
            color:#b2bec3;
            font-size:18px;
            font-weight:bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="tmdm-container">
        <h3 style="text-align: center; font-size: 30px; font-weight: bold; margin-bottom: 20px">Cập Nhật Danh Mục</h3>
           <div class="body">
                  <asp:Table ID="tb1" runat="server" CssClass="tb1">
            <asp:TableRow runat="server">
                <asp:TableCell runat="server" CssClass="title">
                    <h4>Tên Danh Mục</h4>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow> 
              <asp:TableCell class="cell" runat="server">
                    <asp:TextBox ID="txtTenDM" runat="server" CssClass="tmdm-ten"></asp:TextBox> <br />
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Vui lòng nhập tên danh mục" ControlToValidate="txtTenDM" CssClass="tmdm-error" Display="Dynamic"></asp:RequiredFieldValidator>
                  <asp:Label ID="lblThongBao" runat="server" Text="" CssClass="lblThongBao"></asp:Label>
                </asp:TableCell>
             </asp:TableRow>
        </asp:Table>
               
        <div class="nut">
            <asp:Button ID="btnCapNhat"  runat="server" Text="Cập nhật" Class="btnCapNhat" OnClick="btnCapNhat_Click" />
            <asp:Button ID="btnHuy"  runat="server" Text="Hủy" Class="btnHuy" CausesValidation="false" OnClick="btnHuy_Click" />
        </div>
           </div>   
       </div>
</asp:Content>
