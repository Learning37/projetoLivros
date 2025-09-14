package controller;

import model.Livro;
import model.LivroDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/LivroServlet")
public class LivroServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private LivroDAO dao;

    public void init() {
        dao = new LivroDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String acao = request.getParameter("acao");

        if (acao == null || acao.equals("listar")) {
            List<Livro> livros = dao.listarTodos();
            request.setAttribute("livros", livros);
            request.getRequestDispatcher("listar.jsp").forward(request, response);

        } else if (acao.equals("editar")) {
            int id = Integer.parseInt(request.getParameter("id"));
            Livro livro = dao.buscarPorId(id);
            request.setAttribute("livro", livro);
            request.getRequestDispatcher("formulario.jsp").forward(request, response);

        } else if (acao.equals("excluir")) {
            int id = Integer.parseInt(request.getParameter("id"));
            dao.excluir(id);
            response.sendRedirect("LivroServlet?acao=listar");
        }
        else if (acao.equals("buscar")) {
            String termo = request.getParameter("termo");
            List<Livro> resultados = dao.buscarPorTituloOuAutor(termo);
            request.setAttribute("resultados", resultados);
            request.getRequestDispatcher("resultadoBusca.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String idParam = request.getParameter("id");
        String titulo = request.getParameter("titulo");
        String autor = request.getParameter("autor");
        int ano = Integer.parseInt(request.getParameter("ano"));
        String genero = request.getParameter("genero");
        String sinopse = request.getParameter("sinopse");

        Livro livro = new Livro();
        livro.setTitulo(titulo);
        livro.setAutor(autor);
        livro.setAno(ano);
        livro.setGenero(genero);
        livro.setSinopse(sinopse);

        if (idParam == null || idParam.isEmpty()) {
            dao.inserir(livro);
        } else {
            livro.setId(Integer.parseInt(idParam));
            dao.atualizar(livro);
        }

        response.sendRedirect("LivroServlet?acao=listar");
    }
}
