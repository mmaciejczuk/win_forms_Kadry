<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogowanieUzytkownika.aspx.cs" Inherits="Kadry.LogowanieUzytkownika" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:LoginView ID="LoginView1" runat="server"></asp:LoginView>
        <br />
        Wecome back <asp:LoginName ID="LoginName1" runat="server" />
        <asp:LoginStatus ID="LoginStatus1" runat="server" />
        <br />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Admin/Default.aspx">Admin Panel</asp:HyperLink>      
    </div>
    </form>
</body>
</html>
