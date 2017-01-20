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
    public partial class Lista_wnioskow_pozostale : System.Web.UI.Page
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
            string checkUser = "select w.Id As Id, w.Data_zlozenia, tw.Nazwa As Typ_wniosku, w.Tresc, w.Przyjety " +
                "from Wnioski w, TypyWioskow tw " +
            "where w.Pracownik = @Pracownik and w.Typ_wniosku NOT LIKE 1 " +
            "and w.Typ_wniosku=tw.Id";
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