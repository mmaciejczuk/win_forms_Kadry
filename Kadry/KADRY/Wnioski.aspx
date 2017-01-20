<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Ksiegowosc.Master" AutoEventWireup="true" CodeBehind="Wnioski.aspx.cs" Inherits="Kadry.KADRY.Wnioski" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table>
        <tr>
            <td>
                <br />
            </td>
            <td>
                <asp:LinkButton ID="LinkButton1" runat="server" Font-Size="Medium" ForeColor="#efa233" PostBackUrl="~/KADRY/Wnioski_urlopowe.aspx">>> Wnioski urlopowe</asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td>
                <br />
            </td>
            <td>
                <asp:LinkButton ID="LinkButton2" runat="server" Font-Size="Medium" ForeColor="#efa233" PostBackUrl="~/KADRY/Wnioski_inne.aspx">>> Wnioski inne</asp:LinkButton>
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
