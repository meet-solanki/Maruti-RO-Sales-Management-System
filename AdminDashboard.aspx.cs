using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Maruti_R.O_Sales
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["MarutiROConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindProducts();
                BindOrders();
            }
        }

        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            if (txtProductName.Text == "" || txtPrice.Text == "" || !FileUpload1.HasFile)
            {
                lblMsg.Text = "Please fill all fields and select image";
                return;
            }

            try
            {
                string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
                string path = Server.MapPath("~/Images/" + fileName);
                FileUpload1.SaveAs(path);

                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    conn.Open();
                    string query = "INSERT INTO Products (ProductName, Price, ImagePath) VALUES (@Name, @Price, @Image)";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@Name", txtProductName.Text.Trim());
                    cmd.Parameters.AddWithValue("@Price", Convert.ToDecimal(txtPrice.Text.Trim()));
                    cmd.Parameters.AddWithValue("@Image", "Images/" + fileName);

                    cmd.ExecuteNonQuery();
                }

                lblMsg.Text = "Product added successfully!";
                txtProductName.Text = "";
                txtPrice.Text = "";
                BindProducts();
            }
            catch (Exception ex)
            {
                lblMsg.Text = "Error: " + ex.Message;
            }
        }

        // Bind products to GridView
        private void BindProducts()
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                string query = "SELECT * FROM Products";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridViewProducts.DataSource = dt;
                GridViewProducts.DataBind();
            }
        }
        protected void GridViewProducts_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewProducts.EditIndex = e.NewEditIndex;
            BindProducts();
        }

        protected void GridViewProducts_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewProducts.EditIndex = -1;
            BindProducts();
        }

        protected void GridViewProducts_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int productId = Convert.ToInt32(GridViewProducts.DataKeys[e.RowIndex].Value);

            TextBox txtName = (TextBox)GridViewProducts.Rows[e.RowIndex].FindControl("txtEditName");
            TextBox txtPrice = (TextBox)GridViewProducts.Rows[e.RowIndex].FindControl("txtEditPrice");

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                string query = "UPDATE Products SET ProductName=@Name, Price=@Price WHERE ProductID=@ID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
                cmd.Parameters.AddWithValue("@Price", Convert.ToDecimal(txtPrice.Text.Trim()));
                cmd.Parameters.AddWithValue("@ID", productId);

                cmd.ExecuteNonQuery();
            }

            // SUCCESS MESSAGE
            lblDeleteMsg.Text = "Product updated successfully!";
            lblDeleteMsg.ForeColor = System.Drawing.Color.Blue;

            GridViewProducts.EditIndex = -1;
            BindProducts();
        }

        protected void GridViewProducts_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int productId = Convert.ToInt32(GridViewProducts.DataKeys[e.RowIndex].Value);

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                string query = "DELETE FROM Products WHERE ProductID=@ID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@ID", productId);
                cmd.ExecuteNonQuery();
            }

            lblDeleteMsg.Text = "✅ Product deleted successfully!";
            lblDeleteMsg.ForeColor = System.Drawing.Color.Green;

            BindProducts();
        }
        // Bind orders to GridView
        private void BindOrders()
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                string query = @"SELECT o.OrderID,
                                p.ProductName,
                                o.Qty,
                                o.OrderDate,
                                o.Email
                         FROM Orders o
                         INNER JOIN Products p ON o.ProductID = p.ProductID";

                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridViewOrders.DataSource = dt;
                GridViewOrders.DataBind();
            }
        }
    }
    
}