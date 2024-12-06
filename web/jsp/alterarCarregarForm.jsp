<%-- 
    Document   : Carregar formulário para alteração
    Created on : 09 de nov. de 2024, 10:21:08
    Author     : vagner

enabled=false
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset="ISO-8859-1">
        <link rel="stylesheet" href="../css/cliente.css">
        <link rel="stylesheet" href="../css/formAlteracao.css">
        
        <title></title>
    </head>
    <body>
        <%
            String c;
            Connection conn;
            PreparedStatement stm;
            ResultSet rs;

            // Obtenha o valor do parâmetro corretamente como "codigo"
            c = request.getParameter("codigo");

            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/LACOSDEPATA", "root", "rpmonn");

            // Converte o parâmetro 'c' para Integer para ser usado na consulta
            stm = conn.prepareStatement("SELECT * FROM cliente WHERE posicao = ?");
            stm.setInt(1, Integer.parseInt(c));

            rs = stm.executeQuery();
            if (rs.next()) {
        %>    
        <br>
        
        <section class="cadastro">

            <div class="cadastro_cabecalho">
                <div class="nomeEmpresa">
                    <br>
                    <h3><b>Cadastro de Tutor - Alteração</b></h3>
                </div>
            </div>
        <div class="form">
            <form actionclass="form" method="post" action="alterarUsuario.jsp">
                <fieldset class="infoPessoal">
                    <legend>Informações Pessoais</legend>
                    <div class="numFila">
                        <label for="id-numFila">Posição na fila</label>
                        <input type="text" id="id-numFila" name="posicao" maxlength="30" value="<%=rs.getString("posicao")%>" readonly>
                    </div>
                    <div class="nomeCliente">
                        <label for="id-nomeCliente">Primeiro Nome*</label>
                        <input type="text" id="id-nomeCliente" name="primeiroNome" maxlength="30" value="<%=rs.getString("primeiroNome")%>" required placeholder="Ex.: João">
                    </div>
                    <div class="sobrenomeCliente">
                        <label for="id-sobrenomeCliente">Sobrenome*</label>
                        <input type="text" id="id-sobrenomeCliente" name="sobreNome" maxlength="60" value="<%=rs.getString("sobreNome")%>" required placeholder="da Silva Souza">
                    </div>
                    <div class="nomeSocial">
                        <label for="id-nomeSocial">Nome Social</label>
                        <input type="text" maxlength="30" name="nomeSocial" value="<%=rs.getString("nomeSocial")%>" id="id-nomeSocial">
                    </div>
                    <div class="cpf">
                        <label for="id-cpf">CPF*</label>
                        <input type="text" id="id-cpf" maxlength="11" required name="cpf" value="<%=rs.getString("cpf")%>" required placeholder="somente números">
                    </div>
                    <div class="dtNascimento">
                        <label for="id-dtNasc">Data Nasc.*</label>
                        <input type="date" maxlength="8" required name="dtNasc" value="<%=rs.getString("dataNasc")%>" id="id-dtNasc" required>
                    </div>

                </fieldset>

                <br>

                <fieldset class="infoContado">
                    <legend>Informações de Contato</legend>
                    <div class="email">
                        <label for="id-email">e-mail*</label>
                        <input type="email" required name="email" maxlength="60" value="<%=rs.getString("email")%>" id="id-email" >
                    </div>
                    <div class="telefoneCelular">
                        <label for="id-telefoneCelular">Num Tel. Celular</label>
                        <input type="tel" name="telefoneCelular" maxlength="11" value="<%=rs.getString("telCelular")%>" id="id-telefoneCelular"
                               placeholder="somente números com DDD">
                    </div>
                    <div class="telefoneResid">
                        <label for="id-telefoneResid">Num Tel. Residencial</label>
                        <input type="tel" name="telefoneResid" maxlength="10" value="<%=rs.getString("telResidencial")%>" id="id-telefoneResid"
                               placeholder="somente números com DDD">
                    </div>
                </fieldset>

                <br>

                <fieldset class="endereco">
                    <legend>Endereço</legend>
                    <div class="cep">
                        <label for="id-cep">CEP*</label>
                        <input type="text" required name="cep" id="id-cep" maxlength="8" value="<%=rs.getString("cep")%>" placeholder="somente números">
                    </div>
                    <div class="rua">
                        <label for="id-rua">Logradouro*</label>
                        <input type="text" required name="rua" maxlength="80" value="<%=rs.getString("logradouro")%>" id="id-rua" >
                    </div>
                    <div class="numero">
                        <label for="id-numero">Número*</label>
                        <input type="text" required name="numero" maxlength="20" value="<%=rs.getString("numero")%>" id="id-numero" >
                    </div>
                    <div class="complemento">
                        <label for="id-complemento">Complemento</label>
                        <input type="text" name="complemento" maxlength="30" value="<%=rs.getString("complemento")%>" id="id-complemento">
                    </div>
                    <div class="bairro">
                        <label for="id-bairro">Bairro*</label>
                        <input type="text" required name="bairro" maxlength="30" value="<%=rs.getString("bairro")%>" id="id-bairro" >
                    </div>
                    <div class="cidade">
                        <label for="id-cidade">Cidade*</label>
                        <input type="text" required name="cidade" maxlength="20" value="<%=rs.getString("cidade")%>" id="id-cidade" >
                    </div>
                    <div class="estado">
                        <label for="id-estado">Estado*</label>
                        <select required name="estado"  value="<%=rs.getString("estado")%>">
                            <optgroup label="Norte">
                                <option>AC</option>
                                <option>AP</option>
                                <option>AM</option>
                                <option>PA</option>
                                <option>MA</option>
                                <option>MT</option>
                                <option>PA</option>
                                <option>RO</option>
                                <option>RR</option>
                                <option>TO</option>
                            </optgroup>

                            <optgroup label="Nordeste">
                                <option>BA</option>
                                <option>CE</option>
                                <option>MA</option>
                                <option>PB</option>
                                <option>PE</option>
                                <option>PI</option>
                                <option>RN</option>
                                <option>SE</option>
                            </optgroup>

                            <optgroup label="C_Oeste">
                                <option>GO</option>
                                <option>MT</option>
                                <option>MS</option>
                                <option>DF</option>
                            </optgroup>

                            <optgroup label="Sudeste">
                                <option>ES</option>
                                <option>MG</option>
                                <option>RJ</option>
                                <option selected>SP</option>
                            </optgroup>

                            <optgroup label="Sul">
                                <option>PR</option>
                                <option>RS</option>
                                <option>SC</option>
                            </optgroup>
                        </select>
                    </div>
                </fieldset>

                <br>


                <div class="botoes">
                    <button type="submit" id="alterar">Alterar</button>
                </div>
            </form>
        </div>
        </section>
    <%
            
            } 
 
        
    %>        
    </body>
</html>
