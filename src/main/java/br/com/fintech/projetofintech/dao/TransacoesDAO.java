package br.com.fintech.projetofintech.dao;

import br.com.fintech.projetofintech.model.Entrada;
import br.com.fintech.projetofintech.model.Transacao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TransacoesDAO {

    private Connection connection;


    public void inserirEntrada(Entrada entrada) throws SQLException {
        connection = ConnectionManager.getInstance().getConnection();
        String sqlTransacao = "INSERT INTO T_FIN_TRANSACAO (ID_TRANSACAO, ID_USUARIO, NOME, VALOR, DATA_TRANSACAO, CATEGORIA) " +
                "VALUES (SEQ_TRANSACAO.NEXTVAL, ?, ?, ?, TO_DATE(?, 'YYYY-MM-DD'), ?)";

        String sqlEntrada = "INSERT INTO T_FIN_ENTRADA (ID_TRANSACAO) VALUES (SEQ_TRANSACAO.CURRVAL)";

        try (
                PreparedStatement stmt1 = connection.prepareStatement(sqlTransacao);
                PreparedStatement stmt2 = connection.prepareStatement(sqlEntrada)
        ) {
            connection.setAutoCommit(false); // iniciar transação

            // T_FIN_TRANSACAO
            stmt1.setInt(1, entrada.getIdUsuario());
            stmt1.setString(2, entrada.getNome());
            stmt1.setDouble(3, entrada.getValor());
            stmt1.setString(4, entrada.getDataTransacao());
            stmt1.setString(5, entrada.getCategoria());
            stmt1.executeUpdate();

            // T_FIN_ENTRADA
            stmt2.executeUpdate();

            connection.commit(); // confirmar transação
        } catch (SQLException e) {
            connection.rollback();
            throw e;
        }
    }

    public List<Transacao> listarPorUsuario(Long idUsuario) throws SQLException {
        connection = ConnectionManager.getInstance().getConnection();
        String sql = "SELECT * FROM VW_TRANSACOES_USUARIO WHERE ID_USUARIO = ?";
        List<Transacao> lista = new ArrayList<>();

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setLong(1, idUsuario);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Transacao dto = new Transacao();
                    dto.setIdTransacao(rs.getLong("ID_TRANSACAO"));
                    dto.setIdUsuario(rs.getLong("ID_USUARIO"));
                    dto.setNomeUsuario(rs.getString("NOME_USUARIO"));
                    dto.setNomeTransacao(rs.getString("NOME_TRANSACAO"));
                    dto.setValor(rs.getDouble("VALOR"));

                    Date dataSql = rs.getDate("DATA_TRANSACAO");
                    if ( dataSql!= null) {
                        dto.setDataTransacao(dataSql.toLocalDate());
                    }

                    dto.setCategoria(rs.getString("CATEGORIA"));
                    dto.setTipoTransacao(rs.getString("TIPO_TRANSACAO"));
                    dto.setNomeCartao(rs.getString("NOME_CARTAO"));
                    dto.setFinalCartao(rs.getString("FINAL_CARTAO"));
                    dto.setCor(rs.getString("COR"));
                    dto.setTipoCartao(rs.getString("TIPO_CARTAO"));

                    lista.add(dto);
                }
            }
        }

        return lista;
    }
}

