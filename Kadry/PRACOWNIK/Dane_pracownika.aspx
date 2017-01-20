<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Uzytkownik.Master" AutoEventWireup="true" CodeBehind="Dane_pracownika.aspx.cs" Inherits="Kadry.PRACOWNIK.Dane_pracownika" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CellPadding="4" Width="400px" 
        DataKeyNames="Id_pracownika" ForeColor="#333333" GridLines="None" Height="50px">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
        <EditRowStyle BackColor="#999999" />
        <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True"/>
        <Fields>
            <asp:BoundField DataField="Id_pracownika" Visible="false" HeaderText="Id_pracownika" InsertVisible="False" 
                ReadOnly="True" SortExpression="Id_pracownika" />
            <asp:BoundField DataField="Imie" HeaderText="IMIĘ" SortExpression="Imie" />
            <asp:BoundField DataField="Nazwisko" HeaderText="NAZWISKO" SortExpression="Nazwisko" />
            <asp:BoundField DataField="Plec" HeaderText="PŁEĆ" SortExpression="Plec" />
            <asp:BoundField DataField="Typ_umowy" HeaderText="RODZAJ ETATU" SortExpression="Typ_umowy" />
            <asp:BoundField DataField="Umowa_od" DataFormatString="{0:dd/MM/yyyy}" HeaderText="DATA ZAWARCIA UMOWY" SortExpression="Umowa_od" />
            <asp:BoundField DataField="Umowa_do" DataFormatString="{0:dd/MM/yyyy}" HeaderText="DATA ZAKOŃCZENIA UMOWY" SortExpression="Umowa_do" />
            <asp:BoundField DataField="Stanowisko" HeaderText="STANOWISKO" SortExpression="Stanowisko" />
            <asp:BoundField DataField="Staz_pracy_do_umowy" HeaderText="STAŻ PRACY PRZED ZAWARCIEM UMOWY" SortExpression="Staz_pracy_do_umowy" />
            <asp:BoundField DataField="Dochod_netto" HeaderText="DOCHÓD NETTO" SortExpression="Dochod_netto" />
            <asp:BoundField DataField="Pesel" HeaderText="NUMER PESEL" SortExpression="Pesel" />
            <asp:BoundField DataField="Email" HeaderText="ADRES E-MAIL" SortExpression="Email" />
            <asp:BoundField DataField="Haslo" HeaderText="HASŁO" SortExpression="Haslo" />
            <asp:BoundField DataField="Telefon" HeaderText="NUMER TELEFONU" SortExpression="Telefon" />
            <asp:BoundField DataField="Ulica" HeaderText="ULICA" SortExpression="Ulica" />
            <asp:BoundField DataField="Kod" HeaderText="KOD" SortExpression="Kod" />
            <asp:BoundField DataField="Miasto" HeaderText="MIASTO" SortExpression="Miasto" />
            <asp:BoundField DataField="SymbolDzialu" Visible="false" HeaderText="SymbolDzialu" SortExpression="SymbolDzialu" />
            <asp:BoundField DataField="NrKonta" HeaderText="NUMER KONTA" SortExpression="NrKonta" />
        </Fields>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Width="300px"/>
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:HRConnectionString %>" 
        SelectCommand="SELECT [Id_pracownika], [Imie], [Nazwisko], [Plec], [Typ_umowy], 
        [Umowa_od], [Umowa_do], [Stanowisko], [Staz_pracy_do_umowy], [Dochod_netto], 
        [Pesel], [Email], [Telefon], [Ulica], [Kod], [Miasto], [Haslo], 
        [SymbolDzialu], [NrKonta] FROM [Pracownicy]"></asp:SqlDataSource>
</asp:Content>
