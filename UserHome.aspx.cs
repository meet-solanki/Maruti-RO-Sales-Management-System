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
    public partial class UserHome : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["MarutiROConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserEmail"] == null)
                Response.Redirect("UserLogin.aspx");

            lblUser.Text = Session["UserEmail"].ToString();

            if (!IsPostBack)
                LoadProducts();
        }

        void LoadProducts()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Products", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                rptProducts.DataSource = dt;
                rptProducts.DataBind();
            }
        }

        protected void AddToCart_Command(object sender, System.Web.UI.WebControls.CommandEventArgs e)
        {
            int productId = Convert.ToInt32(e.CommandArgument);

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("IF EXISTS(SELECT * FROM Cart WHERE Email=@Email AND ProductID=@ProductID) " +
                    "UPDATE Cart SET Qty=Qty+1 WHERE Email=@Email AND ProductID=@ProductID " +
                    "ELSE INSERT INTO Cart(Email, ProductID, Qty) VALUES(@Email, @ProductID, 1)", con);

                cmd.Parameters.AddWithValue("@Email", Session["UserEmail"].ToString());
                cmd.Parameters.AddWithValue("@ProductID", productId);
                cmd.ExecuteNonQuery();
            }
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Product added successfully!');", true);
        
        }

        protected void btnCart_Click(object sender, EventArgs e)
        {
            Response.Redirect("Cart.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("UserLogin.aspx");
        }
    }
}