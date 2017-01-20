<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Skas.aspx.cs" Inherits="Kadry.Skas" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %> 
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css"/>
  <script src="/Scripts/jquery-1.10.2.js"></script>
  <script src="/Scripts/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css"/>



</head>
<body>
   <form id="form1" runat="server">


       <asp:TextBox runat="server" ID="txtDate" />

       <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
       <br />
       <asp:Label ID="Years" runat="server" Text="lblDate"></asp:Label>
       <br />
       <asp:Label ID="Months" runat="server" Text="lblDate"></asp:Label>
       <br />
       <asp:Label ID="Days" runat="server" Text="lblDate"></asp:Label>
       <br />
       <asp:Label ID="Hours" runat="server" Text="lblDate"></asp:Label>
       <br />
       <asp:Label ID="Minutes" runat="server" Text="lblDate"></asp:Label>
       <br />
       <asp:Label ID="Seconds" runat="server" Text="lblDate"></asp:Label>
       <br />
       <asp:Label ID="Milliseconds" runat="server" Text="lblDate"></asp:Label>

       <br />
       <br />
       <asp:Label ID="LabelTest" runat="server" Text="Label"></asp:Label>
       <br />
       <asp:Label ID="LabelInfo" runat="server" Text="Label"></asp:Label>

    </form>
</body>
</html>
