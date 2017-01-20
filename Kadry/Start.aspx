<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Default.Master" AutoEventWireup="true" CodeBehind="Start.aspx.cs" Inherits="Kadry.Start" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>


body{
	margin: 0;
	padding: 0;
	background: #fff;

	color: #fff;
	font-family: Arial;
	font-size: 12px;
}

.body{
	position: absolute;
	top: -20px;
	left: -20px;
	right: -40px;
	bottom: -40px;
	width: auto;
	height: auto;
/*	background-image: ;*/
	background-size: cover;
	-webkit-filter: blur(5px);
	z-index: 0;
}



.header{
	position: absolute;
	top: calc(50% - 105px);
	left: calc(50% - 155px);
	z-index: 2;
}

.header div{
	float: left;
	color: #fff;
	font-family: 'Exo', sans-serif;
	font-size: 35px;
	font-weight: 200;
}

.header div span{
	color: #5379fa !important;
}

.login{
	position: absolute;
	top: calc(50% - 75px);
	left: calc(50% - 161px);
	height: 150px;
	width: 350px;
	padding: 10px;
	z-index: 2;
}


::-webkit-input-placeholder{
   color: rgba(255,255,255,0.6);
}

::-moz-input-placeholder{
   color: rgba(255,255,255,0.6);
}
/*      TEXTBOX EMAIL       */
        .tbEmail
        {
	        width: 250px;
	        height: 30px;
	        background: transparent;
	        border: 1px solid rgba(255,255,255,0.6);
	        border-radius: 2px;
	        color: #5379fa;
	        font-family: 'Exo', sans-serif;
	        font-size: 16px;
	        font-weight: 400;
	        padding: 4px;
        }


/*      TEXTBOX HASLO       */

        .tbHaslo
        {
	        width: 250px;
	        height: 30px;
	        background: transparent;
	        border: 1px solid rgba(255,255,255,0.6);
	        border-radius: 2px;
	        color: #5379fa;
	        font-family: 'Exo', sans-serif;
	        font-size: 16px;
	        font-weight: 400;
	        padding: 4px;
	        margin-top: 10px;
        }

/*      BUTTON      */
.ButtonZaloguj.focus
{
    outline: none;

}
.ButtonZaloguj.hover
{
        opacity: 0.8;
}
.ButtonZaloguj.active
{
	opacity: 0.6;
}
.ButtonZaloguj{
	width: 260px;
	height: 35px;
	background: #fff;
	border: 1px solid #fff;
	cursor: pointer;
	border-radius: 2px;
	color: #a18d6c;
	font-family: 'Exo', sans-serif;
	font-size: 16px;
	font-weight: 400;
	padding: 6px;
	margin-top: 10px;
}

</style>
    <script>

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


		<div class="header">
            
			<div><span>HR Management</span></div>
            
		</div>
		<br>
		<div class="login">
            <asp:TextBox runat="server" ID="tbEmail" CssClass="tbEmail" placeholder="email"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="pole wymagane" 
                ForeColor="#FF3300" ControlToValidate="tbEmail" Display="Dynamic"></asp:RequiredFieldValidator>

            <asp:TextBox runat="server" ID="tbHaslo" CssClass="tbHaslo" TextMode="Password" placeholder="hasło"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="pole wymagane" 
                ForeColor="Red" ControlToValidate="tbHaslo"></asp:RequiredFieldValidator>

                <asp:Button CssClass="ButtonZaloguj" runat="server" ID="ButtonZaloguj" Text="Zaloguj" OnClick="ButtonZaloguj_Click" />
            <br />
            <br />
            <asp:Label ID="FailureText" runat="server" ForeColor="Red" Text=""></asp:Label>
		</div>


</asp:Content>
