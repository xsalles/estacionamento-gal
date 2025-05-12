<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registrando entrada do carro...</title>
</head>
<body>
<%
    String numero_vaga = request.getParameter("numero_vaga");
    String placa = request.getParameter("placa");
    String entrada = request.getParameter("entrada");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/estacionamento_db", "root", "root");

        String sql = "INSERT INTO vagas (numero_vaga, placa, entrada) VALUES (?, ?, ?)";
        PreparedStatement statement = conecta.prepareStatement(sql);
        statement.setString(1, numero_vaga);
        statement.setString(2, placa);
        statement.setString(3, entrada);

        statement.executeUpdate();
        statement.close();
        conecta.close();
%>
<script>
    alert("Entrada registrada com sucesso!");
    window.location.href = "../dashboard/admin/index.jsp";
</script>
<%
    } catch (Exception e) {
%>
<script>
    alert("Erro: <%= e.getMessage() %>");
    window.location.href = "../dashboard/carros/index.jsp";
</script>
<%
    }
%>
</body>
</html>
