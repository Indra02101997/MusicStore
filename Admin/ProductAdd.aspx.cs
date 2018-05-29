using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
public partial class Admin_ProductAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Master.PageName = "Add  New  Product";
        if (!IsPostBack)
        {
            load();
            this.DropDownList1.Text = "";
        }
    }
    public void load()
    {
        this.DropDownList1.Items.Clear();
        string conn = System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con = new SqlConnection(conn);
        con.Open();
        String s1 = "Select * from Category";
        SqlCommand cmd1 = new SqlCommand(s1, con);
        SqlDataReader dr1 = cmd1.ExecuteReader();
        while (dr1.Read())
        {
            this.DropDownList1.Items.Add(dr1.GetValue(1).ToString());
        }
        con.Close();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string pathi = "", pathv = "";
        string name = this.TextBox1.Text;
        string des = this.TextBox2.Text;
        int cate = Convert.ToInt32(this.DropDownList1.SelectedIndex) + 1;
        if (FileUpload1.PostedFile.FileName != "" || FileUpload1.PostedFile.FileName !=null)
        {
            string file = Path.GetFileName(FileUpload1.PostedFile.FileName);
            int imgSize = FileUpload1.PostedFile.ContentLength;
            string ext = Path.GetExtension(this.FileUpload1.PostedFile.FileName).ToLower();

            //if (fuProductImg.PostedFile != null && fuProductImg.PostedFile.FileName != "")
            //{
            if (FileUpload1.PostedFile.ContentLength > 1000000)
            {
                CustomValidator1.ErrorMessage = "File is Too Big";
            }
            /*
            if (ext != ".jpg" || ext != ".png" || ext != ".gif" || ext != ".jpeg")
            {
                CustomValidator1.ErrorMessage = "Please choose only .jpg, .png and .gif image types!";
            }*/
            FileUpload1.SaveAs(Server.MapPath("~/UploadsI/" + file));
            pathi = "~/UploadsI/" + file;
        }
        if (FileUpload2.PostedFile.FileName != "" || FileUpload2.PostedFile.FileName != null)
        {
            string file = Path.GetFileName(FileUpload2.PostedFile.FileName);
            int imgSize = FileUpload2.PostedFile.ContentLength;
            string ext = Path.GetExtension(this.FileUpload2.PostedFile.FileName).ToLower();

            //if (fuProductImg.PostedFile != null && fuProductImg.PostedFile.FileName != "")
            //{

           /* if (ext != ".mp4" || ext != ".flv" || ext != ".3gp" || ext != ".avi")
            {
                CustomValidator1.ErrorMessage = "Please choose only .mp4, .flv and .avi video types!";
            }*/
            FileUpload2.SaveAs(Server.MapPath("~/UploadsV/" + file));
            pathv = "~/UploadsV/" + file;
        }
        string conn = System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con = new SqlConnection(conn);
        con.Open();
        string s = "insert into Product(product_name,product_desc,product_cdate,product_image,product_video,category_id) values (@product_name,@product_desc,@product_cdate,@product_image,@product_video,@category_id)";
        SqlCommand cmd = new SqlCommand(s, con);
        cmd.Parameters.AddWithValue("product_name", name);
        cmd.Parameters.AddWithValue("product_desc", des);
        cmd.Parameters.AddWithValue("product_cdate", DateTime.Now.ToShortDateString());
        cmd.Parameters.AddWithValue("product_image", pathi);
        cmd.Parameters.AddWithValue("product_video", pathv);
        cmd.Parameters.AddWithValue("category_id", cate);
        int i = cmd.ExecuteNonQuery();
        if (i == 1)
        {
            string confirmValue = Request.Form["confirm_value"];
            if (confirmValue == "Yes")
            {
                Response.Redirect("ProductInfo.aspx");
            }
            else
            {

            }
        }
        else
        {
            Response.Write("<script>alert('Product Not Inserted')</script>");
        }
        con.Close();
    }
}