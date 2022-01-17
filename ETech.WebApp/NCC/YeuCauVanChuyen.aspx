<%@ Page Title="" Language="C#" MasterPageFile="~/NCC/MasterPage.Master" AutoEventWireup="true" CodeBehind="YeuCauVanChuyen.aspx.cs" Inherits="ETech.WebApp.NCC.YeuCauVanChuyen" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        :root {
            --text-color: #333;
            --primary-color: #f15f1b;
            --white-color: #fff;
            --box-shadow: rgba(0, 0, 0, 0.16) 0px 3px 6px, rgba(0, 0, 0, 0.23) 0px 3px 6px;
        }

        body {
            margin: 0;
            padding: 0;
            background-color: #eee;
        }

        .YCVC__container {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            margin: 200px 0 0 500px;
            font-family: 'Roboto', sans-serif;
            max-width: 800px;
            background-color: white;
            border-radius: 20px;
            box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
            padding: 50px;
        }
        .YCVC__btn {
            background-color: var(--white-color);
            width: 150px;
            height: 40px;
            margin: 20px 0 20px;
            border: none;
            border-radius: 5px;
            transition: .3s;
            cursor: pointer;
            box-shadow: var(--box-shadow);
            font-size: 18px;
            padding: 5px;
        }

        .YCVC__btn:hover {
                background-color: var(--primary-color);
                color: var(--white-color);
        }

        .YCVC__btn:active {
                transform: scale(.8);
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
        .YCVC__container h3{
            margin:20px 0px
        }
      .qldm-column2{
       padding: 10px;
       border: 1px solid black;  
       line-height:1.3;
       text-align: left;
       font-weight:400;
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
            width: 200px;
            height:30px;
            color:#1e272e;
  }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="YCVC__container">
        <h2>DANH MỤC VẬN CHUYỂN</h2>
        <div id="menu_1" class="tab-content-item">
                        <div class="YCDM__box">
                            <p>Chọn đơn vị vận chuyển:</p>
                           <asp:DropDownList CssClass="edit-container" ID="ddDVVC" runat="server"></asp:DropDownList>
                        </div>
            <asp:Button ID="btnGoi" runat="server" Text="Gởi yêu cầu thêm" class="YCVC__btn" OnClick="btnGoi_Click"/> 
                    <asp:Label ID="lblThongBao" runat="server" Text="" CssClass="cnsp-error"></asp:Label>
                    <table class="table" cellpadding="0" cellspacing="0">
                        <thead class="row_header">
                            <tr>
                              <th class="cell" style="min-width: 100px">ID</th>   
                              <th class="cell" style="min-width: 300px">Tên DVVC</th>
                               <th class="cell" style="min-width: 150px">Phí vận chuyển</th>
                               <th class="cell" style="min-width: 150px">Trạng thái</th>
                            </tr>
                        </thead>
                        <tbody>
                             <asp:Panel ID="Panel1" runat="server"></asp:Panel>
                        </tbody>
                     </table>  
                </div>
    </div>
</asp:Content>
