<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Uzytkownik.Master" AutoEventWireup="true" CodeBehind="Wnioski_urlopowe.aspx.cs" Inherits="Kadry.PRACOWNIK.Wnioski_urlopowe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td>
                <br />
            </td>
            <td>
                <asp:LinkButton ID="LinkButton1" runat="server" Font-Size="Medium" ForeColor="#efa233" PostBackUrl="~/PRACOWNIK/Lista_wnioskow.aspx">>> Lista wniosków</asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td>
                <br />
            </td>
            <td>
                <asp:LinkButton ID="LinkButton2" runat="server" Font-Size="Medium" ForeColor="#efa233" PostBackUrl="~/PRACOWNIK/Zloz_wniosek.aspx">>> Złóż wniosek</asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td>
                <br />
            </td>
            <td>
                <asp:LinkButton ID="LinkButton3" runat="server" Font-Size="Medium" ForeColor="#efa233" PostBackUrl="~/PRACOWNIK/Dostepny_urlop.aspx">>> Dostępny urlop</asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td>
                <br />
            </td>
            <td>

            </td>
        </tr>
    </table>
</asp:Content>
