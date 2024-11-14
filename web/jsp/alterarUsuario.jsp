<%-- 
    Document   : alterarUsuario
    Created on : 09 de nov. de 2024, 11:39:49
    Author     : Vagner
--%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.SQLException"%>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset="ISO-8859-1">
        <title></title>
    </head>
    <body>
        <%
            String prNome, sbNome, nmSocial, cpf, dtNasc, email, telCel, telRes, log, num, compl, bairro, cde, es, cep;
            int posicao;

            Connection conn;
            PreparedStatement stm;
            
            try {                /*utilizar o valor do name no formulário */
            prNome = request.getParameter("primeiroNome");
            sbNome = request.getParameter("sobreNome");
            nmSocial = request.getParameter("nomeSocial");
            cpf = request.getParameter("cpf");
            dtNasc = request.getParameter("dtNasc");            
            email = request.getParameter("email");
            telCel = request.getParameter("telefoneCelular");
            telRes = request.getParameter("telefoneResidencial");
            log = request.getParameter("rua");
            num = request.getParameter("numero");
            compl = request.getParameter("complemento");
            bairro = request.getParameter("bairro");
            cde = request.getParameter("cidade");
            es = request.getParameter("estado");
            cep = request.getParameter("cep");
            
            String posicaoParam = request.getParameter("posicao");
            if (posicaoParam != null && !posicaoParam.trim().isEmpty()) {
                posicao = Integer.parseInt(posicaoParam);
            } else {
                out.print("<p style='color:red;'>Erro: O valor de 'posicao' está ausente ou vazio.</p>");
                return; // Interrompe a execução se `posicao` estiver vazio
            }
            
            /*CONECTAR COM BANCO DE DADOS*/
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/LACOSDEPATA", "root", "rpmonn");
                /* Alterar usuário na tabela do BD */

            stm = conn.prepareStatement("UPDATE cliente SET primeiroNome=?, sobreNome=?, nomeSocial=?, cpf=?, dataNasc=?, email=?, telCelular=?, telResidencial=?, logradouro=?, numero=?, complemento=?, bairro=?, cidade=?, estado=?, cep=? WHERE posicao=?");
            stm.setString(1, prNome);
            stm.setString(2, sbNome);
            stm.setString(3, nmSocial);
            stm.setString(4, cpf);
            stm.setDate(5, java.sql.Date.valueOf(dtNasc));                
            stm.setString(6, email);
            stm.setString(7, telCel);
            stm.setString(8, telRes);
            stm.setString(9, log);
            stm.setString(10, num);
            stm.setString(11, compl);
            stm.setString(12, bairro);
            stm.setString(13, cde);
            stm.setString(14, es);
            stm.setString(15, cep);
            stm.setInt(16, posicao);

                stm.executeUpdate(); //executa o cmd

                out.print("<p style='color:white; font-size:30; font-family: arial'>Jogador alterado com sucesso!</p>");
            } catch (SQLException erro) {
                    out.print("<p style='color:red; font-size:30;'>Erro: Entre em contato com o administrador</p>" + erro.getMessage());
            } 
        %>
    </body>
</html>
