<%-- 
    Document   : salvar
    Created on : 06 de nov. de 2024, 18:31:26
    Author     : Vagner
--%>


<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>

<!DOCTYPE html>
<html lang="pt-br">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Cliente e Pet</title>
    </head>
    <body>
        <%
        String prNome, sbNome, nmSocial, cpf, dtNasc, email, telCel, telRes, cep, log, num, compl, bairro, cde, es, nomePet;
        int reg;

        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet generatedKeys = null;

        try {
            prNome = request.getParameter("primeiroNome");
            sbNome = request.getParameter("sobreNome");
            nmSocial = request.getParameter("nomeSocial");
            cpf = request.getParameter("cpf");
            dtNasc = request.getParameter("dtNasc");            
            email = request.getParameter("email");
            telCel = request.getParameter("telefoneCelular");
            telRes = request.getParameter("telefoneResidencial");
            cep = request.getParameter("cep");
            log = request.getParameter("rua");
            num = request.getParameter("numero");
            compl = request.getParameter("complemento");
            bairro = request.getParameter("bairro");
            cde = request.getParameter("cidade");
            es = request.getParameter("estado");
            reg = Integer.parseInt(request.getParameter("registro"));
            nomePet = request.getParameter("nomePet");

            // Conectar com o banco de dados
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/LACOSDEPATA", "root", "rpmonn");

            // Inserir cliente no banco de dados e recuperar a chave gerada
            stm = conn.prepareStatement("INSERT INTO cliente (primeiroNome, sobreNome, nomeSocial, cpf, dataNasc, email, telCelular, telResidencial, logradouro, numero, complemento, bairro, cidade, estado, cep) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", PreparedStatement.RETURN_GENERATED_KEYS);

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

            int affectedRows = stm.executeUpdate();

            if (affectedRows == 0) {
                throw new SQLException("Falha ao inserir cliente, nenhuma linha afetada.");
            }

            generatedKeys = stm.getGeneratedKeys();
            int posicaoCliente = 0;

            if (generatedKeys.next()) {
                posicaoCliente = generatedKeys.getInt(1);  // Obter o ID gerado para o cliente
            } else {
                throw new SQLException("Falha ao inserir cliente, ID não obtido.");
            }

            // Inserir o pet, relacionando com o cliente
            stm = conn.prepareStatement("INSERT INTO pet (idPet, nomePet, posicaoCliente) VALUES (?, ?, ?)");
            stm.setInt(1, reg);  
            stm.setString(2, nomePet); 
            stm.setInt(3, posicaoCliente); 

            stm.executeUpdate();


            // Redireciona para o index.html após mostrar o alerta
            String contextPath = request.getContextPath(); // Obtem o contexto da aplicação (ex: /ProjetoPWII)
            out.println("<script type='text/javascript'>");
            out.println("alert('Dados cadastrados com sucesso!');");
            out.println("window.location.href = '" + contextPath + "/index.html';"); // Redireciona para /ProjetoPWII/index.html
            out.println("</script>");


        } catch (Exception e) {
            String contextPath = request.getContextPath(); // Obtém o contexto da aplicação
            out.println("<script type='text/javascript'>");
            out.println("alert('Erro ao inserir dados: " + e.getMessage() + "');");
            out.println("window.location.href = '" + contextPath + "/index.html';"); // Redireciona para a página inicial
            out.println("</script>");
        } finally {
            if (generatedKeys != null) try { generatedKeys.close(); } catch (Exception ignore) {}
            if (stm != null) try { stm.close(); } catch (Exception ignore) {}
            if (conn != null) try { conn.close(); } catch (Exception ignore) {}
        }
        %>
    </body>
</html>
