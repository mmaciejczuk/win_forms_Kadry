using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Kadry.PRACOWNIK
{
    public partial class Urlopy : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void WybierzDane()
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.
                ConnectionStrings["HRConnectionString"].ConnectionString);
            connection.Open();
            string checkUser = "select p.Staz_pracy_do_umowy, p.Umowa_od, p.Wymiar_etatu, p.Plec, " +
                "w.Data_od, w.Data_do, w.Liczba_dni, w.Stan_wniosku, ru.Nazwa_urlopu " +
                "from Pracownicy r, PracownicyWnioski pw, Wnioski w, RodzajeUrlopw ru where " +
                "p.Id_pracownika=pw.Id_pracownika AND pw.Id_wniosku=w.Id AND w.Rodzaj_urlopu=ru.Id " + 
                "AND Email = @Email";
            SqlCommand cmd = new SqlCommand(checkUser, connection);
            cmd.Parameters.AddWithValue("@Email", Session["email"].ToString());
            SqlDataReader reader = null;
            reader = cmd.ExecuteReader();

            string Staz_pracy_do_umowy = null;
            string Umowa_od = null;
            string Wymiar_etatu = null;
            string Plec = null;
            string Data_od = null;
            string Data_do = null;
            string Liczba_dni = null;
            string Stan_wniosku = null;
            string Nazwa_urlopu = null;

            while (reader.Read())
            {
                Staz_pracy_do_umowy = (reader[0].ToString());
                Umowa_od = (reader[1].ToString());
                Wymiar_etatu = (reader[2].ToString());
                Plec = (reader[3].ToString());
                Data_od = (reader[4].ToString());
                Data_do = (reader[5].ToString());
                Liczba_dni = (reader[6].ToString());
                Stan_wniosku = (reader[7].ToString());
                Nazwa_urlopu = (reader[8].ToString());
            }
            connection.Close();
            reader.Close();
        }
    }
}