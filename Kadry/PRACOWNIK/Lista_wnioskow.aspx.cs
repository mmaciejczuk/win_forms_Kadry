using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Kadry.PRACOWNIK
{
    public partial class Lista_wnioskow : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bindListView();
        }

        protected void bindListView()   //  pobierz urlopy
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.
               ConnectionStrings["HRConnectionString"].ConnectionString);
            connection.Open();
            string checkUser = "select w.Id As Id, ru.Nazwa_urlopu as Rodzaj_urlopu, " +
                "w.Data_od_, w.Data_do, w.Liczba_dni, w.Przyjety, w.Data_zlozenia " +
                "from Wnioski w, RodzajeUrlopow ru " +
            "where w.Pracownik = @Pracownik and w.Typ_wniosku=1 " +
            "and w.Rodzaj_urlopu=ru.Id";
            SqlCommand cmd = new SqlCommand(checkUser, connection);
            cmd.Parameters.AddWithValue("@Pracownik", Session["id"].ToString());

            SqlDataReader reader = cmd.ExecuteReader();

            GridView1.DataSource = reader;
            GridView1.DataBind();
            reader.Close();
            connection.Close();
        }
    }
}