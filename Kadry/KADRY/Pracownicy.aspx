<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Ksiegowosc.Master" AutoEventWireup="true" CodeBehind="Pracownicy.aspx.cs" Inherits="Kadry.KADRY.Pracownicy" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td>
                <br />
            </td>
            <td>
                <asp:LinkButton ID="LinkButton1" runat="server" Font-Size="Medium" ForeColor="#efa233" PostBackUrl="~/KADRY/Dane_pracownikow.aspx">>> Dane pracowników</asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td>
                <br />
            </td>
            <td>
                <asp:LinkButton ID="LinkButton4" runat="server" Font-Size="Medium" ForeColor="#efa233" PostBackUrl="~/KADRY/Urlopy_pracownikow.aspx">>> Urlopy pracowników</asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td>
                <br />
            </td>
            <td>
                <asp:LinkButton ID="LinkButton2" runat="server" Font-Size="Medium" ForeColor="#efa233" PostBackUrl="~/KADRY/Szkolenia.aspx">>> Szkolenia</asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td>
                <br />
            </td>
            <td>
                <asp:LinkButton ID="LinkButton3" runat="server" Font-Size="Medium" ForeColor="#efa233" PostBackUrl="~/KADRY/Badania.aspx">>> Badania</asp:LinkButton>
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
