<%@ Page Title="" Language="C#" MasterPageFile="~/KH/MasterPage.Master" AutoEventWireup="true" CodeFile="TrangChiTietSanPham.aspx.cs" Inherits="ETech.WebApp.KH.TrangChiTietSanPham" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
      :root {
            --primary-color: #3e67b9;
            --orange-color: #f15f1b;
            --background-color: #c5d4fc;
            --black-color: #333;
            --white-color: #fff;
            --gray-color: #808080;
            --lightgray: rgb(231, 231, 231);
            --box-shadow: rgba(0, 0, 0, 0.16) 0px 3px 6px, rgba(0, 0, 0, 0.23) 0px 3px 6px;
        }

        body {
            font-family: 'Roboto', sans-serif;
            font-size: 20px;
        }

        * {
            margin: 0;
            padding: 0;
        }

        .ChiTietSP__header {
            margin-top: 50px;
        }

        .card-wrapper {
            box-shadow: rgba(149, 157, 165, 0.2) 0px 8px 24px;
            max-width: 90%;
            margin: 0 auto;
            border: 1.5px solid #ddd;
            border-radius: 5px;
            padding: 30px 0;
        }
        .img-showcase {
            margin-bottom: 5px;
            display: flex;
            transition: all 0.5s ease;
        }

        .img-showcase img {
                width:100%;
                object-fit:cover;
        }
      /*  img {
            width: 100%;
            display: block;
            object-fit: cover;
        }*/
        .product-title {
            font-size: 28px;
            color: var(--primary-color);
            margin: 1rem 0;
        }

        .product-link {
            text-decoration: none;
            text-transform: uppercase;
            font-weight: 400;
            font-size: 20px;
            display: inline-block;
            margin-bottom: 0.5rem;
            background: #256eff;
            color: #fff;
            padding: 0 0.3rem;
            transition: all 0.5s ease;
        }

            .product-link:hover {
                opacity: 0.9;
            }

        .product-rating {
            color: var(--orange-color);
        }

            .product-rating span {
                font-weight: 600;
                color: #252525;
            }

        .product-price {
            margin: 1rem 0;
            font-size: 22px;
            font-weight: 700;
        }

            .product-price span {
                font-weight: 400;
            }

        .last-price span {
            color: var(--orange-color);
            text-decoration: line-through;
        }

        .new-price span {
            color: var(--primary-color);
        }

        .product-detail h4 {
            text-transform: capitalize;
            color: #12263a;
            padding-top: 20px;
            font-size: 22px;
        }

        .product-detail li {
            font-size: 20px;
            padding: 3px;
            opacity: 0.8;
        }

        .product-detail ul {
            font-size: 15px;
        }

            .product-detail ul li {
                margin: 0;
                list-style: none;
                background-size: 18px;
                padding-left: 1.7rem;
                font-weight: 600;
                opacity: 0.9;
            }

                .product-detail ul li span {
                    font-weight: 400;
                }

        .purchase-info {
            margin: 1.5rem 0;
        }

            .purchase-info input,
            .purchase-info .btn {
                border: 1.5px solid #ddd;
                border-radius: 25px;
                text-align: center;
                padding: 0.45rem 0.8rem;
                outline: 0;
                margin-right: 0.2rem;
                margin-bottom: 1rem;
            }

            .purchase-info input {
                width: 60px;
                font-size: 20px;
            }

            .purchase-info .btn {
                cursor: pointer;
                color: #fff;
                font-size: 20px;
                padding: 5px;
                height: 40px;
                width:120px;
            }

                .btnBuy {
                    background: var(--primary-color);
                }

                .btnBack {
                    background: var(--gray-color);
                }
        @media screen and (min-width: 992px) {
            .card {
                display: grid;
                grid-template-columns: repeat(2, 1fr);
                grid-gap: 1.5rem;
            }

            .card-wrapper {
                height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;
            }

            .product-imgs {
                display: flex;
                flex-direction: column;
                justify-content: center;
                width: 80%;
                height: 90%;
                object-fit: cover;
                padding-left: 40px;
            }

            .product-content {
                padding-top: 0;
                padding-right: 30px;
            }
        }

        .tabs {
            max-width: 90%;
            margin: 50px auto;
        }

        .nav-tabs {
            display: flex;
            list-style: none;
            margin: 0;
            padding: 0;
            justify-content: space-around;
            font-size: 26px;
        }
        .fa-star{
            color: yellow!important;
        }
        .fa-star-half-alt{
            color: yellow!important;
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

                    .nav-tabs li a:focus {
                        color: var(--primary-color);
                    }

                    .nav-tabs li a::after {
                        content: "";
                        height: 5px;
                        width: 100%;
                        position: absolute;
                        left: 0px;
                        bottom: -3px;
                        background: transparent;
                    }

                .nav-tabs li.ChiTietSP__active a::after,
                .nav-tabs li:hover a::after {
                    background: var(--primary-color);
                }

        .ChiTietSP__active a {
            font-weight: bolder;
        }

        .tab-detail {
            display: flex;
        }

        .ChiTietSP__body-detail,
        .ChiTietSP__body-comment {
            border: 1.5px solid #ddd;
            border-radius: 5px;
            padding: 30px 120px;
            box-shadow: rgba(149, 157, 165, 0.2) 0px 8px 24px;
        }

            .ChiTietSP__body-detail h3,
            .ChiTietSP__body-detail h4,
            .ChiTietSP__body-detail img,
            .ChiTietSP__body-detail p {
                margin: 20px;
            }

            .ChiTietSP__body-detail img {
                width: 790px;
                height: 500px;
                object-fit: cover;
            }

            .ChiTietSP__body-detail p {
                font-size: 18px;
            }

        .ChiTietSP__body-comment-1 {
            margin: 20px 0;
            width: 85%;
            display: flex;
            justify-content: space-between;
            border-bottom: 1.5px solid #ddd;
        }

            .ChiTietSP__body-comment-1 b,
            .body-comment-select {
                padding-bottom: 20px;
            }

        .body-comment-select {
            display: flex;
        }

            .body-comment-select h5 {
                margin-right: 5px;
            }

        .ChiTietSP__body-comment-2 {
            display: flex;
            flex-direction: column;
            width: 80%;
            border: 1.5px solid #ddd;
            padding: 20px;
        }

        .ChiTietSP__body-comment-2-p {
            border-bottom: 1.5px solid #ddd;
            padding-bottom: 10px;
        }

        .ChiTietSP__body-comment-2 textarea {
            font-size: 20px;
            width: 100%;
            border: 1.5px solid #ddd;
        }

        .ChiTietSP__body-comment-2-star {
            padding: 10px 0;
        }

        .ChiTietSP__body-comment-2-btn {
            text-align: right;
        }

        .btn-comment {
            background: var(--primary-color);
            color: #fff;
        }

        .btn-comment,
        .btn-cancel {
            font-size: 18px;
            width: 10%;
        }

        .ChiTietSP__body-comment-2-star div,
        .ChiTietSP__body-comment-3-star {
            color: var(--orange-color);
        }

        .ChiTietSP__body-comment-3 {
            width: 79%;
            margin-top: 30px;
            padding: 30px;
            border-top: 1.5px solid #ddd;
            display: flex;
        }

            .ChiTietSP__body-comment-3 img {
                margin-right: 10px;
                width: 8%;
                height: 8%;
                object-fit: cover;
            }

        .ChiTietSP__body-comment-3-star {
            padding: 10px 0;
        }
        .NCC-title{
            font-weight:bold;
            font-size:20px;
            color:var(--primary-color);
        }
          .txterror {
            color: var(--primary-color);
            display: block;
            margin-top: 5px;
        }
          li{
              padding-left:0!important;
          }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="ChiTietSP__header">
        <!-- <div class="ChiTietSP__img"></div> -->
        <div class="card-wrapper">
            <div class="card">
                <!-- card left -->
                        <div class="img-showcase">
                            <asp:Image ID="imgSP" runat="server" />
                        </div>
                <!-- card right -->
                <div class="product-content">
                    <asp:Label ID="lblTenSP" runat="server" Text="" CssClass="product-title"></asp:Label>  
                    <br />
                    
                    <div class="product-rating">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half-alt"></i>
                        <span>4.7(21)</span>
                    </div>

                    <div class="product-price">
                        
                        <p class="last-price">Giá cũ: <asp:Label ID="lblprice1" runat="server" Text=""></asp:Label></p>
                        <p class="new-price">Giá mới: <asp:Label ID="lblprice2" runat="server" Text=""></asp:Label></p>
                    </div>

                    <div class="product-detail">
                        <h4>Thông số kỹ thuật</h4>
                        <ul>
                            <li>Nhà cung cấp: <asp:Label ID="lblNCC" runat="server" Text="" CssClass="NCC-title"></asp:Label></li>
                            <li>Chi tiết sản phẩm: <asp:Label ID="lblCT" runat="server" Text=""></asp:Label></li>
                            <li>Số lượng còn lại: <asp:Label ID="lblSL" runat="server" Text="" CssClass="NCC-title"></asp:Label></li>
         
                        </ul>
                        <%--<h4>Khuyến mãi liên quan</h4>--%>
                    </div>

                    <div class="purchase-info">
                        <asp:TextBox ID="txtSL" runat="server" type="number" Text="1"></asp:TextBox>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Số lượng không được bỏ trống" ControlToValidate="txtSL" Display="Dynamic" CssClass="txterror"></asp:RequiredFieldValidator>
                         <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Số lượng phải lớn hơn 0" ControlToValidate="txtSL" Display="Dynamic" CssClass="txterror" ValueToCompare="1" Operator="GreaterThanEqual"></asp:CompareValidator>
                        <asp:Button ID="btnBuy" runat="server" CssClass="btn btnBuy" Text="Mua Ngay" OnClick="btnBuy_Click" />
                        <asp:Button ID="btnBack" runat="server" CssClass="btn btnBack" Text="Xem Sau" OnClick="btnBack_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="ChiTietSP__body">
        <div class="tabs">
            <ul class="nav-tabs">
                <li><a href="#menu_2">BÌNH LUẬN</a></li>
            </ul>
            <div class="tab-content">

                <div id="menu_2" class="tab-content-item">
                    <div class="ChiTietSP__body-comment">
                        <div class="ChiTietSP__body-comment-1">
                            <b>1 bình luận</b>
                            <div class="body-comment-select">
                                <h5>Sắp xếp theo</h5>
                                <select>
                                    <option>Cũ nhất</option>
                                    <option>Mới nhất</option>
                                </select>
                            </div>
                        </div>
                        <div class="ChiTietSP__body-comment-2">
                            <p class="ChiTietSP__body-comment-2-p">
                                Sản phẩm:<br>
                                Điện thoại Iphone 11 Pro Max
                            </p>
                            <div class="ChiTietSP__body-comment-2-star">
                                <p>Đánh giá</p>
                                <div>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="far fa-star"></i>
                                </div>
                            </div>
                            <textarea name="" id="" cols="30" rows="10" placeholder="để lại bình luận..."></textarea>
                            <div class="ChiTietSP__body-comment-2-btn">
                                <button class="btn-comment">Bình luận</button>
                                <button class="btn-cancel">Huỷ</button>
                            </div>
                        </div>
                        <div class="ChiTietSP__body-comment-3">
                            <img
                                src="https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60">
                            <div>
                                <h5>ABC123</h5>
                                <div class="ChiTietSP__body-comment-3-star">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="far fa-star"></i>
                                </div>
                                <p>Đóng gói cẩn thận. Giao hàng nhanh chóng. Hàng đúng mẫu như hình. Có hỗ trợ bảo hành.</p>
                            </div>
                        </div>
                        <div class="ChiTietSP__body-comment-3">
                            <img
                                src="https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60">
                            <div>
                                <h5>ABC123</h5>
                                <div class="ChiTietSP__body-comment-3-star">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="far fa-star"></i>
                                </div>
                                <p>Đóng gói cẩn thận. Giao hàng nhanh chóng. Hàng đúng mẫu như hình. Có hỗ trợ bảo hành.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
