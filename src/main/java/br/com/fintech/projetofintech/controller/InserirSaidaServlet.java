package br.com.fintech.projetofintech.controller;

import br.com.fintech.projetofintech.dao.TransacoesDAO;
import br.com.fintech.projetofintech.model.Saida;
import br.com.fintech.projetofintech.model.Usuario;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.time.LocalDate;

@WebServlet("/saida")
public class InserirSaidaServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        Usuario usuario = (session != null)
                ? (Usuario) session.getAttribute("usuarioLogado")
                : null;

        if (usuario == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Ler parâmetros
        Saida dto = new Saida();
        dto.setIdUsuario(usuario.getId());
        dto.setNome(request.getParameter("nome"));
        dto.setDescricao(request.getParameter("descricao"));

        String valorParam = request.getParameter("valor");

        if (valorParam == null || valorParam.trim().isEmpty()) {
            // Pode lançar exceção personalizada, redirecionar com erro, ou definir um valor padrão
            throw new IllegalArgumentException("O campo 'valor' é obrigatório.");
        }

        // Ajuste de formato brasileiro para BigDecimal
        String valorStr = valorParam.replace(".", "").replace(",", ".");

        try {
            dto.setValor(new BigDecimal(valorStr));
        } catch (NumberFormatException e) {
            throw new IllegalArgumentException("Valor inválido: " + valorParam);
        }


        dto.setDataTransacao(LocalDate.parse(request.getParameter("data")));
        dto.setCategoria(request.getParameter("categoria"));

        String cartaoParam = request.getParameter("idCartao");
        if (cartaoParam != null && !cartaoParam.isEmpty()) {
            dto.setIdCartao(Integer.parseInt(cartaoParam));
        }

        // Inserir no banco
        TransacoesDAO dao = new TransacoesDAO();
        try {
            dao.inserirSaida(dto);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        // Redireciona para dashboard
        response.sendRedirect("dashboard?idUsuario=" + usuario.getId());
    }
}
