using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Kadry.PRACOWNIK
{
    public partial class Zloz_wniosek : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //LabelInfo.Text = "";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (rbPowod.SelectedIndex == -1 || tbDataDo.Text == "" || tbDataOd.Text == "" || tbLiczba.Text == "")
            {
                LabelInfo.Text = "Brak wymaganych informacji. Wypełnij wszystkie pola lub popraw błędy.";
            }
            else
            {
                if (Convert.ToDateTime(tbDataOd.Text) > Convert.ToDateTime(tbDataDo.Text)
                    || Convert.ToDateTime(tbDataOd.Text) < DateTime.Now || 
                    Convert.ToDateTime(tbDataDo.Text) < DateTime.Now)
                {
                    LabelInfo.Text = "Wprowadź poprawne daty.";
                }
                else if (Convert.ToDateTime(tbDataOd.Text).Year != Convert.ToDateTime(tbDataDo.Text).Year)
                {
                    LabelInfo.Text = "Wybrane daty na jednym wniosku powinny należeć do tego samego roku.";
                }
                else
                {
                    wyslijFormularzDoBazy();
                    rbPowod.SelectedIndex = -1;
                    tbDataOd.Text = "";
                    tbDataDo.Text = "";
                    tbUwagi.Text = "";
                    tbLiczba.Text = "";
                    LabelInfo.ForeColor = System.Drawing.Color.Green;
                    LabelInfo.Text = "Wniosek został wysłany. Dziękujemy.";
                }
            }
        }

        protected void wyslijFormularzDoBazy()
        {

/*      POŁĄCZENIE PIERWSZE       */

            SqlConnection sqlConnection1 = new SqlConnection(ConfigurationManager.
                ConnectionStrings["HRConnectionString"].ConnectionString);
            string Insert1 = "INSERT Wnioski (Typ_wniosku, Pracownik, Przyjety, Tresc, Data_zlozenia, " +
                "Rodzaj_urlopu, Data_od_, Data_do, Liczba_dni, Uwagi) " +
                "VALUES (@Typ_wniosku, @Pracownik, @Przyjety, @Tresc, @Data_zlozenia, " +
                "@Rodzaj_urlopu, @Data_od_, @Data_do, @Liczba_dni, @Uwagi) SELECT CAST(scope_identity() AS int)";
            SqlCommand cmd = new SqlCommand(Insert1, sqlConnection1);

            cmd.Parameters.AddWithValue("@Typ_wniosku", 1);
            cmd.Parameters.AddWithValue("@Pracownik", Session["id"].ToString());
            cmd.Parameters.AddWithValue("@Przyjety", false);
            cmd.Parameters.AddWithValue("@Tresc", "");
            cmd.Parameters.AddWithValue("@Data_zlozenia", (DateTime.Now.ToOADate()));
            cmd.Parameters.AddWithValue("@Rodzaj_urlopu", Convert.ToInt32(rbPowod.SelectedValue));
            cmd.Parameters.AddWithValue("@Data_od_", tbDataDo.Text);
            cmd.Parameters.AddWithValue("@Data_do", tbDataDo.Text);
            cmd.Parameters.AddWithValue("@Liczba_dni", tbLiczba.Text);
            cmd.Parameters.AddWithValue("@Uwagi", tbUwagi.Text);

            cmd.Connection = sqlConnection1;

            sqlConnection1.Open();
            int wniosekId = Convert.ToInt32(cmd.ExecuteScalar());
            sqlConnection1.Close();
            LabelInfo.Text = wniosekId.ToString();         
        }
    }
}