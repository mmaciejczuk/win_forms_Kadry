using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Kadry
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            SqlConnection connection = new SqlConnection(ConfigurationManager.
                ConnectionStrings["HRConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("ALTER TABLE SzkoleniaBadania " +
                    "DROP constraint", connection);

            connection.Open();
            cmd.ExecuteNonQuery();
            connection.Close();
        }
    }
}