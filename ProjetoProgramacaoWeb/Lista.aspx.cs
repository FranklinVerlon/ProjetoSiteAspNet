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
    public partial class Lista : System.Web.UI.Page
    {
        String sc = "Server=localhost;Database=GuitarCourse;Uid=root;Pwd=;";
        protected void Page_Load(object sender, EventArgs e)
        {
            carregarTela();
        }

        private void carregarTela()
        {
            MySqlConnection conexao = new MySqlConnection(sc);
            conexao.Open();
            String sql = "select codigo, nome as Nome, email as Email, dt_nascto as DataNascimento, telefone as Telefone, uf as Estado, tipo_usuario as Usuario, situacao as Situacao from cadrastro_curso order by codigo";
            DataSet ds = new DataSet();
            MySqlDataAdapter conversor = new MySqlDataAdapter(sql, conexao);
            conversor.Fill(ds, "todosClientes");
            conexao.Close();
            txtGrid.DataSource = ds.Tables["todosClientes"];
            txtGrid.DataBind();
        }

     

        protected void detalhes(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int id = int.Parse(txtGrid.DataKeys[(btn.NamingContainer as GridViewRow).RowIndex]["codigo"].ToString());
            Response.Redirect("CRUD.aspx?txtCodigo=" + id);
        }

        protected void txtGrid_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}