using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using Media_Player_ASP.NET_Control;
using System.Configuration;
using System.Web.Services;
using System.Web.Script.Services;
using System.IdentityModel;
public partial class Client_ProductDetail : System.Web.UI.Page
{
    protected string pro_id = "";
    protected string pro_name = "";
    protected string path = "";
    protected int width=1300;
    protected int height = 600;
    protected int left = 57;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session.IsNewSession != true && Session["fname"] != null && Session["id"] != null)
        {
        }
        audio.Attributes.Add("src", path);
        //audio.Attributes.Add("width", width.ToString());
        //audio.Attributes.Add("height", height.ToString());
        //audio.Attributes.Add("margin-left", left.ToString());
    }
    protected void Page_PreInit(object sender, EventArgs e)
    {
        if (Session.IsNewSession != true && Session["fname"] != null && Session["id"] != null)
        {
            this.Page.MasterPageFile = "~/Client2.master";
        }
        else
        {
            this.Page.MasterPageFile = "~/Client1.master";
            Response.Write("<script>alert('You must Login First')</script>");
            Response.Redirect("~/Client/Login.aspx");
        }
    }
    protected void Page_Init(object sender, EventArgs e)
    {
        pro_id = Request.QueryString.Get("pid").ToString();
        if (pro_id.ToString() == String.Empty)
        {
            Response.Redirect("Home.aspx");
        }
        getdata();
    }
    public void getdata()
    {
        string conn = System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con = new SqlConnection(conn);
        con.Open();
        String s = "Select * from Product where product_id='" + pro_id + "'";
        SqlCommand cmd = new SqlCommand(s, con);
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            this.Label2.Text = dr.GetValue(1).ToString();
            pro_name = dr.GetValue(1).ToString();
            this.TextBox1.Text = dr.GetValue(2).ToString();
            path = dr.GetValue(5).ToString();
        }
        con.Close();
    }
    public string Clients()
    {
        return path;   
    }
}