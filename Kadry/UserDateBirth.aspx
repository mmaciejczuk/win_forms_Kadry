<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserDateBirth.aspx.cs" Inherits="Kadry.UserDateBirth" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        Date of birth: 
        <uc1:CalendarUserControl ID="CalendarUserControl1" runat="server" />
    </div>
    </form>
</body>
</html>
