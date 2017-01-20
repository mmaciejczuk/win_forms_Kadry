<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Ksiegowosc.Master" 
    AutoEventWireup="true" CodeBehind="Wnioski_urlopowe.aspx.cs" Inherits="Kadry.KADRY.Wnioski_urlopowe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1"
            BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" 
            BorderWidth="1px" CellPadding="4"
             ForeColor="Black" GridLines="Vertical" Width="96%" AllowPaging="True" AllowSorting="True">
            <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="Id" HeaderText="Id" Visible="false" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:TemplateField HeaderText="Wpłynęło dnia" SortExpression="Data_zlozenia" Visible="false">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Data_zlozenia", "{0:yyyy/MM/dd}") %>' 
                        Font-Size="Small" Height="16px" Width="80px"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" Font-Size="Small" runat="server" Text='<%# Bind("Data_zlozenia", "{0:yyyy/MM/dd}") %>'>
                    </asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Wpłynęło dnia" SortExpression="Data_zlozenia" Visible="false">
                <EditItemTemplate>
                    <asp:Label ID="lblPracownik" Font-Size="Small" runat="server" Text='<%# Session["imie"].ToString() %>'>
                    </asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblPracownik2" Font-Size="Small" runat="server" Text='<%# Session["imie"].ToString() %>'>
                    </asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Rodzaj urlopu" SortExpression="Rodzaj_urlopu">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataValueField="Id" Enabled="true"
                        DataTextField="Nazwa_urlopu" DataSourceID="SqlDataSource2"
                        SelectedValue='<%# Bind("Rodzaj_urlopu") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataValueField="Id" Enabled="false"
                        DataTextField="Nazwa_urlopu" DataSourceID="SqlDataSource2"
                        SelectedValue='<%# Bind("Rodzaj_urlopu") %>'>
                    </asp:DropDownList>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Typ_wniosku" SortExpression="Typ_wniosku" Visible="False">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Typ_wniosku") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" Font-Size="Small"  runat="server" Text='<%# Bind("Typ_wniosku") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Od" SortExpression="Data_od_">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Data_od_", "{0:yyyy/MM/dd}") %>' 
                        Font-Size="Small" Height="16px" Width="80px"></asp:TextBox> 
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" Font-Size="Small"  runat="server" Text='<%# Bind("Data_od_", "{0:yyyy/MM/dd}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Do" SortExpression="Data_do">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Data_do", "{0:yyyy/MM/dd}") %>' 
                        Font-Size="Small" Height="16px" Width="80px"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Data_do", "{0:yyyy/MM/dd}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Dni" SortExpression="Liczba_dni">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" Font-Size="Small" Height="16px" Width="20px"  runat="server" 
                        Text='<%# Bind("Liczba_dni") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("Liczba_dni") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Przyjęty" SortExpression="Przyjety">
                <EditItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Przyjety") %>' />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Przyjety") %>' Enabled="false" />
                </ItemTemplate>
            </asp:TemplateField>
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
        SelectCommand="SELECT [Id], [Pracownik], [Typ_wniosku], [Przyjety], [Tresc], [Data_zlozenia], [Rodzaj_urlopu], [Data_od_], [Data_do], [Liczba_dni], [Uwagi] FROM [Wnioski] WHERE ([Typ_wniosku] = @Typ_wniosku)" 

        DeleteCommand="DELETE FROM [Wnioski] WHERE [Id] = @Id" 
        InsertCommand="INSERT INTO [Wnioski] ([Pracownik], [Typ_wniosku], [Przyjety], [Tresc], [Data_zlozenia], [Rodzaj_urlopu], [Data_od_], [Data_do], [Liczba_dni], [Uwagi]) VALUES (@Pracownik, @Typ_wniosku, @Przyjety, @Tresc, @Data_zlozenia, @Rodzaj_urlopu, @Data_od_, @Data_do, @Liczba_dni, @Uwagi)" 
        UpdateCommand="UPDATE [Wnioski] SET [Pracownik] = @Pracownik, [Typ_wniosku] = @Typ_wniosku, [Przyjety] = @Przyjety, [Tresc] = @Tresc, [Data_zlozenia] = @Data_zlozenia, [Rodzaj_urlopu] = @Rodzaj_urlopu, [Data_od_] = @Data_od_, [Data_do] = @Data_do, [Liczba_dni] = @Liczba_dni, [Uwagi] = @Uwagi WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Pracownik" Type="Int32" />
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
        <SelectParameters>
            <asp:Parameter DefaultValue="1" Name="Typ_wniosku" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Pracownik" Type="Int32" />
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
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:HRConnectionString %>" SelectCommand="SELECT [Id], [Nazwa_urlopu] FROM [RodzajeUrlopow]"></asp:SqlDataSource>

</asp:Content>
