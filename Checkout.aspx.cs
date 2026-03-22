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
    public partial class Checkout : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["MarutiROConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserEmail"] == null)
                Response.Redirect("UserLogin.aspx");

            if (!IsPostBack)
                LoadCheckout();
        }
        void LoadCheckout()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = @"
            SELECT p.ProductName, p.Price, c.Qty,
                   (c.Qty * p.Price) AS Total
            FROM Cart c
            INNER JOIN Products p ON c.ProductID = p.ProductID
            WHERE c.Email=@Email";

                SqlDataAdapter da = new SqlDataAdapter(query, con);
                da.SelectCommand.Parameters.AddWithValue("@Email", Session["UserEmail"].ToString());

                DataTable dt = new DataTable();
                da.Fill(dt);

                decimal grandTotal = 0;
                foreach (DataRow row in dt.Rows)
                {
                    grandTotal += Convert.ToDecimal(row["Total"]);
                }

                rptCheckout.DataSource = dt;
                rptCheckout.DataBind();

                lblGrandTotal.Text = grandTotal.ToString("0.00");
            }
        }
        protected void btnPrint_Click(object sender, EventArgs e)
        {
            SaveOrders();
            ClearCart();
            Response.Write("<script>alert('Order placed successfully!');</script>");
            Response.Redirect("UserHome.aspx"); // redirect back to home
        }

        void SaveOrders()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                // Get current cart items with fully qualified column names
                SqlCommand cmd = new SqlCommand(@"
            SELECT c.ProductID, c.Qty, (c.Qty * p.Price) AS Total
            FROM Cart c
            INNER JOIN Products p ON c.ProductID = p.ProductID
            WHERE c.Email=@Email", con);
                cmd.Parameters.AddWithValue("@Email", Session["UserEmail"].ToString());

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                foreach (DataRow row in dt.Rows)
                {
                    SqlCommand insert = new SqlCommand(@"
                INSERT INTO Orders (Email, OrderDate, ProductID, Qty, Total)
                VALUES (@Email, @OrderDate, @ProductID, @Qty, @Total)", con);

                    insert.Parameters.AddWithValue("@Email", Session["UserEmail"].ToString());
                    insert.Parameters.AddWithValue("@OrderDate", DateTime.Now);
                    insert.Parameters.AddWithValue("@ProductID", row["ProductID"]);
                    insert.Parameters.AddWithValue("@Qty", row["Qty"]);
                    insert.Parameters.AddWithValue("@Total", row["Total"]);
                    insert.ExecuteNonQuery();
                }
            }
        }
        void ClearCart()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("DELETE FROM Cart WHERE Email=@Email", con);
                cmd.Parameters.AddWithValue("@Email", Session["UserEmail"].ToString());
                cmd.ExecuteNonQuery();
            }
        }
    }
    
}