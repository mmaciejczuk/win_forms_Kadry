<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Uzytkownik.Master" AutoEventWireup="true" CodeBehind="Urlopy.aspx.cs" Inherits="Kadry.PRACOWNIK.Urlopy" %>

<%@ Register Src="~/UserControls/CalendarUserControl.ascx" TagPrefix="uc2" TagName="CalendarUserControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style>
.tg  {border-collapse:collapse;border-spacing:0;border-color:#aaa;}
.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#aaa;color:#333;background-color:#fff;}
.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#aaa;color:#fff;background-color:#f38630;}
.tg .tg-cxkv{background-color:#ffffff}
.tg .tg-e3zv{font-weight:bold}
.tg .tg-vebi{font-weight:bold;color:#343434}
div.TabView div.Tabs
{
  height: 30px;
  overflow: hidden;
}

div.TabView div.Tabs a
{
    padding:9px 15px;
    display:inline-block;
    border-radius:3px 3px 0px 0px;
    background:#7FB5DA;
    font-size:14px;
    font-weight:600;
    color:#4c4c4c;
    transition:all linear 0.15s;
}

div.TabView div.Tabs a:hover, div.TabView div.Tabs a.Active
{
    background:#a7cce5;
    text-decoration:none;
}

div.TabView div.Pages
{
  clear: both;
  width: 100%;
  border: 1px solid #a7a6a6;
  overflow: hidden;
}

div.TabView div.Pages div.Page
{
  height: 100%;
  padding: 0px;
  overflow: hidden;
}

div.TabView div.Pages div.Page div.Pad
{
  padding: 3px 5px;
}
</style>
<script>

    function tabview_aux(TabViewId, id) {
        var TabView = document.getElementById(TabViewId);

        // ----- Tabs -----

        var Tabs = TabView.firstChild;
        while (Tabs.className != "Tabs") Tabs = Tabs.nextSibling;

        var Tab = Tabs.firstChild;
        var i = 0;

        do {
            if (Tab.tagName == "A") {
                i++;
                Tab.href = "javascript:tabview_switch('" + TabViewId + "', " + i + ");";
                Tab.className = (i == id) ? "Active" : "";
                Tab.blur();
            }
        }
        while (Tab = Tab.nextSibling);

        // ----- Pages -----

        var Pages = TabView.firstChild;
        while (Pages.className != 'Pages') Pages = Pages.nextSibling;

        var Page = Pages.firstChild;
        var i = 0;

        do {
            if (Page.className == 'Page') {
                i++;
                if (Pages.offsetHeight) Page.style.height = (Pages.offsetHeight - 2) + "px";
                Page.style.overflow = "auto";
                Page.style.display = (i == id) ? 'block' : 'none';
            }
        }
        while (Page = Page.nextSibling);
    }

    // ----- Functions -------------------------------------------------------------

    function tabview_switch(TabViewId, id) { tabview_aux(TabViewId, id); }

    function tabview_initialize(TabViewId) { tabview_aux(TabViewId, 1); }
</script>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="TabView" id="TabView">

<!-- *** Tabs ************************************************************** -->

<div class="Tabs" style="width: 100%;">
    <a>Wnioski urlopowe</a>
    <a>Napisz wniosek</a>
    <a>Dostępny urlop</a>
</div>

<!-- *** Pages ************************************************************* -->

<div class="Pages" style="width:660px; height: 400px;">

  <div class="Page">
  <div class="Pad">

  <!-- *** Page1 Start *** -->

  <br />


  <!-- *** Page1 End ***** -->

  </div>
  </div>

  <!-- *** Page2 Start *** -->

  <div class="Page">
  <div class="Pad">

  <asp:Label ID="lblNapisz" runat="server"></asp:Label>
<table class="tg">
  <tr>
    <th class="tg-vebi" colspan="5">Wniosek urlopowy</th>
  </tr>
  <tr>
    <td class="tg-031e">Imię</td>
    <td class="tg-031e" colspan="4">
        <asp:TextBox ID="tbImie" runat="server"></asp:TextBox>
    </td>
  </tr>
  <tr>
    <td class="tg-031e">Nazwisko</td>
    <td class="tg-031e" colspan="4">
        <asp:TextBox ID="tbNazwisko" runat="server"></asp:TextBox>
    </td>
  </tr>
  <tr>
    <td class="tg-031e" colspan="5"></td>
  </tr>
  <tr>
    <td class="tg-e3zv">Powód nieobecności</td>
    <td class="tg-031e" colspan="4">
            <asp:RadioButtonList ID="rbPowod" runat="server" 
                RepeatDirection="Vertical" RepeatLayout="Flow">
                <asp:ListItem Text="Excellent" Value="Excellent"></asp:ListItem>
                <asp:ListItem Text="Very Good" Value="Very Good"></asp:ListItem>
                <asp:ListItem Text="Good" Value="Good"></asp:ListItem>
                <asp:ListItem Text="Fair" Value="Fair"></asp:ListItem>
                <asp:ListItem Text="Bad" Value="Bad"></asp:ListItem>
            </asp:RadioButtonList> 
    </td>
  </tr>
  <tr>
    <td class="tg-e3zv" rowspan="2">Czas nieobecności</td>
    <td class="tg-031e">od</td>
    <td class="tg-031e">
        <uc2:CalendarUserControl runat="server" ID="CalendarUserControl" />
    </td>
    <td class="tg-031e">do</td>
    <td class="tg-031e">textboxDataDo</td>
  </tr>
  <tr>
    <td class="tg-031e">liczba dni</td>
    <td class="tg-031e" colspan="3">textboxLiczbaDni</td>
  </tr>
  <tr>
    <td class="tg-e3zv">Uwagi</td>
    <td class="tg-031e" colspan="4">Uwagi........</td>
  </tr>
  </table>

  <!-- *** Page2 End ***** -->

  </div>
  </div>

  <div class="Page">
  <div class="Pad">

  <!-- *** Page3 Start *** -->

  <br />

  <asp:Label ID="lblDost" runat="server">Dostępne urlopy</asp:Label>

  <!-- *** Page3 End ***** -->

  </div>
  </div>

</div>

</div>


<script type="text/javascript">

    tabview_initialize('TabView');


</script>
</asp:Content>
