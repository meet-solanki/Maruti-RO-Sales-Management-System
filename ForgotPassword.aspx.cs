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
    public partial class ForgetPassword : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["MarutiROConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SendOTP_Click(object sender, EventArgs e)
        {
            string otp = new Random().Next(100000, 999999).ToString();

            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(
                    "UPDATE Users SET OTP=@o, OTPExpiry=DATEADD(MINUTE,5,GETDATE()) WHERE Email=@e", con);

                cmd.Parameters.AddWithValue("@o", otp);
                cmd.Parameters.AddWithValue("@e", txtEmail.Text);
                cmd.ExecuteNonQuery();
            }

            lblMsg.Text = "OTP Sent (OTP: " + otp + ")";
        }

        protected void Reset_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(
                    "UPDATE Users SET Password=@p WHERE Email=@e AND OTP=@o AND OTPExpiry>GETDATE()", con);

                cmd.Parameters.AddWithValue("@p", txtNewPass.Text);
                cmd.Parameters.AddWithValue("@e", txtEmail.Text);
                cmd.Parameters.AddWithValue("@o", txtOTP.Text);

                int r = cmd.ExecuteNonQuery();
                lblMsg.Text = r > 0 ? "Password Reset Successful" : "Invalid OTP";
            }
        }
    }
}