using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Kadry
{
    public partial class Kontakt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                MailMessage msg = new MailMessage();
                msg.To.Add("mmaniek@gmail.com");
                MailAddress address = new MailAddress("mmaniek@gmail.com");
                msg.From = address;
                msg.Subject = txtName.Text + " :  " + ddlSubject.Text;
                msg.Body = txtMessage.Text;

                SmtpClient client = new SmtpClient();
                client.Host = "smtp.gmail.com";
                client.EnableSsl = true;
                NetworkCredential credentials = new NetworkCredential("mmaniek@gmail.com", "maciejczuk7");
                client.Credentials = credentials;

                client.Send(msg);

                lblResult.Text = "Twoja wiadomość została wysłana.";

                txtName.Text = "";
                txtMessage.Text = "";
            }
            catch
            {
                lblResult.Text = "Wiadomość nie została wysłana. Spróbuj ponownie.";
            }
        }
    }
}