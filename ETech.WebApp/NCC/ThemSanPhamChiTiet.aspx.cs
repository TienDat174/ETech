using ETech.WebApp.AppCode;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ETech.WebApp.NCC
{
    
    public partial class ThemSanPhamChiTiet : System.Web.UI.Page
    {
        DataAccess dataAccess = new DataAccess();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userNCC"]==null)
            {
                Response.Redirect("DangKyDangNhapNCC.aspx");
            }
            int id = int.Parse(Session["id"].ToString());
            if (!IsPostBack)
            {
                dataAccess.MoKetNoiCSDL();
                
                //Fill data vao dropdownlist
                string sqlNSX = "SELECT * FROM NSX";
                string sqlLoai = "SELECT * FROM LOAISP a,CHITIETDANHMUC b WHERE a.LOAISPID=b.LOAISPID AND b.TRANGTHAI=1 AND b.NHACUNGCAPID="+id;
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
            }    
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            dataAccess.MoKetNoiCSDL();
            int id = int.Parse(Session["id"].ToString());

            //khai bao path va file name de luu hinh uploaded
            string path = Server.MapPath("~/wwwroot/img/sp");
            string fileName = "";

            if (FileUpload1.PostedFile != null)
            {
                fileName = Path.GetFileName(FileUpload1.FileName).Trim();
            }

            SqlCommand cmd = new SqlCommand("PROC_INSERT_SANPHAM", dataAccess.getConnection());
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@NHASANXUATID", int.Parse(ddlNSX.SelectedValue));
            cmd.Parameters.AddWithValue("@LOAISPID", int.Parse(ddlDM.SelectedValue));
            cmd.Parameters.AddWithValue("@NHACUNGCAPID", id);//truyenthamsovaoday
            cmd.Parameters.AddWithValue("@DONVIVANCHUYENID", int.Parse(ddlDVVC.SelectedValue));
            cmd.Parameters.AddWithValue("@TENSANPHAM", txtTenSP.Text);
            cmd.Parameters.AddWithValue("@HINHANH", fileName);
            cmd.Parameters.AddWithValue("@CHITIET",txtdetail.Text);
            cmd.Parameters.AddWithValue("@SOLUONG", int.Parse(txtSoLuong.Text));
            cmd.Parameters.AddWithValue("@DONGIA", int.Parse(txtprice.Text));
            if (rdb_open.Checked == true)
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
                if (FileUpload1.PostedFile != null)
                {
                    FileUpload1.PostedFile.SaveAs(string.Format("{0}/{1}", path, fileName));
                }

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