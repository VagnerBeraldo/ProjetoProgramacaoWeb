<%-- 
    Document   : listar_pets
    Created on : 08 de nov. de 2024, 21:47:08
    Author     : vagner
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Relação de pets</title>
        <link rel="stylesheet" href="../css/styleLista.css" type="text/css">
           
    </head>
    <body>
        <%
            Connection conn;
            PreparedStatement stm;
            ResultSet rs;            

            /*CONECTAR COM BANCO DE DADOS*/
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/LACOSDEPATA", "root", "rpmonn");
            /* Busca o usuário e senha digitados na tabela do BD*/
            
            
            String senhaUsuario = (String) session.getAttribute("senhaUsuario");           
            //String posicaoParam = request.getParameter("senha");
            //int pos = Integer.parseInt(posicaoParam);
                        
            stm = conn.prepareStatement("SELECT posicao, primeiroNome, idPet, nomePet, statusPet FROM cliente INNER JOIN pet ON posicao = posicaoCliente WHERE senha = ?;");
            stm.setString(1, senhaUsuario);
            rs = stm.executeQuery();
            
            out.print("<table>");
            
            out.print("<caption>");
            out.print("Relação resumo de Pets para adoção");
            out.print("</caption>");
            
            out.print("<tr><th> Posição </th><th> Tutor </th><th> ID Pet </th><th> Nome do Pet </th><th> Status </th><th> Exclusão</th><th> Alterar</th></tr>");
            while(rs.next()){                  /*nome da coluna no banco de dados*/
            out.print("<tr><td>" + rs.getInt("posicao") + 
            "</td><td>" + rs.getString("primeiroNome") +  
            "</td><td>" + rs.getInt("idPet") +
            "</td><td>" + rs.getString("nomePet") +
            "</td><td>" + rs.getString("statusPet") +
            "</td>");    /*href=excluir_remedio.jsp?<name do HTML>=" */               /*nome da coluna no banco de dados*/
            out.print("<td><a href='excluirUsuario.jsp?codigo=" + rs.getString("posicao") + 
                  "' onclick='return confirm(\"Confirmar a exclusão?\");'>Excluir</a></td>");
            out.print("<td><a href='alterarCarregarForm.jsp?codigo=" + rs.getString("posicao") + "'>Alterar</a></td></tr>");
            }
            out.print("</table>");
        %>
    </body>
</html>
