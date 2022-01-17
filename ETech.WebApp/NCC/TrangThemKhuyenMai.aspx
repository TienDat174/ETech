<%@ Page Title="" Language="C#" MasterPageFile="~/NCC/MasterPage.Master" AutoEventWireup="true" CodeBehind="TrangThemKhuyenMai.aspx.cs" Inherits="ETech.WebApp.NCC.TrangThemKhuyenMai" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .QLTKe__container {
            background-color: #fff;
            border-radius: 20px;
            box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
            margin: 180px 0 0 600px;
            max-width: 600px;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

            .QLTKe__container h2 {
                margin-bottom: 30px;
            }

        .QLTKe__container-item {
            width: 100%;
            display:flex;
            justify-content: center;
            align-items: center;
            margin-top: 50px;
        }

        .QLTKe__select-date {
            display: flex;
            align-items: center;
        }

        input[type="date"i] {
            margin: 0px 0 0 0px;
            height: 35px;
            padding: 0;
            font-size: 16px;
            text-align: left;
        }

        .QLTKe__btn {
            font-size: 16px;
            margin: 40px 20px;
            height: 30px;
            width: 80px;
            border: none;
            border-radius: 5px;
            background-color: white;
            transition: .3s;
            box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
        }

            .QLTKe__btn:hover {
                cursor: pointer;
                background-color: var(--primary-color);
                color: white;
            }

            .QLTKe__btn:active {
                transform: scale(0.8);
            }
            .QLTKe__title {
            margin-top: 30px;
            margin-bottom: 30px;
        }
        .discount-wrapper{
            background-color: white;
       
            height: 450px;
            justify-content:center;
            width: 700px;
            margin-left: 30px;
            margin-top: 4%;
            box-shadow: 0 3px 10px 0 rgb(0 0 0 / 14%);
            border-radius: 3px;
            border: none;
            transition: 0.25s;      
            cursor: pointer;          
        }
        .discount-wrapper:hover{
            box-shadow: 2px 4px 10px #B2D426;
        }
        .input-percent{
        }
        .QLHS__box {
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

        .QLHS__box-input {
            float: left;
            width: 300px;
            position: relative;
        }
         .effect {
            height: 30px;
            border: 1px solid #ccc;
        }

            .effect ~ .focus-border {
                position: absolute;
                bottom: 0;
                left: 0;
                width: 0;
                height: 2px;
                background-color: var(--primary-color);
                transition: 0.3s;
            }

            .effect:focus ~ .focus-border {
                width: 100%;
                transition: 0.4s;
            }
            .QLHS__btn a {
            text-decoration: none;
            color: inherit;
        }

        .QLHS__btn {
            box-shadow: rgba(0, 0, 0, 0.05) 0px 6px 24px 0px, rgba(0, 0, 0, 0.08) 0px 0px 0px 1.5px;
            margin: 60px 30px;
            width: 100px;
            height: 30px;
            border: none;
            transition: .3s;
            border-radius: 7px;
            font-size: 18px;
            background: #fff;
        }

        .QLHS__btn-changePW {
            width: 140px;
            height: 30px;
        }

            .QLHS__btn-changePW:active,
            .QLHS__btn-save:active {
                transform: scale(0.8);
            }

            .QLHS__btn-changePW:hover,
            .QLHS__btn-save:hover {
                cursor: pointer;
                color: #fff;
                background-color: var(--primary-color);
            }
            .QLHS__title {
            margin-top: 30px;
            margin-bottom: 30px;
        }
            .btn_Flex{
                display: flex;
            }
            .edit-container {
            display: flex;
            align-items: center;
            justify-content: space-between;
            width: 150px;
            color:#1e272e;
            height:30px;
  }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
        
        
            
        <div class="QLTKe__container">
            <div class="QLHS__title">
            <h3>Thêm mới khuyến mãi</h3>
        </div>           
             <div class="QLHS__box">
            <h5>Họ tên</h5>
            <div class="QLHS__box-input">
                <asp:TextBox ID="txtTenKM" class="input-percent" runat="server" Width="300px" ></asp:TextBox>
            <span class="focus-border"></span>
            </div>
            </div>
            <div class="QLHS__box">
                <h5>Chọn ngày bắt đầu</h5>
            <asp:TextBox ID="txtNgayBD" CssClass="input-percent" TextMode="Date" runat="server" Width="300px"></asp:TextBox>
            </div>
            <div class="QLHS__box">
                <h5>Chọn ngày kết thúc</h5>
            <asp:TextBox ID="txtNgayKT" CssClass="input-percent" TextMode="Date" runat="server" Width="300px"></asp:TextBox>
            </div>
            <div class="QLHS__box">
            <h5>Tỷ Lệ Khuyến Mãi:</h5>
            <div class="QLHS__box-input">
                <asp:TextBox ID="txttl" class="input-percent" runat="server" Width="300px" ></asp:TextBox>
            <span class="focus-border"></span>
            </div>
            </div>        
            <div class="QLHS__box">
            <h5>Loại Sản Phẩm ID:</h5>
                
            <div class="QLHS__box-input">
                <asp:DropDownList CssClass="edit-container" ID="ddKM" runat="server"></asp:DropDownList>
            <span class="focus-border"></span>
            </div>
            </div>
            <div class="btn_Flex">
                <asp:Button ID="Button1" CssClass="QLHS__btn QLHS__btn-save" runat="server" OnClick="Button1_Click" Text="Cập nhật" />
                <asp:Button ID="Button2" CssClass="QLHS__btn QLHS__btn-changePW" runat="server" OnClick="Button2_Click" Text="Hủy" />  
            </div>

                               
            <br />
            <asp:Label ID="Label1" CssClass="lbSuccess" runat="server" Text=""></asp:Label>
        </div>
        
</asp:Content>
