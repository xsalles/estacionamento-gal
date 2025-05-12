<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %><%--
  Created by IntelliJ IDEA.
  User: 2DT
  Date: 07/04/2025
  Time: 16:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Deletando contato...</title>
</head>
<body>
<%
    String idParam = request.getParameter("id");

    if (idParam != null) {
        int id = Integer.parseInt(idParam);

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/estacionamento_db", "root", "root");

            String sql = "DELETE FROM usuario WHERE usuario_id = ?";
            PreparedStatement statement = conecta.prepareStatement(sql);
            statement.setInt(1, id);

            statement.executeUpdate();

            statement.close();
            conecta.close();
%>
<script>
    alert("Funcionário deletado com sucesso!");
    window.location.href = "index.jsp";
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
} else {
%>
<script>
    alert("ID do contato não foi informado.");
    window.location.href = "index.jsp";
</script>
<%
    }
%>
</body>
</html>