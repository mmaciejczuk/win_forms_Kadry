﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Kadry
{
    public partial class LogowanieUzytkownika : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (User.IsInRole("Administrator"))
                HyperLink1.Visible = true;
            else
                HyperLink1.Visible = false;
        }
    }
}