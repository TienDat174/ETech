<%@ Page Title="" Language="C#" MasterPageFile="~/NCC/MasterPage.Master" AutoEventWireup="true" CodeBehind="QuanLyDonHang.aspx.cs" Inherits="ETech.WebApp.NCC.QuanLyDonHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        :root {
            --primary-color: #f15f1b;
            --text-color: #333
        }

        body {
            font-size: 16px;
            font-family: 'Roboto', sans-serif;
            background-color: #eee;
        }

        .QLDH__container {
            max-width: 800px;
            margin: 230px 0 0 500px;
            padding: 40px;
        }

        .QLDH__title {
            text-align: center;
            margin-bottom: 30px;
        }

        .nav-tabs {
            display: flex;
            list-style: none;
            margin: 0;
            padding: 0;
            border-bottom: 3px solid #ddd;
            justify-content: space-between;
        }

            .nav-tabs li {
                margin-right: 10px;
            }

                .nav-tabs li a {
                    display: block;
                    padding: 6px 10px;
                    text-decoration: none;
                    position: relative;
                    color: var(--text-color);
                }

                    .nav-tabs li a:active {
                        color: var(--primary-color);
                    }

                    .nav-tabs li a::after {
                        content: "";
                        height: 3px;
                        width: 100%;
                        position: absolute;
                        left: 0px;
                        bottom: -3px;
                        background: transparent;
                    }

                .nav-tabs li.QLDH__active a::after,
                .nav-tabs li:hover a::after {
                    background: var(--primary-color);
                }

        .QLDH__active a {
            font-weight: bold;
        }

        .dangki_danhmuc {
            flex-grow: 1;
            color: var(--text-color);
            font-size: 17px;
            text-decoration: none;
            transition: .3s;
            text-align: right;
        }

            .dangki_danhmuc:hover {
                color: var(--primary-color);
            }

            .dangki_danhmuc .fas {
                margin-right: 5px;
            }

        /* Tab style */
        .table {
            width: 100%;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.2);
            display: table;
            text-align: center;
        }

        .row {
            display: table-row;
            background: #f6f6f6;
        }

            .row:nth-of-type(odd) {
                background: #e9e9e9;
            }

            .row_header {
                font-weight: 900;
                color: #ffffff;
                background:var(--primary-color);
            }

        .cell {
            display: table-cell;
            padding: 6px 12px;
        }

        .QLDH__link {
            text-decoration: none;
            color: var(--text-color);
            margin: 5px;
            font-weight: bold;
        }

            .QLDH__link:hover {
                color: var(--primary-color);
            }

       .tab-content-item {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .tab-content {
            margin-top: 10px;
        }
        .tab-content-item h2{
            margin:15px 0px
        }
        .qldm-column2{
        padding: 10px;
       border: 1px solid black;  
       line-height:1.3;
       text-align: left;
       font-weight:600;
        }
    h3{
        margin-bottom:10px;
       
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="QLDH__container">
        <h2 class="QLDH__title">QUẢN LÝ ĐƠN HÀNG</h2>
        <div class="tabs">
            <ul class="nav-tabs">
                <li class="QLDH__active"><a href="#menu_1">CHỜ DUYỆT</a></li>
                <li><a href="#menu_2">ĐANG VẬN CHUYỂN</a></li>
                <li><a href="#menu_3">ĐÃ THANH TOÁN</a></li>
                <li><a href="#menu_4">ĐÃ HUỶ</a></li>
            </ul>
            <div class="tab-content">
                <div id="menu_1" class="tab-content-item">
                    <div class="table">
                       <h3 >ĐƠN HÀNG CHỜ DUYỆT</h3>
                    <table class="table" cellpadding="0" cellspacing="0">
                        <thead class="row_header">
                            <tr>
                              <th class="cell" style="min-width: auto">Mã Đơn Hàng</th>   
                                <th class="cell" style="min-width: auto">Tên Sản phẩm</th>
                                <th class="cell" style="min-width: auto">Địa chỉ</th>
                                <th class="cell" style="min-width: auto">SDT</th>
                                 <th class="cell" style="min-width: auto">Ngày</th>
                                <th class="cell" style="min-width: auto">Chức năng</th>
                                
                            </tr>
                           
                        </thead>
                        <tbody>
                             <asp:Panel ID="Panel1" runat="server"></asp:Panel>
                        </tbody>
                     </table>  
                            
                        </div>
                    </div>
                

                <div id="menu_2" class="tab-content-item">
                    <div class="table">
                       <h3 >ĐƠN HÀNG ĐANG VẬN CHUYỂN</h3>
                    <table class="table" cellpadding="0" cellspacing="0">
                        <thead class="row_header">
                            <tr>
                             <th class="cell" style="min-width: auto">Mã Đơn Hàng</th>   
                                <th class="cell" style="min-width: auto">Tên Sản phẩm</th>
                                <th class="cell" style="min-width: auto">Địa chỉ</th>
                                <th class="cell" style="min-width: auto">SDT</th>
                                 <th class="cell" style="min-width: auto">Ngày</th>
                                <th class="cell" style="min-width: auto">Chức năng</th>
                            </tr>
                           
                        </thead>
                        <tbody>
                             <asp:Panel ID="Panel2" runat="server"></asp:Panel>
                        </tbody>
                     </table>  
                            
                        </div>
                    </div>

                <div id="menu_3" class="tab-content-item">
                    <div class="table">
                       <h3 >ĐƠN HÀNG ĐÃ THANH TOÁN</h3>
                    <table class="table" cellpadding="0" cellspacing="0">
                        <thead class="row_header">
                            <tr>
                        <th class="cell" style="min-width: auto">Mã Đơn Hàng</th>   
                                <th class="cell" style="min-width: auto">Tên Sản phẩm</th>
                                <th class="cell" style="min-width: auto">Địa chỉ</th>
                                <th class="cell" style="min-width: auto">SDT</th>
                                 <th class="cell" style="min-width: auto">Ngày</th>
                            </tr>
                           
                        </thead>
                        <tbody>
                             <asp:Panel ID="Panel3" runat="server"></asp:Panel>
                        </tbody>
                     </table>  
                            
                        </div>
                </div>

                <div id="menu_4" class="tab-content-item">
                    <div class="table">
                       <h3 >ĐƠN HÀNG ĐÃ HỦY</h3>
                    <table class="table" cellpadding="0" cellspacing="0">
                        <thead class="row_header">
                            <tr>
                    <th class="cell" style="min-width: auto">Mã Đơn Hàng</th>   
                                <th class="cell" style="min-width: auto">Tên Sản phẩm</th>
                                <th class="cell" style="min-width: auto">Địa chỉ</th>
                                <th class="cell" style="min-width: auto">SDT</th>
                                 <th class="cell" style="min-width: auto">Ngày</th>
                            </tr>
                        </thead>

                        <tbody>
                             <asp:Panel ID="Panel4" runat="server"></asp:Panel>
                        </tbody>
                     </table>  
                            
                        </div>
                            
                        </div>
                    </div>
                </div>
            </div>


    <script>
        $(document).ready(function () {
            $('.tab-content-item').hide();
            $('.tab-content-item:first-child').fadeIn();
            $('.nav-tabs li').click(function () {
                $('.nav-tabs li').removeClass('QLDH__active')
                $(this).addClass('QLDH__active');

                let id_tab_content = $(this).children('a').attr('href');
                $('.tab-content-item').hide();
                $(id_tab_content).fadeIn();

                return false;
            });
        });
    </script>
</asp:Content>
