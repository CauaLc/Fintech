<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login - Controle Financeiro</title>
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
      color: #f25c3b;
    }
    .form-label {
      color: #6c757d;
      font-weight: 500;
    }
    .btn-login {
      background-color: #64d2e6;
      color: white;
    }
    .btn-login:hover {
      background-color: #53c0d3;
    }
  </style>
</head>
<body>
<div class="container">
  <div class="card mx-auto">
    <h2 class="form-title text-center">Fazer Login</h2>
    <% String erro = (String) request.getAttribute("erroLogin"); %>
    <% if (erro != null) { %>
    <div class="alert alert-danger text-center" role="alert">
      <%= erro %>
    </div>
    <% } %>

    <form action="./login" method="post">
      <div class="mb-3">
        <label for="email" class="form-label">Email</label>
        <input type="email" class="form-control" id="email" name="email" required>
      </div>
      <div class="mb-3">
        <label for="senha" class="form-label">Senha</label>
        <input type="password" class="form-control" id="senha" name="senha" required>
      </div>
      <div class="d-grid">
        <button type="submit" class="btn btn-login">Entrar</button>
      </div>
    </form>
    <div class="text-center mt-3">
      <a href="index.jsp" class="text-decoration-none text-secondary">Voltar à tela inicial</a>
    </div>
  </div>
</div>
</body>
</html>
</html>
