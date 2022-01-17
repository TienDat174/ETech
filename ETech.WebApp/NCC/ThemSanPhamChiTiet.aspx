<%@ Page Title="" Language="C#" MasterPageFile="~/NCC/MasterPage.Master" AutoEventWireup="true" CodeFile="ThemSanPhamChiTiet.aspx.cs" Inherits="ETech.WebApp.NCC.ThemSanPhamChiTiet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        :root {
            --primary-color: #f15f1b;
            --background-color: #FFEEE6;
            --BG-sidebar: #fff;
            --black-color: #333;
            --white-color: #fff;
            --gray-color: #808080;
            --box-shadow: rgba(0, 0, 0, 0.16) 0px 3px 6px, rgba(0, 0, 0, 0.23) 0px 3px 6px;
        }

        * {
            font-family: 'Roboto', sans-serif;
            font-size: 16px;
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        .QLSPchitiet__container {
            border-radius: 10px;
            box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px;
            width: 45%;
            margin: 100px 0 20px 550px;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            padding: 30px;
            background-color: #fff;
        }

            .QLSPchitiet__container h2 {
                padding: 10px;
                font-size: 20px;
            }

        .QLSPchitiet__input,
        .QLSPchitiet__img,
        .QLSPchitiet__title,
        .QLSPchitiet__description {
            width: 100%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1.5px solid #ddd;
            padding: 5px;
        }
        .QLSPchitiet__description2 {
            width: 100%;
            display: flex;
            align-items: center;
            border-bottom: 1.5px solid #ddd;
            padding: 5px;
        }

            .QLSPchitiet__input p,
            .QLSPchitiet__img p,
            .QLSPchitiet__description p,
            .QLSPchitiet__description2 p {
                padding: 5px;
                padding: 5px;
                margin: 5px;
            }

            .QLSPchitiet__input input,
            .QLSPchitiet__description textarea,
            .QLSPchitiet__input select {
                width: 50%;
                border: 1.5px solid #ddd;
                border-radius: 5px;
                overflow: auto;
                margin: 10px 0;
                font-size: 18px;
            }

            .QLSPchitiet__input input,
            .QLSPchitiet__input select {
                height: 35px;
            }

        #file-input {
            display: none;
        }

        .preview {
            display: flex;
            align-items: center;
            justify-content: space-between;
            width: 50%;
        }

            .preview img {
                width: 112.05px;
                height: 100px;
                object-fit: fill;
            }

            .preview label {
                font-size: 15px;
                font-weight: 600;
                cursor: pointer;
                color: var(--text-color);
                border-radius: 5px;
                padding: 5px 10px;
                background-color: var(--white-color);
                box-shadow: rgba(0, 0, 0, 0.16) 0px 1px 4px;
            }

        .QLSPchitiet__btn {
            margin-top: 10px;
            padding: 10px;
        }

            .QLSPchitiet__btn .btn {
                padding: 5px 10px;
                background-color: var(--primary-color);
                color: #fff;
                border: none;
                border-radius: 5px;
                box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px;
                transition: .3s;
            }

                .QLSPchitiet__btn .btn:hover {
                    cursor: pointer;
                }

                .QLSPchitiet__btn .btn:active {
                    transform: scale(.8);
                }
                .QLSPchitiet__btn  .btn2{
                    color:var(--gray-color);
                    border-radius: 5px;
                    padding: 5px 10px;
                    border:none;
                }
                 .QLSPchitiet__btn .btn2:hover {
                    cursor: pointer;
                }
                 .tmsp-rblTrangThai{
                    padding-left:200px;
                 }
                 .tmsp-rblTrangThai-item{
                     padding-left:20px;
                 }
                .tmsp-error {
                    color: tomato;
                    margin-top: 4px;
                    display: block;
                }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="QLSPchitiet__container">
        <h2>THÊM SẢN PHẨM</h2>
        <div class="QLSPchitiet__input">
            <p>Tên sản phẩm</p>
            <asp:TextBox ID="txtTenSP" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Tên sản phẩm không được trống" ControlToValidate="txtTenSP" CssClass="tmsp-error" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>
        <div class="QLSPchitiet__input">
            <p>Giá tiền</p>
            <asp:TextBox ID="txtprice" runat="server"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Số tiền phải lớn hơn hoặc bằng 0" ControlToValidate="txtprice" ValueToCompare="0" Type="Integer" Operator="GreaterThanEqual" CssClass="tmsp-error" Display="Dynamic"></asp:CompareValidator>                
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Số tiền không được trống" ControlToValidate="txtprice" CssClass="tmsp-error" Display="Dynamic"></asp:RequiredFieldValidator>    

        </div>
        <div class="QLSPchitiet__input">
            <p>Số lượng</p>
            <asp:TextBox ID="txtSoLuong" Textmode="Number" runat="server"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidator3" runat="server" ErrorMessage="Số lượng phải lớn hơn hoặc bằng 0" ControlToValidate="txtSoLuong" ValueToCompare="0" Type="Integer" Operator="GreaterThanEqual" CssClass="tmsp-error" Display="Dynamic"></asp:CompareValidator>                
         <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Số lượng không được trống" ControlToValidate="txtSoLuong" CssClass="tmsp-error" Display="Dynamic"></asp:RequiredFieldValidator>       
        </div>
        <div class="QLSPchitiet__input">
            <p>Danh mục</p>
            <asp:DropDownList ID="ddlDM" runat="server"></asp:DropDownList>
             <asp:RequiredFieldValidator
                         ID="RequiredFieldValidator3"
                         runat="server"
                         ControlToValidate="ddlNSX"
                         InitialValue="-1"
                         ErrorMessage="Vui lòng chọn danh mục"
                         CssClass="tmsp-error"
                         Display="Dynamic"
                         >
                    </asp:RequiredFieldValidator>
        </div>
        <div class="QLSPchitiet__input">
            <p>Nhà Sản Xuất</p>
            <asp:DropDownList ID="ddlNSX" runat="server"></asp:DropDownList>
             <asp:RequiredFieldValidator
                         ID="RequiredFieldValidator2"
                         runat="server"
                         ControlToValidate="ddlNSX"
                         InitialValue="-1"
                         ErrorMessage="Vui lòng chọn nhà sản xuất"
                         CssClass="tmsp-error"
                         Display="Dynamic"
                         >
                    </asp:RequiredFieldValidator>
        </div>
          <div class="QLSPchitiet__input">
            <p>Đơn vị vận chuyển</p>
            <asp:DropDownList ID="ddlDVVC" runat="server"></asp:DropDownList>
            <asp:RequiredFieldValidator
                         ID="RequiredFieldValidator1"
                         runat="server"
                         ControlToValidate="ddlDVVC"
                         InitialValue="-1"
                         ErrorMessage="Vui lòng chọn đơn vị vận chuyển"
                         CssClass="tmsp-error"
                         Display="Dynamic"
                         >
                    </asp:RequiredFieldValidator>
        </div>
        <div class="QLSPchitiet__input">
            <p>Chi Tiết</p>
            <asp:TextBox ID="txtdetail" runat="server"></asp:TextBox>
        </div>
         <div class="QLSPchitiet__description2">
            <p>Tình Trạng</p>
           <div class="tmsp-rblTrangThai">
              <asp:RadioButton ID="rdb_open" GroupName="Group1" Text="Mở" Checked="true" runat="server" class="tmsp-rblTrangThai-item"/>
              <asp:RadioButton ID="rdb_close" GroupName="Group1" Text="Đóng" class="tmsp-rblTrangThai-item" style="margin-left: 30px" runat="server" />    
             </div>
        </div>

        <div class="QLSPchitiet__img">
            <p>Thêm hình ảnh</p>
            <div class="preview">
                <asp:FileUpload ID="FileUpload1" runat="server" accept=".png,.jpg,.jpeg,.gif"/>
            </div>
        </div>
        <div class="QLSPchitiet__btn">
            <asp:Button ID="btnThem" CssClass="btn" runat="server" Text="Thêm Sản Phẩm" OnClick="btnThem_Click" />
            <asp:Button ID="btnHuy" CssClass="btn2" runat="server" Text="Hủy" CausesValidation="false" OnClick="btnHuy_Click" />
        </div>
    </div>

</asp:Content>
