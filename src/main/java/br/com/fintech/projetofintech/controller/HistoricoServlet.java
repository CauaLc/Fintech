package br.com.fintech.projetofintech.controller;

import br.com.fintech.projetofintech.model.Usuario;
import br.com.fintech.projetofintech.dao.TransacoesDAO;
import br.com.fintech.projetofintech.model.Transacao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/historico")
public class HistoricoServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {



        String idParam = request.getParameter("idUsuario");

        if (idParam == null || idParam.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Parâmetro idUsuario é obrigatório.");
            return;
        }

        try {
            Long idUsuario = Long.parseLong(idParam);
            TransacoesDAO dao = new TransacoesDAO();
            List<Transacao> transacoes = dao.listarPorUsuario(idUsuario);

            request.setAttribute("transacoes", transacoes);
            request.getRequestDispatcher("historico.jsp").forward(request, response);


        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID de usuário inválido.");
        } catch (SQLException e) {
            throw new ServletException("Erro ao buscar transações", e);
        }
    }
}


