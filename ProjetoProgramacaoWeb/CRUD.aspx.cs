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
    public partial class CRUD : System.Web.UI.Page
    {
        String Situacao;
        String sc = "Server=localhost;Database=GuitarCourse;Uid=root;Pwd=;";
        protected void Page_Load(object sender, EventArgs e)
        {
            string a = txtCodigo.Text.ToString();
            if (IsPostBack == false)
            {
                var x = Convert.ToInt64(Request["txtCodigo"]);
                if (x > 0)
                {
                    Session["txtCodigo"] = Convert.ToInt64(Request["txtCodigo"]);
                    txtCodigo.Text = Session["txtCodigo"].ToString();
                    detalhes();
                }
            }
            carregar();
        }

        private void carregar()
        {
            DataSet ds = new DataSet();
            MySqlConnection conexao = new MySqlConnection(sc);
            conexao.Open();
            String sql = "select * from uf order by estado";
            MySqlDataAdapter conversor1 = new MySqlDataAdapter(sql, conexao);
            conversor1.Fill(ds, "todos");
            conexao.Close();
            txtEstado.DataSource = ds.Tables["todos"];
            txtEstado.DataValueField = "codigo";
            txtEstado.DataTextField = "estado";
            txtEstado.DataBind();
        }

        protected void detalhes()
        {
            MySqlConnection conexao = new MySqlConnection(sc);
            conexao.Open();
            String sql = "select * from cadrastro_curso where codigo=" + txtCodigo.Text;
            MySqlCommand comando = new MySqlCommand(sql, conexao);
            try
            {
                MySqlDataReader registro = comando.ExecuteReader();
                if (registro.Read())
                {
                    txtCodigo.Text = registro["codigo"].ToString();
                    nome.Value = registro["nome"].ToString();
                    email.Value = registro["email"].ToString();
                    dataNascimento.Value = registro["dt_nascto"].ToString();
                    Fone.Value = registro["telefone"].ToString();
                    txtEstado.Text = registro["uf"].ToString();
                    list_usuario.Value = registro["tipo_usuario"].ToString();
                    Situacao = registro["situacao"].ToString();


                    if (Situacao == "Ativo")
                    {
                        Ativo.Checked = true;
                    }
                    if (Situacao == "Inativo")
                    {
                        Inativo.Checked = true;
                    }

                    if (Fone.Value.Length < 15)
                    {
                        fixo.Checked = true;
                    }
                    else { celular.Checked = true; }

                }
                else
                {
                    Response.Write("<script>alert('Falha na consulta! Confira os dados');</script>");
                    // limpar();
                }
            }
            catch
            {
                // Response.Write("<script>alert('Falha na consulta! Confira os dados');</script>");
            }
            conexao.Close();
        }




        protected void cadastrar(object sender, EventArgs e)
        {
              if (Ativo.Checked)
               {
                   Situacao = "Ativo";
               }
               if (Inativo.Checked)
               {
                   Situacao = "Inativo";
               }
              
       
                MySqlConnection conexao = new MySqlConnection(sc);
                conexao.Open();
                 String sql = "insert into cadrastro_curso(codigo, nome, email, dt_nascto, telefone, uf, tipo_usuario, situacao)" +
                "values('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}')";
                 sql = String.Format(sql, txtCodigo.Text, nome.Value, email.Value, dataNascimento.Value, Fone.Value, txtEstado.Text, list_usuario.Value, Situacao );
                MySqlCommand comando = new MySqlCommand(sql, conexao);    

                   String sql1 = "insert into usuario(codigo, nome, email, senha)" +
                    "values('{0}','{1}','{2}','{3}')";
                    sql1 = String.Format(sql1, txtCodigo.Text, nome.Value, email.Value, pwd.Value); 
                    MySqlCommand comando1 = new MySqlCommand(sql1, conexao);  
     
            try
            {
                comando.ExecuteNonQuery();
                comando1.ExecuteNonQuery();
                Response.Write("<script>alert('Cadastro realizado com sucesso!);</script>");
              //  Response.Redirect("Lista.aspx");
                limpar();
            }
            catch
            {
              Response.Write("<script>alert('Falha no cadastro! Confira os dados');</script>");
            }
            conexao.Close();

        }

        protected void alterar(object sender, EventArgs e)
        {
            MySqlConnection conexao = new MySqlConnection(sc);
            conexao.Open();

            if (Ativo.Checked)
            {
                Situacao = "Ativo";
            }
            if (Inativo.Checked)
            {
                Situacao = "Inativo";
            }

            try
            {
                String sql = "update cadrastro_curso set nome='{0}',email='{1}',dt_nascto='{2}',telefone='{3}',uf='{4}',tipo_usuario='{5}',situacao='{6}' where codigo='{7}'";
                sql = String.Format(sql, nome.Value, email.Value, dataNascimento.Value, Fone.Value, txtEstado.Text, list_usuario.Value, Situacao, txtCodigo.Text ) ;
                MySqlCommand comando = new MySqlCommand(sql, conexao);
                String sql1 = "update usuario set nome='{0}', email='{1}', senha='{2}' where codigo='{3}';";
                sql1 = String.Format(sql1, nome.Value, email.Value, pwd.Value, txtCodigo.Text); 
                MySqlCommand comando1 = new MySqlCommand(sql1, conexao);  
                comando.ExecuteNonQuery();
                comando1.ExecuteNonQuery();
              //  Response.Write("<script> $.notify({ title: '<strong>Sucesso!</strong>', message: 'Atualizacao realiza com sucesso.', offset: 80 }, { type: 'success'});</script>");
                Response.Redirect("Lista.aspx");
            }
            catch
            {
                Response.Write("<script> $.notify({ title: '<strong>Atenção!</strong>', message: 'Falha na Atualização', offset: 80 }, { type: 'warning'});</script>");

            }
            conexao.Close();
        //99    limpar();
        }

        protected void consutar(object sender, EventArgs e)
        {
            MySqlConnection conexao = new MySqlConnection(sc);
            conexao.Open();
            String sql = "select * from cadrastro_curso where codigo=" + txtCodigo.Text;
            MySqlCommand comando = new MySqlCommand(sql, conexao);
            try
            {
                MySqlDataReader registro = comando.ExecuteReader();
                if (registro.Read())
                {
                    txtCodigo.Text = registro["codigo"].ToString();
                    nome.Value = registro["nome"].ToString();
                    email.Value = registro["email"].ToString();
                    dataNascimento.Value = registro["dt_nascto"].ToString();
                    Fone.Value = registro["telefone"].ToString();
                    txtEstado.Text = registro["uf"].ToString();
                    list_usuario.Value = registro["tipo_usuario"].ToString();
                    Situacao = registro["situacao"].ToString();
                    
                    if(Situacao == "Ativo")
                    {
                        Ativo.Checked = true;
                    }
                    if (Situacao == "Inativo")
                    {
                        Inativo.Checked = true;
                    }

                    if(Fone.Value.Length < 15)
                    {
                        fixo.Checked = true;
                    }
                    else { celular.Checked = true; }

                }
                else
                {
                    Response.Write("<script>alert('Falha na consulta! Confira os dados');</script>");
                    limpar();
                }
            }
            catch
            {
                Response.Write("<script>alert('Falha na consulta! Confira os dados');</script>");
            }
            conexao.Close();
        }

        protected void excluir(object sender, EventArgs e)
        {
            MySqlConnection conexao = new MySqlConnection(sc);
            conexao.Open();
            try
            {
                String sql = "delete from cadrastro_curso where codigo=" + txtCodigo.Text;
                MySqlCommand comando = new MySqlCommand(sql, conexao);
                String sql1 = "delete from usuario where codigo=" + txtCodigo.Text;
                MySqlCommand comando1 = new MySqlCommand(sql1, conexao);
                comando.ExecuteNonQuery();
                comando1.ExecuteNonQuery();
                Response.Write("<script>alert('Feito! usuario excluido com sucesso!');</script>");
                Response.Redirect("Lista.aspx");
            }
            catch
            {
                Response.Write("<script>alert('Falha ao excluir! Confira os dados');</script>");
            }
            conexao.Close();
            // limpar();
            
        }

        private void limpar()
        {
            txtCodigo.Text = "";
            nome.Value = "";
            email.Value = "";
            dataNascimento.Value = "";
            Fone.Value = "";
            txtEstado.Text = "";
            list_usuario.Value = "";
            Situacao = "";

        }



    }
}