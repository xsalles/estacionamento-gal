<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="styles.css" />
    <link rel="stylesheet" href="../../styles/global.css"/>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Nunito+Sans:ital,opsz,wght@0,6..12,200..1000;1,6..12,200..1000&display=swap"
      rel="stylesheet"
    />
    <title>HTML do gal</title>
  </head>

  <body>
    <header>
      <h2>Dashboard</h2>
    </header>
    <div class="wrapper">
      <aside>
        <div class="icons">
            <a href="index.jsp">
            <img
              class="icon"
              src="../../assets/cars.svg"
              alt="Gerenciar carros do estacionamento"
            />
          </a>
            <a href="../admin/index.jsp">
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
                <td>Vaga</td>
                <td>Placa</td>
                <td>Entrada</td>
                <td>Saída</td>
                <td>Status</td>
                <td>Ações</td>
              </tr>
            </thead>
            <tbody>
              <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/estacionamento_db", "root", "root");

                    String sql = "SELECT * FROM vagas";
                    PreparedStatement st = conecta.prepareStatement(sql);
                    ResultSet rs = st.executeQuery();

                    while (rs.next()) {
              %>
              <tr>
                <td><%= rs.getInt("vaga_id") %></td>
                <td><%= rs.getString("placa") %></td>
                <td><%= rs.getString("entrada") %></td>
                <td><%= rs.getString("saida") %></td>
                <td><%= rs.getString("status") %></td>
                <td>
                    <form method="post" action="deleteFunc.jsp" onsubmit="return confirm('Deseja deletar este funcionário?')">
                    <input type="hidden" name="id" value="<%= rs.getInt("vaga_id") %>" />
                    <button type="submit">Deletar</button>
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
            <a href="../../entVeiculo/index.html" class="addVeic">Adicionar Veículo</a>
        </div>
      </main>
    </div>
  </body>
</html>
