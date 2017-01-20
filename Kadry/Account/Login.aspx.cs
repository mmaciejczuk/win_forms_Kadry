using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Kadry.Account
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Unnamed6_Click(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["HRConnectionString"].ConnectionString);
            connection.Open();
            string checkUser = "select count(*) from Pracownicy where Email = @Email";
            SqlCommand cmd = new SqlCommand(checkUser, connection);
            cmd.Parameters.AddWithValue("@Email", UserName.Text);
            int temp = Convert.ToInt32(cmd.ExecuteScalar().ToString());
            connection.Close();
            if (temp == 1)
            {
                connection.Open();
                string checkPasswordQuery = "select Haslo from Pracownicy where Email = @Email";
                SqlCommand passCom = new SqlCommand(checkPasswordQuery, connection);
                passCom.Parameters.AddWithValue("@Email", UserName.Text);
                string password = passCom.ExecuteScalar().ToString();
                if (password == Password.Text)
                {
                    Session["New"] = UserName.Text;
                    Response.Write("Hasło jest poprawne");
                    Response.Redirect("~/Uzytkownik/Default.aspx");
                    connection.Close();
                }
                else
                {
                    FailureText.Text = "Hasło jest niepoprawne";
                    connection.Close();
                }
            }
            else
            {
                FailureText.Text = "Użytkownik nie istnieje w bazie";
            }
        }
    }
}