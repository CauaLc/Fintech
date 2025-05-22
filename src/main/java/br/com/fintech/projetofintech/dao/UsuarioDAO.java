package br.com.fintech.projetofintech.dao;

import br.com.fintech.projetofintech.model.Usuario;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UsuarioDAO {

    public void inserir(Usuario usuario) {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = ConnectionManager.getInstance().getConnection();
            String sql = "INSERT INTO T_FIN_USUARIO (NM_NOME, NM_SOBRENOME, EMAIL, SENHA, DT_NASCIMENTO) VALUES (?, ?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, usuario.getNome());
            stmt.setString(2, usuario.getSobrenome());
            stmt.setString(3, usuario.getEmail());
            stmt.setString(4, usuario.getSenha());
            stmt.setDate(5, new java.sql.Date(usuario.getDataNascimento().getTime()));

            stmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }


    public Usuario validarLogin(String email, String senha) {
        Usuario usuario = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = ConnectionManager.getInstance().getConnection();
            String sql = "SELECT * FROM T_FIN_USUARIO WHERE EMAIL = ? AND SENHA = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);
            stmt.setString(2, senha);
            rs = stmt.executeQuery();

            if (rs.next()) {
                usuario = new Usuario();
                /*usuario.setId(rs.getInt("ID_USUARIO"));*/ //Teste sem Id funcionou
                usuario.setNome(rs.getString("NM_NOME"));
                usuario.setSobrenome(rs.getString("NM_SOBRENOME"));
                usuario.setEmail(rs.getString("EMAIL"));
                usuario.setSenha(rs.getString("SENHA"));
                usuario.setDataNascimento(rs.getDate("DT_NASCIMENTO"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return usuario;
    }

}
