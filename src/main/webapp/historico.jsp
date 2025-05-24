<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.util.Comparator" %>

<%@ page import="br.com.fintech.projetofintech.model.Transacao" %>
<%@ page import="br.com.fintech.projetofintech.model.Usuario" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
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

    List<Transacao> transacoes = (List<Transacao>) request.getAttribute("transacoes");
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

    if (transacoes != null) {
        Collections.sort(transacoes, new Comparator<Transacao>() {
            public int compare(Transacao t1, Transacao t2) {
                if (t1.getDataTransacao() == null) return 1;
                if (t2.getDataTransacao() == null) return -1;
                return t2.getDataTransacao().compareTo(t1.getDataTransacao());
            }
        });
    }
%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Histórico de Transações</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .card-transacao {
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            margin-bottom: 1rem;
            padding: 1rem;
            transition: transform 0.2s ease-in-out;
        }

        .card-transacao:hover {
            transform: scale(1.01);
        }

        .entrada {
            border-left: 6px solid #28a745;
        }

        .saida {
            border-left: 6px solid #dc3545;
        }

        .botao-voltar {
            margin-bottom: 2rem;
        }

        body {
            background-color: #f8f9fa;
        }

        h2 {
            font-weight: bold;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <a href="<%= "./dashboard?idUsuario=" + usuario.getId() %>" class="btn btn-secondary botao-voltar">← Voltar para Dashboard</a>
    <h2 class="mb-4">Histórico de Transações</h2>

    <% if (transacoes != null && !transacoes.isEmpty()) {
        for (Transacao t : transacoes) {
            String tipo = t.getTipoTransacao();
            String cssClass = "card-transacao " + ("entrada".equalsIgnoreCase(tipo) ? "entrada" : "saida");
    %>
    <div class="<%= cssClass %>">
        <h5><strong><%= t.getNomeTransacao() %></strong></h5>
        <p><strong>Valor:</strong> R$ <%= String.format("%.2f", t.getValor()) %></p>
        <%
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        %>
        <p><strong>Data:</strong> <%= t.getDataTransacao() != null ? t.getDataTransacao().format(formatter) : "Não informada" %></p>
        <p><strong>Categoria:</strong> <%= t.getCategoria() %></p>
        <p><strong>Tipo:</strong> <%= tipo.toUpperCase() %></p>
    </div>
    <%  }
    } else { %>
    <div class="alert alert-warning" role="alert">
        Nenhuma transação registrada.
    </div>
    <% } %>
</div>
</body>
</html>









