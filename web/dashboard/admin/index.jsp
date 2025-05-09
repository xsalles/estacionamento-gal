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
          <a href="../carros/index.html">
            <img
              class="icon"
              src="../../assets/cars.svg"
              alt="Gerenciar carros do estacionamento"
            />
          </a>
          <a href="index.html">
            <img
              class="icon"
              src="../../assets/profile.svg"
              alt="Gerenciar funcionários"
            />
          </a>
          <a href="">
            <img
              class="icon"
              src="../../assets/settings.svg"
              alt="Tela de configurações"
            />
          </a>
          <a href="">
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
              <tr>
                <td>1</td>
                <td>Pedro</td>
                <td>example@example.com</td>
                <td>
                  <button>Deletar</button>
                </td>
              </tr>
            </tbody>
          </table>
          <a href="../cadFuncionario/index.html" class="addFunc">Adicionar funcionário</a>
        </div>
      </main>
    </div>
  </body>
</html>