<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Uzytkownik.Master" AutoEventWireup="true" CodeBehind="Kontakt.aspx.cs" Inherits="Kadry.PRACOWNIK.Kontakt" %>
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
        width: 500px;
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
    <div id="cont">
        <h2>Kontakt</h2>
        <br />
        <table  style="border-spacing: 10px; font-size:14px;">
            <tr>
                <td align="center">
                    Imię i nazwisko:</td>
                <td>
                    <asp:TextBox ID="txtName"
                                    runat="server"
                                    Columns="50"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td align="center">
                    Temat:
                </td>
                <td>
                    <asp:DropDownList ID="ddlSubject" runat="server">
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
                                    Columns="40"
                                    Rows="6"
                                    TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr align="center">
                <td colspan="2">
                    <asp:Button ID="btnSubmit" runat="server" Text="Wyślij"
                        onclick="btnSubmit_Click" />
                </td>
            </tr>

            <tr align="center">
                <td colspan="2">
                    <asp:Label ID="lblResult" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
