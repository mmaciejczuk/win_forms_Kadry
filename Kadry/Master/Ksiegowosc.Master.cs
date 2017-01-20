using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Kadry.Master
{
    public partial class Ksiegowosc : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToInt32(Session["id"]) != 2 || Session["Id"] == null)
                Response.Redirect("~/Start.aspx");
            else
            {
                if (Session["plec"].ToString() == "K")
                {
                    ImagePlec.ImageUrl = "~/images/kobieta.png";
                    lbImieNazwisko.Text = "Witaj " + Session["imie"].ToString() + " " +
                        Session["nazwisko"].ToString();
                }
                else if (Session["plec"].ToString() == "M")
                {
                    ImagePlec.ImageUrl = "~/images/facet.png";
                    lbImieNazwisko.Text = "Witaj " + Session["imie"].ToString() + " " +
                        Session["nazwisko"].ToString();
                }
                else
                    Response.Redirect("~/Start.aspx");
            }
        }
    }
}