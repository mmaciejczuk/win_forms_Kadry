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
    public partial class Wiadomosci : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            SqlConnection sqlConnection1 = new SqlConnection(ConfigurationManager.
                ConnectionStrings["HRConnectionString"].ConnectionString);
            string Insert1 = "INSERT Wiadomosci (Pracownik, Temat, Tresc, Nadawca_pracownik, Data_wyslania) " +
                "VALUES (@Pracownik, @Temat, @Tresc, @Nadawca_pracownik, @Data_wyslania)";
            SqlCommand cmd = new SqlCommand(Insert1, sqlConnection1);

            cmd.Parameters.AddWithValue("@Pracownik", Session["id"].ToString());
            cmd.Parameters.AddWithValue("@Temat", ddlSubject.SelectedItem.ToString());
            cmd.Parameters.AddWithValue("@Tresc", txtMessage.Text);
            cmd.Parameters.AddWithValue("@Nadawca_pracownik", true);
            cmd.Parameters.AddWithValue("@Data_wyslania", (DateTime.Now.ToOADate()));

            cmd.Connection = sqlConnection1;

            sqlConnection1.Open();
            cmd.ExecuteNonQuery();
            sqlConnection1.Close();
            Response.Redirect("~/PRACOWNIK/Wiadomosci.aspx");
            LabelInfo.Text = "Wiadomość została wysłana";
        }


    }
}