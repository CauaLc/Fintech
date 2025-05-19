/*package br.com.fintech.projetofintech.controller;

import br.com.fintech.projetofintech.dao.UsuarioDAO;
import br.com.fintech.projetofintech.model.Usuario;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String senha = request.getParameter("senha");

        UsuarioDAO usuarioDAO = new UsuarioDAO();
        Usuario usuario = usuarioDAO.validarLogin(email, senha);

        if (usuario != null) {
            HttpSession session = request.getSession();
            session.setAttribute("usuarioLogado", usuario);
            response.sendRedirect("dashboard.jsp");
        } else {
            request.setAttribute("erroLogin", "Email ou senha incorretos");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

}*/
