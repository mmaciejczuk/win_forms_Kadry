<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Uzytkownik.Master" AutoEventWireup="true" CodeBehind="Wnioski_inne.aspx.cs" Inherits="Kadry.PRACOWNIK.Wnioski_inne" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>

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
  <a>Dostępny urlop</a>
</div>

<!-- *** Pages ************************************************************* -->

<div class="Pages" style="width:660px; height: 400px;">

  <div class="Page">
  <div class="Pad">

  <!-- *** Page1 Start *** -->

  <br />

  <table>
  <tr>
    <td style="vertical-align: top;">Distributed form:&nbsp;</td>
    <td>
    <input type="text" name="first" />
    <br />
    <small>Note: the rest of the form is at the Tab 3.</small>
    </td>
  </tr>
  </table>

  <!-- *** Page1 End ***** -->

  </div>
  </div>

  <!-- *** Page2 Start *** -->

  <div class="Page">
  <div class="Pad">

  Tab2<br />Tab2<br />Tab2<br />Tab2<br />Tab2<br />Tab2<br />Tab2<br />Tab2<br />Tab2<br />Tab2<br />Tab2<br />Tab2<br />Tab2<br />Tab2<br />Tab2<br />Tab2<br />Tab2<br />Tab2<br />Tab2<br />Tab2<br />Tab2<br />Tab2<br />Tab2<br />Tab2<br />Tab2<br />Tab2<br />Tab2<br />Tab2<br />Tab2<br />Tab2<br />Tab2<br />Tab2<br />Tab2<br />Tab2<br />Tab2<br />Tab2<br />Tab2<br />Tab2<br />

  <!-- *** Page2 End ***** -->

  </div>
  </div>

  <div class="Page">
  <div class="Pad">

  <!-- *** Page3 Start *** -->

  <br />

  <table>
  <tr>
    <td>Username:&nbsp;</td>
    <td><input style="width: 120px;" type="text"     name="username" /></td>
  </tr>
  <tr>
    <td>Password:&nbsp;</td>
    <td><input style="width: 120px;" type="password" name="password" /></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><input type="submit" value="Submit" /></td>
  </tr>
  </table>

  <!-- *** Page3 End ***** -->

  </div>
  </div>

</div>

</div>


<script type="text/javascript">

    tabview_initialize('TabView');


</script>

</asp:Content>
