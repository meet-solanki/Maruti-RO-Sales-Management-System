using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Maruti_R.O_Sales
{
    public partial class UserLogin : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["MarutiROConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
         
        }

       

        
        protected void Login_Click(object sender, EventArgs e)
        {

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                SqlCommand cmd = new SqlCommand(
                    "SELECT COUNT(*) FROM Users WHERE Email=@e AND Password=@p", con);

                cmd.Parameters.AddWithValue("@e", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@p", txtPassword.Text.Trim());

                int count = Convert.ToInt32(cmd.ExecuteScalar());

                if (count == 1)
                {
                    // ✅ SAVE SESSION
                    Session["UserEmail"] = txtEmail.Text.Trim();

                    // ✅ SUCCESS MESSAGE
                    Response.Write("<script>alert('Login Successful');</script>");

                    // ✅ REDIRECT TO USER HOME
                    Response.Redirect("UserHome.aspx");
                }
                else
                {
                    lblMsg.Text = "Invalid Email or Password";
                    lblMsg.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
    }

        
    
}
    