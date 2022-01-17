<%@ Page Title="" Language="C#" MasterPageFile="~/ADMIN/MasterPage.Master" AutoEventWireup="true" CodeBehind="QuanLyXoaDanhMuc.aspx.cs" Inherits="ETech.WebApp.ADMIN.QuanLyXoaDanhMuc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
        .xoansx-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
             margin:auto;
             box-shadow: 0 3px 10px 0 rgb(0 0 0 / 14%);
             border-radius: 3px;
             transition:1.5s;
             width:800px;
             margin-top:240px;
             transition:1.5s;
             margin-left:32%;
             height:200px;
 
        }
        .xoansx-header {
            font-size: 18px;
            margin-bottom: 30px;
            text-transform: uppercase;
            color: rgb(141, 141, 141);
            font-weight: 600;
        }
        .lblDanhMuc{
            font-size: 18px;
            color:#3e67b9;
            font-weight: bold;
        }
        .xoansx-btn {
            padding: 10px 15px;
            min-width: 85px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
            
        }
        .xoansx-btn-xoa {
         font-size: 18px;
           background-color: #3e67b9;
          color: white;
            width:80px;
           height:40px;
            cursor: pointer;
            transition: 0.25s;
            border-radius: 2px;
            border:none;
        }
        .xoansx-btn-xoa:hover{
         background-color: white;
            border: 1px solid #3e67b9;
            color: #3e67b9;
        }
        .xoansx-btn-huy {
            background-color:#b2bec3;
          font-size: 18px;
          color: white;
           width:80px;
           height:40px;
           cursor: pointer;
           transition: 0.25s;
           border-radius: 2px;
           border:none;
        }
        .xoansx-btn-huy:hover{
           background-color:white;
            color:#b2bec3;
            border: 1px solid #b2bec3;  
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <div class="xoansx-container">
        <p class="xoansx-header">Bạn có chắc chắn muốn xóa danh mục :
                       <asp:Label ID="lblDanhMuc" runat="server" Text="" CssClass="lblDanhMuc"></asp:Label>  
        </p> 
             <div class="xoansx-btns">
                    <asp:Button ID="btnXoa" runat="server" Text="Xóa" class="xoansx-btn xoansx-btn-xoa" OnClick="btnXoa_Click" />
                    <asp:Button ID="btnHuy" runat="server" Text="Hủy" class="xoansx-btn xoansx-btn-huy" CausesValidation="false" OnClick="btnHuy_Click"/>
          </div>
    </div>
</asp:Content>
