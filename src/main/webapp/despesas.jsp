<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="br.com.fintech.projetofintech.model.Usuario" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="br.com.fintech.projetofintech.model.Transacao" %>
<%@ page import="java.time.ZoneId" %>
<%@ page import="java.util.*" %>
<%
  Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");
  if (usuario == null) {
    response.sendRedirect("login.jsp");
    return;
  }

  List<Transacao> transacoes = (List<Transacao>) request.getAttribute("transacoes");

  // Parâmetros de filtro
  String tipoTransacao = request.getParameter("tipo");
  if (tipoTransacao == null) {
    tipoTransacao = "SAIDA"; // valor padrão
  }

  String mesFiltro = request.getParameter("mes");
  boolean filtrarMesAtual = "atual".equals(mesFiltro);

  // Obter mês atual para exibição
  Calendar cal = Calendar.getInstance();
  String mesAtual = new SimpleDateFormat("MMMM").format(cal.getTime()).toLowerCase();
  mesAtual = mesAtual.substring(0, 1).toUpperCase() + mesAtual.substring(1);

  Map<String, Integer> contagemPorCategoria = new HashMap<>();
  int totalTransacoesMes = 0;

  for (Transacao t : transacoes) {
    if (t.getTipoTransacao().equals(tipoTransacao)) {
      // Verificar filtro por mês atual
      if (filtrarMesAtual) {
        Calendar calTransacao = Calendar.getInstance();
        calTransacao.setTime(Date.from(t.getDataTransacao().atStartOfDay(ZoneId.systemDefault()).toInstant()));

        if (calTransacao.get(Calendar.MONTH) != cal.get(Calendar.MONTH) ||
                calTransacao.get(Calendar.YEAR) != cal.get(Calendar.YEAR)) {
          continue;
        }
      }

      String categoria = t.getCategoria();
      if (categoria != null && !categoria.isEmpty()) {
        contagemPorCategoria.put(categoria,
                contagemPorCategoria.getOrDefault(categoria, 0) + 1);
        totalTransacoesMes++;
      }
    }
  }
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title><%= "ENTRADA".equals(tipoTransacao) ? "Receitas" : "Despesas" %></title>
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
    &lt; <%= mesAtual %> &gt;
  </small>
  <div class="mt-2">
    <a href="<%= "./despesas?idUsuario=" + usuario.getId() +"&tipo=SAIDA" %>" class="text-decoration-none <%= "SAIDA".equals(tipoTransacao) ? "active-tab" : "text-dark" %> mx-2">Despesas</a>
    <a href="<%= "./despesas?idUsuario=" + usuario.getId() +"&tipo=ENTRADA" %>" class="text-decoration-none <%= "ENTRADA".equals(tipoTransacao) ? "active-tab" : "text-dark" %> mx-2">Receitas</a>
  </div>
</div>

<div class="container py-4">
  <div class="text-start text-muted mb-2">
    <small><%= "ENTRADA".equals(tipoTransacao) ? "Receitas" : "Despesas" %> de <strong><%= mesAtual %></strong></small>
  </div>

  <% if (totalTransacoesMes > 0) { %>
  <div class="chart-wrapper mx-auto mb-3">
    <canvas id="donutChart"></canvas>
  </div>

  <div class="bg-white p-3 rounded shadow-sm">
    <small class="text-muted d-block mb-2">Categorias das <strong><%= "ENTRADA".equals(tipoTransacao) ? "Receitas" : "Despesas" %></strong></small>
    <%
      int corIndex = 0;
      String[] cores = {"#A34400", "#00E9C6", "#89FFF9", "#FFDD57", "#FF6384", "#36A2EB", "#4BC0C0", "#FF9F40"};
    %>
    <% for (Map.Entry<String, Integer> entry : contagemPorCategoria.entrySet()) {
      String categoria = entry.getKey();
      int quantidade = entry.getValue();
      double porcentagem = (quantidade * 100.0) / totalTransacoesMes;
      String cor = cores[corIndex % cores.length];
      corIndex++;
    %>
    <div class="d-flex align-items-center mb-2">
      <div class="me-2" style="width: 12px; height: 12px; background-color: <%= cor %>; border-radius: 50%;"></div>
      <div class="flex-grow-1">
        <%= categoria.substring(0,1).toUpperCase() + categoria.substring(1).toLowerCase() %>
      </div>
      <div class="fw-bold"><%= String.format("%.1f", porcentagem) %>%</div>
    </div>
    <% } %>
  </div>
  <% } else { %>
  <div class="alert alert-info text-center">
    Nenhuma <%= "ENTRADA".equals(tipoTransacao) ? "receita" : "despesa" %> encontrada para <%= mesAtual %>.
  </div>
  <% } %>
</div>

<div class="footer d-flex justify-content-around py-2">
  <a href="<%= "./dashboard?idUsuario=" + usuario.getId() %>"><i class="bi bi-house-door text-decoration-none text-dark fs-5 "></i><br></a>
  <a href="<%= "./historico?idUsuario=" + usuario.getId() %>"><span>
      <i class="bi bi-arrow-up-short text-decoration-none text-dark"></i>
      <i class="bi bi-arrow-down-short text-decoration-none text-dark"></i>
    </span></a>
  <a href="perfil.jsp"><i class="bi bi-person icons text-decoration-none text-dark fs-5"></i><br></a>
</div>

<% if (totalTransacoesMes > 0) { %>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
  const labels = [
    <% for (String categoria : contagemPorCategoria.keySet()) { %>
    "<%= categoria %>",
    <% } %>
  ];

  const data = [
    <% for (Integer valor : contagemPorCategoria.values()) { %>
    <%= valor %>,
    <% } %>
  ];

  const cores = ['#A34400', '#00E9C6', '#89FFF9', '#FFDD57', '#FF6384', '#36A2EB', '#4BC0C0', '#FF9F40'];

  const ctx = document.getElementById('donutChart').getContext('2d');
  new Chart(ctx, {
    type: 'doughnut',
    data: {
      labels: labels,
      datasets: [{
        data: data,
        backgroundColor: cores.slice(0, labels.length),
        borderWidth: 3
      }]
    },
    options: {
      cutout: '60%',
      maintainAspectRatio: false,
      plugins: {
        legend: {
          display: false
        }
      }
    }
  });
</script>
<% } %>

</body>
</html>