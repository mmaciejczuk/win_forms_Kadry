<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Uzytkownik.Master" AutoEventWireup="true" CodeBehind="Szkolenia.aspx.cs" Inherits="Kadry.PRACOWNIK.Szkolenia" %>
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
            <asp:BoundField DataField="Nazwa" HeaderText="Nazwa " SortExpression="Nazwa" />
            <asp:BoundField 
                DataField="Szkolenie_od" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Szkolenie od" SortExpression="Szkolenie_od" />
            <asp:BoundField 
                DataField="Szkolenie_do" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Szkolenie do" SortExpression="Szkolenie_do" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HRConnectionString %>" 
        SelectCommand="SELECT [Id_szkolenia], [Pracownik], 
        [Nazwa], [Termin_wazn], [Typ], [Szkolenie_od], [Szkolenie_do] 
        FROM [SzkoleniaBadania] WHERE (([Typ] = @Typ) AND ([Id_szkolenia] = @Id_szkolenia))">
        <SelectParameters>
            <asp:Parameter DefaultValue="1" Name="Typ" Type="Int32" />
            <asp:SessionParameter Name="Id_szkolenia" SessionField="id" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>


</asp:Content>
