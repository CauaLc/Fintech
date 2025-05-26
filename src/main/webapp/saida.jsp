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
      border: 0;
      background: transparent;
      text-align: center;
    }

    .icon-btn {
      width: 50px;
      height: 50px;
      font-size: 1.5rem;
    }

    .icon-btn.selected {
      background-color: #0d6efd; /* azul bootstrap */
      border-color: #0d6efd;
    }


    .btn-selected {
      background-color: #a8430d !important;
      color: white !important;
    }

    .btn-categoria.selecionado {
      background-color: #ADD8E6 !important;
      color: #000 !important;
      border-color: #ADD8E6 !important;
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
<form action="./saida" method="post">

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
        <button type="button" class="btn btn-light icon-btn d-flex align-items-center w-100 btn-categoria" onclick="document.getElementById('categoria').value='SAUDE'"><i class="bi bi-clock me-2"></i>Saúde</button>
        <button type="button" class="btn btn-light icon-btn d-flex align-items-center w-100 m-2 btn-categoria" onclick="document.getElementById('categoria').value='SERVICOS'"><i class="bi bi-file-earmark-text me-2"></i>Serviços</button>
        <button type="button" class="btn btn-light icon-btn d-flex align-items-center w-100 btn-categoria" onclick="document.getElementById('categoria').value='TRANSPORTE'"><i class="bi bi-bus-front me-2"></i>Transporte</button>
        <button type="button" class="btn btn-light icon-btn d-flex align-items-center w-100 btn-categoria" onclick="document.getElementById('categoria').value='ALIMENTACAO'"><i class="bi bi-receipt me-2"></i>Alimentação </button>
        <button type="button" class="btn btn-light icon-btn d-flex align-items-center w-100 btn-categoria" onclick="document.getElementById('categoria').value='MERCADO'"><i class="bi bi-apple me-2"></i>Mercado</button>
        <button type="button" class="btn btn-light icon-btn d-flex align-items-center w-100 btn-categoria" onclick="document.getElementById('categoria').value='LAZER'"><i class="bi bi-camera-video me-2"></i>Lazer</button>
        <button type="button" class="btn btn-light icon-btn d-flex align-items-center w-100 btn-categoria" onclick="document.getElementById('categoria').value='TECNOLOGIA'"><i class="bi bi-laptop me-2"></i>Tecnologia</button>
        <button type="button" class="btn btn-light icon-btn d-flex align-items-center w-100 btn-categoria" onclick="document.getElementById('categoria').value='OUTROS'"><i class="bi bi-plus-lg me-2"></i>Outros</button>
      </div>

      <input type="hidden" name="categoria" id="categoria" value="ALIMENTACAO" />


      <h5 class="mt-4">Data</h5>
      <input type="date" name="data" class="form-control mb-3" />

      <h5>Cartão</h5>
      <select name="tipoCartao" class="form-control mb-3">
        <option value="CREDITO">Crédito</option>
        <option value="DEBITO" selected>Débito</option>
      </select>

      <h5>Descrição</h5>
      <input type="text" name="descricao" class="form-control mb-3" placeholder="Escreva a descrição aqui" />

      <input type="hidden" name="idUsuario" value="<%= usuario.getId() %>" />

      <div class="d-grid">
        <button type="submit" class="btn btn-primary">Salvar Transação</button>
      </div>
    </div>
  </div>
  </form>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
  // Seleciona todos os botões com a classe categoria-btn
  const botoesCategoria = document.querySelectorAll('.categoria-btn');

  botoesCategoria.forEach(botao => {
    botao.addEventListener('click', () => {
      // Remove a classe 'selecionado' de todos os botões
      botoesCategoria.forEach(b => b.classList.remove('selecionado'));

      // Adiciona a classe apenas no botão clicado
      botao.classList.add('selecionado');
    });
  });
</script>


<script>
  const botoesCategoria = document.querySelectorAll('.btn-categoria');

  botoesCategoria.forEach(botao => {
    botao.addEventListener('click', () => {
      botoesCategoria.forEach(b => b.classList.remove('selecionado'));
      botao.classList.add('selecionado');
    });
  });
</script>
</body>
</html>
