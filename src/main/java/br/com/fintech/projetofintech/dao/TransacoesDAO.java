package br.com.fintech.projetofintech.dao;

import br.com.fintech.projetofintech.model.Entrada;
import br.com.fintech.projetofintech.model.Saida;
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
            stmt1.setString(4, entrada.getDataTransacao().toString());
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

    public void inserirSaida(Saida dto) throws SQLException {
        connection = ConnectionManager.getInstance().getConnection();

        String sqlTransacao =
                "INSERT INTO T_FIN_TRANSACAO " +
                        "(ID_TRANSACAO, ID_USUARIO, NOME, DESCRICAO, VALOR, DATA_TRANSACAO, CATEGORIA) " +
                        "VALUES (SEQ_TRANSACAO.NEXTVAL, ?, ?, ?, ?, TO_DATE(?, 'YYYY-MM-DD'), ?)";
        String sqlSaida =
                "INSERT INTO T_FIN_SAIDA (ID_TRANSACAO, ID_CARTAO) " +
                        "VALUES (SEQ_TRANSACAO.CURRVAL, ?)";


             PreparedStatement ps1 = connection.prepareStatement(sqlTransacao);
             PreparedStatement ps2 = connection.prepareStatement(sqlSaida);

            connection.setAutoCommit(false);

            // 1) T_FIN_TRANSACAO
            ps1.setInt(1, dto.getIdUsuario());
            ps1.setString(2, dto.getDescricao());
            ps1.setString(3, dto.getDescricao());
            ps1.setBigDecimal(4, dto.getValor());
            ps1.setString(5, dto.getDataTransacao().toString());
            ps1.setString(6, dto.getCategoria());
            ps1.executeUpdate();

            // 2) T_FIN_SAIDA
            if (dto.getIdCartao() != null) {
                ps2.setInt(1, dto.getIdCartao());
            } else {
                ps2.setNull(1, java.sql.Types.INTEGER);
            }
            ps2.executeUpdate();

            connection.commit();

    }

    public List<Transacao> listarPorUsuario(Long idUsuario) throws SQLException {
        connection = ConnectionManager.getInstance().getConnection();
        String sql = "SELECT * FROM VW_TRANSACOES_USUARIO WHERE ID_USUARIO = ? ORDER BY DATA_TRANSACAO DESC";
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

