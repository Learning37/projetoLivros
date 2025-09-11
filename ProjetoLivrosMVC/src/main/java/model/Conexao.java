package model;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexao {
	private static final String driver = "com.mysql.cj.jdbc.Driver";
	private static final String URL = "jdbc:mysql://127.0.0.1:3306/catalogo_livros?useTimezone=true&serverTimezone=UTC";
    private static final String USER = "root"; // altere se seu usuário for diferente
    private static final String PASSWORD = "1234"; // altere para a senha do seu MySQL

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException e) {
            throw new SQLException("Driver não encontrado!", e);
        }
    }
}
