<%@ Page Title="" Language="C#" MasterPageFile="~/ADMIN/MasterPage.Master" AutoEventWireup="true" CodeBehind="QuanLyChiTietDanhMuc1.aspx.cs" Inherits="ETech.WebApp.ADMIN.QuanLyChiTietDanhMuc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
         .tmdm-container{
           flex-direction: column;
            padding: 120px 0 0 200px;
           margin:auto;

        }
        .head-container { 
            margin:auto;
            margin-left:40px;
            text-decoration: none;
            color: #333;
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
        .qldm-ten{   
            font-size: 1.3rem;
            transition: border-color 0.2s;
            color:#3e67b9 ;
            font-weight:500;
            font-size:25px;
            text-align:center;
        }
        .nut{
            width:500px;
            margin-left:20%;
            margin-top:20px;
            padding-bottom:20px;
        }
        .btnDuyet{
          font-size: 17px;
          background-color: #3e67b9;
          color: white;
            width:120px;
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
           width:120px;
           height:40px;
           cursor: pointer;
           transition: 0.25s;
           border-radius: 2px;
           border:none;
        }
        .btnDuyet:hover{
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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="tmdm-container">
            <a href="QuanLyDanhMuc.aspx" class="head-container"><i class="fas fa-long-arrow-alt-left"></i>Back</a>
        <h3 style="text-align: center; font-size: 30px; font-weight: bold; margin-bottom: 20px">DANH MỤC CHỜ DUYỆT</h3>
           <div class="body">
                  <asp:Table ID="tb1" runat="server" CssClass="tb1">
            <asp:TableRow runat="server">
                <asp:TableCell runat="server" CssClass="title">
                    <h4>Tên Danh Mục</h4>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow> 
              <asp:TableCell class="cell" runat="server">
                <asp:Label ID="lblTen" Class="qldm-ten" runat="server" Text=""></asp:Label>        
                </asp:TableCell>
             </asp:TableRow>
        </asp:Table>

        <div class="nut">
            <asp:Button ID="btnDuyet"  runat="server" Text="Duyệt" Class="btnDuyet" OnClick="btnDuyet_Click"/>
            <asp:Button ID="btnHuy"  runat="server" Text="Hủy Danh Mục" Class="btnHuy" OnClick="btnHuy_Click"/>
        </div>
           </div>   
       </div>
</asp:Content>
