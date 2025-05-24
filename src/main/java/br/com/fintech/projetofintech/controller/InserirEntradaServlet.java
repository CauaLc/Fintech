package br.com.fintech.projetofintech.controller;

import br.com.fintech.projetofintech.dao.TransacoesDAO;
import br.com.fintech.projetofintech.model.Entrada;
import br.com.fintech.projetofintech.model.Usuario;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;

@WebServlet("/entrada")
public class InserirEntradaServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        // Obter os dados do formulário
        int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
        String nome = request.getParameter("descricao");
        String valorStr = request.getParameter("valor");
        valorStr = valorStr.replace(".", "").replace(",", ".");
        double valor = Double.parseDouble(valorStr);
        LocalDate dataTransacao = LocalDate.parse(request.getParameter("data"));
        String categoria = request.getParameter("categoria");

        System.out.println("Data recebida: " + dataTransacao);


        // Criar o objeto entrada
        Entrada entrada = new Entrada();
        entrada.setIdUsuario(idUsuario);
        entrada.setNome(nome);
        entrada.setValor(valor);
        entrada.setDataTransacao(dataTransacao);
        entrada.setCategoria(categoria);

        TransacoesDAO dao = new TransacoesDAO();
        try {
            dao.inserirEntrada(entrada);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        HttpSession session = request.getSession();

        Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");
        response.sendRedirect("./dashboard?idUsuario="+ usuario.getId());

    }
}
