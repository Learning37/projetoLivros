package teste;
import java.sql.Connection;
import model.Conexao;

public class Teste {

	public static void main(String[] args) {
		try (Connection con = Conexao.getConnection()) {
            System.out.println("Conexão bem-sucedida com o banco de dados!");
        } catch (Exception e) {
            e.printStackTrace();
        }

	}

}
