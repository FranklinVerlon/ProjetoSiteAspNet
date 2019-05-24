<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Lista.aspx.cs" Inherits="WebApplication8.Lista" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
		<meta name="login" content="Lista de Alunos. SegundoProjetoWeb2018. Franklin Verlon dos Santos"/>
		
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link rel="shortcut icon" href="https://www.freefavicon.com/freefavicons/objects/guitar-152-172424.png"/>
		<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" />
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
		
		<link rel="stylesheet" href="listaestilo.css" />
        <title>Lista de Alunos</title>
		<script lang="javascript" src="jquery-3.3.1.min.js"> </script>
		<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
		<link href="css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="js/bootstrap.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.quicksearch/2.3.1/jquery.quicksearch.js"></script>
		<style type="text/css"></style>
	
</head>
    	
<body>
    <form id="form1" runat="server">
    <div class="topnav" id="myTopnav">
			<a href="Login.aspx"><i class="glyphicon glyphicon-log-out" aria-hidden="true" runat="server"></i> Logout</a>
			<a href="CRUD.aspx"><i class="fa fa-book" aria-hidden="true" runat="server"></i> Cadastro</a>
			<a href="Lista.aspx"><i class="fa fa-list-ul" aria-hidden="true" runat="server"></i> Lista</a>
			<a href="javascript:void(0);" class="icon" onclick="menu()">&#9776;</a>
			<p> <img src="guitar.ico" width="50" height="50" align="right" id="icone" /></p>
	    </div>

   <center id="pesq" >
	<div class="form-group input-group">
		<span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>
		<input name="consulta" id="txt_consulta" placeholder="Consultar" type="text" class="form-control" />
		</div>
	</center>
	<div class="container">
	<center>
			<h1 class="titulo3"><i class="fa fa-music" aria-hidden="true"></i> 
				Lista de Usuários do Curso de Guitarra <i class="fa fa-music" aria-hidden="true"></i><br/>
				<br/>
			</h1>
                <asp:GridView ID="txtGrid" runat="server" DataKeyNames="codigo" BackColor="White" Font-Size="Medium" ForeColor="Black" OnSelectedIndexChanged="txtGrid_SelectedIndexChanged">
                <Columns>
                    <asp:TemplateField AccessibleHeaderText="Informações" ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="txtLb" runat="server" OnClick="detalhes"  CausesValidation="false" CommandName="" Text="Detalhes" ></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                    <HeaderStyle BackColor="Aqua" ForeColor="#3333CC" />
            </asp:GridView>
        </center>
        </div>
    </form>
</body>
</html>


<script lang="javascript">


    $('input#txt_consulta').quicksearch('table#tabela tbody tr');



    function menu() {
        var x = document.getElementById("myTopnav");
        if (x.className == "topnav") {
            x.className += " responsive";
        } else {
            x.className = "topnav";
        }
    }
</script>