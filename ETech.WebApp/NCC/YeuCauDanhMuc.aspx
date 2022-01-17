<%@ Page Title="" Language="C#" MasterPageFile="~/NCC/MasterPage.Master" AutoEventWireup="true" CodeBehind="YeuCauDanhMuc.aspx.cs" Inherits="ETech.WebApp.NCC.YeuCauDanhMuc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        :root {
            --text-color: #333;
            --primary-color: #f15f1b;
            --white-color: #fff;
            --box-shadow: rgba(0, 0, 0, 0.16) 0px 0px 7px;
        }

        body {
            font-size: 16px;
            font-family: 'Roboto', sans-serif;
            background-color: #eee;
        }

        .YCDM__container {
            max-width: 700px;
            margin: 100px 0 0 500px;
            padding: 40px;
        }

        .YCDM__title {
            text-align: center;
            margin-bottom: 50px;
        }

        input[type="text"] {
            color: #333;
            width: 60%;
            box-sizing: border-box;
            font-size: 18px;
        }

        .nav-tabs {
            display: flex;
            list-style: none;
            margin: 0;
            padding: 0;
            border-bottom: 3px solid #ddd;
            justify-content: space-around;
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

                .nav-tabs li.YCDM__active a::after,
                .nav-tabs li:hover a::after {
                    background: var(--primary-color);
                }

        .YCDM__active a {
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

        .YCDM__row {
            display: table-row;
            background: #f6f6f6;
        }

            .YCDM__row:nth-of-type(odd) {
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

        .YCDM__link {
            text-decoration: none;
            color: var(--text-color);
            margin: 5px;
            font-weight: bold;
        }

            .YCDM__link:hover {
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
        .YCDM__box {
            width: 400px;
            display: flex;
            justify-content: space-around;
            align-items: center;
            font-size: 18px;
            margin-bottom: 30px;
            margin-top:30px;
        }

            .input-them {
                background:none;
                height: 35px;
                outline:none;
                border:none;
                border-bottom:2px solid var(--primary-color);
                
            }
            .input-them:focus,.input-them:hover{
                border-bottom:2px solid var(--primary-color);
                transform: translateY(-13%);
                transition:0.5s;
            }
        .YCDM__btn {
            background-color: var(--primary-color);
            width: auto;
            height: auto;
            border: none;
            border-radius: 8px;
            transition: .3s;
            cursor: pointer;
            box-shadow: var(--box-shadow);
            font-size: 15px;
            padding: 10px 20px;
            margin: 0px 0 20px;
            font-weight: 600;
            color: var(--white-color);
        }

            .YCDM__btn:active {
                transform: scale(.8);
            }

        .YCDM__img {
            width: 50px;
            height: 50px;
        }

        .YCDM__wrapper-chooseimg {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 230px;
            margin: 0 0 20px;
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
     .cnsp-error {
            color: var(--primary-color);
            display: block;
            margin-bottom:10px;
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
     <div class="YCDM__container">
        <h2 class="YCDM__title">DANH SÁCH DANH MỤC</h2>
        <div class="tabs">
            <ul class="nav-tabs">
                <li class="YCDM__active"><a href="#menu_1">YÊU CẦU THÊM</a></li>
                <li><a href="#menu_2">DANH MỤC CHỜ DUYỆT</a></li>
                <li><a href="#menu_3">DANH MỤC CỦA ETCH</a></li>
            </ul>
            <div class="tab-content">
                <div id="menu_1" class="tab-content-item">

                        <div class="YCDM__box">
                            <p>Chọn danh mục cần thêm:</p>
                            <asp:DropDownList CssClass="edit-container" ID="ddDM" runat="server"></asp:DropDownList>
                        </div>
         <asp:Button ID="btnThem" runat="server" Text="Gởi yêu cầu thêm" CssClass="YCDM__btn" OnClick="btnThem_Click"  />
                    <asp:Label ID="lblThongBao" runat="server" Text="" CssClass="cnsp-error"></asp:Label>
                    <h3>DANH MỤC CÓ SẴN</h3>
                    <table class="table" cellpadding="0" cellspacing="0">
                        <thead class="row_header">
                            <tr>
                              <th class="cell" style="min-width: 100px">ID</th>   
                              <th class="cell" style="min-width: 350px">Tên Danh Mục</th>
                                <th class="cell" style="min-width: 150px">Chức năng</th>
                            </tr>
                        </thead>
                        <tbody>
                             <asp:Panel ID="Panel1" runat="server"></asp:Panel>
                        </tbody>
                     </table>  
                </div>

                <div id="menu_2" class="tab-content-item">
                    <h2>DANH MỤC CHỜ DUYỆT</h2>
                   <table class="table" cellpadding="0" cellspacing="0">
                        <thead class="row_header">
                            <tr>
                              <th class="cell" style="min-width: 100px">ID</th>   
                              <th class="cell" style="min-width: 350px">Tên Danh Mục</th>
                                <th class="cell" style="min-width: 150px">Trạng thái</th>
                            </tr>
                        </thead>
                        <tbody>
                             <asp:Panel ID="Panel2" runat="server"></asp:Panel>
                        </tbody>
                     </table>  
                </div>

                  <div id="menu_3" class="tab-content-item">
                      <h2>DANH MỤC CỦA ETECH</h2>
                    <table class="table" cellpadding="0" cellspacing="0">
                        <thead class="row_header">
                            <tr>
                              <th class="cell" style="min-width: 100px">ID</th>   
                              <th class="cell" style="min-width: 350px">Tên Danh Mục</th>
                            </tr>
                        </thead>
                        <tbody>
                             <asp:Panel ID="Panel3" runat="server"></asp:Panel>
                        </tbody>
                     </table>   
                </div>
                
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function () {
            $('.tab-content-item').hide();
            $('.tab-content-item:first-child').fadeIn();
            $('.nav-tabs li').click(function () {
                $('.nav-tabs li').removeClass('YCDM__active')
                $(this).addClass('YCDM__active');

                let id_tab_content = $(this).children('a').attr('href');
                $('.tab-content-item').hide();
                $(id_tab_content).fadeIn();

                return false;
            });
        });
    </script>
</asp:Content>
