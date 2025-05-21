<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <title>Cadastro</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
      background-color: #ffffff;
      font-family: Arial, sans-serif;
    }
    .card {
      border: none;
      padding: 2rem;
      max-width: 400px;
      width: 100%;
      box-shadow: 0 0 20px rgba(0,0,0,0.05);
    }
    .form-title {
      font-size: 1.5rem;
      font-weight: bold;
      margin-bottom: 1rem;
    }
    .btn-cadastrar {
      background-color: #007bff;
      color: white;
    }
    .btn-cadastrar:hover {
      background-color: #0069d9;
    }
  </style>
</head>
<body>
<div class="container">
  <div class="card mx-auto">
    <h2 class="form-title text-center">Crie sua conta</h2>

    <% String erro = (String) request.getAttribute("erroCadastro"); %>
    <% if (erro != null) { %>
    <div class="alert alert-danger text-center" role="alert">
      <%= erro %>
    </div>
    <% } %>

    <form action="cadastro" method="post">
      <div class="mb-3">
        <input type="text" class="form-control" name="nome" placeholder="Nome" required>
      </div>
      <div class="mb-3">
        <input type="text" class="form-control" name="sobrenome" placeholder="Sobrenome" required>
      </div>
      <div class="mb-3">
        <input type="date" class="form-control" name="dataNascimento" required>
      </div>
      <div class="mb-3">
        <input type="email" class="form-control" name="email" placeholder="Email" required>
      </div>
      <div class="mb-3">
        <input type="password" class="form-control" name="senha" placeholder="Senha" required>
      </div>
      <div class="mb-3">
        <input type="password" class="form-control" name="confirmarSenha" placeholder="Confirmar Senha" required>
      </div>
      <div class="d-grid">
        <button type="submit" class="btn btn-cadastrar">Cadastrar</button>
      </div>
    </form>
    <div class="text-center mt-3">
      <a href="index.jsp" class="text-decoration-none text-secondary">Voltar à tela inicial</a>
    </div>
  </div>
</div>
</body>
</html>


