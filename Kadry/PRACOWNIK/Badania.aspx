<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Uzytkownik.Master" AutoEventWireup="true" CodeBehind="Badania.aspx.cs" Inherits="Kadry.PRACOWNIK.Badania" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
             BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" 
            BorderWidth="1px" CellPadding="4" 
             ForeColor="Black" GridLines="Vertical" Width="96%"
            DataKeyNames="Id_szkolenia" DataSourceID="SqlDataSource1">
            <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="Id_szkolenia" Visible="false" HeaderText="Id_szkolenia" InsertVisible="False" ReadOnly="True" SortExpression="Id_szkolenia" />
            <asp:BoundField DataField="Pracownik" Visible="false" HeaderText="Pracownik" SortExpression="Pracownik" />
            <asp:BoundField DataField="Nazwa" HeaderText="Nazwa badania" SortExpression="Nazwa" />
            <asp:BoundField DataField="Szkolenie_od" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Data wykonania" SortExpression="Szkolenie_od" />
            <asp:BoundField DataField="Termin_wazn" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Termin ważności" SortExpression="Termin_wazn" />
            <asp:BoundField DataField="Typ" HeaderText="Typ" Visible="false" SortExpression="Typ" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:HRConnectionString %>" 
        SelectCommand="SELECT [Id_szkolenia], [Pracownik], [Nazwa], [Termin_wazn], [Typ], 
        [Szkolenie_od], [Szkolenie_do] FROM [SzkoleniaBadania] WHERE ([Typ] = @Typ)">
        <SelectParameters>
            <asp:Parameter DefaultValue="2" Name="Typ" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>
