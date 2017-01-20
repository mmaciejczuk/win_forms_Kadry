<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Uzytkownik.Master" AutoEventWireup="true" CodeBehind="Lista_wnioskow.aspx.cs" Inherits="Kadry.PRACOWNIK.Lista_wnioskow" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:GridView ID="GridView1" runat="server" 
            AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" 
            BorderWidth="1px" CellPadding="4" DataKeyNames="Id" 
             ForeColor="Black" GridLines="Vertical" Width="96%">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" Visible="false" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="Data_zlozenia" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Data złożenia" SortExpression="Data_zlozenia" />
                <asp:BoundField DataField="Rodzaj_urlopu" HeaderText="Rodzaj urlopu" SortExpression="Rodzaj_urlopu" />
                <asp:BoundField DataField="Data_od_" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Data od" SortExpression="Data_od_" />
                <asp:BoundField DataField="Data_do" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Data do" SortExpression="Data_do" />
                <asp:BoundField DataField="Liczba_dni" HeaderText="Liczba dni" SortExpression="Liczba_dni" />
                <asp:CheckBoxField DataField="Przyjety" HeaderText="Przyjęty" SortExpression="Przyjety" />
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
            DeleteCommand="DELETE FROM [Wnioski] WHERE [Id] = @Id" 
            InsertCommand="INSERT INTO [Wnioski] ([Typ_wniosku], [Przyjety], [Tresc], [Data_zlozenia], 
            [Rodzaj_urlopu], [Data_od_], [Data_do], [Liczba_dni], [Uwagi]) VALUES (@Typ_wniosku, 
            @Przyjety, @Tresc, @Data_zlozenia, @Rodzaj_urlopu, @Data_od_, @Data_do, @Liczba_dni, @Uwagi)" 
            SelectCommand="SELECT [Id], [Typ_wniosku], [Przyjety], [Tresc], [Data_zlozenia], [Rodzaj_urlopu], 
            [Data_od_], [Data_do], [Liczba_dni], [Uwagi] FROM [Wnioski] ORDER BY [Data_zlozenia]" 
            UpdateCommand="UPDATE [Wnioski] SET [Typ_wniosku] = @Typ_wniosku, [Przyjety] = @Przyjety, 
            [Tresc] = @Tresc, [Data_zlozenia] = @Data_zlozenia, [Rodzaj_urlopu] = @Rodzaj_urlopu, 
            [Data_od_] = @Data_od_, [Data_do] = @Data_do, [Liczba_dni] = @Liczba_dni, [Uwagi] = @Uwagi WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Typ_wniosku" Type="Int32" />
                <asp:Parameter Name="Przyjety" Type="Boolean" />
                <asp:Parameter Name="Tresc" Type="String" />
                <asp:Parameter Name="Data_zlozenia" Type="DateTime" />
                <asp:Parameter Name="Rodzaj_urlopu" Type="Int32" />
                <asp:Parameter Name="Data_od_" Type="DateTime" />
                <asp:Parameter Name="Data_do" Type="DateTime" />
                <asp:Parameter Name="Liczba_dni" Type="Int16" />
                <asp:Parameter Name="Uwagi" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Typ_wniosku" Type="Int32" />
                <asp:Parameter Name="Przyjety" Type="Boolean" />
                <asp:Parameter Name="Tresc" Type="String" />
                <asp:Parameter Name="Data_zlozenia" Type="DateTime" />
                <asp:Parameter Name="Rodzaj_urlopu" Type="Int32" />
                <asp:Parameter Name="Data_od_" Type="DateTime" />
                <asp:Parameter Name="Data_do" Type="DateTime" />
                <asp:Parameter Name="Liczba_dni" Type="Int16" />
                <asp:Parameter Name="Uwagi" Type="String" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
</div>
</asp:Content>
