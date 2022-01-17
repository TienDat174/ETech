using ETech.WebApp.AppCode;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ETech.WebApp.NCC
{
    public partial class QuanLySanPhamChiTiet : System.Web.UI.Page
    {
        DataAccess dataAccess = new DataAccess();
        protected void Page_Load(object sender, EventArgs e)
        {
            dataAccess.MoKetNoiCSDL();
            
            
            if (Session["userNCC"] == null)
            {
                Response.Redirect("DangKyDangNhapNCC.aspx");
            }
            int id = int.Parse(Session["id"].ToString());
            string idSP = Request.QueryString.Get("idSP").ToString();
            if (!IsPostBack)
            {
                dataAccess.MoKetNoiCSDL();

                string sqlNSX = "SELECT * FROM NSX";
                string sqlLoai = "SELECT * FROM LOAISP a,CHITIETDANHMUC b WHERE a.LOAISPID=b.LOAISPID AND b.TRANGTHAI=1 AND b.NHACUNGCAPID=" + id;
                string sqlDVVC = "SELECT * FROM DONVIVANCHUYEN";
                SqlCommand cmdNSX = new SqlCommand(sqlNSX, dataAccess.getConnection());
                SqlCommand cmdLoai = new SqlCommand(sqlLoai, dataAccess.getConnection());
                SqlCommand cmdDVVC = new SqlCommand(sqlDVVC, dataAccess.getConnection());

                ddlNSX.DataSource = cmdNSX.ExecuteReader();
                ddlNSX.DataTextField = "TENNHASANXUAT";
                ddlNSX.DataValueField = "NHASANXUATID";
                ddlNSX.DataBind();

                ddlNSX.Items.Insert(0, new ListItem("---Chọn nhà sản xuất---", "-1"));

                ddlDM.DataSource = cmdLoai.ExecuteReader();
                ddlDM.DataTextField = "TENLOAI";
                ddlDM.DataValueField = "LOAISPID";
                ddlDM.DataBind();
                
                ddlDM.Items.Insert(0, new ListItem("---Chọn loại sản phẩm---", "-1"));

                ddlDVVC.DataSource = cmdDVVC.ExecuteReader();
                ddlDVVC.DataTextField = "TENDONVIVANCHUYEN";
                ddlDVVC.DataValueField = "DONVIVANCHUYENID";
                ddlDVVC.DataBind();

                ddlDVVC.Items.Insert(0, new ListItem("---Chọn đơn vị vận chuyển---", "-1"));

                SqlCommand cmd = new SqlCommand("PROC_VIEW_SP", dataAccess.getConnection());
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@IDSP", int.Parse(idSP));
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt!=null && dt.Rows.Count>0)
                {
                    imgSP.ImageUrl= "~/wwwroot/img/sp/" + dt.Rows[0]["HINHANH"].ToString();
                    txtTenSP.Text = dt.Rows[0]["TENSANPHAM"].ToString();
                    txtprice.Text = dt.Rows[0]["DONGIA"].ToString();
                    txtSoLuong.Text = dt.Rows[0]["SOLUONG"].ToString();
                    ddlDM.Items.FindByValue(dt.Rows[0]["LOAISPID"].ToString()).Selected = true;
                    ddlNSX.Items.FindByValue(dt.Rows[0]["NHASANXUATID"].ToString()).Selected = true;
                    ddlDVVC.Items.FindByValue(dt.Rows[0]["DONVIVANCHUYENID"].ToString()).Selected = true;
                    txtdetail.Text = dt.Rows[0]["CHITIET"].ToString();
                    string state = dt.Rows[0]["TRANGTHAI"].ToString();
                    if (state == "1")
                    {
                        rdb_open.Checked = true;
                    }
                    else
                    {
                        rdb_close.Checked = true;
                    }
                }
            }    
         }

        protected void btnSua_Click(object sender, EventArgs e)
        {
             string idSP = Request.QueryString.Get("idSP").ToString();
            dataAccess.MoKetNoiCSDL();
            int id = int.Parse(Session["id"].ToString());

            dataAccess.MoKetNoiCSDL();
            SqlCommand cmd = new SqlCommand("PROC_UPDATE_SANPHAM", dataAccess.getConnection());
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@SANPHAMID", int.Parse(idSP));
            cmd.Parameters.AddWithValue("@NHASANXUATID", int.Parse(ddlNSX.SelectedValue));
            cmd.Parameters.AddWithValue("@LOAISPID", int.Parse(ddlDM.SelectedValue));
            cmd.Parameters.AddWithValue("@NHACUNGCAPID", id);
            cmd.Parameters.AddWithValue("@DONVIVANCHUYENID", int.Parse(ddlDVVC.SelectedValue));
            cmd.Parameters.AddWithValue("@TENSANPHAM", txtTenSP.Text);
            cmd.Parameters.AddWithValue("@CHITIET", txtdetail.Text);
            cmd.Parameters.AddWithValue("@SOLUONG", int.Parse(txtSoLuong.Text));
            cmd.Parameters.AddWithValue("@DONGIA", int.Parse(txtprice.Text));
            if(rdb_open.Checked==true)
            {
                cmd.Parameters.AddWithValue("@TRANGTHAI", 1);
            }
            else
            {
                cmd.Parameters.AddWithValue("@TRANGTHAI", 0);
            }    
            try
            {
                cmd.ExecuteNonQuery();
                dataAccess.DongKetNoiCSDL();
                Response.Redirect("QuanLySanPham.aspx");
            }
            catch
            {
                Response.Write("<script>alert('Đã xảy ra lỗi. Vui lòng thực hiện lại')</script>");
                dataAccess.DongKetNoiCSDL();
            }
        }

        protected void btnHuy_Click(object sender, EventArgs e)
        {
            Response.Redirect("QuanLySanPham.aspx");
        }
    }
}