<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Kadry.WebForm1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <style>
            .tab {
            display:none;   
            }
        </style>
        <script type="text/javascript">

            function initTabView() {
                var x = document.getElementsByClassName('tab-view')
                for (var i = 0; i < x.length; i++) {
                    x[i].onclick = displayTab;
                }

                var prevViewedTab = null;

                function displayTab(e) {
                    var idOfTabToDisplay = this.getAttribute("data-tab")

                    if (prevViewedTab) {
                        prevViewedTab.style.display = 'none';
                    }

                    var tabToDisplay = document.getElementById(idOfTabToDisplay);
                    tabToDisplay.style.display = 'block';
                    prevViewedTab = tabToDisplay;
                }

                var defaultTab = document.getElementsByClassName('default-tab')
                if (defaultTab.length) {
                    defaultTab[0].style.display = 'block';
                    prevViewedTab = defaultTab[0];
                }
            }

        </script>
</head>
<body>
       <form id="form1" runat="server">
       <ul>
            <li>
                <a data-tab="tab1" class="tab-view">Tab 1</a>
            </li>
            <li>
                <a data-tab="tab2" class="tab-view">Tab 2</a>
            </li>
            <li>
                <a data-tab="tab3" class="tab-view">Tab 3</a>
            </li>
            <li>
                <a data-tab="tab4" class="tab-view">Tab 4</a>
            </li>
        </ul>
           <p>
               <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
           </p>
        <div id="tabCtrl">
            <div class="tab default-tab" id="tab1">This is Tab 1</div>
            <div class="tab" id="tab2">This is Tab 2</div>
            <div class="tab" id="tab3">This is Tab 3</div>
            <div class="tab" id="tab4">This is Tab 4</div>
        </div>

        <script>
            initTabView();
        </script>
       </form>
</body>
</html>
