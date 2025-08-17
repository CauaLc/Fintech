# 💰 Fintech - Gestão Financeira Pessoal

Este projeto é uma aplicação **Java Web** desenvolvida para auxiliar no controle financeiro pessoal, permitindo que o usuário registre suas receitas e despesas, acompanhe seu histórico de transações e visualize relatórios em um dashboard intuitivo.

## 🚀 Funcionalidades
- Cadastro e autenticação de usuários.
- Registro de entradas (receitas) e saídas (despesas).
- Histórico de transações financeiras.
- Visualização de saldo e estatísticas no dashboard.
- Gerenciamento de perfil do usuário.

## 🛠️ Tecnologias Utilizadas
- **Java 11+**
- **Servlets & JSP (Jakarta EE)**
- **Maven**
- **DAO Pattern** para acesso ao banco de dados.
- **JDBC** para persistência.
- **HTML, CSS, JSP** no frontend.

## 📂 Estrutura do Projeto
- `model/` → Classes de domínio (Usuário, Transações, Entradas, Saídas).  
- `dao/` → Camada de acesso a dados (DAO e ConnectionManager).  
- `controller/` → Servlets que tratam as requisições.  
- `webapp/` → JSPs para interface do usuário (login, cadastro, dashboard, etc).

## ▶️ Como Executar
1. Clonar o repositório:
   ```bash
   git clone https://github.com/seuusuario/fintech.git
Importar o projeto em uma IDE (Eclipse/IntelliJ) como Maven Project.

Configurar o servidor (ex.: Apache Tomcat 9).

Criar o banco de dados conforme as tabelas de Usuario, Transacao, Entrada, Saida.

Rodar o projeto no servidor e acessar em:

bash
Copiar
Editar
http://localhost:8080/fintech
📊 Demonstração das Telas
index.jsp → Tela inicial.

login.jsp → Login do usuário.

cadastro.jsp → Cadastro de novos usuários.

dashboard.jsp → Resumo financeiro.

entrada.jsp / saida.jsp → Lançamento de receitas e despesas.

historico.jsp → Histórico de transações.
