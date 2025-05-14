<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="styles.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Nunito+Sans:ital,opsz,wght@0,6..12,200..1000;1,6..12,200..1000&display=swap"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="styles.css"/>
    <link rel="stylesheet" href="../../styles/global.css"/>
    <title>HTML do gal</title>
  </head>

  <body>
    <header>
      <h2>Dashboard</h2>
    </header>
    <div class="wrapper">
      <aside>
        <div class="icons">
          <a href="../carros/index.jsp">
            <img
              class="icon"
              src="../../assets/cars.svg"
              alt="Gerenciar carros do estacionamento"
            />
          </a>
          <a href="index.jsp">
            <img
              class="icon"
              src="../../assets/profile.svg"
              alt="Gerenciar funcionários"
            />
          </a>
          <a href="../../index.html">
            <img
              class="icon"
              src="../../assets/power.svg"
              alt="Fazer Logout"
            />
          </a>
        </div>
      </aside>
      <main>
        <div class="content">
          <table>
            <thead>
              <tr>
                <td>ID</td>
                <td>Funcionário</td>
                <td>Email</td>
                <td>Ações</td>
              </tr>
            </thead>
            <tbody>
              <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/estacionamento_db", "root", "root");

                    String sql = "SELECT * FROM usuario WHERE nivel_acesso = 'MODERADOR'";
                    PreparedStatement st = conecta.prepareStatement(sql);
                    ResultSet rs = st.executeQuery();

                    while (rs.next()) {
              %>
              <tr>
                <td><%= rs.getInt("usuario_id") %></td>
                <td><%= rs.getString("nome") %></td>
                <td><%= rs.getString("email") %></td>
                <td>
                    <form method="post" action="deleteFunc.jsp" onsubmit="return confirm('Deseja deletar este funcionário?')">
                    <input type="hidden" name="id" value="<%= rs.getInt("usuario_id") %>" />
                    <button class="deleteVeic" type="submit">Deletar</button>
                  </form>
                </td>
              </tr>
              <%
                    }
                    rs.close();
                    st.close();
                    conecta.close();
                } catch (Exception e) {
              %>
              <tr>
                <td colspan="4">Erro ao buscar dados: <%= e.getMessage() %></td>
              </tr>
              <% } %>
            </tbody>
          </table>
          <a href="../../cadastro/index.html" class="addFunc">Adicionar funcionário</a>
        </div>
      </main>
    </div>
  </body>
</html>
