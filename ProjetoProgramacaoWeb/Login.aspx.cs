using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;
using MySql.Data.MySqlClient;
using System.Data;

namespace WebApplication8
{
    public partial class Login : System.Web.UI.Page
    {   
        String sc = "Server=localhost;Database=GuitarCourse;Uid=root;Pwd=;";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void login(object sender, EventArgs e)
        {   
            MySqlConnection conexao = new MySqlConnection(sc);
            conexao.Open();
            String sql = "select * from usuario where email='" + email.Text + "' and " + "senha='" + senha.Text + "'";
            MySqlCommand comando = new MySqlCommand(sql, conexao);
            MySqlDataReader registro = comando.ExecuteReader();
            if (registro.Read())
            {
                Response.Write("<script>alert('Login efetuado com sucesso espere ser redirecionado!');</script>");
                Response.Redirect("Lista.aspx");
            }
            else
            {
                Response.Write("<script>alert('Falha no login! Dados incorretos confira email e senha');</script>");
                limpar();
            }
            conexao.Close();
        }
        private void limpar()
        {
            email.Text = "";
            senha.Text = "";
        }

        protected void reenviarSenha(object sender, EventArgs e)
        {
            MySqlConnection conexao = new MySqlConnection(sc);
            conexao.Open();
            String sql = "select * from usuario where email='" + email.Text + "'";
            MySqlCommand comando = new MySqlCommand(sql, conexao);
            MySqlDataReader registro = comando.ExecuteReader();
            if (registro.Read())
            {
                MailMessage Email = new MailMessage();
                Email.From = new MailAddress("seu.email@outlook.com");
                Email.To.Add(new MailAddress(email.Text));
                Email.Subject = "Recuperação de senha";
                Email.Body = "Olá " + registro["nome"].ToString() + " a senha para a sua conta é: " + registro["senha"].ToString();

                SmtpClient smtp = new SmtpClient("smtp-mail.outlook.com");
                try
                {
                    smtp.Port = 587;
                    smtp.EnableSsl = true;
                    smtp.Credentials = new NetworkCredential("seu.email@outlook.com", "sua senha");
                    smtp.Send(Email);
                    txtLbl2.Text = "Senha  enviada com sucesso para seu email";
                }
                catch
                {
                    txtLbl2.Text = "Erro ao enviar o email";
                }
            }
            else
            {
                txtLbl2.Text = "O email digitado não está cadastrado no sistema";
            }
            limpar();
            conexao.Close();
        }

    }
}