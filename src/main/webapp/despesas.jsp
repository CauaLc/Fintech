<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<html>
<head>
  <meta charset="UTF-8">
  <title>Despesas</title>


  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">



  <style>
    body {
      background-color: #f8f9fa;
      font-family: 'Segoe UI', sans-serif;
    }

    .active-tab {
      color: #A34400;
      font-weight: bold;
      text-decoration: underline;
    }

    .chart-wrapper {
      max-width: 250px;
    }

    canvas {
      width: 100% !important;
      height: auto !important;
    }


    .nav-icons {
      font-size: 1.4rem;
    }

    .footer-icon {
      font-size: 1.2rem;
    }

    a{
      text-decoration: none;
    }

    .footer {
      position: fixed;
      bottom: 0;
      left: 0;
      width: 100%;
      background-color: white;
      border-top: 1px solid #ccc;
    }
  </style>
</head>
<body>


<div class="text-center py-2 bg-white border-bottom">
  <small>
    &lt; Setembro <span class="fw-bold text-warning">Outubro</span> Novembro &gt;
  </small>
  <div class="mt-2">
    <a href="#" class="text-decoration-none text-dark mx-2">Balanço</a>
    <a href="#" class="text-decoration-none active-tab mx-2">Despesas</a>
    <a href="#" class="text-decoration-none text-dark mx-2">Receitas</a>
  </div>
</div>


<div class="container py-4">


  <div class="text-start text-muted mb-2">
    <small>Despesas de <strong>outubro</strong></small>
  </div>


  <div class="chart-wrapper mx-auto mb-3">
    <canvas id="donutChart"></canvas>
  </div>


  <div class="d-flex justify-content-center flex-wrap gap-3 text-muted small mb-4">
    <div class="d-flex align-items-center">
      <div class="me-1" style="width: 10px; height: 10px; background-color: #A34400;"></div> Aluguel
    </div>
    <div class="d-flex align-items-center">
      <div class="me-1" style="width: 10px; height: 10px; background-color: #00E9C6;"></div> Conta Luz
    </div>
    <div class="d-flex align-items-center">
      <div class="me-1" style="width: 10px; height: 10px; background-color: #89FFF9;"></div> Conta Água
    </div>
  </div>


  <div class="bg-white p-3 rounded shadow-sm">
    <small class="text-muted d-block mb-2">Categorias dos <strong>Gastos</strong></small>
    <div class="d-flex align-items-center">
      <div class="me-2">
        <i class="bi bi-house-door"></i>
      </div>
      <div class="flex-grow-1">
        Gastos com moradia
      </div>
      <div class="fw-bold">100%</div>
    </div>
  </div>
</div>


<div class="footer d-flex justify-content-around py-2">
  <a href="<%= "./dashboard?idUsuario=" + usuario.getId() %>"><i class="bi bi-house-door text-decoration-none text-dark fs-5 "></i><br></a>
  <a href="<%= "./historico?idUsuario=" + usuario.getId() %>"<span>
      <i class="bi bi-arrow-up-short text-decoration-none text-dark"></i>
      <i class="bi bi-arrow-down-short text-decoration-none text-dark"></i>
    </span></a>
  <a href="perfil.jsp"><i class="bi bi-person icons text-decoration-none text-dark fs-5"></i><br></a>
</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
  const ctx = document.getElementById('donutChart').getContext('2d');
  new Chart(ctx, {
    type: 'doughnut',
    data: {
      labels: ['Aluguel', 'Conta Luz', 'Conta Água'],
      datasets: [{
        data: [50, 30, 20],
        backgroundColor: ['#A34400', '#00E9C6', '#89FFF9'],
        borderWidth: 0
      }]
    },
    options: {
      cutout: '70%',
      plugins: {
        legend: {
          display: false
        }
      }
    }
  });
</script>
</body>
</html>


