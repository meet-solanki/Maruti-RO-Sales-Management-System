using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Maruti_R.O_Sales
{
    public partial class Cart : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["MarutiROConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserEmail"] == null)
                Response.Redirect("UserLogin.aspx");

            if (!IsPostBack)
                LoadCart();
        }

        void LoadCart()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = @"SELECT p.ProductName, p.Price, c.Qty, (p.Price * c.Qty) AS Total
                                 FROM Cart c
                                 INNER JOIN Products p ON c.ProductID = p.ProductID
                                 WHERE c.Email=@Email";

                SqlDataAdapter da = new SqlDataAdapter(query, con);
                da.SelectCommand.Parameters.AddWithValue("@Email", Session["UserEmail"].ToString());
                DataTable dt = new DataTable();
                da.Fill(dt);
                rptCart.DataSource = dt;
                rptCart.DataBind();
            }
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            Response.Redirect("Checkout.aspx");
        }
    }
}