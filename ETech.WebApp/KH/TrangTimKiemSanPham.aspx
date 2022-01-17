<%@ Page Title="" Language="C#" MasterPageFile="~/KH/MasterPage.Master" AutoEventWireup="true" CodeBehind="TrangTimKiemSanPham.aspx.cs" Inherits="ETech.WebApp.KH.TrangTimKiemSanPham" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
    .content {
            margin-top: 30px;
        }

        .content_title {
            height: auto;
            max-width: 68%;
            margin: 0 auto;
            text-align: center;
            color: #ffffff;
            background-color: var(--primary-color);
        }

        .content_items {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            padding: 0 5px;
            max-width: 1100px;
            margin: 0 auto;
        }

        .content_item {
            position: relative;
            overflow: hidden;
            border: 3px solid var(--lightgray);
            border-bottom: 0;
            background-color: #fff;
            border-radius: 10px;
            min-width: 230px;
            max-width: 252.5px;
            width: 100%;
            color: #000000;
            text-align: center;
            -webkit-perspective: 50em;
            perspective: 50em;
            margin: 3px 0px 0;
        }

            .content_item:hover {
                cursor: pointer;
            }

            .content_item * {
                -webkit-box-sizing: padding-box;
                box-sizing: padding-box;
                -webkit-transition: all 0.2s ease-out;
                transition: all 0.2s ease-out;
            }

            .content_item h5 {
                padding: 0 5px;
                color: var(--primary-color);
                height: 30px;
                overflow: hidden;
            }

            .content_item img {
                max-width: 95%;
                max-height: 95%;
                object-fit: contain;
            }

            .content_item .content_item-upload {
                top: 50%;
                height: 100%;
                width: 100%;
                background: #fff;
                position: absolute;
                opacity: 0;
                z-index: 1;
            }

            .content_item:after {
                background-color: #ffffff;
                position: absolute;
                content: "";
                display: block;
                top: 20px;
                left: 20px;
                right: 20px;
                bottom: 20px;
                -webkit-transition: all 0.4s ease-in-out;
                transition: all 0.4s ease-in-out;
                -webkit-transform: rotateX(-90deg);
                transform: rotateX(-90deg);
                -webkit-transform-origin: 50% 50%;
                -ms-transform-origin: 50% 50%;
                transform-origin: 50% 50%;
                opacity: 0;
            }

            .content_item:hover .content_item-upload,
            .content_item.uploadhover .content_item-upload {
                -webkit-transform: translateY(-50%);
                transform: translateY(-50%);
                opacity: 1;
                -webkit-transition-delay: 0.2s;
                transition-delay: 0.2s;
            }

            .content_item:hover:after,
            .content_item.uploadhover:after {
                -webkit-transform: rotateX(0);
                transform: rotateX(0);
                opacity: 0.9;
            }

        .content_item-info {
            display: flex;
            justify-content: space-around;
            align-items: center;
        }

        .content_item-cash p,
        .content_item-btnprepay p {
            margin: 5px 0;
        }

            .content_item-btnprepay p:first-child {
                background: #e0ebff;
                border-radius: 6px;
                display: flex;
                padding: 5px;
                align-items: center;
            }

        .content_item-cash {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
        }

            .content_item-cash p:first-child {
                color: var(--orange-color);
            }

            .content_item-cash p:last-child {
                text-decoration-line: line-through;
            }

        .content_item-upload img {
            width: 80%;
            height: 80%;
            object-fit: cover;
        }

        .content_item-upload a {
            box-shadow: rgba(149, 157, 165, 0.2) 0px 8px 24px;
            font-size: 18px;
            border-radius: 5px;
            padding: 5px;
            text-decoration: none;
            color: #ffffff;
            background-image: linear-gradient(180deg, #439cfb, #1a6fc9);
        }

        .content_item-star {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
            height: 50px;
            color: var(--orange-color);
        }

            .content_item-star i {
                width: 30px;
                height: 30px;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content">
         
         <asp:Label ID="Label1" CssClass="content_title" runat="server" Text=""> </asp:Label>
        <div class="content_items">
            <asp:Repeater ID="rpt2" runat="server">
                <ItemTemplate>
                    <div class="content_item">
                        <img
                            src="../wwwroot/img/sp/<%# Eval("HINHANH") %>"
                            alt="sq-sample26" />
                        <h5><%# Eval("TENSANPHAM") %></h5>
                        <div class="content_item-info">
                            <div class="content_item-cash">
                                <p><%# Eval("DONGIA","{0:n0}") %></p>
                                <p><%# Eval("DONGIA2", "{0:n0}") %></p>
                            </div>
                            <div class="content_item-btnprepay">
                                <p>Hoặc trả trước</p>
                                <p><%# Eval("DONGIA3","{0:n0}") %></p>
                            </div>
                        </div>
                        <div class="content_item-star">
                            <i class="fas fa-star fa-lg"></i>
                            <i class="fas fa-star fa-lg"></i>
                            <i class="fas fa-star fa-lg"></i>
                            <i class="fas fa-star fa-lg"></i>
                            <i class="far fa-star fa-lg"></i>
                        </div>
                        <div class="content_item-upload">
                            <img
                                src="../wwwroot/img/sp/<%# Eval("HINHANH") %>"
                                alt="">
                            <div><a href="TrangChiTietSanPham.aspx?idSP=<%# Eval("SANPHAMID") %>">Xem chi tiết</a></div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

        </div>
</asp:Content>
