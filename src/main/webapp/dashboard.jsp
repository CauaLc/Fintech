<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <title>Dashboard</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Bootstrap -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

  <style>
    body {
      background-color: #f4f4f4;
      font-family: 'Segoe UI', sans-serif;
    }
    .card-saldo {
      background-color: white;
      border-radius: 15px;
      padding: 20px;
      margin-bottom: 20px;
      box-shadow: 0px 0px 10px rgba(0,0,0,0.05);
    }
    .card-banco {
      border-radius: 15px;
      padding: 20px;
      color: white;
      width: 150px;
      height: 120px;
      margin-right: 15px;
    }
    .nubank {
      background-color: #6edbf4;
    }
    .inter {
      background-color: #ff6b4d;
    }
    .itau {
      background-color: #8a4f00;
    }
    .card-transacoes {
      background-color: white;
      border-radius: 15px;
      padding: 20px;
      box-shadow: 0px 0px 10px rgba(0,0,0,0.05);
    }
    .footer-nav {
      position: fixed;
      bottom: 0;
      width: 100%;
      background-color: #ffffff;
      border-top: 1px solid #dee2e6;
      display: flex;
      justify-content: space-around;
      align-items: center;
      padding: 10px 0;
      z-index: 1000;
    }

    .footer-nav a {
      text-decoration: none;
      color: #6c757d;
      font-size: 14px;
      text-align: center;
    }

    .footer-nav .add {
      background-color: #0d6efd;
      color: #fff;
      font-size: 24px;
      width: 50px;
      height: 50px;
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      margin-top: -30px;
      box-shadow: 0 4px 8px rgba(0,0,0,0.2);
      border: none;
    }

    /* Modal flutuante */
    .modal-fundo {
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background-color: rgba(0, 0, 0, 0.6);
      z-index: 1050;
      display: none;
      align-items: flex-end;
      justify-content: center;
    }

    .modal-card {
      background-color: #fff;
      width: 100%;
      max-width: 500px;
      border-radius: 20px 20px 0 0;
      padding: 20px;
      animation: slideUp 0.3s ease;
    }

    .barra-modal {
      width: 40px;
      height: 4px;
      background-color: #ccc;
      border-radius: 10px;
      margin: 0 auto 15px;
    }

    @keyframes slideUp {
      from {
        transform: translateY(100%);
      }
      to {
        transform: translateY(0);
      }
    }
  </style>


</head>
<body>
<%--<%@ page import="br.com.fintech.projetofintech.model.Usuario" %>
<%
  Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");
  if (usuario == null) {
    response.sendRedirect("login.jsp");
    return;
  }
%>

<h4>Bem-vindo, <%= usuario.getNome() %>!</h4>--%>


<div class="container mt-4">


  <div class="card-saldo text-center">
    <h6 class="text-muted">Outubro <i class="bi bi-chevron-down"></i></h6>
    <h4><strong>Saldo: R$ 2.000,00</strong></h4>
    <div class="d-flex justify-content-around mt-3">
      <div class="text-success">
        <i class="bi bi-arrow-up-circle-fill"></i><br>
        Entrada: <strong>R$ 4.000,00</strong>
      </div>
      <div class="text-danger">
        <i class="bi bi-arrow-down-circle-fill"></i><br>
        Saída: <strong>R$ 2.000,00</strong>
      </div>
    </div>
  </div>


  <div class="d-flex overflow-auto mb-3 px-1">
    <div class="card-banco nubank">
      <p class="mb-1">Nubank</p>
      <small>Gasto: <strong>R$1.000,00</strong></small><br>
      <small>**** 5843</small>
    </div>
    <div class="card-banco inter">
      <p class="mb-1">Inter</p>
      <small>Gasto: <strong>R$1.000,00</strong></small><br>
      <small>**** 5843</small>
    </div>
    <div class="card-banco itau">
      <p class="mb-1">Itaú</p>
      <small>Gasto: <strong>R$1.000,00</strong></small><br>
      <small>**** 5843</small>
    </div>
  </div>

  <!-- Transações Recentes -->
  <div class="card-transacoes">
    <h6><strong>Recentes</strong></h6>
    <ul class="list-group list-group-flush mt-3">
      <li class="list-group-item d-flex justify-content-between align-items-center px-0">
        <div><i class="bi bi-house-door"></i> Aluguel</div>
        <span><strong>R$ 1.000,00</strong></span>
      </li>
      <li class="list-group-item d-flex justify-content-between align-items-center px-0">
        <div><i class="bi bi-lightbulb"></i> Conta de Luz</div>
        <span><strong>R$ 200,00</strong></span>
      </li>
      <li class="list-group-item d-flex justify-content-between align-items-center px-0">
        <div><i class="bi bi-droplet"></i> Conta de Água</div>
        <span><strong>R$ 100,00</strong></span>
      </li>
    </ul>
  </div>

</div>

<div class="footer-nav">
  <a href="#"><i class="bi bi-house-door"></i><br>Início</a>
  <a href="#"><i class="bi bi-currency-dollar"></i><br>Carteira</a>
  <button class="add" id="abrirModal"><i class="bi bi-plus"></i></button>
  <a href="despesas.jsp"><i class="bi bi-pie-chart"></i><br>Despesas</a>
  <a href="perfil.jsp"><i class="bi bi-person"></i><br>Perfil</a>
</div>


<div id="modalCadastro" class="modal-fundo">
  <div class="modal-card text-center">
    <div class="barra-modal"></div>
    <p class="mb-3">Escolha o que vai cadastrar</p>
    <a href="entrada.jsp" class="btn btn-success w-100 mb-2"><i class="bi bi-plus-circle"></i> Entrada</a>
    <a href="saida.jsp" class="btn btn-danger w-100"><i class="bi bi-dash-circle"></i> Saída</a>
  </div>
</div>


<script src="js/bootstrap.bundle.min.js"></script>


<script>
  const modal = document.getElementById("modalCadastro");
  const abrirModal = document.getElementById("abrirModal");

  abrirModal.addEventListener("click", () => {
    modal.style.display = "flex";
  });

  modal.addEventListener("click", (e) => {
    if (e.target === modal) {
      modal.style.display = "none";
    }
  });
</script>

</body>
</html>

