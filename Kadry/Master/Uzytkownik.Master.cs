using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Kadry.Master
{
    public partial class Uzytkownik : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToInt32(Session["id"]) != 1 || Session["Id"] == null)
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

            /*           System.Web.UI.HtmlControls.HtmlGenericControl urlopyLi = (System.Web.UI.HtmlControls.HtmlGenericControl)this.Page.FindControl("urlopyLi");
                        HtmlGenericControl urlopyLi = new HtmlGenericControl("urlopyLi");

                        System.Web.UI.HtmlControls.HtmlGenericControl wnioskiLi = (System.Web.UI.HtmlControls.HtmlGenericControl)this.Page.Master.FindControl("wnioskiLi");
                        System.Web.UI.HtmlControls.HtmlGenericControl szkoleniaLi = (System.Web.UI.HtmlControls.HtmlGenericControl)this.Page.Master.FindControl("szkoleniaLi");
                        System.Web.UI.HtmlControls.HtmlGenericControl badaniaLi = (System.Web.UI.HtmlControls.HtmlGenericControl)this.Page.Master.FindControl("badaniaLi");
                        System.Web.UI.HtmlControls.HtmlGenericControl daneLi = (System.Web.UI.HtmlControls.HtmlGenericControl)this.Page.Master.FindControl("daneLi");
                        System.Web.UI.HtmlControls.HtmlGenericControl wiadomosciLi = (System.Web.UI.HtmlControls.HtmlGenericControl)this.Page.Master.FindControl("wiadomosciLi");

                        //pracownik_urlopy_aspx
                        string thisURL = this.Page.GetType().Name.ToString();
                        switch (thisURL)
                        {
                            case "pracownik_urlopy_aspx":
                                urlopyLi.Attributes.Add("class", "Active");
            //                    Control foundControl = FindControlRecursive(Page.Master, "urlopyLi");
            //                        ((HtmlControl)foundControl).Attributes.Add("class", "Active");
                                break;
                            case "pracownik_wnioski_inne_aspx":
                                wnioskiLi.Attributes.Add("class", "Active");
                                break;
                            case "pracownik_szkolenia_aspx":
                                szkoleniaLi.Attributes.Add("class", "Active");
                                break;
                            case "pracownik_badania_aspx":
                                badaniaLi.Attributes.Add("class", "Active");
                                break;
                            case "pracownik_dane_pracownika_aspx":
                                daneLi.Attributes.Add("class", "Active");
                                break;
                            case "pracownik_wiadomosci_aspx":
                                wiadomosciLi.Attributes.Add("class", "Active");
                                break;

                        }
                    }

                    public static Control FindControlRecursive(Control rootControl, string id)
                    {
                        if (rootControl != null)
                        {
                            if (rootControl.ID == id)
                            {
                                return rootControl;
                            }

                            for (int i = 0; i < rootControl.Controls.Count; i++)
                            {
                                Control child;

                                if ((child = FindControlRecursive(rootControl.Controls[i], id)) != null)
                                {
                                    return child;
                                }
                            }
                        }
                        return null;
                    }
                    string GetTags()
                    {
                        return ID;
                    }        */
        }
    }
}