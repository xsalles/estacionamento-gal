<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title></title>
    <link rel="stylesheet" href="styles.css" />
    <link rel="stylesheet" href="../../../styles/global.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Nunito+Sans:ital,opsz,wght@0,6..12,200..1000;1,6..12,200..1000&display=swap"
      rel="stylesheet"
    />
  </head>

  <body>
    <header>
      <h4>Sistema de Estacionamento</h4>
    </header>
    <h1>Cadastro de funcion�rios</h1>
    <main>
      <form>
        <div>
          <p>Tempo total</p>
          <p>1 dia e 20 horas</p>
        </div>
        <div>
          <p>Valor total</p>
          <p>R$ 50,00</p>
        </div>
        <div>
          <label for="entrada">Entrada</label>
          <select id="formPagamento" name="forma_pagamento">
            <option value="Pix">Pix</option>
            <option value="Cart�o de cr�dito">Cart�o de cr�dito</option>
            <option value="Cart�o de d�bito">Cart�o de d�bito</option>
            <option value="Dinheiro">Dinheiro</option>
          </select>
        </div>
          <a href="../dashboard/carros/index.jsp"> Cadastrar sa�da do ve�culo </a>
      </form>
    </main>
  </body>
</html>
