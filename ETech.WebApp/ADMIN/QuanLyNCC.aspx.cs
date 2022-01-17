using ETech.WebApp.AppCode;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ETech.WebApp.ADMIN
{
    public partial class QuanLyNCC : System.Web.UI.Page
    {
        DataAccess dataAccess = new DataAccess();
        protected void Page_Load(object sender, EventArgs e)
        {
          
           
            
                BANG1();
                BANG2();
            BANG3();
            
            
            

        }
       
        void BANG1()
        {
            dataAccess.MoKetNoiCSDL();

            SqlParameter[] p = { };
            DataTable dt = dataAccess.ExecuteQuery("PROC_VIEW_NCC_CHODUYET", p);

            StringBuilder table = new StringBuilder();
            if (dt != null && dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    table.Append("<tr class=\"\">");
                    table.Append("<td class=\"qldm-column2\" style=\"text-align:center;\">" + dr["NHACUNGCAPID"] + "</td>");
                    table.Append("<td class=\"qldm-column2\">" + dr["TENNHACUNGCAP"] + "</td>");
                    table.Append("<td class=\"qldm-column2\">" + dr["DIACHI"] + "</td>");
                    table.Append("<td class=\"qldm-column2\">" + dr["SDT"] + "</td>");
                    table.Append("<td class=\"qldm-column2\">" + dr["EMAIL"] + "</td>");
                   
                    table.Append("<td class=\"qldm-column2\" style=\"text-align:center;\">");
                    table.Append("<a href=\"QuanLyNCCChiTiet.aspx?NHACUNGCAPID=" + dr[0] + "\" class=\"cell_xem\">Duyệt</a>");

                    table.Append("</td>");
                    table.Append("</tr>");
                }
                Panel1.Controls.Add(new Label { Text = table.ToString() });
                //Panel1.Controls.Add(new Label { Text = table.ToString() });
            }
        }
        void BANG2()
        {
            dataAccess.MoKetNoiCSDL();
            SqlParameter[] p = { };
            DataTable dt = dataAccess.ExecuteQuery("PROC_VIEW_NCC_DADUYET", p);
            StringBuilder table = new StringBuilder();
            if(dt != null && dt.Rows.Count > 0)
            {
               foreach(DataRow dr in dt.Rows)
                {
                    table.Append("<tr class=\"\">");
                    table.Append("<td class=\"qldm-column2\" style=\"text-align:center;\">" + dr["NHACUNGCAPID"] + "</td>");
                    table.Append("<td class=\"qldm-column2\">" + dr["TENNHACUNGCAP"] + "</td>");
                    table.Append("<td class=\"qldm-column2\">" + dr["DIACHI"] + "</td>");
                    table.Append("<td class=\"qldm-column2\">" + dr["SDT"] + "</td>");
                    table.Append("<td class=\"qldm-column2\">" + dr["EMAIL"] + "</td>");
                   
                    table.Append("<td class=\"qldm-column2\" style=\"text-align:center;\">");
                    table.Append("<a href=\"QuanLyNCCChiTiet.aspx?NHACUNGCAPID=" + dr[0] + "\" class=\"cell_xem\">Duyệt</a>");
                    table.Append("</td>");
                    table.Append("</tr>");
                }
                Panel2.Controls.Add(new Label { Text = table.ToString() });
                
            }
        }
        void BANG3()
        {
            dataAccess.MoKetNoiCSDL();
            SqlParameter[] p = { };
            DataTable dt = dataAccess.ExecuteQuery("PROC_VIEW_NCC_DAHUY", p);
            StringBuilder table = new StringBuilder();
            if (dt != null && dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    table.Append("<tr class=\"\">");
                    table.Append("<td class=\"qldm-column2\" style=\"text-align:center;\">" + dr["NHACUNGCAPID"] + "</td>");
                    table.Append("<td class=\"qldm-column2\">" + dr["TENNHACUNGCAP"] + "</td>");
                    table.Append("<td class=\"qldm-column2\">" + dr["DIACHI"] + "</td>");
                    table.Append("<td class=\"qldm-column2\">" + dr["SDT"] + "</td>");
                    table.Append("<td class=\"qldm-column2\">" + dr["EMAIL"] + "</td>");

                    table.Append("<td class=\"qldm-column2\" style=\"text-align:center;\">");
                    table.Append("<a href=\"QuanLyNCCChiTiet.aspx?NHACUNGCAPID=" + dr[0] + "\" class=\"cell_xem\">Duyệt</a>");
                    table.Append("</td>");
                    table.Append("</tr>");
                }
                Panel3.Controls.Add(new Label { Text = table.ToString() });

            }
        }




    }
}