<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CRUD.aspx.cs" Inherits="WebApplication8.CRUD" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <meta charset="UTF-8" />
		<meta name="description" content="Cadastro de Alunos. SegundoProjetoWeb2018. Franklin Verlon dos Santos" />
		<link rel="stylesheet" href="cadastroestilo.css" />
		<link rel="stylesheet" href="reset.css"/>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<link rel="shortcut icon" href="https://www.freefavicon.com/freefavicons/objects/guitar-152-172424.png"/>
		<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet"/>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>

	    <title>Cadastro de Alunos</title>
	    <script lang="javascript" src="jquery-3.3.1.min.js"> </script>
		<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
		<link href="css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="js/bootstrap.min.js"></script>
		<script type="text/javascript" src="js/bootstrap-notify.min.js"></script>
		<script type="text/javascript" src="js/jquery.mask.min.js"></script>
		
	
</head>
	<body>
        <div class="topnav" id="myTopnav">
			<a href="Login.aspx"><i class="glyphicon glyphicon-log-out" aria-hidden="true" runat="server"></i> Logout</a>
			<a href="CRUD.aspx"><i class="fa fa-book" aria-hidden="true" runat="server"></i> Cadastro</a>
			<a href="Lista.aspx"><i class="fa fa-list-ul" aria-hidden="true" runat="server"></i> Lista</a>
			<a href="javascript:void(0);" class="icon" onclick="menu()">&#9776;</a
			<p> <img src="guitar.ico" width="50" height="50" align="right" id="icone" /></p>
	    </div>

		 <div class="container">
		    <center>
		 
			<h1 class="titulo2"><i class="fa fa-book" aria-hidden="true"></i> 
				Cadastro de Alunos Curso de Guitarra  <i class="fa fa-music" aria-hidden="true"></i><br/>
			</h1>
		    		
			
		    </center>
		 
			    <form name="formCadastro" method="post"  onsubmit="return confirmar()" runat="server">
			    <label>Código:</label>
				<asp:TextBox  id="txtCodigo" required="" runat="server"></asp:TextBox>
				
				
				<label>Tipo de usuario:</label>		
				<select id="list_usuario" name="list_usuario" runat="server">			
				<option>Aluno</option>
				<option>Professor</option>
				<option>Administrador</option>
				</select>

                <label>Estado:</label>
				<asp:DropDownList ID="txtEstado" runat="server" AppendDataBoundItems="True" AutoPostBack="True" CausesValidation="True" EnableTheming="True" Height="20px">
                 <asp:ListItem></asp:ListItem>
                </asp:DropDownList>
				
				<div class="form-group" runat="server">
					<label>Nome</label>
					<input name="nome" id="nome" placeholder="Digite aqui seu nome" class="form-control"  runat="server"/>
				</div>
				<div class="form-group" runat="server">
					<label>Email</label>
					<input class="form-control" id="email" name="email" placeholder="Digite aqui seu E-mail"  runat="server"/>  
				</div>
				<div class="form-group" runat="server">
					<label>Data de Nascimento</label>
					<input type="text" class="form-control" id="dataNascimento" name="dataNascimento" placeholder="00/00/0000"  runat="server"/>  
				</div>
				
				<div class="form-group" runat="server">
					<label>Telefone:</label>
					<label class="radio-inline"><input type="radio" id="fixo" name="tele"  runat="server"/>Fixo</label>
                    <label class="radio-inline"><input type="radio" id="celular" name="tele"  runat="server"/>Celular</label> 
					<input type="text" class="form-control" id="Fone" name="Fone" placeholder="Digite seu telefone com DDD"  disabled="disabled" runat="server"/>  
				</div>
				
				<div class="form-group" runat="server">
                   <label for="pwd">Password</label>
                   <input type="password" class="form-control" id="pwd" placeholder="Digite a senha"  runat="server"/>
                </div>

				 <label>Situação:</label> 
                 <label class="radio-inline"><asp:RadioButton id="Ativo"   checked="true" runat="server" Text="Ativo" GroupName="situacao" ></asp:RadioButton></label>
                 <label class="radio-inline"><asp:RadioButton id="Inativo"   runat="server" Text="Inativo" GroupName="situacao" ></asp:RadioButton></label><br/>
			     <asp:Button type="submit" class="btn btn-primary" id="btnCadrastra" runat="server" OnClick="cadastrar" Text="Cadastrar">
				 </asp:Button>
                 <asp:Button type="submit" class="btn btn-primary" id="btnAlterar" runat="server" Text="Alterar" OnClick="alterar" >
				 </asp:Button>
                 <asp:Button class="btn btn-primary" id="btnConsultar" runat="server" Text="Consultar" OnClick="consutar" OnClientClick="SemValidar()">
				</asp:Button>
                <asp:Button type="submit" class="btn btn-primary" id="btnExcluir" runat="server" Text="Excluir" OnClick="excluir">
				</asp:Button>
				<br/>
			</form>
		</div>
