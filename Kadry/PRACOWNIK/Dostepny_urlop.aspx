<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Uzytkownik.Master" AutoEventWireup="true" CodeBehind="Dostepny_urlop.aspx.cs" Inherits="Kadry.PRACOWNIK.Dostepny_urlop" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #divButton{
            float:right;
            margin: 5px 5px 5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
            <asp:Label ID="LabelInfo" runat="server" ForeColor="Red" Font-Size="Small"></asp:Label>
    </div>
    <div>
    <asp:Table ID="table1" runat="server">
        <asp:TableRow>
            <asp:TableCell>
                <asp:chart id="Chart1" runat="server" Height="300px" Width="330px">
					<titles>
						<asp:Title Text="Dostępne urlopy" Name="Title1" ForeColor="#666666" />
					</titles>
					<legends>
						<asp:Legend Alignment="Center" Docking="Bottom" IsTextAutoFit="False" Name="Default" LegendStyle="Column" />
					</legends>
					<series>
						<asp:Series Name="Default" />
					</series>
					<chartareas>
						<asp:ChartArea Name="ChartArea1" BorderWidth="0" />
					</chartareas>
				</asp:chart> 
            </asp:TableCell>
            <asp:TableCell>

                <asp:chart id="Chart2" runat="server" Height="300px" Width="300px">
					<titles>
						<asp:Title Text="Wykorzystane urlopy"  Name="Title1" ForeColor="#666666"/>
					</titles>
					<legends>
						<asp:Legend Alignment="Center" Docking="Bottom" IsTextAutoFit="False" Name="Default" LegendStyle="Column" />
					</legends>
					<series>
						<asp:Series Name="Default" />
					</series>
					<chartareas>
						<asp:ChartArea Name="ChartArea1" BorderWidth="0" />
					</chartareas>
				</asp:chart> 
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>

            </asp:TableCell>
            <asp:TableCell>
                <div id="divButton">
                <asp:Button ID="btnAktualizuj" runat="server" Text="Aktualizuj" OnClick="btnAktualizuj_Click"  />
                </div>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    </div>
</asp:Content>
