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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Busca usuário no BD</title>
    </head>
  <body>
<%
    String user, password;
    Connection conn = null;
    PreparedStatement stm = null;
    ResultSet rs = null;
    boolean loginInvalido = false;  // Variável de controle para indicar login inválido

    try {
        user = request.getParameter("email");
        password = request.getParameter("password");

        /* CONECTAR COM BANCO DE DADOS */
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/LACOSDEPATA", "root", "rpmonn");

        /* Busca o usuário e senha digitados na tabela do BD */
        stm = conn.prepareStatement("SELECT * FROM cliente WHERE email = ? AND senha = ?");
        stm.setString(1, user);
        stm.setString(2, password);
        rs = stm.executeQuery();

        if (rs.next()) {
            session.setAttribute("senhaUsuario", password);
            // Redireciona para adm.jsp com o primeiroNome do usuário
            response.sendRedirect("adm.jsp?primeiroNome=" + rs.getString("primeiroNome"));
        } else {
            loginInvalido = true;  // Login incorreto
        }

    } catch (Exception e) {
        out.print("Erro: " + e.getMessage());
    } finally {
        try {
            if (rs != null) rs.close();
            if (stm != null) stm.close();
            if (conn != null) conn.close();
        } catch (Exception ex) {
            out.print("Erro ao fechar recursos: " + ex.getMessage());
        }
    }

    // Se login for inválido, redireciona para login.jsp com erro
    if (loginInvalido) {
    out.print("Login inválido detectado.");    
    response.sendRedirect("../form/login.html?erro=true"); // Verifique se o caminho está correto
    }
%>
</body>


</html>