</body>
</html>


<script type="text/javascript">
    $(document).ready(function () {
        $('#dataNascimento').mask('00/00/0000');
    })


    $('#fixo').click(function () {
        Fone.disabled = false;
        $('#Fone').mask('(99) 9999-9999');
        $('#Fone').val("");
        Fone.focus();
        return true;
    });
    $('#celular').click(function () {
        Fone.disabled = false;
        $('#Fone').mask('(99) 99999-9999');
        $('#Fone').val("");
        Fone.focus();
        return true;
    });

    if (validar()) {
       // $('#celular').checked = true;

    } else {
                function confirmar() {
                    if (nome.value.length < 3) {
                         $.notify({
                         title: '<strong>Atenção!</strong>',
                         message: 'Você precisa preecher seu nome completo.',
                         offset: 80
                     }, {
                         type: 'warning'
                     });
            /*		alert('Voce precisa preencher seu nome completo!');  */
                    $('#nome').val("");
                             return false;
                }
        
                //  a@a.co
                    if (email.value.length < 6 ||
			        email.value.indexOf("@") < 1 ||
		        	email.value.lastIndexOf(".") <=
			        email.value.indexOf("@")) {
                     $.notify({
                     title: '<strong>Por favor!</strong>',
                     message: 'Informe um E-mail valido.',
                     offset: 80
                    }, {
                      type: 'info'
                     });
                    $('#email').val("");
                    return false;
                     }

                    if (dataNascimento.value.length < 10) {
                     $.notify({
                      title: '<strong>Por favor!</strong>',
                       message: 'Informe sua data de nacimento completa.',
                     offset: 80
                     }, {
                    type: 'info'
                    });
                return false;
                 }

                 if (document.formCadastro.tele[0].checked == true) {
                  if (Fone.value.length < 14) {
                     $.notify({
                          title: '<strong>Por favor!</strong>',
                           message: 'Informe seu telefone completo.',
                          offset: 80
                        }, {
                            type: 'info'
                        });
                      return false;
                  }
              }

                  if (document.formCadastro.tele[1].checked == true) {
                 if (Fone.value.length < 15) {
                        $.notify({
                    title: '<strong>Por favor!</strong>',
                    message: 'Informe seu Celular completo.',
                    offset: 80
                        }, {
                    type: 'info'
                     });
                return false;
                  }
                 }


                if (pwd.value.length < 6) {
                  $.notify({
                  title: '<strong>Atenção!</strong>',
                   message: 'Sua senha deve ter no mínimo 6 caracteres!',
                  offset: 80
                          }, {
                  type: 'warning'
                   });
                  $('#pwd').val("");
                  return false;
                  }
        


              $.notify({
                 title: '<strong>Sucesso!</strong>',
               message: 'Seu cadastro foi realizado com sucesso.',
               offset: 80
                 }, {
                    type: 'success'
                  });
                 return false


        
            
                }


        $(document).ready(function () {
            $('.icon').click(function () {
                if ($('.topnav').hasClass('responsive')) {
                    $('.topnav').removeClass('responsive');
                } else {
                    $('.topnav').addClass('responsive');
                }
            });
        });

    }

</script>		
