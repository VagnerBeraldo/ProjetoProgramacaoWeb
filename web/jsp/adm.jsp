<%-- 
    Document   : validar usuário
    Created on : 09 de nov. de 2024, 00:23:40
    Author     : Vagner
--%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
          <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Cursos de HTML, CSS e Javascript">
    <meta name="keywords" content="HTML, CSS, JS, Javascript">
    <meta name="robots" content="index, Follow">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
        rel="stylesheet">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Viga&display=swap"
        rel="stylesheet">

    <link rel="stylesheet" href="../css/cliente.css">
    <link rel="stylesheet" href="../css/adm.css">
    <!-- <link rel="stylesheet" href="../css/styleLista.css"> -->

    <title>Projeto PI</title>
    </head>
    <body>
           <header class="header">
        <div class="logo">
            <img src="../img/logo.png" id="logo" alt="">
        </div>

        <div class="tituloPagina">
            <h3>Laços de Pata - Bem-Vindo(a): <%= request.getParameter("primeiroNome")%></h3>
            
        </div>
        
        <div class="redeSocial">
            
            <div class="rede">
                <a href="https://www.facebook.com/universitariosantoamaro" target="_blank"><img src="../img/facebook.png" alt="icone da rede social facebook"></a>
            </div>
            <div class="rede">
                <a href="https://www.instagram.com/senacsantoamaro/" target="_blank"><img src="../img/instagram.png" alt="ícone da rede social instagram"></a>
            </div>
            <div class="rede">
                <a href="https://t.me/senacsantoamaro/" target="_blank"><img src="../img/telegram.png" id="imgTeleg" alt="ícone da rede social telegram"></a>
            </div>
            <div class="rede">
                <a href="https://wa.me/5511996616224" target="_blank"><img src="../img/whatsapp.png" alt="ícone da rede social whatsapp"></a>
            </div>
</div>

        <div class="navigation">
            <nav id="nav">
                <button aria-label="Abrir Menu" id="btn-mobile" aria-haspopup="true" aria-controls="menu"
                    aria-expanded="false">
                    <span id="hamburger"></span>
                </button>
                <ul id="menu" role="menu">
                    <li id="idLiInicio" style="display: block;"><a href="../index.html">Voltar</a></li>
                    <!-- <li><a href="cadastrar.html" target="AdmCRUD">Cadastrar</a></li> -->
                    <!--<li><a href="alterar.html" target="AdmCRUD">Alterar</a></li>-->
                    <!-- <li><a href="consultar.html" target="AdmCRUD">Consultar</a></li> -->
                    <li><a href="../jsp/listar.jsp" target="AdmCRUD">Listar pets</a></li>
                    <!--<li><a href="excluir.html" target="AdmCRUD">Excluir</a></li>-->
                </ul>
                
            </nav>

        </div>

    </header>
    <main>
        
        <section class="section">
            <div>
                <iframe class="iframeAdm" name="AdmCRUD" title="crud de clientes" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
            </div>
        </section>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="./js/voltar.js"></script>
    <script src="./js/menu.js"></script>


    <br>
    
    <footer>
        <div class="direitos">
            <p><b>Nossos Parceiros:</b></p>
            <p>Clínica Veterinária PetCare</p>
            <p>PetLife Rações e Cia</p>
            <p>Beleza Animal Petshop Bernardo</p>
            <p><b>&copy Laços de Pata - 2024. Todos os direitos reservados.</b></p>
            <address>
                <p>
                    <a href="https://www.google.com.br/maps/place/Centro+Universit%C3%A1rio+Senac+-+Santo+Amaro/@-23.6695931,-46.7020657,17z/data=!3m1!4b1!4m6!3m5!1s0x94ce5036539648d5:0x78501a72680ea23a!8m2!3d-23.669598!4d-46.6994908!16s%2Fg%2F121jytr5?hl=pt-BR&entry=ttu"
                       target="_blank"">
                        Av. Eng. Eusébio Stevaux, 823 - Santo Amaro
                    </a> - SP, 04696-000
                </p>   
            </address>
        </div>

        <div class=" redeSocial">
            <div class="rede">
                <a href="https://www.facebook.com/universitariosantoamaro" target="_blank"><img src="../img/facebook.png" alt="icone da rede social facebook"></a>
            </div>
            <div class="rede">
                <a href="https://www.instagram.com/senacsantoamaro/" target="_blank"><img src="../img/instagram.png" alt="ícone da rede social instagram"></a>
            </div>
            <div class="rede">
                <a href="https://t.me/senacsantoamaro/" target="_blank"><img src="../img/telegram.png" alt="ícone da rede social telegram"></a>
            </div>
            <div class="rede">
                <a href="https://wa.me/5511996616224" target="_blank"><img src="../img/whatsapp.png" alt="ícone da rede social whatsapp"></a>
            </div>
        </div>
    </footer>    


    </body>
</html>
