<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication8.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
	<head runat="server">
		<meta charset="utf8"/>
		<title> Login - Curso de Música </title>
		<link rel="stylesheet" href="loginestilo.css" />
        <link rel="stylesheet" href="reset.css"/>
		<meta name="description" content="Os melhores cursos de músicas do Brasil"/>
		<meta name="keywords" content="cadastro,login"/>
        <link rel="shortcut icon" href="https://www.freefavicon.com/freefavicons/objects/guitar-152-172424.png"/>
		<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet"/>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
	    <!--	<link rel="shortcut icon" href="guitar.ico"/>  -->
	</head>

	<body>

      <div class="topnav" id="myTopnav">
			<a href="Login.aspx"><i class="fa fa-sign-in" aria-hidden="true"></i> Login</a>
			<a href="javascript:void(0);" class="icon" onclick="menu()">&#9776;</a>
	   </div>
	
    <form id="form1" onsubmit="return validar()" runat="server">
   		
		<div class="container">
		<center>
	
			<div class="vida">			
			
			<p>LOGIN</p>
                <asp:Label ID="txtLbl2" runat="server" Font-Size="Small"></asp:Label>
                <br/><br/>
		
          <label for="username"> 
                Email: <asp:TextBox  id="email" name="email" requered="" placeholder="Digite seu email" runat="server" Height="31px"></asp:TextBox><br/><br/> 
          </label>
            <label for="password">
                Senha: <asp:TextBox type="password" id="senha" name="senha" requered="" placeholder="Digite sua senha" runat="server" Height="31px"></asp:TextBox><br/><br/> 
            </label>

            <label for="login">
                <asp:Button type="button" id="btnLogin" class="btn" value="Entrar" runat="server" OnClick="login" Text="Login" > 
                </asp:Button></label> <br/>
                <asp:LinkButton ID="linkReenviar" runat="server" Font-Size="Small" OnClick="reenviarSenha">Recuperar Senha.</asp:LinkButton>
                <br/>
			
           
                </div>	
        </center>

		 </div>
       
    </form>
   
</body>


</html>

<script lang="javascript" type="text/javascript" src="jquery-3.3.1.min.js"></script>
<script lang="javascript">

function validar()
{
	if(email.value=="" || senha.value=="")
	{
		alert("Preencha todos os campos!");
		return false;
	}
	
		
	 //a@a.co
	 if(email.value.length < 6 ||
	    email.value.indexOf("@") < 1 ||
		email.value.lastIndexOf(".") <=
		email.value.indexOf("@"))
		{
		     alert("Informe um email valido !");
			 email.focus();
			 return false;
		}

	   if(senha.value.length < 6)	
		{
			alert("Sua senha deve ter no mínimo 6 caracteres!");
			senha.focus();
			return false;
    }

	//	alert("Login efetuado com sucesso espere ser redirecionado!");
	//	window.location.replace('Lista.aspx');
 }
    
$(document).ready(function() {
	$('.icon').click(function() {
		if ( $('.topnav').hasClass('responsive') ) {
			 $('.topnav').removeClass('responsive');
		} else {
			$('.topnav').addClass('responsive');
		}
	});
});

</script>
	
