<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="br.com.fintech.projetofintech.model.Usuario" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
  Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");
  if (usuario == null) {
    response.sendRedirect("login.jsp");
    return;
  }
  String nomeCompleto = usuario.getNome() + " " + usuario.getSobrenome();
  String email = usuario.getEmail();
  String dataCriacao = new SimpleDateFormat("dd/MM/yyyy").format(usuario.getDataNascimento());
%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <title>Cadastrar Entrada</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
  <style>
    body {
      font-family: 'Segoe UI', sans-serif;
      background-color: #ffffff;
    }

    .header {
      background-color: #73d6f2;
      color: white;
      padding: 1rem;
      border-bottom-left-radius: 20px;
      border-bottom-right-radius: 20px;
    }

    .valor-recebido {
      font-size: 1.25rem;
    }

    .valor {
      font-size: 2rem;
      font-weight: bold;
      border: 0;
      background: transparent;
      text-align: center;
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
      grid-template-columns: repeat(3, 1fr);
      gap: 0.5rem;
      margin-top: 1rem;
    }

    .btn-check:checked + .btn-categoria {
      background-color: #a8430d;
      color: white;
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

  </style>
</head>
<body>

<form method="post" action="./entrada">
  <input type="hidden" name="idUsuario" value=<%= usuario.getId()%> />
  <div class="container-fluid px-3 px-md-5">
    <div class="header text-center">
      <div class="d-flex justify-content-start">
        <a href="<%= "./dashboard?idUsuario=" + usuario.getId() %>" class="text-white text-decoration-none">
          <i class="bi bi-arrow-left"></i> Voltar
        </a>
      </div>
      <div class="mt-3 valor-recebido">Valor recebido:</div>
      <input type="text" name="valor" class="valor form-control text-center" placeholder="2.000,00" required />
    </div>

    <div class="form-section">
      <h5 class="mb-2">Categorias</h5>
      <div class="category-grid">
        <input type="radio" class="btn-check" name="categoria" id="cat1" value="SALARIO" autocomplete="off" checked>
        <label class="btn btn-light icon-btn btn-categoria" for="cat1"><i class="bi bi-wallet2"></i></label>

        <input type="radio" class="btn-check" name="categoria" id="cat2" value="INVESTIMENTO" autocomplete="off">
        <label class="btn btn-light icon-btn btn-categoria" for="cat2"><i class="bi bi-piggy-bank"></i></label>

        <input type="radio" class="btn-check" name="categoria" id="cat3" value="OUTROS" autocomplete="off">
        <label class="btn btn-light icon-btn btn-categoria" for="cat3"><i class="bi bi-plus-lg"></i></label>
      </div>

      <h5 class="mt-4">Data</h5>
      <input type="date" name="data" class="form-control mb-3" required />

      <h5>Tipo</h5>
      <div class="mb-3">
        <select class="form-select" name="tipo" required>
          <option value="PRESENTE" selected>Receita</option>
          <option value="INVESTIMENTO">Transferência</option>
          <option value="SALARIO">Salário</option>
          <option value="OUTROS">Outros</option>
        </select>
      </div>

      <h5>Descrição</h5>
      <input type="text" class="form-control" name="descricao" placeholder="Escreva a descrição aqui" required>

      <div class="mt-4 text-center">
        <button type="submit" class="btn btn-primary">Cadastrar</button>
      </div>
    </div>
  </div>
</form>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
