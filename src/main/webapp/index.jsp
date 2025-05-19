<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Controle Financeiro</title>
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
            text-align: center;
        }
        .title-gray {
            color: #6c757d;
            font-size: 1.5rem;
        }
        .text-controlar {
            color: #f25c3b;
            font-weight: bold;
        }
        .text-gastos {
            color: #944f00;
            font-weight: bold;
        }
        .text-objetivos {
            color: #64d2e6;
            font-weight: bold;
        }
        .icons img {
            width: 40px;
            margin: 10px;
        }
        .btn-google {
            background-color: #f5f5f5;
            border: 1px solid #ddd;
            color: #000;
        }
        .btn-email {
            background-color: #64d2e6;
            color: #fff;
        }
        .btn-email:hover {
            background-color: #53c0d3;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="card p-4 shadow-sm">
        <p class="title-gray mb-1">Comece a <span class="text-controlar">Controlar</span></p>
        <p class="mb-3 title-gray">o seus <span class="text-gastos">Gastos</span></p>
        <p class="title-gray mb-1">Alcance seus <span class="text-objetivos">Objetivos</span></p>

        <div class="icons my-4">
            <img src="./resources/img/casa.png" alt="Casa">
            <img src="./resources/img/bolo.png" alt="Bolo">
            <img src="./resources/img/briefcase.png" alt="Viagem">
        </div>

        <div class="d-grid gap-2">
            <a href="#" class="btn btn-google">
                <img src="https://developers.google.com/identity/images/g-logo.png" width="20" class="me-2">Continuar com Google
            </a>
            <a href="login.jsp" class="btn btn-email">
                <img src="https://img.icons8.com/ios-filled/50/ffffff/new-post.png" width="20" class="me-2">Continuar com email
            </a>
        </div>
    </div>
</div>
</body>
</html>