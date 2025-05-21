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
  <title>Perfil do Usuário</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
  <style>
    body {
      background-color: #f5f6fa;
    }
    .card-perfil {
      border-radius: 20px;
      box-shadow: 0 4px 10px rgba(0,0,0,0.1);
    }
    .avatar {
      width: 100px;
      height: 100px;
      object-fit: cover;
      border-radius: 50%;
      border: 3px solid #fff;
      margin-top: -50px;
    }
    .btn-edit {
      border-radius: 30px;
    }
  </style>
</head>
<body>

<div class="container py-5">
  <div class="row justify-content-center">
    <div class="col-md-6">

      <div class="card card-perfil text-center p-4">
        <div class="bg-primary rounded-top" style="height: 100px;"></div>
        <img src="./resources/img/usuario.png" class="avatar mx-auto shadow" alt="Avatar">
        <div class="card-body mt-3">
          <h4 class="card-title"><%= nomeCompleto %></h4>
          <p class="text-muted mb-1"><%= email %></p>
          <p class="text-muted">Conta criada em: <%= dataCriacao %></p>

          <hr>

          <div class="d-grid gap-2 col-10 mx-auto">
            <a href="dashboard.jsp" class="btn btn-outline-secondary btn-edit"><i class="bi bi-arrow-left-circle me-2"></i>Voltar</a>
            <a href="login.jsp" class="btn btn-danger btn-edit"><i class="bi bi-box-arrow-right me-2"></i>Sair</a>
          </div>
        </div>
      </div>

    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>


