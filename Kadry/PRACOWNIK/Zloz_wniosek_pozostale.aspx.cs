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
    public partial class Zloz_wniosek_pozostale : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //LabelInfo.Text = "";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (rbPowod.SelectedIndex == -1)
            {
                LabelInfo.Text = "Brak wymaganych informacji. Wypełnij wszystkie pola.";
            }

            else
            {
                if (tbTresc.Text == "")
                {
                    LabelInfo.Text = "Sprecyzj wniosek w polu Treść wniosku.";
                }
                else
                {
                    wyslijFormularzDoBazy();
                    rbPowod.SelectedIndex = -1;
                    tbTresc.Text = "";
                    tbUwagi.Text = "";
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
                "Uwagi) " +
                "VALUES (@Typ_wniosku, @Pracownik, @Przyjety, @Tresc, @Data_zlozenia, " +
                "@Uwagi) SELECT CAST(scope_identity() AS int)";
            SqlCommand cmd = new SqlCommand(Insert1, sqlConnection1);

            cmd.Parameters.AddWithValue("@Typ_wniosku", rbPowod.SelectedValue);
            cmd.Parameters.AddWithValue("@Pracownik", Session["id"].ToString());
            cmd.Parameters.AddWithValue("@Przyjety", false);
            cmd.Parameters.AddWithValue("@Tresc", tbTresc.Text);
            cmd.Parameters.AddWithValue("@Data_zlozenia", (DateTime.Now.ToOADate()));
            cmd.Parameters.AddWithValue("@Uwagi", tbUwagi.Text);

            cmd.Connection = sqlConnection1;

            sqlConnection1.Open();
            int wniosekId = Convert.ToInt32(cmd.ExecuteScalar());
            sqlConnection1.Close();
            LabelInfo.Text = wniosekId.ToString();

        }
    }
}