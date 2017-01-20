using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Kadry
{
    public partial class Start : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["id"] = null;
            Session["email"] = null;
            Session["nazwisko"] = null;
            Session["imie"] = null;
            Session["plec"] = null;
        }

        protected void ButtonZaloguj_Click(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["HRConnectionString"].ConnectionString);
            connection.Open();
            string checkUser = "select count(*) from Pracownicy where Email = @Email";
            SqlCommand cmd = new SqlCommand(checkUser, connection);
            cmd.Parameters.AddWithValue("@Email", tbEmail.Text);
            int temp = Convert.ToInt32(cmd.ExecuteScalar().ToString());
            connection.Close();
            if (temp == 1)
            {
                connection.Open();
                string checkPasswordQuery = "select Haslo, Plec, Imie, Nazwisko, SymbolDzialu, Id_pracownika from Pracownicy where Email = @Email";
                SqlCommand passCom = new SqlCommand(checkPasswordQuery, connection);
                passCom.Parameters.AddWithValue("@Email", tbEmail.Text);
                SqlDataReader reader = null;
                reader = passCom.ExecuteReader();

                string haslo = null;
                string plec = null;
                string imie = null;
                string nazwisko = null;
                string email = null;
                int symbolDzialu = -1;
                int id = 0;

                while (reader.Read())
                {
                    haslo = (reader[0].ToString());
                    plec = (reader[1].ToString());
                    imie = (reader[2].ToString());
                    nazwisko = (reader[3].ToString());
                    symbolDzialu = (Convert.ToInt32(reader[4]));
                    email = tbEmail.Text;
                    id = (Convert.ToInt32(reader[5])); ;
                }
                connection.Close();
                reader.Close();
//                string password = passCom.ExecuteScalar().ToString();

                if (haslo == tbHaslo.Text)
                {
                    Session["email"] = email;
                    Session["nazwisko"] = nazwisko;
                    Session["imie"] = imie;
                    Session["plec"] = plec;
                    Session["id"] = id;

                    Response.Write("Hasło jest poprawne");

                    switch (symbolDzialu)
                    {
                        case 1:     //PRACOWNIK
                            Response.Redirect("~/PRACOWNIK/Default.aspx");
                            break;
                        case 2:     //KADRY
                            Response.Redirect("~/KADRY/Default.aspx");
                            break;
                        case 3:     //ADMIN
                            Response.Redirect("~/ADMIN/Default.aspx");
                            break;
                        default:
                            Response.Redirect("~/Default.aspx");
                            break;
                    }
                }
                else
                {
                    FailureText.Text = "Hasło jest niepoprawne";
                    connection.Close();
                }
            }
            else
            {
                FailureText.Text = "Użytkownik nie istnieje w bazie pracowników";
            }
        }
    }
}