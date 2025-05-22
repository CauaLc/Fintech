package br.com.fintech.projetofintech.controller;

import br.com.fintech.projetofintech.dao.UsuarioDAO;
import br.com.fintech.projetofintech.model.Usuario;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.text.SimpleDateFormat;

@WebServlet("/cadastro")
public class CadastroServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nome = request.getParameter("nome");
        String sobrenome = request.getParameter("sobrenome");
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");
        String confirmarSenha = request.getParameter("confirmarSenha");
        String dataNascimentoStr = request.getParameter("dataNascimento");


        if (nome.isEmpty() || sobrenome.isEmpty() || email.isEmpty() || senha.isEmpty() || confirmarSenha.isEmpty() || dataNascimentoStr.isEmpty()) {
            request.setAttribute("erroCadastro", "Todos os campos são obrigatórios.");
            request.getRequestDispatcher("cadastro.jsp").forward(request, response);
            return;
        }

        if (!senha.equals(confirmarSenha)) {
            request.setAttribute("erroCadastro", "As senhas não coincidem.");
            request.getRequestDispatcher("cadastro.jsp").forward(request, response);
            return;
        }

        try {
            Usuario usuario = new Usuario();
            usuario.setNome(nome);
            usuario.setSobrenome(sobrenome);
            usuario.setEmail(email);
            usuario.setSenha(senha);
            usuario.setDataNascimento(new SimpleDateFormat("yyyy-MM-dd").parse(dataNascimentoStr));

            UsuarioDAO usuarioDAO = new UsuarioDAO();
            usuarioDAO.inserir(usuario);

            response.sendRedirect("login.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("erroCadastro", "Erro ao cadastrar usuário.");
            request.getRequestDispatcher("cadastro.jsp").forward(request, response);
        }
    }
}

