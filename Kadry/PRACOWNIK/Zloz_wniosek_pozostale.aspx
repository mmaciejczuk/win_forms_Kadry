<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Uzytkownik.Master" AutoEventWireup="true" CodeBehind="Zloz_wniosek_pozostale.aspx.cs" Inherits="Kadry.PRACOWNIK.Zloz_wniosek_pozostale" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<link rel="stylesheet" href="http://localhost:3033/code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css"/>
<script src="/Scripts/jquery-1.10.2.js"></script>
<script src="/Scripts/jquery-ui.js"></script>
<script src="../jquery/development-bundle/ui/i18n/jquery.ui.datepicker-sv.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css"/>
<script>

    $(function () {
        $("#ContentPlaceHolder1_tbDataOd").datepicker();
    });
    $(function () {
        $("#ContentPlaceHolder1_tbDataDo").datepicker();
    });

    jQuery(function ($) {
        $.datepicker.regional['pl'] = {
            closeText: 'Zamknij',
            prevText: '&#x3c;Poprzedni',
            nextText: 'Następny&#x3e;',
            currentText: 'Dziś',
            monthNames: ['Styczeń', 'Luty', 'Marzec', 'Kwiecień', 'Maj', 'Czerwiec',
            'Lipiec', 'Sierpień', 'Wrzesień', 'Październik', 'Listopad', 'Grudzień'],
            monthNamesShort: ['Sty', 'Lu', 'Mar', 'Kw', 'Maj', 'Cze',
            'Lip', 'Sie', 'Wrz', 'Pa', 'Lis', 'Gru'],
            dayNames: ['Niedziela', 'Poniedziałek', 'Wtorek', 'Środa', 'Czwartek', 'Piątek', 'Sobota'],
            dayNamesShort: ['Nie', 'Pn', 'Wt', 'Śr', 'Czw', 'Pt', 'So'],
            dayNamesMin: ['N', 'Pn', 'Wt', 'Śr', 'Cz', 'Pt', 'So'],
            weekHeader: 'Tydz',
            dateFormat: 'yy-mm-dd',
            firstDay: 1,
            isRTL: false,
            showMonthAfterYear: false,
            yearSuffix: ''
        };
        $.datepicker.setDefaults($.datepicker.regional['pl']);
    });

    $(document).ready(function () {
        //called when key is down
        $("#ContentPlaceHolder1_tbLiczba").bind("keydown", function (event) {
            if (event.keyCode == 46 || event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 27 || event.keyCode == 13 ||
                // Allow: Ctrl+A
                    (event.keyCode == 65 && event.ctrlKey === true) ||

                // Allow: home, end, left, right
                    (event.keyCode >= 35 && event.keyCode <= 39)) {
                // let it happen, don't do anything
                return;
            } else {
                // Ensure that it is a number and stop the keypress
                if (event.shiftKey || (event.keyCode < 48 || event.keyCode > 57) && (event.keyCode < 96 || event.keyCode > 105)) {
                    event.preventDefault();
                }
            }
        });
    });

    $(function () {
        $("#ContentPlaceHolder1_tbDataOd").datepicker({ maxDate: "-1D" }).attr('readonly', 'readonly');
        $("#ContentPlaceHolder1_tbDataOd").readonlyDatepicker(true);
        $("#ContentPlaceHolder1_tbDataDo").datepicker({ maxDate: "-1D" }).attr('readonly', 'readonly');
        $("#ContentPlaceHolder1_tbDataDo").readonlyDatepicker(true);
    });

</script>

<style>

.ui-datepicker table {
width: 100%;
font-size: .9em;
border-collapse: collapse;
margin: 0 0 .4em;
font: 150% "Trebuchet MS", sans-serif;
}
.ui-corner-all, .ui-corner-bottom, .ui-corner-right, .ui-corner-br {
border-bottom-right-radius: 4px;
}
.ui-corner-all, .ui-corner-bottom, .ui-corner-left, .ui-corner-bl {
border-bottom-left-radius: 4px;
}
.ui-corner-all, .ui-corner-top, .ui-corner-right, .ui-corner-tr {
border-top-right-radius: 4px;
}
.ui-corner-all, .ui-corner-top, .ui-corner-left, .ui-corner-tl {
border-top-left-radius: 4px;
}
.ui-widget-content {
border: 1px solid #dddddd;
background: #eeeeee url("images/ui-bg_highlight-soft_100_eeeeee_1x100.png") 50% top repeat-x;
color: #333333;
}
.ui-widget {
font-family: Trebuchet MS,Tahoma,Verdana,Arial,sans-serif;
font-size: 1.1em;
}
.ui-datepicker {
width: 17em;
padding: .2em .2em 0;
display: none;
}
.ui-helper-clearfix {
min-height: 0;
/* support: IE7; */
}
user agent stylesheetdiv {
display: block;
}
Pseudo ::before element
.ui-helper-clearfix:before, .ui-helper-clearfix:after {
content: "";
display: table;
border-collapse: collapse;
}
Pseudo ::after element
.ui-helper-clearfix:after {
clear: both;
}
.ui-helper-clearfix:before, .ui-helper-clearfix:after {
content: "";
display: table;
border-collapse: collapse;
}

.tg  {border-collapse:collapse;border-spacing:0;border-color:#aaa;}
.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#aaa;color:#333;background-color:#fff;}
.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#aaa;color:#fff;background-color:#f38630;}
.tg .tg-cxkv{background-color:#ffffff}
.tg .tg-e3zv{font-weight:bold}
.tg .tg-vebi{font-weight:bold;color:#343434}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <table class="tg" style="width: 660px">
  <tr>
    <th class="tg-vebi" colspan="2">Wniosek</th>
  </tr>
  <tr>
    <td class="tg-031e" colspan="2">
        <asp:Label ID="LabelInfo" runat="server" ForeColor="Red" Text=""></asp:Label>
    </td>
  </tr>
  <tr>
    <td class="tg-e3zv">Rodzaj wniosku</td>
    <td class="tg-031e">
            <asp:RadioButtonList ID="rbPowod" runat="server" 
                RepeatDirection="Vertical" RepeatLayout="Flow">
                <asp:ListItem Text="wniosek o zaliczkę" Value="2"></asp:ListItem>
                <asp:ListItem Text="wniosek o zmianę danych pracownika" Value="3"></asp:ListItem>
                <asp:ListItem Text="wniosek o zmianę rachunku bankowego" Value="4"></asp:ListItem>
                <asp:ListItem Text="wniosek o zgłoszenie członka rodziny" Value="5"></asp:ListItem>
                <asp:ListItem Text="wniosek inny" Value="6"></asp:ListItem>
            </asp:RadioButtonList> 
    </td>
  </tr>
  <tr>
    <td class="tg-e3zv">Treść wniosku&nbsp;</td>
    <td class="tg-031e">
        <asp:TextBox ID="tbTresc" runat="server" TextMode="MultiLine" Height="79px" 
            Width="488px"></asp:TextBox>
    </td>
  </tr>
  <tr>
    <td class="tg-e3zv">Uwagi</td>
    <td class="tg-031e">
        <asp:TextBox ID="tbUwagi" runat="server" TextMode="MultiLine" Height="51px" 
            Width="488px"></asp:TextBox>
<div style="float:right; margin-right:10px; margin-bottom:10px; margin-top:10px">
  <asp:Button ID="Button1" runat="server" Text="Wyślij" OnClick="Button1_Click" />

</div>
    </td>
  </tr>
  </table>

</asp:Content>
