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
    public partial class Dane_pracownika : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bindDetailsView();
        }

        protected void bindDetailsView()   //  pobierz urlopy
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.
               ConnectionStrings["HRConnectionString"].ConnectionString);
            connection.Open();
            string checkUser = "SELECT [Id_pracownika], [Imie], [Nazwisko], [Plec], tu.Nazwa As [Typ_umowy], " +
            "[Umowa_od], [Umowa_do], [Stanowisko], [Staz_pracy_do_umowy], [Dochod_netto], " +
            "[Pesel], [Email], [Telefon], [Ulica], [Kod], [Miasto], [Haslo], " +
            "[SymbolDzialu], [NrKonta] FROM [Pracownicy] p, [TypUmowy] tu WHERE Id_pracownika=Id_pracownika "+
            "AND p.Typ_umowy = tu.Id";

            SqlCommand cmd = new SqlCommand(checkUser, connection);
            cmd.Parameters.AddWithValue("@Id_pracownika", Session["id"].ToString());

            SqlDataReader reader = cmd.ExecuteReader();

            DetailsView1.DataSource = reader;
            DetailsView1.DataBind();
            reader.Close();
            connection.Close();
        }        
    }
}