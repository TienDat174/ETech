using System;


namespace ETech.WebApp.NCC
{
    public partial class MailActiveDone : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/NCC/QuanLyHoSo.aspx");
        }
    }
}