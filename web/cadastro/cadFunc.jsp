<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>adicionando o contato...</title>
</head>
<body>
<%
    String nome = request.getParameter("nome");
    String email = request.getParameter("email");
    String senha = request.getParameter("senha");
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/estacionamento_db", "root", "root");

        String sql = "INSERT INTO usuario (nome, email, senha, nivel_acesso) VALUES (?, ?, ?, 'MODERADOR')";
        PreparedStatement statement = conecta.prepareStatement(sql);
        statement.setString(1, nome);
        statement.setString(2, email);
        statement.setString(3, senha);
        
        statement.executeUpdate();
        
        statement.close();
    conecta.close();
%>
<script>
    alert("Funcionário cadastrado com sucesso!");
    window.location.href = "../dashboard/admin/index.jsp";
</script>
<%
} catch (Exception e) {
%>
<script>
    alert("Erro: <%= e.getMessage() %>");
    window.location.href = "index.jsp";
</script>
<%
    }
%>
</body>
</html>