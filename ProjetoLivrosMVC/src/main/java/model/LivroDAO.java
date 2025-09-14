package model;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class LivroDAO {
	// Inserir novo livro
    public void inserir(Livro livro) {
        String sql = "INSERT INTO livro (titulo, autor, ano, genero, sinopse) VALUES (?, ?, ?, ?, ?)";
        try (Connection con = Conexao.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setString(1, livro.getTitulo());
            stmt.setString(2, livro.getAutor());
            stmt.setInt(3, livro.getAno());
            stmt.setString(4, livro.getGenero());
            stmt.setString(5, livro.getSinopse());

            stmt.executeUpdate();
            System.out.println("✅ Livro cadastrado com sucesso!");
        } catch (SQLException e) {
            System.out.println("Erro ao inserir livro: " + e.getMessage());
        }
    }

    // Listar todos os livros
    public List<Livro> listarTodos() {
        List<Livro> livros = new ArrayList<>();
        String sql = "SELECT * FROM livro";

        try (Connection con = Conexao.getConnection();
             Statement stmt = con.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Livro livro = new Livro();
                livro.setId(rs.getInt("id"));
                livro.setTitulo(rs.getString("titulo"));
                livro.setAutor(rs.getString("autor"));
                livro.setAno(rs.getInt("ano"));
                livro.setGenero(rs.getString("genero"));
                livro.setSinopse(rs.getString("sinopse"));
                livros.add(livro);
            }

        } catch (SQLException e) {
            System.out.println("Erro ao listar livros: " + e.getMessage());
        }
        return livros;
    }

    // Atualizar livro
    public void atualizar(Livro livro) {
        String sql = "UPDATE livro SET titulo=?, autor=?, ano=?, genero=?, sinopse=? WHERE id=?";
        try (Connection con = Conexao.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setString(1, livro.getTitulo());
            stmt.setString(2, livro.getAutor());
            stmt.setInt(3, livro.getAno());
            stmt.setString(4, livro.getGenero());
            stmt.setString(5, livro.getSinopse());
            stmt.setInt(6, livro.getId());

            stmt.executeUpdate();
            System.out.println("✅ Livro atualizado com sucesso!");
        } catch (SQLException e) {
            System.out.println("Erro ao atualizar livro: " + e.getMessage());
        }
    }

    // Excluir livro
    public void excluir(int id) {
        String sql = "DELETE FROM livro WHERE id=?";
        try (Connection conn = Conexao.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            stmt.executeUpdate();
            System.out.println("✅ Livro excluído com sucesso!");
        } catch (SQLException e) {
            System.out.println("Erro ao excluir livro: " + e.getMessage());
        }
    }

    // Buscar livro por ID
    public Livro buscarPorId(int id) {
        String sql = "SELECT * FROM livro WHERE id=?";
        try (Connection conn = Conexao.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                Livro livro = new Livro();
                livro.setId(rs.getInt("id"));
                livro.setTitulo(rs.getString("titulo"));
                livro.setAutor(rs.getString("autor"));
                livro.setAno(rs.getInt("ano"));
                livro.setGenero(rs.getString("genero"));
                livro.setSinopse(rs.getString("sinopse"));
                return livro;
            }

        } catch (SQLException e) {
            System.out.println("Erro ao buscar livro: " + e.getMessage());
        }
        return null;
    }
    
    public List<Livro> buscarPorTituloOuAutor(String termo) {
        List<Livro> resultados = new ArrayList<>();
        String sql = "SELECT * FROM livro WHERE titulo LIKE ? OR autor LIKE ?";

        try (Connection con = Conexao.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            String busca = "%" + termo + "%"; // "%" para buscar qualquer parte do texto
            ps.setString(1, busca);
            ps.setString(2, busca);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Livro livro = new Livro();
                livro.setId(rs.getInt("id"));
                livro.setTitulo(rs.getString("titulo"));
                livro.setAutor(rs.getString("autor"));
                livro.setAno(rs.getInt("ano"));
                livro.setGenero(rs.getString("genero"));
                livro.setSinopse(rs.getString("sinopse"));
                resultados.add(livro);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return resultados;
    }
}
