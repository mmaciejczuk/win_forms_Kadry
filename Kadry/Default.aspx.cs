using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Kadry
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (User.IsInRole("Administrator"))
            {
                HyperLinkPrzekieruj.Text = "Przejdź do panelu administracyjnego";
                HyperLinkPrzekieruj.NavigateUrl = "~/Administrator/Default.aspx";
            }
            else if (User.IsInRole("Uzytkownik"))
            {
                HyperLinkPrzekieruj.Text = "Przejdź do panelu pracownika";
                HyperLinkPrzekieruj.NavigateUrl = "~/Uzytkownik/Default.aspx";
            }
            else if (User.IsInRole("Ksiegowosc"))
            {
                HyperLinkPrzekieruj.Text = "Przedź do panelu HR";
                HyperLinkPrzekieruj.NavigateUrl = "~/Ksiegowosc/Default.aspx";
            }
            else
                HyperLinkPrzekieruj.Text = "";
        }
    }
}