package br.com.fintech.projetofintech.controller;

import br.com.fintech.projetofintech.dao.TransacoesDAO;
import br.com.fintech.projetofintech.model.Transacao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/despesas")
public class TransacaoDespesasServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idParam = request.getParameter("idUsuario");

        if (idParam == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Parâmetro idUsuario é obrigatório.");
            return;
        }

        Long idUsuario = Long.parseLong(idParam);
        TransacoesDAO dao = new TransacoesDAO();

        try {
            List<Transacao> transacoes = dao.listarPorUsuario(idUsuario);

            request.setAttribute("transacoes", transacoes);
            request.getRequestDispatcher("despesas.jsp").forward(request, response);
            System.out.println(transacoes);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}

