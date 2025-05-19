package br.com.fintech.projetofintech.dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionManager {
    private static ConnectionManager connetionManager;
    public static ConnectionManager getInstance() {
        if (connetionManager == null) {
            connetionManager = new ConnectionManager();
        }
        return connetionManager;
    }

    public Connection getConnection() {
        Connection connection = null;

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");

            connection = DriverManager.getConnection(
                    "jdbc:oracle:thin:@oracle.fiap.com.br:1521:ORCL",
                    "RM560488",
                    "190105");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return connection;
    }
}

