<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Livro" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Livros</title>
    <link rel="stylesheet" type="text/css" href="css/estilo.css">
    
</head>
<body>
    <h1>📚 Lista de Livros</h1>

    <div class="lista-livros">
        <%
            List<Livro> livros = (List<Livro>) request.getAttribute("livros");
            if (livros != null && !livros.isEmpty()) {
                for (Livro livro : livros) {
        %>
        <div class="livro-card">
            <h2><%= livro.getTitulo() %></h2>
            <p><strong>Autor:</strong> <%= livro.getAutor() %></p>
            <p><strong>Ano:</strong> <%= livro.getAno() %></p>
            <p><strong>Gênero:</strong> <%= livro.getGenero() %></p>
            <p><strong>Sinopse:</strong> <%= livro.getSinopse() %></p>
            <div class="botoes-livro">
                <a href="LivroServlet?acao=editar&id=<%= livro.getId() %>">&#x270F; Editar</a>
                <a href="LivroServlet?acao=excluir&id=<%= livro.getId() %>" 
   				onclick="return confirm('Tem certeza que deseja excluir este livro?');">&#x1F5D1; Excluir</a>
            </div>
        </div>
        <%
                }
            } else {
        %>
        <p>Nenhum livro cadastrado.</p>
        <%
            }
        %>
    </div>

    <div style="text-align:center; margin-top:20px;">
        <a href="index.jsp" class="botaoVoltar"> &#x21A9; Voltar ao menu</a>
    </div>
</body>
</html>
