<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Ksiegowosc.Master" AutoEventWireup="true" CodeBehind="Wnioski_inne.aspx.cs" Inherits="Kadry.KADRY.Wnioski_inne" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1"
            BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" 
            BorderWidth="1px" CellPadding="4"
             ForeColor="Black" GridLines="Vertical" Width="96%">
            <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="Typ_wniosku" HeaderText="Typ_wniosku" SortExpression="Typ_wniosku" />
            <asp:CheckBoxField DataField="Przyjety" HeaderText="Przyjety" SortExpression="Przyjety" />
            <asp:BoundField DataField="Tresc" HeaderText="Tresc" SortExpression="Tresc" />
            <asp:BoundField DataField="Data_zlozenia" HeaderText="Data_zlozenia" SortExpression="Data_zlozenia" />
            <asp:BoundField DataField="Rodzaj_urlopu" HeaderText="Rodzaj_urlopu" SortExpression="Rodzaj_urlopu" />
            <asp:BoundField DataField="Data_od_" HeaderText="Data_od_" SortExpression="Data_od_" />
            <asp:BoundField DataField="Data_do" HeaderText="Data_do" SortExpression="Data_do" />
            <asp:BoundField DataField="Liczba_dni" HeaderText="Liczba_dni" SortExpression="Liczba_dni" />
            <asp:BoundField DataField="Uwagi" HeaderText="Uwagi" SortExpression="Uwagi" />
            </Columns>
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#F7F7DE" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FBFBF2" />
            <SortedAscendingHeaderStyle BackColor="#848384" />
            <SortedDescendingCellStyle BackColor="#EAEAD3" />
            <SortedDescendingHeaderStyle BackColor="#575357" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HRConnectionString %>" SelectCommand="SELECT [Id], [Typ_wniosku], [Przyjety], [Tresc], [Data_zlozenia], [Rodzaj_urlopu], [Data_od_], [Data_do], [Liczba_dni], [Uwagi] FROM [Wnioski]"></asp:SqlDataSource>

</asp:Content>