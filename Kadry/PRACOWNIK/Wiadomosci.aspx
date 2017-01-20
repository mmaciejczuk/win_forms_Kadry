<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Uzytkownik.Master" AutoEventWireup="true" CodeBehind="Wiadomosci.aspx.cs" Inherits="Kadry.PRACOWNIK.Wiadomosci" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #cont
        {
            padding: 10px;
        }


h1, h2, h3,
h4, h5, h6 {
    color: #000;
    margin-bottom: 0;
    padding-bottom: 0;
}

h1 {
    font-size: 2em;
}

h2 {
    font-size: 1.75em;
}

h3 {
    font-size: 1.2em;
}

h4 {
    font-size: 1.1em;
}

h5, h6 {
    font-size: 1em;
}

    h5 a:link, h5 a:visited, h5 a:active {
        padding: 0;
        text-decoration: none;
    }


/* login page */
#loginForm {
    border-right: solid 2px #c8c8c8;
    width: 55%;
    margin-left: 20px;
}

    #loginForm .validation-error {
        display: block;
        margin-left: 15px;
    }

#socialLoginForm {
    margin-left: 40px;
    float: left;
    width: 40%;
}

    #socialLoginForm h2 {
        margin-bottom:  5px;
    }

fieldset.open-auth-providers {
    margin-top: 15px;
}

    fieldset.open-auth-providers button {
        margin-bottom: 12px;
    }
    

/* forms */
fieldset {
    border: none;
    margin: 0;
    padding: 0;
}

    fieldset legend {
        display: none;
    }
    
    fieldset ol {
        padding: 0;
        list-style: none;
    }

        fieldset ol li {
            padding-bottom: 5px;
        }

    label {
        display: block;
        font-size: 1.2em;
        font-weight: 600;
    }

    label.checkbox {
        display: inline;
    }

    input, textarea {
        border: 1px solid #e2e2e2;
        background: #fff;
        color: #333;
        font-size: 1.2em;
        margin: 5px 0 6px 0;
        padding: 5px;
        width: 300px;
    }

    textarea {
        font-family: inherit;
        }
    
        input:focus, textarea:focus {
            border: 1px solid #7ac0da;
        }

        input[type="checkbox"] {
            background: transparent;
            border: inherit;
            width: auto;
        }
        
    input[type="submit"],
    input[type="button"],
    button {
        background-color: #d3dce0;
        border: 1px solid #787878;
        cursor: pointer;
        font-size: 1.2em;
        font-weight: 600;
        padding: 7px;
        margin-right: 8px;
        width: auto;
    }

    td input[type="submit"],
    td input[type="button"],
    td button {
        font-size: 1em;
        padding: 4px;
        margin-right: 4px;
    }

/* info and errors */
.message-info {
    border: 1px solid;
    clear: both;
    padding: 10px 20px;
}

.message-error {
    clear: both;
    color: #e80c4d;
    font-size: 1.1em;
    font-weight: bold;
    margin: 20px 0 10px 0;
}

.message-success {
    color: #7ac0da;
    font-size: 1.3em;
    font-weight: bold;
    margin: 20px 0 10px 0;
}

