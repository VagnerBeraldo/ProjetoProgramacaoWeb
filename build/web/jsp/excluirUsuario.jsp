<%-- 
    Document   : excluir_pet
    Created on : 09 de nov. de 2024, 09:11:00
    Author     : Vagner
--%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exclusão de Pet</title>
    </head>
    <body>
        
        <%
            String cod;
            int status;
            
            Connection conn;
            PreparedStatement stm;
            
            cod = request.getParameter("codigo");
            
            /*CONECTAR COM BANCO DE DADOS*/
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/LACOSDEPATA", "root", "rpmonn");
            /* Excluir cliente na tabela do BD */
            
            stm = conn.prepareStatement("DELETE FROM cliente WHERE posicao=?");
            stm.setString(1, cod);
            
            
            status = stm.executeUpdate(); //executa o cmd
            //if(status == 1){
            //out.print("<p style='color:white; font-size:30; font-family: arial'>Cliente excluído com sucesso</p>");
            //}else{
            //out.print("<p style='color:white; font-size:30; font-family: arial'>Cliente não encontrado!</p>");
            //}
            response.sendRedirect("listar.jsp");
        %>
              </body>
</html>
