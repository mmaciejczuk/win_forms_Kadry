<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Uzytkownik.Master" AutoEventWireup="true" CodeBehind="Lista_wnioskow_pozostale.aspx.cs" Inherits="Kadry.PRACOWNIK.Lista_wnioskow_pozostale" %>
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
                <asp:BoundField DataField="Typ_wniosku" HeaderText="Wniosek" SortExpression="Typ_wniosku" />
                <asp:BoundField DataField="Tresc" HeaderText="Treść" SortExpression="Tresc" />
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
            </div>
</asp:Content>
