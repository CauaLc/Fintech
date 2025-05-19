<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <title>Cadastrar Transação</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
  <style>
    body {
      font-family: 'Segoe UI', sans-serif;
      background-color: #ffffff;
    }

    .header {
      background-color: #FF8C42;
      color: white;
      padding: 1rem;
      border-bottom-left-radius: 20px;
      border-bottom-right-radius: 20px;
    }

    .valor-gasto {
      font-size: 1.25rem;
    }

    .valor {
      font-size: 2rem;
      font-weight: bold;
    }

    .icon-btn {
      width: 50px;
      height: 50px;
      font-size: 1.5rem;
    }

    .btn-selected {
      background-color: #a8430d !important;
      color: white !important;
    }

    .category-grid {
      display: grid;
      grid-template-columns: repeat(4, 1fr);
      gap: 0.5rem;
      margin-top: 1rem;
    }

    .form-section {
      margin: 1.5rem;
    }

    .btn-toggle {
      min-width: 70px;
    }

    .form-control::placeholder {
      color: #aaa;
    }

    .icon-btn img {
      max-width: 100%;
      max-height: 100%;
    }
  </style>
</head>
<body>

<div class="container-fluid px-3 px-md-5">
  <div class="header text-center">
    <div class="d-flex justify-content-start">
      <a href="dashboard.jsp" class="text-white text-decoration-none">
        <i class="bi bi-arrow-left"></i> Cadastrar Transação
      </a>
    </div>
    <div class="mt-3 valor-gasto">Valor gasto:</div>
    <div class="valor">R$ 100,00</div>
  </div>

  <div class="form-section">
    <h5 class="mb-2">Categorias</h5>
    <div class="category-grid">
      <button class="btn btn-light icon-btn btn-selected"><i class="bi bi-clock"></i></button>
      <button class="btn btn-light icon-btn btn-selected"><i class="bi bi-file-earmark-text"></i></button>
      <button class="btn btn-light icon-btn btn-selected"><i class="bi bi-bus-front"></i></button>
      <button class="btn btn-light icon-btn btn-selected"><i class="bi bi-receipt"></i></button>
      <button class="btn btn-light icon-btn btn-selected"><i class="bi bi-apple"></i></button>
      <button class="btn btn-light icon-btn btn-selected"><i class="bi bi-camera-video"></i></button>
      <button class="btn btn-light icon-btn btn-selected"><i class="bi bi-laptop"></i></button>
      <button class="btn btn-light icon-btn btn-selected"><i class="bi bi-plus-lg"></i></button>
    </div>

    <h5 class="mt-4">Data</h5>
    <div class="btn-group mb-3" role="group">
      <button type="button" class="btn btn-toggle btn-outline-secondary">Hoje</button>
      <button type="button" class="btn btn-toggle btn-outline-secondary">Ontem</button>
      <button type="button" class="btn btn-toggle btn-outline-secondary">
        <i class="bi bi-calendar"></i>
      </button>
    </div>

    <h5>Cartão</h5>
    <div class="btn-group mb-3" role="group">
      <button type="button" class="btn btn-toggle btn-outline-secondary">Crédito</button>
      <button type="button" class="btn btn-toggle btn-selected">Débito</button>
    </div>

    <h5>Descrição</h5>
    <input type="text" class="form-control" placeholder="Escreva a descrição aqui">
  </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
</body>
</html>

