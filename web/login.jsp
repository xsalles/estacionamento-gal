<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
    <head>
        <title>Login</title>
        <link rel="stylesheet" href="style.css">
        <script>
            function showAlert(message) {
                alert(message);
            }
        </script>
    </head>
    <body>
        <%
            String email = request.getParameter("email");
            String senha = request.getParameter("senha");

            if (email != null && senha != null) {
                try {

                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/estacionamento_db", "root", "root");

                    String sql = "SELECT * FROM usuario WHERE email = ? AND senha = ?";
                    PreparedStatement statement = conecta.prepareStatement(sql);
                    statement.setString(1, email);
                    statement.setString(2, senha);
                    ResultSet rs = statement.executeQuery();

                    if (rs.next()) {

                        String nivelAcesso = rs.getString("nivel_acesso");

                        if ("ADMIN".equalsIgnoreCase(nivelAcesso)) {

        %>
        <script>showAlert("Login realizado com sucesso (ADMIN)");

            setTimeout(() => {
                window.location.href = "dashboard/admin/index.jsp";
            }, 1000);
        </script>
        <%        } else {
        %>
        <script>showAlert("Login realizado com sucesso (MODERADOR)");

            setTimeout(() => {
                window.location.href = "dashboard/moderador/index.html";
            }, 1000);
        </script>
        <%
            }
        } else {
        %>
        <script>showAlert("Email ou senha inválidos!");

                window.location.href = "index.html";

        </script>
        <%
            }

            rs.close();
            statement.close();
            conecta.close();
        } catch (Exception e) {
        %>
        <script>showAlert("Erro: <%= e.getMessage()%>");</script>
        <%
            }
        } else {
        %>
        <script>showAlert("Por favor insira o email e a senha");

        </script>
        <%
            }
        %>

    </body>
</html>