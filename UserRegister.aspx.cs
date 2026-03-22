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
    public partial class UserRegister : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["MarutiROConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

      

        protected void Register_Click(object sender, EventArgs e)
        {
                 using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(
                    "INSERT INTO Users VALUES(@n,@e,@p,NULL,NULL)", con);

                cmd.Parameters.AddWithValue("@n", txtName.Text);
                cmd.Parameters.AddWithValue("@e", txtEmail.Text);
                cmd.Parameters.AddWithValue("@p", txtPassword.Text);

                cmd.ExecuteNonQuery();
                lblMsg.Text = "Registration Successful!";
                lblMsg.ForeColor = System.Drawing.Color.Green;
            }
        }
    }
    
}