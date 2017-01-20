using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.WebControls;

namespace Kadry.PRACOWNIK
{
    public partial class Dostepny_urlop : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            rysujWykres1();
            rysujWykres2();
        }

        protected void rysujWykres1()
        {
            int rokAktualny = DateTime.Now.Year;

            SqlConnection connection = new SqlConnection(ConfigurationManager.
                ConnectionStrings["HRConnectionString"].ConnectionString);
            connection.Open();
            string checkUser = "select Zalegly, Aktualny, Na_zadanie from Urlopy where Id = @Id";
            SqlCommand cmd = new SqlCommand(checkUser, connection);
            cmd.Parameters.AddWithValue("@Id", Session["id"].ToString());

            SqlDataReader reader = null;
            reader = cmd.ExecuteReader();

            int[] yValues = new int[3];
            string[] xValues = new string[3];

            while (reader.Read())
            {
                yValues[0] = (Convert.ToInt32(reader[0]));
                xValues[0] = (reader[0]).ToString() + " dni - zaległy";
                yValues[1] = (Convert.ToInt32(reader[1]));
                xValues[1] = (reader[1]).ToString() + " dni - aktualny";
                yValues[2] = (Convert.ToInt32(reader[2]));
                xValues[2] = (reader[2]).ToString() + " dni - na żądanie";
            }
            connection.Close();
            reader.Close();

            Chart1.Series["Default"].Points.DataBindXY(xValues, yValues);
            Chart1.Series["Default"].ChartType = SeriesChartType.Pie;
            Chart1.Series["Default"]["PieLabelStyle"] = "Disabled";
            Chart1.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = true;
            Chart1.Series[0]["PieDrawingStyle"] = "SoftEdge";
            Chart1.Legends[0].Enabled = true;
        }


        protected void rysujWykres2()
        {
            /*
            1 - wypoczynkowy
            2 - na żądanie
            3 - macierzyński
            4 - bezpłatny
            5 - okolicznościowy 
            7 - zdrowotny
            8 - nad dzieckiem
            9 - ojcowski
            */
            int rokAktualny = DateTime.Now.Year;

            //  Pobierz ulopy wypoczynkowe z tabeli Urlopy  -   do wykresu 1
            //  Pobierz liczbę urlopów wraz z nazwami z aktualnego roku  - do wykresu 2.

            SqlConnection connection = new SqlConnection(ConfigurationManager.
                ConnectionStrings["HRConnectionString"].ConnectionString);
            SqlCommand pobierzDane = new SqlCommand("SELECT Rodzaj_urlopu, SUM(Liczba_dni) As Liczba " +
                "FROM Wnioski " +
                "WHERE YEAR(Data_od_) = @rokAktualny AND Pracownik = @Pracownik " +
                "AND Przyjety=@Przyjety " +
                "GROUP BY Rodzaj_urlopu", connection);

            pobierzDane.Parameters.AddWithValue("@rokAktualny", rokAktualny);
            pobierzDane.Parameters.AddWithValue("@Pracownik", Session["id"].ToString());
            pobierzDane.Parameters.AddWithValue("@Przyjety", true);
            connection.Open();
            SqlDataReader reader = pobierzDane.ExecuteReader();
            int numRows = 0;
            DataTable dt = new DataTable();
            dt.Load(reader);
            numRows = dt.Rows.Count;

            // Populate series data
            int[] yValues = new int[numRows];
            string[] xValues = new string[numRows];

            for (int index = 0; index < numRows; index++)
            {

                yValues[index] = Convert.ToInt32(dt.Rows[index]["Liczba"]);

                if (Convert.ToInt32(dt.Rows[index]["Rodzaj_urlopu"]) == 1)
                {
                    xValues[index] = Convert.ToInt32(dt.Rows[index]["Liczba"]).ToString() + " dni - wypoczynkowy";
                }
                else if (Convert.ToInt32(dt.Rows[index]["Rodzaj_urlopu"]) == 2)
                {
                    xValues[index] = Convert.ToInt32(dt.Rows[index]["Liczba"]).ToString() + " dni - na żądanie";
                }
                else if (Convert.ToInt32(dt.Rows[index]["Rodzaj_urlopu"]) == 3)
                {
                    xValues[index] = Convert.ToInt32(dt.Rows[index]["Liczba"]).ToString() + " dni - bezpłatny";
                }
                else if (Convert.ToInt32(dt.Rows[index]["Rodzaj_urlopu"]) == 4)
                {
                    xValues[index] = Convert.ToInt32(dt.Rows[index]["Liczba"]).ToString() + " dni - bezpłatny";
                }
                else if (Convert.ToInt32(dt.Rows[index]["Rodzaj_urlopu"]) == 5)
                {
                    xValues[index] = Convert.ToInt32(dt.Rows[index]["Liczba"]).ToString() + " dni - okolicznościowy";
                }
                else if (Convert.ToInt32(dt.Rows[index]["Rodzaj_urlopu"]) == 7)
                {
                    xValues[index] = Convert.ToInt32(dt.Rows[index]["Liczba"]).ToString() + " dni - zdrowotny";
                }
                else if (Convert.ToInt32(dt.Rows[index]["Rodzaj_urlopu"]) == 8)
                {
                    xValues[index] = Convert.ToInt32(dt.Rows[index]["Liczba"]).ToString() + " dni - opieka nad dzieckiem";
                }
                else if (Convert.ToInt32(dt.Rows[index]["Rodzaj_urlopu"]) == 9)
                {
                    xValues[index] = Convert.ToInt32(dt.Rows[index]["Liczba"]).ToString() + " dni - ojcowski";
                }
            }
            connection.Close();
            reader.Close();

            Chart2.Series["Default"].Points.DataBindXY(xValues, yValues);


            //Set Pie chart type
            Chart2.Series["Default"].ChartType = SeriesChartType.Pie;

            //Set labels style (Inside, Outside, Disabled)
            Chart2.Series["Default"]["PieLabelStyle"] = "Disabled";

            //Enable 3D
            Chart2.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = true;

            //Default, SoftEdge, Concave (not enabled if 3D)
            Chart2.Series[0]["PieDrawingStyle"] = "SoftEdge";

            // Disable/Enable the Legend
            Chart2.Legends[0].Enabled = true;
        }

        protected void btnAktualizuj_Click(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.
                ConnectionStrings["HRConnectionString"].ConnectionString);
            connection.Open();
            string checkUser = "select Dnia, Aktualny, Na_zadanie from Urlopy where Id = @Id";
            SqlCommand cmd = new SqlCommand(checkUser, connection);
            cmd.Parameters.AddWithValue("@Id", Session["id"]);
            DateTime dnia = new DateTime();
            int aktualnyUrlop = 0;
            SqlDataReader reader = null;
            reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                dnia = Convert.ToDateTime(reader[0]);
                aktualnyUrlop = Convert.ToInt32(reader[1]) + Convert.ToInt32(reader[2]);
            }
            connection.Close();
            reader.Close();


            connection.Close();
            if (dnia.Year == DateTime.Now.Year - 1)    // zaktualizuj jeśli jest już NASTĘPNY rok, a nie zostało zaktualizowane
            {
                //  wylicz staż, 
                //  jeśli < 5 dodaj 21 dni, jeśli > 5 dodaj 26 dni dop "Aktualny" i zmień status "Zaktualizowano" na true

                connection.Open();
                string checkPasswordQuery = "select Typ_umowy, Umowa_od, Umowa_do, Staz_pracy_do_umowy " +
                    "from Pracownicy where Id_pracownika = @Id";
                SqlCommand passCom = new SqlCommand(checkPasswordQuery, connection);
                passCom.Parameters.AddWithValue("@id", Convert.ToInt32(Session["id"]));
                SqlDataReader reader2 = null;
                reader2 = passCom.ExecuteReader();

                int wymiarEtatu = 0;
                DateTime umowa_od = new DateTime();
                string umowa_do = "";
                int staz = 0;

                while (reader2.Read())
                {
                    wymiarEtatu = Convert.ToInt32(reader2[0]);
                    umowa_od = Convert.ToDateTime(reader2[1]);
                    umowa_do = (reader2[2]).ToString();
                    staz = Convert.ToInt32(reader2[3]);
                }
                connection.Close();
                reader2.Close();

                //  wylicz staż,  
                int stazCalkowity = 0;

                DateTime zeroTime = new DateTime(1, 1, 1);
                TimeSpan span = DateTime.Now - umowa_od;
                stazCalkowity = (zeroTime + span).Year - 1 + staz;

                //  wylicz wymiar urlopu z wymiaru etatu, umowy_do i ze stażu pracy
                //1 - cały etat
                //2 - pół etatu
                //3 - 1/4 etatu

                int uropDoDodania = 0;

                if (umowa_do != "")     //  wykonaj jeśli pracownik ma umowę na czas określony
                {
                    // jeśli rok zakończenia umowy jest większy niż obecny to dodaj normalnie
                    if ((Convert.ToDateTime(umowa_do)).Year > DateTime.Now.Year)
                    {
                        if (stazCalkowity > 5)  // jeśli przepracował więcej niż 5 lat
                        {
                            if (wymiarEtatu == 1)
                            {
                                uropDoDodania = 26;
                            }
                            else if (wymiarEtatu == 2)
                            {
                                uropDoDodania = 26 / 2;
                            }
                            else if (wymiarEtatu == 3)
                            {
                                //  funkcja zaokrąglająca urlop zawsze w górę
                                uropDoDodania = (int)Math.Ceiling((double)26 / (double)4);
                            }
                        }
                        else if (stazCalkowity < 5)    //  jeśli nie przepracował 5 lat
                        {
                            if (wymiarEtatu == 1)
                            {
                                uropDoDodania = 21;
                            }
                            else if (wymiarEtatu == 2)
                            {
                                uropDoDodania = (int)Math.Ceiling((double)21 / (double)2);
                            }
                            else if (wymiarEtatu == 3)
                            {
                                uropDoDodania = (int)Math.Ceiling((double)21 / (double)4);
                            }
                        }

 //  ________________________TUTAJ UPDATE TABELI URLOPY______________________________
                        updateUrlopy(uropDoDodania, aktualnyUrlop);
                        LabelInfo.Text = "Umowa pracownika jest aktualna do " +
                            (Convert.ToDateTime(umowa_do)).Year + " roku. Dodano " + uropDoDodania.ToString() + " dni urlopowych.";
                    }

                    // jeśli rok zakończenia jest równy obecnemu to wyświetl informację
                    if ((Convert.ToDateTime(umowa_do)).Year == DateTime.Now.Year)
                    {
                        LabelInfo.Text = "Umowa pracownika jest aktualna do obecnego roku. Urlop nie został zaktualizowany.<br />" +
                            " Skonsultuj się z Działem Kadr.";
                    }
                    // jeśli rok zakończenia umowy jest mniejszy niz obecny wyzeruj i wyświetl informację "umowa nieważna"
                    if ((Convert.ToDateTime(umowa_do)).Year < DateTime.Now.Year)
                    {
                        LabelInfo.Text = "Umowa pracownika wygasła.";
                    }
                }

                else                        //   wykonaj jeśli pracownik ma umowę na czas nieokreślony
                {
                    if (stazCalkowity > 5)  // jeśli przepracował więcej niż 5 lat
                    {
                        if (wymiarEtatu == 1)
                        {
                            uropDoDodania = 26;
                        }
                        else if (wymiarEtatu == 2)
                        {
                            uropDoDodania = 26 / 2;
                        }
                        else if (wymiarEtatu == 3)
                        {
                            //  funkcja zaokrąglająca urlop zawsze w górę
                            uropDoDodania = (int)Math.Ceiling((double)26 / (double)4);
                        }
                    }
                    else if (stazCalkowity < 5)    //  jeśli nie przepracował 5 lat
                    {
                        if (wymiarEtatu == 1)
                        {
                            uropDoDodania = 21;
                        }
                        else if (wymiarEtatu == 2)
                        {
                            uropDoDodania = (int)Math.Ceiling((double)21 / (double)2);
                        }
                        else if (wymiarEtatu == 3)
                        {
                            uropDoDodania = (int)Math.Ceiling((double)21 / (double)4);
                        }
                    }

 //  ______________________TUTAJ UPDATE TABELI URLOPY______________________________
                    updateUrlopy(uropDoDodania, aktualnyUrlop);
                    LabelInfo.Text = "Umowa pracownika jest aktualna. Dodano " + uropDoDodania.ToString() + " dni urlopowych.";
                }
            }
            else if (dnia.Year == DateTime.Now.Year)        //      jeśli urlop był już zakualizowany wyświetl info
            {
                LabelInfo.Text = "Urlop został już zaktualizowany dnia " + dnia.ToShortDateString() + ".";
            }
            else
            {
                LabelInfo.Text = "Skonsultuj się z Działem Kadr.";
            }
        } 

        //  funkcja aktualizująca tabelę urlopy o nowy urlop wyp + na żądanie, oraz przepisująca urlop aktualny jako zaległy
        protected void updateUrlopy(int uropDoDodania, int urlopZalegly)
        {
            //  pola do tabeli Ulopy:
            DateTime dnia = DateTime.Now;
            int zalegly = urlopZalegly;
            int aktualny = uropDoDodania - 4;
            int naZadanie = 4;

            SqlConnection connection = new SqlConnection(ConfigurationManager.
                ConnectionStrings["HRConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("update [Urlopy] set [Zaktualizowano] = @zaktualizowano, " +
                "[Dnia] = @dnia, [Zalegly] = @zalegly, [Aktualny]=@aktualny, " +
            "[Na_zadanie]=@naZadanie where Id = @Id", connection);;

            cmd.Parameters.AddWithValue("zaktualizowano", true);
            cmd.Parameters.AddWithValue("dnia", dnia);
            cmd.Parameters.AddWithValue("zalegly", zalegly);
            cmd.Parameters.AddWithValue("aktualny", aktualny);
            cmd.Parameters.AddWithValue("naZadanie", naZadanie);
            cmd.Parameters.AddWithValue("Id", Session["id"].ToString());
            try
            {
                connection.Open();
                cmd.ExecuteNonQuery();
            }
            catch (SqlException err)
            {
                LabelInfo.Text = err.ToString();
            }
            finally
            {
                connection.Close();
            }
        }
    }
}

    