.error {
    color: #e80c4d;
}


    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table  style="border-spacing: 10px; font-size:14px;">
        <tr>
            <td>
               <h4>Wyślij wiadomość</h4>
                <br />
            </td>
            <td align="center">
                <asp:Label ID="LabelInfo" runat="server" ForeColor="#336600"></asp:Label>
                <br />
              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtMessage"
                        ErrorMessage="Wpisz wiadomość" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
            <tr>
                <td align="center">
                    Temat:
                </td>
                <td>
                    <asp:DropDownList ID="ddlSubject" runat="server" Height="25px" Width="391px">
                        <asp:ListItem>Wybierz temat</asp:ListItem>
                        <asp:ListItem>Zgłoś problem</asp:ListItem>
                        <asp:ListItem>Obsuga klienta</asp:ListItem>
                        <asp:ListItem>Inny</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="center">
                    Wiadomość:
                </td>
                <td>
                    <asp:TextBox ID="txtMessage"
                                    runat="server"
                                    TextMode="MultiLine" Height="114px" Width="391px"></asp:TextBox>

                </td>
            </tr>
            <tr align="center">
                <td colspan="2">
                    <asp:Button ID="btnSubmit" runat="server" Text="Wyślij" OnClick="btnSubmit_Click"/>
                </td>
            </tr>

            <tr align="center">
                <td colspan="2">
                    <asp:Label ID="lblResult" runat="server"></asp:Label>
                </td>
            </tr>
    <tr>
        <td colspan="2" >
            <div>
            <h4>Skrzynka nadawcza</h4>
                <br />
                <asp:GridView ID="GridViewNadawcza" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" 
                    DataSourceID="SqlDataSourceNadawcza"
             BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" 
            BorderWidth="1px" CellPadding="4" 
             ForeColor="Black" GridLines="Vertical" Width="600px">
            <AlternatingRowStyle BackColor="White" />
              
                    <Columns>
                        <asp:BoundField DataField="Id" Visible="false" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                        <asp:BoundField DataField="Pracownik" Visible="false" HeaderText="Pracownik" SortExpression="Pracownik" />
                        <asp:BoundField DataField="Data_wyslania" HeaderText="Wysłano" ItemStyle-Width="15%" DataFormatString="{0:dd/MM/yyyy}" SortExpression="Data_wyslania" />
                        <asp:BoundField DataField="Temat" HeaderText="Temat" ItemStyle-Width="20%"  SortExpression="Temat" />
                        <asp:BoundField DataField="Tresc" HeaderText="Treść" SortExpression="Tresc" />
                        <asp:CheckBoxField DataField="Nadawca_kadry" Visible="false" HeaderText="Nadawca_kadry" SortExpression="Nadawca_kadry" />
                        <asp:CheckBoxField DataField="Nadawca_pracownik" Visible="false" HeaderText="Nadawca_pracownik" SortExpression="Nadawca_pracownik" />
                    </Columns>
                        <FooterStyle BackColor="#CCCC99" />
                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                        <RowStyle BackColor="#F7F7DE"/>
                        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#FBFBF2" />
                        <SortedAscendingHeaderStyle BackColor="#848384" />
                        <SortedDescendingCellStyle BackColor="#EAEAD3" />
                        <SortedDescendingHeaderStyle BackColor="#575357" />
                </asp:GridView>
            </div>
        </td>
    </tr>
    <tr>
        <td colspan="2" >
           <div>
            <h4>Skrzynka odbiorcza</h4>
               <br />
               <asp:GridView ID="GridViewOdbiorcza" runat="server" AutoGenerateColumns="False" 
                   DataKeyNames="Id" DataSourceID="SqlDataSourceOdbiorcza"
             BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" 
            BorderWidth="1px" CellPadding="4" 
             ForeColor="Black" GridLines="Vertical" Width="600px">
            <AlternatingRowStyle BackColor="White" />
              
                   <Columns>
                       <asp:BoundField DataField="Id" Visible="false" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                       <asp:BoundField DataField="Pracownik" Visible="false" HeaderText="Pracownik" SortExpression="Pracownik" />
                       <asp:BoundField DataField="Data_wyslania" HeaderText="Otrzymano" ItemStyle-Width="15%"  DataFormatString="{0:dd/MM/yyyy}"  SortExpression="Data_wyslania" />
                       <asp:BoundField DataField="Temat" HeaderText="Temat" ItemStyle-Width="20%"  SortExpression="Temat" />
                       <asp:BoundField DataField="Tresc" HeaderText="Treść" SortExpression="Tresc" />
                       <asp:CheckBoxField DataField="Nadawca_kadry" Visible="false" HeaderText="Nadawca_kadry" SortExpression="Nadawca_kadry" />
                       <asp:CheckBoxField DataField="Nadawca_pracownik" Visible="false" HeaderText="Nadawca_pracownik" SortExpression="Nadawca_pracownik" />
                   </Columns>
                        <FooterStyle BackColor="#CCCC99" />
                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White"/>
                        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                        <RowStyle BackColor="#F7F7DE" />
                        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#FBFBF2" />
                        <SortedAscendingHeaderStyle BackColor="#848384" />
                        <SortedDescendingCellStyle BackColor="#EAEAD3" />
                        <SortedDescendingHeaderStyle BackColor="#575357" />
               </asp:GridView>
            </div>
        </td>
    </tr>
        </table>
    <asp:SqlDataSource ID="SqlDataSourceNadawcza" runat="server" 
        ConnectionString="<%$ ConnectionStrings:HRConnectionString %>" SelectCommand="SELECT [Id], [Pracownik], [Tresc],
        [Temat], [Nadawca_kadry], [Nadawca_pracownik], [Data_wyslania] FROM [Wiadomosci] WHERE (([Pracownik] = @Pracownik) AND ([Nadawca_pracownik] = @Nadawca_pracownik))">
        <SelectParameters>
            <asp:SessionParameter Name="Pracownik" SessionField="id" Type="Int32" />
            <asp:Parameter DefaultValue="true" Name="Nadawca_pracownik" Type="Boolean" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceOdbiorcza" runat="server" 
        ConnectionString="<%$ ConnectionStrings:HRConnectionString %>" SelectCommand="SELECT [Id], [Pracownik], [Tresc], 
        [Temat], [Nadawca_kadry], [Nadawca_pracownik], [Data_wyslania] FROM [Wiadomosci] WHERE (([Pracownik] = @Pracownik) AND ([Nadawca_kadry] = @Nadawca_kadry))">
        <SelectParameters>
            <asp:SessionParameter Name="Pracownik" SessionField="id" Type="Int32" />
            <asp:Parameter DefaultValue="true" Name="Nadawca_kadry" Type="Boolean" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
